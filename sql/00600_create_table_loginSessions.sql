USE nova;

/*
 * @script     00600_create_table_loginSessions.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS loginSessions;

CREATE TABLE loginSessions (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  loginId             UUID						NOT NULL                                    ,
  sessionId           UUID						NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_loginId UNIQUE (loginId),
  CONSTRAINT udx_sessionId UNIQUE (sessionId),

  FOREIGN KEY (loginId)
      REFERENCES logins(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
