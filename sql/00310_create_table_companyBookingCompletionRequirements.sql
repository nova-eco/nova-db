USE nova;

/*
 * @script     00310_create_table_companyBookingCompletionRequirements.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyBookingCompletionRequirements;

CREATE TABLE companyBookingCompletionRequirements (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  organisationBookingCompletionRequirementId UUID            NOT NULL                                    ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
