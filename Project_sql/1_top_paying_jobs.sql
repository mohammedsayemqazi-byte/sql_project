SELECT 
    job_id,
    C.company_id,
    C.name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date
FROM
    job_postings_fact as J
INNER JOIN
    company_dim as C
ON J.company_id=C.company_id
WHERE 
    Job_title_short = 'Data Analyst'
AND
    Job_work_from_home = TRUE 
AND 
    job_location = 'Anywhere'
AND
    Salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10;

