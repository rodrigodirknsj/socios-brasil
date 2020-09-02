#!/bin/bash

set -e

POSTGRESQL_URI="postgres://postgres:postgres@db:5432/cnpj"

rows pgimport --schema=schema-full/empresa.csv /app/data/output-dw/empresa.csv.gz $POSTGRESQL_URI empresa
# rows pgimport --schema=schema-full/socio.csv /app/data/output-dw/empresa-socia.csv.gz $POSTGRESQL_URI empresa_socia
rows pgimport --schema=schema-full/socio.csv /app/data/output-dw/socio.csv.gz $POSTGRESQL_URI socio
rows pgimport --schema=schema-full/cnae-secundaria.csv /app/data/output-dw/cnae-secundaria.csv.gz $POSTGRESQL_URI cnae_secundaria

