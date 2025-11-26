USE nova;

/*
 * @script     00350_create_table_serviceLead.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS serviceLead;

CREATE TABLE serviceLead (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  serviceId    UUID            NOT NULL                                    ,
  staffId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_serviceId UNIQUE (serviceId),

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
