SELECT
  date,
  amount,
  SUM(amount) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_amount
FROM transactions;


SELECT
  id,
  category,
  price,
  price - AVG(price) OVER (PARTITION BY category) AS price_deviation
FROM products;


SELECT
  log_time,
  temperature,
  AVG(temperature) OVER (
    ORDER BY log_time 
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg_3
FROM temperature_logs;


SELECT
  task_id,
  project_id,
  start_date,
  MIN(start_date) OVER (PARTITION BY project_id) AS first_task_date,
  MAX(start_date) OVER (PARTITION BY project_id) AS last_task_date
FROM project_tasks;
