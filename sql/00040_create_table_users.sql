USE nova;

/*
 * @script     00040_create_table_users.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS users;

CREATE TABLE users (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userStatusId        UUID            NOT NULL                                    ,
  forename            VARCHAR(100)    NOT NULL                                    ,
  surname             VARCHAR(100)    NOT NULL                                    ,
  username            VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_username UNIQUE (username),

  FOREIGN KEY (userStatusId)
      REFERENCES userStatuses(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
