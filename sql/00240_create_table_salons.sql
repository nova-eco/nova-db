USE nova;

/*
 * @script     00240_create_table_salons.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS salons;

CREATE TABLE salons (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  locationId          UUID            NOT NULL                                    ,
  timeSlotTemporalDurationId UUID     NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(100)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_locationId_per_companyId UNIQUE (companyId, locationId),
  CONSTRAINT unique_salon_name_per_companyId UNIQUE (companyId, name),

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (locationId)
      REFERENCES locations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (timeSlotTemporalDurationId)
      REFERENCES temporalDurations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
