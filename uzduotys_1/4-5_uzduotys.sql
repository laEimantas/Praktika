ALTER TABLE defect_types
    ADD ndefect_location_id NUMBER(10);

ALTER TABLE defect_positions
    ADD ndefect_type_id NUMBER(10);