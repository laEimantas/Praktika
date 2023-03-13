SELECT dl.sname AS location_name
      ,dt.sname AS type_name
      ,dp.sname AS position_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_positions dp
      ,defect_location_defect_types dldt
      ,defect_type_defect_positions dtdp
WHERE  dl.nid = dldt.nlocation_id
AND    dt.nid = dldt.ntype_id
AND    dt.nid = dtdp.ntype_id
AND    dp.nid = dtdp.nposition_id;