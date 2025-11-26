USE nova;

/*
 * @script     00770_create_table_staffOpenHours.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS staffOpenHours;

CREATE TABLE staffOpenHours (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  openHourId          UUID            NOT NULL                                    ,
  staffId             UUID            NOT NULL                                    ,
  dayIndexValue       INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_hour_per_day_per_staff UNIQUE (dayIndexValue, openHourId, staffId),

  FOREIGN KEY (openHourId)
      REFERENCES openHours(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
