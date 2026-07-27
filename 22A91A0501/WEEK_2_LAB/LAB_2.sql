USE  GRAMPANCHAYAT_CERT_REQUEST;
SHOW TABLES;

SELECT UPPER(full_name) AS uppercase_column 
FROM Citizen;

SELECT LOWER(village_name) as uppercase_column
FROM Citizen;

SELECT Length(full_name) 
FROM Citizen;

SELECT LEFT(reference_number,4)
From Certificate_Application;

SELECT CONCAT(full_name, ' - ' ,village_name)
FROM Citizen;

SELECT Replace(certificate_name,'Certificate','cert.')
FROM Certificate_Application;

Select trim(certificate_name) 
From Certificate_Application;

SELECT SUBSTRING_INDEX(full_name, ' ', 1) FROM Citizen;

SELect concat('Citizen:', full_name ,'\n', 'Village:',village_name)
FROM Citizen;

SELECT * FROM Certificate_Application
WHERE reference_number LIKE 'GP2026%';

SELECT ROUND(application_fee)
FROM Certificate_Type;

SELECT ABS(processing_days - 10) AS adjusted_days 
FROM Certificate_Type;

SELECT  processing_days * processing_days AS Squareofprocessingdays
FROM Certificate_Type;

SELECT mod(processing_days, 3) as remainder_when_divided_by_3
FROM Certificate_Type;

SELECT ROUND(application_fee,1) as roundfee
FROM Certificate_Type;

select application_fee,
ceil(application_fee) as ceilfunc,
floor(application_fee) as floorfunc
FROM Certificate_Type;

SELECT FLOOR(RAND() * 100) + 1 AS random_num;

SELECT sqrt(processing_days) as sqrtofprocessing_days
FROM Certificate_Type;

SELECT processing_days*2 as processingdaysxtwo
FROM Certificate_Type;

SELECT current_date();
SELECT current_date() , current_time();
SELECT now();

SELECT year(application_date)
FROM Certificate_Application;

SELECT  month(application_date)
FROM Certificate_Application;

SELECT day(application_date)
FROM Certificate_Application;

SELECT ADDDATE(application_date, INTERVAL processing_days DAY) AS issue_date 
FROM Certificate_Application,Certificate_Type;

SELECT adddate(application_date,interval 30 day) as thirtydatinter
FROM Certificate_Application;

SELECT adddate(application_date,interval -7 day) as thirtydatinter
FROM Certificate_Application;

SELECT datediff(curdate(),application_date) as noofdaysbw
FROM Certificate_Application;

SELECT * FROM Certificate_Application
where year(application_date)= year(curdate());

SELECT CAST(application_fee AS UNSIGNED) AS fee_int,
CAST(processing_days AS CHAR) AS days_char
FROM Certificate_Type;

SELECT CAST(application_date AS DATETIME) AS app_datetime,
CAST(processing_days AS DECIMAL(10, 2)) AS days_decimal
FROM Certificate_Type,Certificate_Application;

SELECT CAST(application_fee AS CHAR) AS fee_string 
FROM Certificate_Type ;

SELECT 
  CAST(application_fee AS DECIMAL(10,2)) + CAST(processing_days AS DECIMAL(10,2)) AS blabla
FROM Certificate_Type,Certificate_Application;

