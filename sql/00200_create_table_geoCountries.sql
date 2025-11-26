USE nova;

/*
 * @script     00200_create_table_geoCountries.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS geoCountries;

CREATE TABLE geoCountries (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  name                VARCHAR(100)    NOT NULL                                    ,
  threeLetterCode     VARCHAR(3)      NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name),
  CONSTRAINT udx_threeLetterCode UNIQUE (threeLetterCode)
) ENGINE = InnoDB;
