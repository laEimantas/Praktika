-- optimizuotas variantas   

SELECT   COUNT(*) AS defect_count
        ,dl.sname
FROM     defect_locations dl
        ,defect_types dt
        ,defect_location_defect_types dldt
WHERE    dl.nid = dldt.nlocation_id
AND      dt.nid = dldt.ntype_id
GROUP BY dl.sname
ORDER BY defect_count DESC
FETCH    FIRST 1 ROWS WITH TIES;

-- neoptimizuotas variantas
WITH
    defect_counts
    AS
        (SELECT   COUNT(*) AS defect_count
                 ,dl.sname
         FROM     defect_locations dl
                 ,defect_types dt
                 ,defect_location_defect_types dldt
         WHERE    dl.nid = dldt.nlocation_id
         AND      dt.nid = dldt.ntype_id
         GROUP BY dl.sname)
SELECT *
FROM   defect_counts query1
      ,(SELECT MAX(query2.defect_count) AS defect_max
        FROM   defect_counts query2) query3
WHERE  query1.defect_count = query3.defect_max;
