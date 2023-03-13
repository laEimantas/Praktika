ALTER TABLE defect_locations
    ADD CONSTRAINT location_pk PRIMARY KEY(nid);

ALTER TABLE defect_types
    ADD CONSTRAINT type_pk PRIMARY KEY(nid);

ALTER TABLE defect_positions
    ADD CONSTRAINT position_pk PRIMARY KEY(nid);