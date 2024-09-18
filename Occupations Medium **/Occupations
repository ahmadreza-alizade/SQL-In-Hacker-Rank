--so educative row_number(), partition, pivot.

SELECT 
-- cause the selection is from only one item there is no difference between main() & max().
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor, 
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor, 
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer, 
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor 
FROM ( 
    SELECT Name, Occupation, ROW_NUMBER() OVER (partition by occupation order by name) as RowNum   
    FROM OCCUPATIONS 
    ) AS Temp 
GROUP BY RowNum ORDER BY RowNum;
