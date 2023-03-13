SELECT dl.sname
      ,NVL(dp.sname, 'NOT FOUND') AS not_found_nvl
      ,COALESCE(TO_CHAR(dp.sname)
               ,'NOT FOUND') AS not_found_coalesce
      ,DECODE(dp.sname, NULL, 'NOT FOUND') AS not_found_decode
      ,CASE WHEN dp.sname IS NULL THEN 'NOT FOUND' ELSE dp.sname END AS not_found_case
      ,NVL2(dp.sname, dp.sname, 'NOT FOUND') AS not_found_nvl2
      ,dp.sname AS position_name
FROM   defect_locations dl
      ,defect_types dt
      ,defect_positions dp
WHERE  dl.nid = dt.ndefect_location_id(+)
AND    dt.nid = dp.ndefect_type_id(+);