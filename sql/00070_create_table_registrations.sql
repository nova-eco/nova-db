USE nova;

/*
 * @script     00070_create_table_registrations.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrations;

CREATE TABLE registrations (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  validUntil          DATETIME        NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   
) ENGINE = InnoDB;
