USE nova;

/*
 * @script     00010_create_table_organisations.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS organisations;

CREATE TABLE organisations (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  parentOrganisationId UUID            NULL                                        ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name)
) ENGINE = InnoDB;
