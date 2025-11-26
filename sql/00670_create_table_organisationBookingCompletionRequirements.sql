USE nova;

/*
 * @script     00670_create_table_organisationBookingCompletionRequirements.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS organisationBookingCompletionRequirements;

CREATE TABLE organisationBookingCompletionRequirements (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  organisationId      UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name),

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
