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
SELECT dc.defect_count as defect_count, dl.sname as location_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_location_defect_types dldt
      ,defect_counts dc
WHERE  dl.nid = dldt.nlocation_id
AND    dt.nid = dldt.ntype_id
group by dl.sname, dc.defect_count;