USE nova;

/*
 * @script     00700_create_table_passwords.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS passwords;

CREATE TABLE passwords (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userId              UUID            NOT NULL                                    ,
  userPasswordSequenceNumber INT             NOT NULL                                    ,
  password            VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
