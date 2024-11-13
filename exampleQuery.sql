SELECT 
    d.name AS doctor_name,
    COUNT(DISTINCT e.id) AS total_enemy_episodes
FROM 
    doctors d
JOIN 
    episodes e ON d.id = e.doctor_id
JOIN 
    episode_enemy ee ON e.id = ee.episode_id
WHERE 
    d.id = (
        SELECT doctor_id
        FROM episodes e
        JOIN episode_enemy ee ON e.id = ee.episode_id
        GROUP BY e.doctor_id
        ORDER BY COUNT(DISTINCT e.id) DESC
        LIMIT 1
    )
GROUP BY d.name;


