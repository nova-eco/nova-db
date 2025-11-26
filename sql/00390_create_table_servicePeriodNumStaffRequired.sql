USE nova;

/*
 * @script     00390_create_table_servicePeriodNumStaffRequired.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS servicePeriodNumStaffRequired;

CREATE TABLE servicePeriodNumStaffRequired (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  servicePeriodId UUID            NOT NULL                                    ,
  numStaffRequired    INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_servicePeriodId UNIQUE (servicePeriodId),

  FOREIGN KEY (servicePeriodId)
      REFERENCES servicePeriods(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
