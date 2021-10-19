#Sales query
SELECT
  Format_Datetime("%Y-%m-%d", DATETIME) as Date,
  Extract(hour from DATETIME) AS Hour,
  ROUND(SUM(total),2) AS sales,
  COUNT(DISTINCT( CONCAT(CAST(EXTRACT(DATE
          FROM
            datetime) AS STRING), CAST(register_no AS STRING), CAST(emp_no AS STRING), CAST(trans_no AS STRING)))) AS transactions,
  SUM(CASE
      WHEN (trans_status = 'V' OR trans_status = 'R') THEN -1
    ELSE
    1
  END
    ) AS items
FROM
  `beskoonlettuce-327919.wedge_transactions.transArchive_*`
WHERE
  department != 0
  AND department != 15
  AND trans_status != 'M'
  AND trans_status != 'C'
  AND trans_status != 'J'
  AND (trans_status IS NULL
    OR trans_status = ' '
    OR trans_status = 'V'
    OR trans_status = 'R')
GROUP BY Date, Hour
Order by Date, Hour

# Owner query
SELECT
  card_no,
  EXTRACT(YEAR
  FROM
    datetime) AS year,
  EXTRACT(MONTH
  FROM
    datetime) AS month,
  ROUND(SUM(total),2) AS sales,
  COUNT(DISTINCT( CONCAT(CAST(EXTRACT(DATE
          FROM
            datetime) AS STRING), CAST(register_no AS STRING), CAST(emp_no AS STRING), CAST(trans_no AS STRING)))) AS transactions,
  SUM(CASE
      WHEN (trans_status = 'V' OR trans_status = 'R') THEN -1
    ELSE
    1
  END
    ) AS items
FROM
  `umt-msba.wedge_transactions.transArchive_*`
WHERE
  card_no != 3 
  AND department != 0
  AND department != 15
  AND trans_status != 'M'
  AND trans_status != 'C'
  AND trans_status != 'J'
  AND (trans_status IS NULL
    OR trans_status = ' '
    OR trans_status = 'V'
    OR trans_status = 'R')
GROUP BY
  card_no,
  year,
  month
ORDER BY
  card_no,
  year,
  month
  
#Product query
SELECT description,
                   EXTRACT(YEAR from datetime) as year,
                   EXTRACT(MONTH from datetime) as month,
                   UPC,
                   t1.department as DeptNo,
                   t2.dept_name as DeptName,
                   ROUND(SUM(total),2) AS sales,
                   COUNT(distinct(
                      CONCAT(CAST(EXTRACT(DATE from datetime) AS STRING),
                             CAST(register_no AS STRING),
                             CAST(emp_no AS STRING),
                             CAST(trans_no AS STRING)))) as transactions,
                   SUM(CASE WHEN (trans_status = 'V' or trans_status = 'R') THEN -1 ELSE 1 END) as items
                   FROM `umt-msba.wedge_transactions.transArchive_*` as t1
                   JOIN `umt-msba.wedge_transactions.department_lookup` as t2 ON t1.department = t2.department
                     WHERE t1.department != 0 and
                          t1.department != 15 and
                          trans_status != 'M' and
                          trans_status != 'C' and
                          trans_status != 'J' and
                         (trans_status IS NULL or 
                          trans_status = ' ' or 
                          trans_status = 'V' or 
                          trans_status = 'R') 
                    GROUP BY description, year, month, UPC, DeptNo, DeptName
                    ORDER BY sales, description, year, month