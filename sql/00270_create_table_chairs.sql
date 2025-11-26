USE nova;

/*
 * @script     00270_create_table_chairs.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS chairs;

CREATE TABLE chairs (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  seatId              UUID            NOT NULL                                    ,
  salonId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_seatId_per_salonId UNIQUE (seatId, salonId),

  FOREIGN KEY (seatId)
      REFERENCES seats(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (salonId)
      REFERENCES salons(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
