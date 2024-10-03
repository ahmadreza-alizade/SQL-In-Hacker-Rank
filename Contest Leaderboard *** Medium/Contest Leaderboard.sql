
select final.derived_hi as final_hi,
       hackers.name as name,
       final.summation as final_sum
from (select derived.hi as derived_hi,
       sum(max_score) as summation
from  (select submissions.hacker_id as hi,
       submissions.challenge_id as ci,
       max(submissions.score) as max_score
    from hackers
    inner join submissions on hackers.hacker_id = submissions.hacker_id
    group by submissions.hacker_id, submissions.challenge_id
      ) as derived 
group by hi
having summation != 0 ) as final
inner join hackers 
on hackers.hacker_id = final.derived_hi
order by final_sum DESC, final_hi ASC 
