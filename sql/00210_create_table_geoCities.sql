USE nova;

/*
 * @script     00210_create_table_geoCities.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS geoCities;

CREATE TABLE geoCities (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  geoCountryId        UUID            NOT NULL                                    ,
  name                VARCHAR(100)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name),

  FOREIGN KEY (geoCountryId)
      REFERENCES geoCountries(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
