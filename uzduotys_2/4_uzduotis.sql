CREATE TABLE defect_location_defect_types
(
    nid             NUMBER DEFAULT location_type_seq.NEXTVAL NOT NULL
   ,nlocation_id    NUMBER NOT NULL
   ,ntype_id        NUMBER NOT NULL
);

CREATE TABLE defect_type_defect_positions
(
    nid             NUMBER DEFAULT type_position_seq.NEXTVAL NOT NULL
   ,ntype_id        NUMBER NOT NULL
   ,nposition_id    NUMBER NOT NULL
);