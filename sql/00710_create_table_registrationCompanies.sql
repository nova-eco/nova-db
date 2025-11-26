USE nova;

/*
 * @script     00710_create_table_registrationCompanies.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationCompanies;

CREATE TABLE registrationCompanies (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  registrationId      UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (registrationId)
      REFERENCES registrations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
