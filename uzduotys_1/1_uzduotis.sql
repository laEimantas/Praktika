CREATE TABLE defect_locations
(
    nid      NUMBER(10) DEFAULT location_id_sequence.NEXTVAL NOT NULL
   ,sname    VARCHAR2(254)
);

CREATE TABLE defect_types
(
    nid      NUMBER(10) DEFAULT type_id_sequence.NEXTVAL NOT NULL
   ,sname    VARCHAR2(254)
);

CREATE TABLE defect_positions
(
    nid      NUMBER(10) DEFAULT position_id_sequence.NEXTVAL NOT NULL
   ,sname    VARCHAR2(254)
);