-- optimizuotas variantas

SELECT   dl.nid
        ,dl.sname
        ,(SELECT COUNT(*)
          FROM   defect_types dt
                ,defect_location_defect_types dtdt
          WHERE  dl.nid = dtdt.nlocation_id
          AND    dt.nid = dtdt.ntype_id) AS defect_type_count
        ,(SELECT COUNT(*)
          FROM   defect_location_defect_types dldt
                ,defect_type_defect_positions dtdp
          WHERE  dldt.ntype_id = dtdp.ntype_id
          AND    dl.nid = dldt.nlocation_id) AS defect_pos_count
FROM     defect_locations dl
ORDER BY defect_type_count DESC;

-- neoptimizuotas variantas
WITH
    dldt_counts
    AS
        (SELECT   COUNT(*) AS type_count
                 ,dldt.nlocation_id
                 ,dldt.ntype_id
         FROM     defect_location_defect_types dldt
         GROUP BY dldt.nlocation_id
                 ,dldt.ntype_id),
    dtdp_counts
    AS
        (SELECT   COUNT(*) AS position_count
                 ,dtdp.ntype_id
         FROM     defect_type_defect_positions dtdp
         GROUP BY dtdp.ntype_id)
SELECT   dl.sname
        ,SUM(NVL(dlc.type_count, 0)) AS type_count
        ,SUM(NVL(dpc.position_count, 0)) AS pos_count
FROM     dldt_counts dlc
        ,dtdp_counts dpc
        ,defect_locations dl
        ,defect_types dt
WHERE    dl.nid = dlc.nlocation_id(+)
AND      dt.nid = dpc.ntype_id(+)
AND      dt.nid(+) = dlc.ntype_id
GROUP BY dl.sname
        ,dlc.type_count
        ,dpc.position_count;
