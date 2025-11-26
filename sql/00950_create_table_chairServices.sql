USE nova;

/*
 * @script     00950_create_table_chairServices.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS chairServices;

CREATE TABLE chairServices (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  serviceId           UUID            NOT NULL                                    ,
  chairId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_service_per_chair UNIQUE (serviceId, chairId),

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (chairId)
      REFERENCES chairs(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
