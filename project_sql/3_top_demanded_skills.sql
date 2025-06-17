/*
Q: What skills are the most in demand skills for data scientist?
- Join job postings to inner join table similar to query 2
- Identify top 5 in demand skills for data scientist
- Focusing on all job postings
- Retrieve top 5 skills with hishest demand in job market 
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5