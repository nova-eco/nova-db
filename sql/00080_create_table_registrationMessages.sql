USE nova;

/*
 * @script     00080_create_table_registrationMessages.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationMessages;

CREATE TABLE registrationMessages (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  registrationId      UUID            NOT NULL                                    ,
  accessCode          VARCHAR(10)     NOT NULL                                    ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  sequenceNumber      INT             NOT NULL                                    ,
  validUntil          DATETIME        NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (registrationId)
      REFERENCES registrations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
