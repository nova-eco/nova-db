USE nova;

/*
 * @script     00560_create_table_loginIps.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS loginIps;

CREATE TABLE loginIps (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  ip                  VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_ip UNIQUE (ip)
) ENGINE = InnoDB;
