-- First, create a recursive CTE to generate a date series (by week)
WITH RECURSIVE date_series(week_start) AS (
  -- Start with the provided start_date, aligned to the start of the week (Sunday)
  SELECT date( ?, 'weekday 0')

  UNION ALL

  -- Generate dates by week (7-day increments)
  SELECT date(week_start, '+7 days')
  FROM date_series
  WHERE week_start < date( ? )
)

-- Join with the invoices table to get weekly totals
SELECT
  date_series.week_start AS week_start_date,
  date(date_series.week_start, '+6 days') AS week_end_date,
  strftime('%Y-%m-%d', date_series.week_start) || ' to ' ||
  strftime('%Y-%m-%d', date(date_series.week_start, '+6 days')) AS week_range,
  COALESCE(SUM(invoices.total), 0) AS total
FROM
  date_series
LEFT JOIN
  invoices ON
    date(invoices.paid_date) >= date_series.week_start AND
    date(invoices.paid_date) <= date(date_series.week_start, '+6 days') AND
    invoices.status = 'paid' AND
    date(invoices.paid_date) >= ? AND
    date(invoices.paid_date) <= ?
GROUP BY
  date_series.week_start
ORDER BY
  date_series.week_start;