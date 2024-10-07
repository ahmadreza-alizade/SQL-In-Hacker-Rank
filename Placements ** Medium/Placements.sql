select 
       -- stu.id as sid,
       -- pg_2.salary as pg2s,
       stu.name as sname
       -- fri.friend_id as f_fid,
       -- pg_1.salary as pg1s
from (((students stu
inner join friends fri
            on stu.id = fri.id) 
            inner join packages pg_1 on fri.friend_id = pg_1.id) 
inner join packages pg_2 on stu.id = pg_2.id)
where pg_1.salary > pg_2.salary
order by pg_1.salary ASC

            
