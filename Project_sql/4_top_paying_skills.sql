
Select 
    skills as skill_name,
    type as skill_type,
   Round(avg(salary_year_avg),0) as avg_salary
FROM
    job_postings_fact as j1
INNER JOIN
    skills_job_dim as s1
ON 
    j1.job_id=s1.job_id
INNER JOIN
    skills_dim as s2
ON
    s1.skill_id=s2.skill_id
WHERE
    job_title_short = 'Data Analyst'
AND 
    salary_year_avg IS NOT NULL
AND 
    job_work_from_home = TRUE
GROUP BY 
    skill_name,
    skill_type
ORDER BY 
    avg_salary DESC
Limit 25;

/*
1. Big Data & orchestration command the highest premiums – PySpark (#1 at $208k), Databricks (#13), and 
Airflow (#18) sit near the top. This shows that companies pay far more for skills that scale data 
processing and automate pipelines than for basic querying or standard BI dashboards.

2. DevOps/software engineering practices are a major salary booster – Version control(Bitbucket #2, GitLab #6), 
CI/CD (Jenkins #20), and even OS knowledge (Linux #14) appear unexpectedly high. Top‑paying analyst 
roles increasingly require engineering discipline – not just analyzing data, but managing code,
deployments, and infrastructure.

3. Niche/enterprise tools drive outlier salaries, not just common languages – Specialized platforms 
like Watson (AI/cloud), DataRobot (AutoML), and Couchbase (NoSQL) all rank in the top 5. 
Meanwhile, general‑purpose languages like Swift/Go also appear, suggesting these are often tied to 
specific high‑value product teams, whereas standard Python libraries (pandas, numpy) are 
more common and thus carry lower average salaries (~$143k‑$152k).
[
  {
    "skill_name": "pyspark",
    "skill_type": "libraries",
    "avg_salary": "208172"
  },
  {
    "skill_name": "bitbucket",
    "skill_type": "other",
    "avg_salary": "189155"
  },
  {
    "skill_name": "couchbase",
    "skill_type": "databases",
    "avg_salary": "160515"
  },
  {
    "skill_name": "watson",
    "skill_type": "cloud",
    "avg_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "skill_type": "analyst_tools",
    "avg_salary": "155486"
  },
  {
    "skill_name": "gitlab",
    "skill_type": "other",
    "avg_salary": "154500"
  },
  {
    "skill_name": "swift",
    "skill_type": "programming",
    "avg_salary": "153750"
  },
  {
    "skill_name": "jupyter",
    "skill_type": "libraries",
    "avg_salary": "152777"
  },
  {
    "skill_name": "pandas",
    "skill_type": "libraries",
    "avg_salary": "151821"
  },
  {
    "skill_name": "elasticsearch",
    "skill_type": "databases",
    "avg_salary": "145000"
  },
  {
    "skill_name": "golang",
    "skill_type": "programming",
    "avg_salary": "145000"
  },
  {
    "skill_name": "numpy",
    "skill_type": "libraries",
    "avg_salary": "143513"
  },
  {
    "skill_name": "databricks",
    "skill_type": "cloud",
    "avg_salary": "141907"
  },
  {
    "skill_name": "linux",
    "skill_type": "os",
    "avg_salary": "136508"
  },
  {
    "skill_name": "kubernetes",
    "skill_type": "other",
    "avg_salary": "132500"
  },
  {
    "skill_name": "atlassian",
    "skill_type": "other",
    "avg_salary": "131162"
  },
  {
    "skill_name": "twilio",
    "skill_type": "sync",
    "avg_salary": "127000"
  },
  {
    "skill_name": "airflow",
    "skill_type": "libraries",
    "avg_salary": "126103"
  },
  {
    "skill_name": "scikit-learn",
    "skill_type": "libraries",
    "avg_salary": "125781"
  },
  {
    "skill_name": "jenkins",
    "skill_type": "other",
    "avg_salary": "125436"
  },
  {
    "skill_name": "notion",
    "skill_type": "async",
    "avg_salary": "125000"
  },
  {
    "skill_name": "scala",
    "skill_type": "programming",
    "avg_salary": "124903"
  },
  {
    "skill_name": "postgresql",
    "skill_type": "databases",
    "avg_salary": "123879"
  },
  {
    "skill_name": "gcp",
    "skill_type": "cloud",
    "avg_salary": "122500"
  },
  {
    "skill_name": "microstrategy",
    "skill_type": "analyst_tools",
    "avg_salary": "121619"
  }
]
*/