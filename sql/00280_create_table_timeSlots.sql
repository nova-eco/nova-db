USE nova;

/*
 * @script     00280_create_table_timeSlots.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS timeSlots;

CREATE TABLE timeSlots (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  temporalDurationId  UUID            NOT NULL                                    ,
  twentyFourHourStartValue INT             NOT NULL                                    ,
  minuteStartValue    INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_start_time_and_duration UNIQUE (minuteStartValue, twentyFourHourStartValue, temporalDurationId),

  FOREIGN KEY (temporalDurationId)
      REFERENCES temporalDurations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
