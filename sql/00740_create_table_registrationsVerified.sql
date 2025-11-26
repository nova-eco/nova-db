USE nova;

/*
 * @script     00740_create_table_registrationsVerified.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationsVerified;

CREATE TABLE registrationsVerified (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  registrationId      UUID            NOT NULL                                    ,
  registrationMessageId UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_registrationMessageId UNIQUE (registrationMessageId),

  FOREIGN KEY (registrationId)
      REFERENCES registrations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (registrationMessageId)
      REFERENCES registrationMessages(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
