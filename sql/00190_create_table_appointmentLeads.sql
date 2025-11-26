USE nova;

/*
 * @script     00190_create_table_appointmentLeads.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS appointmentLeads;

CREATE TABLE appointmentLeads (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  appointmentId       UUID            NOT NULL                                    ,
  staffId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_appointmentId UNIQUE (appointmentId),

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (appointmentId)
      REFERENCES appointments(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
