USE nova;

/*
 * @script     00890_create_table_userEmails.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS userEmails;

CREATE TABLE userEmails (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userId              UUID            NOT NULL                                    ,
  email               VARCHAR(254)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
