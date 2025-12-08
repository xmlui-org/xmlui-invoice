WITH RECURSIVE
    bounds AS (
        SELECT
            COALESCE(
                    NULLIF(:start_date, ''),
                    MIN(date(paid_date))
            ) AS start_date,
            COALESCE(
                    NULLIF(:end_date, ''),
                    MAX(date(paid_date))
            ) AS end_date
        FROM invoices
        WHERE status = 'paid'
    ),

    date_series(day) AS (
        SELECT start_date
        FROM bounds

        UNION ALL

        SELECT date(day, '+1 day')
        FROM date_series, bounds
        WHERE day < end_date
    )

SELECT
    date_series.day AS date,
    strftime('%Y-%m-%d', date_series.day) AS date_formatted,
    COALESCE(SUM(invoices.total), 0) AS total
FROM
    date_series
        LEFT JOIN invoices
                  ON date(invoices.paid_date) = date_series.day
                      AND invoices.status = 'paid'
GROUP BY
    date_series.day
ORDER BY
    date_series.day;
