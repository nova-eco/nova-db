USE nova;

/*
 * @script     00340_create_table_serviceBookingCompletionRequirements.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS serviceBookingCompletionRequirements;

CREATE TABLE serviceBookingCompletionRequirements (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  serviceId    UUID            NOT NULL                                    ,
  companyBookingCompletionRequirementId UUID            NOT NULL                                    ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
