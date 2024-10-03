SELECT w.id,
       p.age, 
       w.coins_needed, 
       w.power 
FROM wands w 
JOIN wands_property p ON w.code = p.code 
WHERE p.is_evil = 0 AND 
w.coins_needed = (SELECT MIN(coins_needed) 
                  FROM wands WHERE code = w.code AND power = w.power) 
ORDER BY w.power Desc, p.age Desc;
