USE nova;

/*
 * @script     00500_create_table_staffRoleDefaults.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS staffRoleDefaults;

CREATE TABLE staffRoleDefaults (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  organisationId      UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(100)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
