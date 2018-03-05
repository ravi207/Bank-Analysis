SELECT survey_id, AVG(rating) FROM
(
SELECT survey_id, rating, COUNT(user_id) OVER (PARTITION BY survey_id) AS num_users
FROM bank.survey_analysis
) inner
WHERE num_users >= 10
GROUP BY survey_id
HAVING AVG(rating) < 3;

SELECT survey_id, rank FROM
(
SELECT survey_id, RANK() OVER (ORDER BY avg_rating) AS rank
FROM
(
SELECT survey_id, AVG(rating) AS avg_rating FROM
(
SELECT survey_id, rating, COUNT(user_id) OVER (PARTITION BY survey_id) AS num_users
FROM bank.survey_analysis
) inner_1
WHERE num_users >= 20
GROUP BY survey_id
) inner_2
) inner_3
WHERE rank = 1;