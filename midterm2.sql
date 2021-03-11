SELECT
  invoice.invoice_id,
  line_no,
  sum(tax) OVER (PARTITION BY invoice.invoice_id) as sum_tax,
  avg(tax) OVER (PARTITION BY invoice.invoice_id) as avg_tax,
  zip_code
FROM
invoice
LEFT JOIN address on (address.invoice_id = invoice.invoice_id)
LEFT JOIN invoice_line on (invoice_line.invoice_id = invoice.invoice_id)
ORDER BY
  line_no;
