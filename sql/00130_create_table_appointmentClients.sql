USE nova;

/*
 * @script     00130_create_table_appointmentClients.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS appointmentClients;

CREATE TABLE appointmentClients (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  appointmentId       UUID            NOT NULL                                    ,
  userId              UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_user_per_appointment_entry UNIQUE (appointmentId, userId),

  FOREIGN KEY (appointmentId)
      REFERENCES appointments(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
