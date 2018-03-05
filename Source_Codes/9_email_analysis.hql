USE bank;

SELECT id FROM
(
SELECT id, RANK() OVER (ORDER BY datediff(closed_date, opened_date) DESC) AS rank
FROM
(
SELECT id,
MIN(IF(opened="YES",reporting_date,NULL)) AS opened_date,
MIN(IF(closed="YES",reporting_date,NULL)) AS closed_date
FROM email_analysis
GROUP BY id
) inner_1
WHERE opened_date IS NOT NULL AND closed_date IS NOT NULL
) inner_2
WHERE rank = 1;


SELECT id
FROM
(
SELECT id,
MIN(IF(opened="YES",reporting_date,NULL)) AS opened_date,
MIN(IF(closed="YES",reporting_date,NULL)) AS closed_date
FROM email_analysis
GROUP BY id
) inner
WHERE opened_date IS NULL AND closed_date IS NOT NULL;
