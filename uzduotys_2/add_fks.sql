ALTER TABLE defect_location_defect_types
    ADD CONSTRAINT fk_location_types FOREIGN KEY(nlocation_id) REFERENCES defect_locations (nid);

ALTER TABLE defect_location_defect_types
    ADD CONSTRAINT fk_type_types FOREIGN KEY(ntype_id) REFERENCES defect_types (nid);

ALTER TABLE defect_type_defect_positions
    ADD CONSTRAINT fk_type_positions FOREIGN KEY(ntype_id) REFERENCES defect_types (nid);

ALTER TABLE defect_type_defect_positions
    ADD CONSTRAINT fk_position_positions FOREIGN KEY(nposition_id) REFERENCES defect_positions (nid);