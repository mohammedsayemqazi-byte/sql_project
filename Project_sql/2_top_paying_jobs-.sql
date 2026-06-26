WITH Top_paying_jobs as (
SELECT 
    job_id,
    C.company_id,
    C.name as company_name,
    job_title,
    salary_year_avg
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
LIMIT 10
)

Select 
    Top_paying_jobs.*,
    s1.skill_id,
    s2.skills as skill_name,
    s2.type as skill_type
 FROM 
    skills_job_dim as s1
INNER JOIN
    Top_paying_jobs 
ON
    s1.job_id=top_paying_jobs.job_id
Inner JOIN
    skills_dim as s2
ON
    s1.skill_id=s2.skill_id
ORDER BY 
    salary_year_avg DESC;

/*
SQL appears in every role (100%) – it’s the universal baseline.

Python is in 7 out of 8 (87.5%) – highly valued but not mandatory.

Tableau appears in 6 out of 8 (75%) – the most popular visualization tool.

R shows up in 4 roles (50%).

Cloud platforms (AWS, Azure, Snowflake, Oracle, Databricks) are present in 5 roles – often in higher‑paying positions.

Other common tools: Excel (3 roles), Power BI (2), pandas (2), numpy (2), and various collaboration tools (Jira, Confluence, Git, etc.). 

[
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 5,
    "skill_name": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 74,
    "skill_name": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 75,
    "skill_name": "databricks",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 76,
    "skill_name": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 93,
    "skill_name": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 95,
    "skill_name": "pyspark",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 102,
    "skill_name": "jupyter",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 181,
    "skill_name": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 183,
    "skill_name": "power bi",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "company_id": 5835,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skill_id": 196,
    "skill_name": "powerpoint",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "company_id": 183972,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "company_id": 183972,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "company_id": 183972,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skill_id": 5,
    "skill_name": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "company_id": 183972,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skill_id": 97,
    "skill_name": "hadoop",
    "skill_type": "libraries"
  },
  {
    "job_id": 99305,
    "company_id": 183972,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "company_id": 381287,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1021647,
    "company_id": 381287,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skill_id": 23,
    "skill_name": "crystal",
    "skill_type": "programming"
  },
  {
    "job_id": 1021647,
    "company_id": 381287,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skill_id": 79,
    "skill_name": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 1021647,
    "company_id": 381287,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "company_id": 381287,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skill_id": 215,
    "skill_name": "flow",
    "skill_type": "other"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 8,
    "skill_name": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 80,
    "skill_name": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 93,
    "skill_name": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 94,
    "skill_name": "numpy",
    "skill_type": "libraries"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 181,
    "skill_name": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skill_id": 220,
    "skill_name": "gitlab",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 74,
    "skill_name": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 76,
    "skill_name": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 79,
    "skill_name": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 80,
    "skill_name": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 183,
    "skill_name": "power bi",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 189,
    "skill_name": "sap",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 211,
    "skill_name": "jenkins",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 218,
    "skill_name": "bitbucket",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 219,
    "skill_name": "atlassian",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 233,
    "skill_name": "jira",
    "skill_type": "async"
  },
  {
    "job_id": 731368,
    "company_id": 1261,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skill_id": 234,
    "skill_name": "confluence",
    "skill_type": "async"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 5,
    "skill_name": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 210,
    "skill_name": "git",
    "skill_type": "other"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 218,
    "skill_name": "bitbucket",
    "skill_type": "other"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 219,
    "skill_name": "atlassian",
    "skill_type": "other"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 233,
    "skill_name": "jira",
    "skill_type": "async"
  },
  {
    "job_id": 310660,
    "company_id": 4707,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skill_id": 234,
    "skill_name": "confluence",
    "skill_type": "async"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 8,
    "skill_name": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 80,
    "skill_name": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 93,
    "skill_name": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 94,
    "skill_name": "numpy",
    "skill_type": "libraries"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 181,
    "skill_name": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "company_id": 19724,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skill_id": 220,
    "skill_name": "gitlab",
    "skill_type": "other"
  },
  {
    "job_id": 387860,
    "company_id": 2686,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skill_id": 0,
    "skill_name": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 387860,
    "company_id": 2686,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skill_id": 1,
    "skill_name": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 387860,
    "company_id": 2686,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skill_id": 5,
    "skill_name": "r",
    "skill_type": "programming"
  }
]
*/
    

