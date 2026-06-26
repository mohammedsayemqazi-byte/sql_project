WITH skills_demand_count as (
SELECT
   skills_dim.skill_id,
    skills_dim.skills as skill_name,
    skills_dim.type as skill_type,
    count(skills_job_dim.job_id) as skill_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
 AND 
    salary_year_avg IS NOT NULL
AND 
    job_work_from_home = TRUE
GROUP BY 
    skills_dim.skill_id
), Average_salary_count as (
    Select 
    skills_job_dim.skill_id,
    skills_dim.skills as skill_name,
    skills_dim.type as skill_type,
   Round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
FROM
    job_postings_fact 
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
AND 
    salary_year_avg IS NOT NULL
AND 
    job_work_from_home = TRUE
GROUP BY 
    skills_job_dim.skill_id,
     skill_name,
     skill_type
)

SELECT
    skills_demand_count.skill_id,
    skills_demand_count.skill_name,
    skills_demand_count.skill_type,
    skills_demand_count.skill_count,
    average_salary_count.avg_salary
FROM
    skills_demand_count
INNER JOIN
    average_salary_count
ON
    skills_demand_count.skill_id = average_salary_count.skill_id
WHERE
    skill_count > 10
ORDER BY 
    avg_salary DESC,
    skill_count DESC
LIMIT 25;
