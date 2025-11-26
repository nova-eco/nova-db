USE nova;

/*
 * @script     00680_create_table_organisationFrameworks.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS organisationFrameworks;

CREATE TABLE organisationFrameworks (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  frameworkId         UUID            NOT NULL                                    ,
  organisationId      UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_organisationId UNIQUE (organisationId),

  FOREIGN KEY (frameworkId)
      REFERENCES frameworks(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
