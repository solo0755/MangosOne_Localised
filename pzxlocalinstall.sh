#!/bin/sh
dbname=$1
if [ "${dbname}" = "" ]; then
echo "the  sql file  are require!"
printf "Usage: import.sql\n"
exit 0
fi

cmdimport="mysql -uroot -proot -s --default-character-set=utf8"

${cmdimport} ${dbname} <1_LocaleTablePrepare.sql
${cmdimport} ${dbname} <2_Add_NewLocalisationFields.sql
${cmdimport} ${dbname} <3_InitialSaveEnglish.sql
echo "import Chinese sql files"
for sql_file in `ls Translations/Chinese/*.sql`; do ${cmdimport} ${dbname}< $sql_file ; done
echo "import Chinese success"