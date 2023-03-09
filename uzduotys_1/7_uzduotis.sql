SELECT dl.nid
      ,dl.sname
      ,dt.nid AS type_id
      ,dt.sname AS type_name
      ,dt.ndefect_location_id
      ,dp.nid AS position_id
      ,dp.ndefect_type_id
      ,dp.sname AS position_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_positions dp
WHERE  dl.nid = dt.ndefect_location_id
AND    dt.nid = dp.ndefect_type_id;