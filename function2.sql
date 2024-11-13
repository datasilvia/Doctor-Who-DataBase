DROP FUNCTION IF EXISTS count_doctor_companions;

DELIMITER //

CREATE FUNCTION count_doctor_companions(input_doctor_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE companion_count INT;

    SELECT COUNT(DISTINCT companion_id) INTO companion_count
    FROM doctor_companion
    WHERE doctor_id = input_doctor_id;

    RETURN companion_count;
END //

DELIMITER ;


SELECT 
    d.name AS doctor_name,
    count_doctor_companions(d.id) AS total_companions
FROM 
    doctors d;