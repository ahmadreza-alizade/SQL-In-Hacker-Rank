select b.hacker_id,
       b.name,
       b.counter 
from ( select a.hacker_id,
              a.name, 
              a.counter,
              max(a.counter) OVER() as max_count, 
              COUNT(a.counter) OVER (PARTITION BY a.counter) as group_count 
      from ( select h.hacker_id,
                    h.name, 
                    count(distinct c.challenge_id) as counter 
      from Hackers h JOIN Challenges c on c.hacker_id = h.hacker_id 
            group by h.hacker_id, h.name )a )b 
where b.counter = b.max_count or b.group_count = 1 
order by b.counter desc, b.hacker_id ASC
