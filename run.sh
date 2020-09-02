#!/bin/bash

set -e

mkdir -p data/download data/output

if [ "$1" = "--use-mirror" ]; then
	USE_MIRROR=true
else
	USE_MIRROR=false
fi

function download_data() {
	DOWNLOAD_LINK_TXT="data/download/links.txt"
	CONNECTIONS=4
	DOWNLOAD_URL="https://receita.economia.gov.br/orientacao/tributaria/cadastros/cadastro-nacional-de-pessoas-juridicas-cnpj/dados-publicos-cnpj"
	FILE_URLS=$(wget --quiet --no-check-certificate -O - "$DOWNLOAD_URL" \
		| grep --color=no DADOS_ABERTOS_CNPJ \
		| grep --color=no ".zip" \
		| sed 's/.*"http:/http:/; s/".*//' \
		| sort)
	MIRROR_URL="https://data.brasil.io/mirror/socios-brasil"

	rm -rf $DOWNLOAD_LINK_TXT

	for url in $FILE_URLS; do
		if $USE_MIRROR; then
			url="$MIRROR_URL/$(basename $url)"
			
		fi
		echo $url >> $DOWNLOAD_LINK_TXT
	done
	time aria2c --auto-file-renaming=false --continue=true -s $CONNECTIONS -x $CONNECTIONS --dir=data/download -i $DOWNLOAD_LINK_TXT
}

function extract_data() {
	time python3 extract_dump.py --no_censorship data/output/ data/download/DADOS_ABERTOS_CNPJ_1*.zip
	time python3 extract_cnae_cnpj.py data/output/{empresa,cnae_secundaria,cnae_cnpj}.csv.gz
}

function extract_holding() {
	time python3 extract_holding.py data/output/{socio,empresa,holding}.csv.gz
}

function extract_cnae() {
	for versao in "1.0" "1.1" "2.0" "2.1" "2.2" "2.3"; do
		filename="data/output/cnae_$versao.csv"
		rm -rf "$filename"
		time scrapy runspider \
			-s RETRY_HTTP_CODES="500,503,504,400,404,408" \
			-s HTTPCACHE_ENABLED=true \
			--loglevel=INFO \
			-a versao="$versao" \
			-o "$filename" \
			cnae.py
		gzip "$filename"
	done
}

function rows_import(){
	rows pgimport --schema=schema/empresa.csv /app/data/output/empresa.csv.gz $POSTGRESQL_URI empresa
	rows pgimport --schema=schema/socio.csv /app/data/output/holdings.csv.gz $POSTGRESQL_URI holding
	rows pgimport --schema=schema/socio.csv /app/data/output/socio.csv.gz $POSTGRESQL_URI socio
	rows pgimport --schema=schema/cnae-secundaria.csv /app/data/output/cnae-secundaria.csv.gz $POSTGRESQL_URI cnae_secundaria
}

download_data
extract_data
extract_holding
extract_cnae
rows_import
