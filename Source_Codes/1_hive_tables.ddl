CREATE DATABASE bank;
USE bank;

CREATE EXTERNAL TABLE loan_info_stg (
Loan_id int,
User_id int,
last_payment_date string,
payment_installation double,
Date_payable string
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/acadgild/hive/bank/loan_info_stg';

CREATE EXTERNAL TABLE credit_card_info_stg
(
cc_number string,
user_id int,
maximum_credit double,
outstanding_balance double,
due_date string
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/acadgild/hive/bank/credit_card_info_stg';

CREATE EXTERNAL TABLE shares_info_stg
(
Share_id string,
Company_name string,
Gmt_timestamp bigint,
Share_price double
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/acadgild/hive/bank/shares_info_stg';
