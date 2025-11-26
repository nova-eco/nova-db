USE nova;

/*
 * @script     00620_create_table_openHours.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS openHours;

CREATE TABLE openHours (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  openHourTypeId      UUID            NOT NULL                                    ,
  twentyFourHourValue INT             NOT NULL                                    ,
  minuteValue         INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_hour_minuter_per_type UNIQUE (minuteValue, openHourTypeId, twentyFourHourValue),

  FOREIGN KEY (openHourTypeId)
      REFERENCES openHourTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
