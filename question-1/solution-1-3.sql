SELECT
    po.pr_id,
    cer.pr_id,
    po_line.sequence AS po_sequence,
    cer_line.sequence AS cer_sequence,
    po_line.product_id AS po_product_id,
    cer_line.product_id AS cer_product_id,
    CASE
        WHEN po_line.sequence IS NULL THEN 'PO Item Missing'
        WHEN cer_line.sequence IS NULL THEN 'CER Item Missing'
        WHEN po_line.sequence = cer_line.sequence AND po_line.product_id = cer_line.product_id THEN 'Match'
        ELSE 'Mismatch'
        END AS item_status
FROM
    table_po po
        JOIN
    table_po_line po_line ON po.id = po_line.po_id
        LEFT JOIN
    table_cer cer ON po.pr_id = cer.pr_id
        LEFT JOIN
    table_cer_line cer_line ON cer.id = cer_line.cer_id
        AND po_line.sequence = cer_line.sequence
        AND po_line.product_id = cer_line.product_id;
