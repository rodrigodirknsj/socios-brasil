#!/bin/bash

SCHEMA_PATH="schema-full"
OUTPUT_PATH="data/output"

function import_table() {
	
	if [ "$2" = "cnae" ]; then
		tablename="$3"
		fname="$OUTPUT_PATH/${1}.csv.gz"
		sch="$SCHEMA_PATH/${2}.csv"		
	else
		tablename="$1"
		fname="$OUTPUT_PATH/${tablename}.csv.gz"
		sch="$SCHEMA_PATH/${tablename}.csv"		
	fi


	echo "DROP TABLE IF EXISTS ${tablename}; CASCADE" | psql "$POSTGRESQL_URI"
	time rows pgimport \
		--schema="$sch" \
		--input-encoding="utf-8" \
		--dialect="excel" \
		"$fname" \
		"$POSTGRESQL_URI" \
		"$tablename"
}

function import_cnae_tables() {
	schema="cnae"
	for filename in $OUTPUT_PATH/cnae_1*.csv* $OUTPUT_PATH/cnae_2*.csv*; do
		versao="$(basename $filename | sed 's/.csv.*//; s/cnae_//; s/\.//')"
		filename=$(basename $filename | sed 's/.csv.gz//')
		import_table $filename $schema "cnae_$versao"
	done
}

function execute_sql_files() {
	## Execute SQL queries in sql/*.sql
	for filename in sql/*.sql; do
		echo "Executing ${filename}..."
		time cat $filename | psql $POSTGRESQL_URI
	done
}

import_table empresa
import_table cnae_cnpj
import_table socio
import_table holding
import_cnae_tables
execute_sql_files
