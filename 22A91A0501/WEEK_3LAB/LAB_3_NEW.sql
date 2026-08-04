USE grampanchayat_cert_request;

SELECT * FROM citizen;
SELECT * FROM certificate_application;
SELECT * FROM foreign_key;

ALTER TABLE certificate_application ADD COLUMN certificate_id INT;
ALTER TABLE certificate_application ADD COLUMN office_id INT;

UPDATE certificate_application ca
JOIN foreign_key fk ON ca.citizen_id = fk.citizen_id
SET ca.certificate_id = fk.certificate_id,
    ca.office_id       = fk.office_idno;

SELECT application_id, citizen_id, certificate_id, office_id
FROM certificate_application;

ALTER TABLE certificate_application
  ADD CONSTRAINT fk_app_citizen
  FOREIGN KEY (citizen_id) REFERENCES citizen(citzen_id);

ALTER TABLE certificate_application
  ADD CONSTRAINT fk_app_certificate
  FOREIGN KEY (certificate_id) REFERENCES certificate_type(certificate_type_id);

ALTER TABLE certificate_application
  ADD CONSTRAINT fk_app_office
  FOREIGN KEY (office_id) REFERENCES panchayat_office(office_id);

SELECT
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'grampanchayat_cert_request'
  AND TABLE_NAME = 'certificate_application'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

INSERT INTO certificate_application
VALUES (9001, 999, '2026-08-04', 'Test - invalid citizen', 'Submitted', 10.00, 'GPTEST001', NULL, NULL, NULL);

INSERT INTO certificate_application
VALUES (9002, 101, '2026-08-04', 'Test - invalid certificate', 'Submitted', 10.00, 'GPTEST002', NULL, 999, 1);

DELETE FROM citizen WHERE citzen_id = 101;

DELETE FROM certificate_type WHERE certificate_type_id = 1;














SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Income Certificate'
UNION
SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Residence certificate';

SELECT * FROM certificate_application WHERE MONTH(application_date) = 1
UNION
SELECT * FROM certificate_application WHERE MONTH(application_date) = 2;

SELECT * FROM citizen WHERE village_name = 'Ramapuram'
UNION
SELECT * FROM citizen WHERE village_name = 'Lakshmipuram';

SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Income Certificate'
INTERSECT
SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Residence certificate';

SELECT DISTINCT c.full_name
FROM citizen c JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
WHERE YEAR(ca.application_date) = 2025
INTERSECT
SELECT DISTINCT c.full_name
FROM citizen c JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
WHERE YEAR(ca.application_date) = 2026;

SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Income Certificate'
EXCEPT
SELECT c.full_name
FROM citizen c
JOIN certificate_application ca ON c.citzen_id = ca.citizen_id
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Residence certificate';

SELECT * FROM certificate_application WHERE YEAR(application_date) = 2026
EXCEPT
SELECT * FROM certificate_application WHERE YEAR(application_date) = 2025;

INSERT INTO certificate_application
VALUES (9003, 888, '2026-08-04', 'Test invalid FK', 'Submitted', 10.00, 'GPTEST003', NULL, 1, 1);

DELETE FROM citizen WHERE citzen_id = 102;

SELECT full_name FROM citizen
WHERE citzen_id IN (SELECT citizen_id FROM certificate_application);

SELECT full_name FROM citizen
WHERE village_name IN (
    SELECT c2.village_name
    FROM citizen c2
    JOIN certificate_application ca ON c2.citzen_id = ca.citizen_id
    JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
    WHERE ct.certificate_name = 'Income Certificate'
);

SELECT full_name FROM citizen
WHERE citzen_id NOT IN (SELECT citizen_id FROM certificate_application);

SELECT office_name FROM panchayat_office
WHERE office_id NOT IN (
    SELECT office_id FROM certificate_application WHERE office_id IS NOT NULL
);

SELECT full_name FROM citizen c
WHERE EXISTS (
    SELECT 1 FROM certificate_application ca WHERE ca.citizen_id = c.citzen_id
);

SELECT certificate_name FROM certificate_type ct
WHERE EXISTS (
    SELECT 1 FROM certificate_application ca WHERE ca.certificate_id = ct.certificate_type_id
);

SELECT full_name FROM citizen c
WHERE NOT EXISTS (
    SELECT 1 FROM certificate_application ca WHERE ca.citizen_id = c.citzen_id
);

SELECT certificate_name FROM certificate_type ct
WHERE NOT EXISTS (
    SELECT 1 FROM certificate_application ca WHERE ca.certificate_id = ct.certificate_type_id
);

SELECT full_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM citizen
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > ANY (
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
    FROM citizen WHERE village_name = 'Ramapuram'
);

SELECT ca.application_id, ct.certificate_name, ct.processing_days
FROM certificate_application ca
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.processing_days > ANY (
    SELECT ct2.processing_days
    FROM certificate_application ca2
    JOIN certificate_type ct2 ON ca2.certificate_id = ct2.certificate_type_id
    JOIN panchayat_office po ON ca2.office_id = po.office_id
    WHERE po.office_name = 'Nuzvid'
);

SELECT full_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM citizen
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > ALL (
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
    FROM citizen WHERE village_name = 'Ramapuram'
);

SELECT ca.application_id, ct.certificate_name, ct.processing_days
FROM certificate_application ca
JOIN certificate_type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.processing_days > ALL (
    SELECT ct2.processing_days
    FROM certificate_application ca2
    JOIN certificate_type ct2 ON ca2.certificate_id = ct2.certificate_type_id
    JOIN panchayat_office po ON ca2.office_id = po.office_id
    WHERE po.office_name = 'Nuzvid'
);
