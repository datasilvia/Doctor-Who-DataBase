CREATE VIEW episode_details AS
SELECT 
    e.id AS episode_id,
    e.name AS episode_name,
    e.description AS episode_description,
    e.year AS episode_year,
    d.name AS doctor_name,
    c.name AS companion_name,
    en.name AS enemy_name
FROM 
    episodes e
JOIN 
    doctors d ON e.doctor_id = d.id
LEFT JOIN 
    episode_companion ec ON e.id = ec.episode_id
LEFT JOIN 
    companions c ON ec.companion_id = c.id
LEFT JOIN 
    episode_enemy ee ON e.id = ee.episode_id
LEFT JOIN 
    enemies en ON ee.enemy_id = en.id;