SELECT COUNT(dt.sname) AS defect_count
        ,dl.sname
        ,dl.nid
FROM     defect_locations dl
        ,defect_types dt
WHERE    dl.nid = dt.ndefect_location_id
GROUP BY dl.sname
        ,dl.nid
HAVING   COUNT(dt.sname) >= 2;

SELECT   COUNT(dp.sname) AS defect_pos_count
        ,dt.sname
        ,dl.sname as location_name
FROM     defect_types dt
        ,defect_positions dp
        ,defect_locations dl
WHERE    dt.nid = dp.ndefect_type_id
AND      dl.nid = dt.ndefect_location_id
GROUP BY dt.sname
        ,dl.sname;