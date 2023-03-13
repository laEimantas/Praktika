SELECT *
FROM   defect_locations dl
      ,defect_location_defect_types dldt
      ,defect_types dt
      ,defect_type_defect_positions dtdp
      ,defect_positions dp
WHERE  dl.nid = dldt.nlocation_id(+)
AND    dldt.ntype_id = dt.nid(+)
AND    dt.nid = dtdp.ntype_id(+)
AND    dtdp.nposition_id = dp.nid(+);