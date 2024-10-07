with my_f1 as(
    select row_number() over (order by f1.x) as row_id1,
        x,
        y
from functions f1
),
my_f2 as(
select row_number() over (order by f2.x) as row_id2,
        x,
        y
from functions f2
)
select distinct main_f1.x,
        main_f1.y
        -- main_f2.x,
        -- main_f2.y
from my_f1 main_f1
inner join my_f2 main_f2
        on main_f1.x = main_f2.y
        and main_f1.y = main_f2.x
where main_f1.row_id1 != main_f2.row_id2
    and main_f1.x <= main_f1.y
order by main_f1.x ASC






