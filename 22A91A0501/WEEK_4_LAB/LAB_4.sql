USE  GRAMPANCHAYAT_CERT_REQUEST;
show tables;
select * from citizen;

select Citizen.full_name , Certificate_Type.certificate_name
From Citizen
join certificate_type on citzen_id = certificate_type.citizen_id; 

SELECT citizen.full_name, panchayat_office.office_name
FROM citizen
JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
ORDER BY citizen.full_name;

SELECT certificate_application.application_id, citizen.full_name, certificate_application.application_status
FROM citizen
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
ORDER BY certificate_application.application_id;

SELECT citizen.full_name, certificate_type.certificate_name, certificate_application.application_date
FROM citizen
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
INNER JOIN certificate_type ON citizen.citzen_id = certificate_type.citizen_id
ORDER BY certificate_application.application_date;

SELECT 
    certificate_application.application_id,
    citizen.full_name,
    certificate_type.certificate_name,
    panchayat_office.office_name,
    certificate_application.application_status
FROM citizen
INNER JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
INNER JOIN certificate_type ON foreign_key.certificate_id = certificate_type.certificate_type_id
INNER JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
ORDER BY certificate_application.application_id;

SELECT 
    citizen.full_name,
    panchayat_office.office_name
FROM citizen
INNER JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
INNER JOIN certificate_type ON foreign_key.certificate_id = certificate_type.certificate_type_id
INNER JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
WHERE certificate_type.certificate_name = 'Income Certificate';

SELECT 
    citizen.full_name,
    citizen.mobile_number,
    citizen.village_name,
    certificate_application.application_id,
    certificate_application.application_status
FROM citizen
INNER JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
INNER JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
WHERE panchayat_office.office_name = 'Seethampeta Gram Panchayat';

SELECT 
    certificate_application.application_id,
    certificate_type.description,
    certificate_application.application_status
FROM certificate_application
INNER JOIN certificate_type ON certificate_application.citizen_id = certificate_type.citizen_id
ORDER BY certificate_application.application_id;

SELECT 
    citizen.full_name,
    citizen.village_name,
    certificate_type.certificate_name,
    panchayat_office.office_name,
    certificate_application.application_date
FROM citizen
INNER JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
INNER JOIN certificate_type ON foreign_key.certificate_id = certificate_type.certificate_type_id
INNER JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
ORDER BY certificate_application.application_date;


SELECT 
  
    citizen.citzen_id,
    citizen.full_name,
    citizen.date_of_birth,
    citizen.gender,
    citizen.mobile_number,
    citizen.occupation,
    citizen.village_name AS citizen_village,
    citizen.address,

    
    certificate_type.certificate_name,
    certificate_type.description AS certificate_description,
    certificate_type.processing_days,
    certificate_type.application_fee,

    
    panchayat_office.office_name,
    panchayat_office.village_name AS office_village,
    panchayat_office.contact_number AS office_contact,
    panchayat_office.office_email,

    
    certificate_application.application_id,
    certificate_application.application_date,
    certificate_application.application_status,
    certificate_application.fee_paid,
    certificate_application.reference_number,
    certificate_application.issued_date

FROM citizen
INNER JOIN foreign_key ON citizen.citzen_id = foreign_key.citizen_id
INNER JOIN certificate_type ON foreign_key.certificate_id = certificate_type.certificate_type_id
INNER JOIN panchayat_office ON foreign_key.office_idno = panchayat_office.office_id
INNER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
ORDER BY certificate_application.application_id;

SELECT 
    citizen.full_name,
    citizen.village_name,
    certificate_application.application_id,
    certificate_application.application_status
FROM citizen
LEFT OUTER JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id
ORDER BY citizen.full_name;

SELECT 
    certificate_type.certificate_name,
    certificate_application.application_id,
    certificate_application.application_status
FROM foreign_key
RIGHT OUTER JOIN certificate_type ON foreign_key.certificate_id = certificate_type.certificate_type_id
LEFT JOIN certificate_application ON foreign_key.citizen_id = certificate_application.citizen_id
ORDER BY certificate_type.certificate_name;


SELECT 
    citizen.full_name,
    citizen.village_name,
    certificate_application.application_id,
    certificate_application.application_status
FROM citizen
LEFT JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id

UNION

SELECT 
    citizen.full_name,
    citizen.village_name,
    certificate_application.application_id,
    certificate_application.application_status
FROM citizen
RIGHT JOIN certificate_application ON citizen.citzen_id = certificate_application.citizen_id

ORDER BY full_name;



SELECT 
    citizen.full_name,
    certificate_type.certificate_name
FROM citizen
CROSS JOIN certificate_type
ORDER BY citizen.full_name, certificate_type.certificate_name;


SELECT 
    c1.full_name AS citizen_1,
    c2.full_name AS citizen_2,
    c1.village_name AS village
FROM citizen c1
INNER JOIN citizen c2 
    ON c1.village_name = c2.village_name 
    AND c1.citzen_id < c2.citzen_id
ORDER BY c1.village_name, c1.full_name;