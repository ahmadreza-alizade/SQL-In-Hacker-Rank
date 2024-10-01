select  hackers.hacker_id, hackers.name

from  hackers inner join ((Challenges 
inner join Submissions on 
      challenges.challenge_id = submissions.challenge_id)
      join Difficulty on 
      challenges.difficulty_level = Difficulty.Difficulty_level)
      on hackers.hacker_id = submissions.hacker_id 

where Difficulty.score = submissions.score 

group by hackers.hacker_id, hackers.name

having count(*) > 1

order by count(*) DESC, hackers.hacker_id ASC

