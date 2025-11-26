USE nova;

/*
 * @script     00400_create_table_servicePeriodStaff.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS servicePeriodStaff;

CREATE TABLE servicePeriodStaff (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  staffId             UUID            NOT NULL                                    ,
  servicePeriodId UUID            NOT NULL                                    ,
  isRequired          BOOLEAN         NOT NULL    DEFAULT     false               ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (servicePeriodId)
      REFERENCES servicePeriods(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
