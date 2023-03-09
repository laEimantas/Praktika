SELECT dl.nid
      ,dl.sname
      ,dt.nid AS defect_id
      ,dt.sname AS type_name
      ,dt.ndefect_location_id
      ,dp.nid AS position_id
      ,dp.sname AS position_name
      ,dp.ndefect_type_id
FROM   defect_types dt
      ,defect_positions dp
      ,defect_locations dl
WHERE  dt.nid = dp.ndefect_type_id
AND    dl.nid = dt.ndefect_location_id;