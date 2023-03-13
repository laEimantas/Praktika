SELECT   dl.sname AS location_name
        ,dt.sname AS type_name
        ,dt.nid
FROM     defect_locations dl
        ,defect_types dt
        ,defect_location_defect_types dldt
        ,defect_type_defect_positions dtdp
WHERE    dl.nid = dldt.nlocation_id
AND      dt.nid = dldt.ntype_id
AND      dt.nid NOT IN (SELECT dtdp.ntype_id
                        FROM   defect_type_defect_positions dtdp)
GROUP BY dl.sname
        ,dt.sname
        ,dt.nid;


--NEVEIKIA [NOT EXISTS variantas]
SELECT   dl.sname AS location_name
        ,dt.sname AS type_name
        ,dt.nid
FROM     defect_locations dl
        ,defect_types dt
        ,defect_location_defect_types dldt
        ,defect_type_defect_positions dtdp
WHERE    dl.nid = dldt.nlocation_id
AND      dt.nid = dldt.ntype_id
AND      NOT EXISTS
             (SELECT *
              FROM   defect_types dt
              WHERE  dt.nid = dtdp.ntype_id)
GROUP BY dl.sname
        ,dt.sname
        ,dt.nid;