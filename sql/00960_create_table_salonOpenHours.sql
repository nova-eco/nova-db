USE nova;

/*
 * @script     00960_create_table_salonOpenHours.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS salonOpenHours;

CREATE TABLE salonOpenHours (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  openHourId          UUID            NOT NULL                                    ,
  salonId         UUID            NOT NULL                                    ,
  dayIndexValue       INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_hour_per_day_per_salon UNIQUE (dayIndexValue, openHourId, salonId),

  FOREIGN KEY (openHourId)
      REFERENCES openHours(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (salonId)
      REFERENCES salons(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
