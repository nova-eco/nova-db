USE nova;

/*
 * @script     00760_create_table_sessions.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS sessions;

CREATE TABLE sessions (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userId              UUID            NOT NULL                                    ,
  validUntilTimestamp VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
