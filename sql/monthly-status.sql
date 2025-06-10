SELECT
  strftime('%Y-%m', issue_date) as month,
  SUM(CASE WHEN status = 'paid' THEN total ELSE 0 END) as paid_revenue,
  SUM(CASE WHEN status = 'sent' THEN total ELSE 0 END) as sent_revenue
FROM invoices
GROUP BY strftime('%Y-%m', issue_date)
ORDER BY month;