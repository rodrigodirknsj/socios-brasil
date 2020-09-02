#!/bin/bash
set -e

rows pgimport --schema=schema/empresa.csv /app/data/output-dw/empresa.csv.gz $POSTGRESQL_URI empresa
rows pgimport --schema=schema/socio.csv /app/data/output-dw/empresa-socia.csv.gz $POSTGRESQL_URI holding
rows pgimport --schema=schema/socio.csv /app/data/output-dw/socio.csv.gz $POSTGRESQL_URI socio
rows pgimport --schema=schema/cnae-secundaria.csv /app/data/output-dw/cnae-secundaria.csv.gz $POSTGRESQL_URI cnae_secundaria