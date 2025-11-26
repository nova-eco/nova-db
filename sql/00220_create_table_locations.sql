USE nova;

/*
 * @script     00220_create_table_locations.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  addressLineOne      VARCHAR(200)    NOT NULL                                    ,
  addressLineTwo      VARCHAR(200)    NOT NULL                                    ,
  addressLineThree    VARCHAR(200)    NULL                                        ,
  geoCityId           UUID            NOT NULL                                    ,
  postcode            VARCHAR(8)      NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_postcode UNIQUE (postcode),
  CONSTRAINT unique_postcode_and_geoCityId_combination UNIQUE (geoCityId, postcode),

  FOREIGN KEY (geoCityId)
      REFERENCES geoCities(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
