DROP FUNCTION IF EXISTS count_enemy_episodes;


DELIMITER //

CREATE FUNCTION count_enemy_episodes(input_enemy_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE episode_count INT;
    
    SELECT COUNT(DISTINCT episode_id) INTO episode_count
    FROM episode_enemy
    WHERE enemy_id = input_enemy_id;

    RETURN episode_count;
END //

DELIMITER ;



SELECT 
    e.name AS enemy_name,
    count_enemy_episodes(e.id) AS total_episodes
FROM 
    enemies e;
