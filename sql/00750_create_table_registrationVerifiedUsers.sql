USE nova;

/*
 * @script     00750_create_table_registrationVerifiedUsers.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationVerifiedUsers;

CREATE TABLE registrationVerifiedUsers (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  registrationVerifiedId UUID            NOT NULL                                    ,
  userId              UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_registrationVerifiedId UNIQUE (registrationVerifiedId),
  CONSTRAINT udx_userId UNIQUE (userId),

  FOREIGN KEY (registrationVerifiedId)
      REFERENCES registrationsVerified(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
