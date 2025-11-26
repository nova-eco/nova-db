USE nova;

/*
 * @script     00420_create_table_currencies.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS currencies;

CREATE TABLE currencies (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  name                VARCHAR(40)     NOT NULL                                    ,
  abbreviation        VARCHAR(3)      NOT NULL                                    ,
  symbol              VARCHAR(10)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   
) ENGINE = InnoDB;
