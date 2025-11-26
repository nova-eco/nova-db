USE nova;

/*
 * @script     00260_create_table_seats.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS seats;

CREATE TABLE seats (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  seatTypeId          UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_name UNIQUE (name),

  FOREIGN KEY (seatTypeId)
      REFERENCES seatTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
