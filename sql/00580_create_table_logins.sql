USE nova;

/*
 * @script     00580_create_table_logins.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS logins;

CREATE TABLE logins (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  loginIpId           UUID            NOT NULL                                    ,
  loginUsernameId     UUID            NOT NULL                                    ,
  loginTimestamp      VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (loginIpId)
      REFERENCES loginIps(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (loginUsernameId)
      REFERENCES loginUsernames(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
