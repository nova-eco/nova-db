USE nova;

/*
 * @script     00570_create_table_loginUsernames.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS loginUsernames;

CREATE TABLE loginUsernames (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  username            VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_username UNIQUE (username)
) ENGINE = InnoDB;
