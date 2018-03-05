cd /home/acadgild/bank/survey_files
cat *.txt > survey_data
rm *.txt

CREATE DATABASE IF NOT EXISTS bank;

USE bank;

CREATE TABLE survey_analysis (
survey_date string,
survey_question string,
Rating int,
user_id int,
survey_id string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

hive -e "LOAD DATA LOCAL INPATH '/home/acadgild/bank/survey_files/survey_data' INTO TABLE bank.survey_analysis"
