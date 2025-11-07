-- Create a recursive CTE to generate a date series (by day)
WITH RECURSIVE date_series(day) AS (
  -- Start with the provided start_date
  SELECT date(?)

  UNION ALL

  -- Generate dates by day (1-day increments)
  SELECT date(day, '+1 day')
  FROM date_series
  WHERE day < date(?)
)

-- Join with the invoices table to get daily totals
SELECT
  date_series.day AS date,
  strftime('%Y-%m-%d', date_series.day) AS date_formatted,
  COALESCE(SUM(invoices.total), 0) AS total
FROM
  date_series
LEFT JOIN
  invoices ON
    date(invoices.paid_date) = date_series.day AND
    invoices.status = 'paid' AND
    date(invoices.paid_date) >= ? AND
    date(invoices.paid_date) <= ?
GROUP BY
  date_series.day
ORDER BY
  date_series.day;