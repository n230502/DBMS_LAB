CREATE DATABASE GRAMPANCHAYAT_CERT_REQUEST;
USE  GRAMPANCHAYAT_CERT_REQUEST;
CREATE TABLE Citizen(citzen_id int  PRIMARY KEY , full_name varchar(100) not null , date_of_birth DATE NOT NULL , gender varchar(10) Not null ,mobile_number varchar(15) not null unique,  occupation varchar(50) ,village_name varchar(50) not null ,is_active boolean not null );
SELECT * FROM Citizen;
INSERT INTO Citizen values(101,'Ravi Kumar','1995-06-15',"Male","987650001","Farmer","Ramapuram",TRUE,);
INSERT INTO Citizen values(102,'Lakshmi Devi','1988-11-22','Female',"9897650002","Tailor","Ramapuram",True);
INSERT INTO Citizen values(103 , "Suresh Babu",'1992-03-10','Male','987650003',"Shopkeeper","Seethampeta",True);
INSERT INTO Citizen values(104,"Anjali Rao",'2000-08-05','Female','987650004',"Student","Ramapuram",True);
INSERT INTO Citizen values(105,"Kiran Kumar",'1985-01-18','Male',"987650005",'Teacher',"Lakshmipuram",FALSE);
INSERT INTO Citizen values(106,"Meena Kumari",'1998-12-30','Female','987650006','Teacher','Lakshmipuram',false);

CREATE TABLE Certificate_Type(certificate_type_id int Primary key,certificate_name varchar(100) unique not null,description varchar(200) not null , processing_days int not null , application_fee decimal(8,2) not null , is_available boolean not null);
INSERT INTO Certificate_Type values(1,'Residence certificate','Certifies the declared place of residence',7,30.00,true);
INSERT INTO Certificate_Type values(2,'Birth Record Request','Request for a locally maintained birth record',5,20.00,true);
INSERT INTO Certificate_Type values(3,'Death Record Request','Request for a locally maintained death record',5,20.00,true);
INSERT INTO Certificate_Type values(4,'Family Member Certificate','Records declared family-men',10,40.00,true);
INSERT INTO Certificate_Type values (5,'Property Certificate','Cetificate related to locally maintained property records',15,50.00,true);
INSERT INTO Certificate_Type values (6,'No-Dues certificate','Indicates applicable local dues status',7,25.00,false);
SELECT * FROM Certificate_Type;

CREATE TABLE Certificate_Application (application_id int Primary key,citizen_id int not null,certificate_name varchar(100) not null,application_date date not null, purpose varchar(200) not null,application_status varchar(30) not null ,fee_paid decimal(8,2) not null,reference_number varchar(30) unique not null );

INSERT INTO Certificate_Application values(1001,101,'Residence Certificate','2026-07-01','Bank account documentation','Submitted',30.00,'GP20260001');
INSERT INTO Certificate_Application values(1002,102,'Family Member Certificate','2026-07-02','Welfare Scheme application','Under Review',40.00,'GP20260002');
INSERT INTO Certificate_Application values(1003,103,'Property Certificate','2026-07-03','Property Documentation','Submitted',50.00,'GP20260003');
INSERT INTO Certificate_Application values(1004,104,'Residence Certificate','2026-07-04','College admission','Approved',30.00,'GP20260004');
INSERT INTO Certificate_Application values(1005,105,'No Dues Certificate','2026-07-05','Local service requirement','Under Review',25.00,'GP2026005');
INSERT INTO Certificate_Application values(1006,106,'Birth Record Request','2026-07-06','Personal documentation','Rejected',20.00,'GP2026006');

select * from Certificate_Application ;

CREATE TABLE Panchayat_Office(office_id int primary key,office_name varchar(100) not null,village_name varchar(50) not null,pincode varchar(6) not null,contact_number varchar(15) unique , office_email varchar(100) unique, opening_time time not null , is_operational boolean not null );
INSERT INTO Panchayat_office values(1,'Ramapuram Gram Panchayat','Ramapuram','521101','0866000001','ramapuram@gp.example','09:00:00',true);
INSERT INTO Panchayat_office values(2,'Seethampeta Gram Panchayat','Seethampeta','521102','0866000002','seethampeta@gp.example','09:30:00',true);
INSERT INTO Panchayat_office values(3,'Lakshmipuram Gram Panchayat','Lakshmipuram','521103','0866000003','lakshmipuram@gp.example','09:00:00',true);
INSERT INTO Panchayat_office values(4,'Krishnapuram Gram Panchayat','Krishapuram','521104','0866000004','krishnapuram@gp.example','10:00:00',true);
INSERT INTO Panchayat_office values(5,'Venkatapuram Gram Panchayat','Venkatapuram','521105','0866000005','venkatapuram@gp.example','09:30:00',true);
INSERT INTO Panchayat_office values(6,'Gopalapuram Gram Panchayat','Gopalapuram','521106','0866000006','gopalapuram@gp.example','09:00:00',false);


SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Certificate_Application;
SELECT * FROM Panchayat_office;

INSERT INTO Citizen values(107,'jack','2011-09-03','Male','987650007','artist','rguktpuram',TRUE);
INSERT INTO Certificate_Type values(7,'Income Certificate','provides information about income of the citizen',3,25.00,true);

update  Certificate_Application
set application_status = 'Under review'
WHERE application_id=1001;

update  Certificate_Application
set application_status = 'approved'
WHERE application_id=1002;

update Citizen 
set occupation = 'Electrical Technician'
WHERE citzen_id = 105;

update Certificate_Type 
set processing_days =12
WHERE certificate_type_id =5;

update Certificate_Type
set is_available = true
where certificate_type_id=6;

DELETE FROM Citizen
WHERE citzen_id = 107;

ALTER TABLE Citizen ADD address varchar(200);

UPDATE Citizen set address='Academic_ block 1 ' WHERE citzen_id=101;
UPDATE Citizen set address='Academic_ block 2 ' WHERE citzen_id=102;
UPDATE Citizen set address='Academic_ block 3 ' WHERE citzen_id=103;
UPDATE Citizen set address='Academic_ block 4 ' WHERE citzen_id=104;
UPDATE Citizen set address='Academic_ block 5 ' WHERE citzen_id=105;
UPDATE Citizen set address='Academic_ block 6 ' WHERE citzen_id=106;

ALTER TABLE Certificate_Application ADD issued_date date;

UPDATE Certificate_Application set issued_date = '2026-01-12' WHERE application_id=1001;
UPDATE Certificate_Application set issued_date = '2026-01-13' WHERE application_id=1002;
UPDATE Certificate_Application set issued_date = '2026-01-14' WHERE application_id=1003;
UPDATE Certificate_Application set issued_date = '2026-01-15' WHERE application_id=1004;
UPDATE Certificate_Application set issued_date = '2026-01-16' WHERE application_id=1005;
UPDATE Certificate_Application set issued_date = '2026-01-17' WHERE application_id=1006;

ALTER TABLE Certificate_Application 
MODIFY COLUMN purpose VARCHAR(500);

ALTER TABLE Panchayat_Office ADD closing_time TIME ;

UPDATE Panchayat_Office set closing_time='11:15:00' WHERE office_id=1;
UPDATE Panchayat_Office set closing_time='11:25:00' WHERE office_id=2;
UPDATE Panchayat_Office set closing_time='11:35:00' WHERE office_id=3;
UPDATE Panchayat_Office set closing_time='11:45:00' WHERE office_id=4;
UPDATE Panchayat_Office set closing_time='11:55:00' WHERE office_id=5;
UPDATE Panchayat_Office set closing_time='12:10:00' WHERE office_id=6;

SHOW TABLES;

create table Temporary_Request (request_id int  primary key , request_name varchar(100) not null , request_date DATE not null);
INSERT INTO Temporary_Request VALUES 
(77,'Transfer Certificate request','2026-07-21'),
(79,'Marks list Request','2026-07-20'),
(71,'Campus change Request','2025-07-12');
SELECT * FROM Temporary_Request;

TRUNCATE TABLE Temporary_Request;

DROP TABLE Temporary_Request;