-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-09-12 14:34:27 BDT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



DROP TABLE jersey CASCADE CONSTRAINTS;

DROP TABLE points_and_time CASCADE CONSTRAINTS;

DROP TABLE rider CASCADE CONSTRAINTS;

DROP TABLE rider_stages CASCADE CONSTRAINTS;

DROP TABLE stages CASCADE CONSTRAINTS;

DROP TABLE teams CASCADE CONSTRAINTS;

CREATE TABLE jersey (
    jersey_colour     NVARCHAR2(30) NOT NULL,
    rider_rider_no_   NUMBER(7) NOT NULL
);

ALTER TABLE jersey ADD CONSTRAINT jersey_pk PRIMARY KEY ( jersey_colour );

CREATE TABLE points_and_time (
    stage_number      NUMBER(2) NOT NULL,
    point             NUMBER(6) NOT NULL,
    time_hour         NUMBER(2) NOT NULL,
    rider_rider_no_   NUMBER(7) NOT NULL,
    time_min          NUMBER(2) NOT NULL
);

CREATE UNIQUE INDEX points_and_time__idx ON
    points_and_time (
        rider_rider_no_
    ASC );

ALTER TABLE points_and_time ADD CONSTRAINT points_and_time_pk PRIMARY KEY ( stage_number,
                                                                            rider_rider_no_ );

CREATE TABLE rider (
    rider_no_         NUMBER(7) NOT NULL,
    name              VARCHAR2(25) NOT NULL,
    birth             DATE NOT NULL,
    teams_team_name   VARCHAR2(40) NOT NULL
);

ALTER TABLE rider ADD CONSTRAINT rider_pk PRIMARY KEY ( rider_no_ );

CREATE TABLE rider_stages (
    rider_rider_no_    NUMBER(7) NOT NULL,
    stages_stage_no_   VARCHAR2(10) NOT NULL
);

ALTER TABLE rider_stages ADD CONSTRAINT rider_stages_pk PRIMARY KEY ( rider_rider_no_,
                                                                      stages_stage_no_ );

CREATE TABLE stages (
    stage_no_            VARCHAR2(10) NOT NULL,
    Race_Date            DATE NOT NULL,
    distance             VARCHAR2(30) NOT NULL,
    start_to_end_place   VARCHAR2(50) NOT NULL,
    stage_type           VARCHAR2(30) NOT NULL
);

ALTER TABLE stages ADD CONSTRAINT stages_pk PRIMARY KEY ( stage_no_ );

CREATE TABLE teams (
    team_name             VARCHAR2(40) NOT NULL,
    team_leader           VARCHAR2(25) NOT NULL,
    stages_won            NUMBER(5),
    general_ranking       NUMBER(4) NOT NULL,
    competitors_in_race   NUMBER(1) NOT NULL,
    final_victories       NUMBER(3) NOT NULL
);

ALTER TABLE teams ADD CONSTRAINT teams_pk PRIMARY KEY ( team_name );

ALTER TABLE jersey
    ADD CONSTRAINT jersey_rider_fk FOREIGN KEY ( rider_rider_no_ )
        REFERENCES rider ( rider_no_ );

ALTER TABLE points_and_time
    ADD CONSTRAINT points_and_time_rider_fk FOREIGN KEY ( rider_rider_no_ )
        REFERENCES rider ( rider_no_ );

ALTER TABLE rider_stages
    ADD CONSTRAINT rider_stages_rider_fk FOREIGN KEY ( rider_rider_no_ )
        REFERENCES rider ( rider_no_ );

ALTER TABLE rider_stages
    ADD CONSTRAINT rider_stages_stages_fk FOREIGN KEY ( stages_stage_no_ )
        REFERENCES stages ( stage_no_ );

ALTER TABLE rider
    ADD CONSTRAINT rider_teams_fk FOREIGN KEY ( teams_team_name )
        REFERENCES teams ( team_name );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             1
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
