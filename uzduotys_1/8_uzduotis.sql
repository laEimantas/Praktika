SELECT dl.sname
      ,dt.sname as type_name
      ,dp.sname as position_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_positions dp
WHERE  dl.nid = dt.ndefect_location_id(+)
AND    dt.nid = dp.ndefect_type_id(+);