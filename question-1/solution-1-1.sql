SELECT
    COUNT(DISTINCT po.id) AS total_po,
    COUNT(DISTINCT cer.id) AS total_cer
FROM
    table_pr pr
        LEFT JOIN
    table_po po ON pr.id = po.pr_id
        LEFT JOIN
    table_cer cer ON pr.id = cer.pr_id;
