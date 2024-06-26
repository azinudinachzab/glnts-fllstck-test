WITH po_totals AS (
    SELECT
        table_po.pr_id,
        SUM(quantity) AS total_po_items
    FROM
        table_po_line
        left join table_po on table_po_line.po_id = table_po.id
    GROUP BY
        table_po.pr_id
),
     cer_totals AS (
         SELECT
             table_cer.pr_id,
             SUM(quantity) AS total_cer_items
         FROM
             table_cer_line
         left join table_cer on table_cer_line.cer_id = table_cer.id
         GROUP BY
             table_cer.pr_id
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
        LEFT JOIN
    cer_totals cer ON po.pr_id = cer.pr_id
UNION
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
        RIGHT JOIN
    cer_totals cer ON po.pr_id = cer.pr_id
