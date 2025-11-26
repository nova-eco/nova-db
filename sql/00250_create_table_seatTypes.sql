USE nova;

/*
 * @script     00250_create_table_seatTypes.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS seatTypes;

CREATE TABLE seatTypes (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name)
) ENGINE = InnoDB;
