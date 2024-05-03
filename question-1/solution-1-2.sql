WITH po_totals AS (
    SELECT
        pr_id,
        SUM(quantity) AS total_po_items
    FROM
        table_po_line
    GROUP BY
        pr_id
),
     cer_totals AS (
         SELECT
             pr_id,
             SUM(quantity) AS total_cer_items
         FROM
             table_cer_line
         GROUP BY
             pr_id
     )
SELECT
    po.pr_id,
    po.total_po_items AS total_po_items,
    cer.total_cer_items AS total_cer_items,
    CASE
        WHEN po.total_po_items = cer.total_cer_items THEN 'Tally'
        ELSE 'Not Tally'
        END AS tally_status
FROM
    po_totals po
        JOIN
    cer_totals cer ON po.pr_id = cer.pr_id;
