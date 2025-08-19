/*
Question: What skills are requested for the top-paying data analyst job?
- use the top 10 highest-paying Data Analyst jobs from first query
- add the specific skills required for these roles
- why? it provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

-- using CTEs
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        name as company_name,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date    
    FROM
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'India' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*
🧩 Insights
Core trio = SQL + Excel + Python → must-have for most data analyst jobs.
Visualization tools (Tableau, Power BI) are valuable differentiators.
AI/ML frameworks (TensorFlow, PyTorch) show up, suggesting overlap with data science.
Collaboration & documentation tools (Jira, Confluence, Word, Visio) are expected in enterprise settings.
Cloud & systems knowledge (Azure, Unix, Windows) indicates a shift towards hybrid analyst-engineer roles.
*/


/*
[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "skills": "flow"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "skills": "excel"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "skills": "word"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "skills": "powerpoint"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "skills": "sql"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "skills": "python"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "skills": "r"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "company_name": "Loop Health",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "skills": "sheets"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "skills": "sql"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "skills": "python"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "skills": "excel"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "skills": "tableau"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "company_name": "Clarivate",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "skills": "word"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "skills": "sql"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "skills": "unix"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "skills": "windows"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "company_name": "Miratech",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "skills": "tableau"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "skills": "python"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "skills": "tensorflow"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "company_name": "AlphaSense",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "skills": "pytorch"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "sql"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "oracle"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "excel"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "word"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "outlook"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "company_name": "Cargill",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "skills": "flow"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "skills": "python"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "skills": "r"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "company_name": "Bristol Myers Squibb",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "skills": "excel"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22 17:08:01",
    "skills": "sql"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "company_name": "Merck Group",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22 17:08:01",
    "skills": "python"
  }
]
*/