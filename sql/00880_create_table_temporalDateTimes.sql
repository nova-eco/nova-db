USE nova;

/*
 * @script     00880_create_table_temporalDateTimes.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS temporalDateTimes;

CREATE TABLE temporalDateTimes (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  dateTimeZoned       VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_dateTimeZoned UNIQUE (dateTimeZoned)
) ENGINE = InnoDB;
