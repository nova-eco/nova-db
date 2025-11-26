USE nova;

/*
 * @script     00160_create_table_appointmentServices.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS appointmentServices;

CREATE TABLE appointmentServices (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  appointmentId       UUID            NOT NULL                                    ,
  serviceId    UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_service_per_appointment_entry UNIQUE (appointmentId, serviceId),

  FOREIGN KEY (appointmentId)
      REFERENCES appointments(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
