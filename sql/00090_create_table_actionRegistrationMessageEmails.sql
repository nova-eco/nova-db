USE nova;

/*
 * @script     00090_create_table_actionRegistrationMessageEmails.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS actionRegistrationMessageEmails;

CREATE TABLE actionRegistrationMessageEmails (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  actionId            UUID            NOT NULL                                    ,
  registrationMessageId UUID            NOT NULL                                    ,
  templateId          UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (actionId)
      REFERENCES actions(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (registrationMessageId)
      REFERENCES registrationMessages(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
