USE nova;

/*
 * @script     00590_create_table_loginErrors.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS loginErrors;

CREATE TABLE loginErrors (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  loginId             UUID            NOT NULL                                    ,
  errorMessage        VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_loginId UNIQUE (loginId),

  FOREIGN KEY (loginId)
      REFERENCES logins(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
