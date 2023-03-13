SELECT dl.sname
      ,dt.sname AS defect_name
      ,dp.sname AS position_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_positions dp
WHERE  dl.nid = dt.ndefect_location_id(+)
AND    dt.nid = dp.ndefect_type_id(+)
AND    dp.sname IS NULL;