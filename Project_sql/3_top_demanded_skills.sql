With top_demanded_skills as (
Select 
    skill_id,
    count(*) as demand_count
FROM
    skills_job_dim as s1
INNER JOIN
    job_postings_fact as j1
ON 
    s1.job_id=j1.job_id
WHERE
    job_title_short = 'Data Analyst'
AND 
    job_work_from_home = TRUE
GROUP BY 
    skill_id
ORDER BY 
    demand_count DESC
Limit 5
)

Select top_demanded_skills.*,
skills_dim.skills as skill_name,
skills_dim.type as skill_type
 FROM 
    top_demanded_skills
INNER JOIN
    skills_dim
ON
    skills_dim.skill_id=top_demanded_skills.skill_id
ORDER BY 
    demand_count DESC
LIMIT 5;