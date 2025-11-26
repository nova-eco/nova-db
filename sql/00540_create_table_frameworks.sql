USE nova;

/*
 * @script     00540_create_table_frameworks.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS frameworks;

CREATE TABLE frameworks (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name)
) ENGINE = InnoDB;
