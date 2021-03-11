SELECT
  invoice_line.invoice_id,
  line_no,
  sum(tax) OVER (PARTITION BY invoice_line.invoice_id) as sum_tax,
  avg(tax) OVER (PARTITION BY invoice_line.invoice_id) as avg_tax,
  zip_code
FROM
  invoice_line
  JOIN address on (address.invoice_id = invoice_line.invoice_id),
  invoice
ORDER BY
  line_no
