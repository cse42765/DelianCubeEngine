use pkdd99_star;
SET FOREIGN_KEY_CHECKS=0;

TRUNCATE TABLE LOAN;
LOAD DATA INFILE  'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Loan1M.csv'
INTO TABLE loan FIELDS TERMINATED BY ';' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES;

OPTIMIZE TABLE LOAN;
ANALYZE TABLE LOAN;
