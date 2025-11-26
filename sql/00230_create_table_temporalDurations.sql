USE nova;

/*
 * @script     00230_create_table_temporalDurations.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS temporalDurations;

CREATE TABLE temporalDurations (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  durationIso         VARCHAR(255)    NOT NULL                                    ,
  durationMins        INT(10)					NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_durationIso UNIQUE (durationIso)
) ENGINE = InnoDB;
