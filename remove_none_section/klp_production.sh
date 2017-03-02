#!/bin/bash


echo "The script you are running has basename `basename $0`, dirname `dirname $0`"
echo "The present working directory is `pwd`"



origdir=`pwd`
SCRIPT_DIR=`dirname $0`

echo scriptdir




DBNAME=$(basename $0 .sh)
OWNER=klp

# Empty to Empty
echo Step 1 empty to empty
psql -U ${OWNER} -d ${DBNAME} -f ./sql/1empty_to_empty.sql > ./csv/empty_to_empty.csv
python update_student_group.py empty_to_empty.csv 1empty_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./1empty_to_empty/update_assessment_class_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./1empty_to_empty/update_assessment_studentgroup_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./1empty_to_empty/update_student_studentgroupreltion.sql
python delete_studentgroup.py empty_to_empty.csv 1empty_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./1empty_to_empty/delete_group.sql


# Null to Empty
echo Step 2 null to empty
psql -U ${OWNER} -d ${DBNAME} -f ./sql/2null_to_empty.sql > ./csv/null_to_empty.csv
python update_student_group.py null_to_empty.csv 2null_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./2null_to_empty/update_assessment_class_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./2null_to_empty/update_assessment_studentgroup_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./2null_to_empty/update_student_studentgroupreltion.sql
python delete_studentgroup.py null_to_empty.csv 2null_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./2null_to_empty/delete_group.sql
psql -U ${OWNER} -d ${DBNAME} -f ./sql/null_to_empty.sql

# None to Empty
echo Step 3 none to empty
psql -U ${OWNER} -d ${DBNAME} -f ./sql/3none_to_empty.sql > ./csv/none_to_empty.csv
python update_student_group.py none_to_empty.csv 3none_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./3none_to_empty/update_assessment_class_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./3none_to_empty/update_assessment_studentgroup_association.sql
psql -U ${OWNER} -d ${DBNAME} -f ./3none_to_empty/update_student_studentgroupreltion.sql
python delete_studentgroup.py none_to_empty.csv 3none_to_empty
psql -U ${OWNER} -d ${DBNAME} -f ./3none_to_empty/delete_group.sql

# Last Update None to Empty
echo Step 4 none to empty
psql -U ${OWNER} -d ${DBNAME} -f ./sql/last_update.sql

