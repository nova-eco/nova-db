USE nova;

/*
 * @script     00730_create_table_registrationRegistrants.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationRegistrants;

CREATE TABLE registrationRegistrants (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  registrationId      UUID            NOT NULL                                    ,
  email               VARCHAR(255)    NOT NULL                                    ,
  forename            VARCHAR(100)    NOT NULL                                    ,
  surname             VARCHAR(100)    NOT NULL                                    ,
  username            VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_registrationId UNIQUE (registrationId),

  FOREIGN KEY (registrationId)
      REFERENCES registrations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
