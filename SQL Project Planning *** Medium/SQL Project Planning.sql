WITH project_groups AS (
    SELECT 
        task_id,
        start_date,
        end_date,
        -- Identify if a new project starts by checking if the start_date is NOT equal to the previous row's end_date
        CASE 
            WHEN LAG(end_date) OVER (ORDER BY start_date) = start_date
            THEN 0
            ELSE 1
        END AS new_project_flag
    FROM projects
),
project_assignment AS (
    SELECT 
        task_id,
        start_date,
        end_date,
        -- Assign a project ID by doing a cumulative sum on the new_project_flag
        SUM(new_project_flag) OVER (ORDER BY start_date) AS project_id
    FROM project_groups
)
-- Select the start and end dates of each project
SELECT 
    -- project_id,
    MIN(start_date) AS project_start_date,
    MAX(end_date) AS project_end_date
FROM project_assignment
GROUP BY project_id
order by datediff(project_end_date, project_start_date) ASC, project_start_date ASC
