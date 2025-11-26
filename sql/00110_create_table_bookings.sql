USE nova;

/*
 * @script     00110_create_table_bookings.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  bookingPreId        UUID            NOT NULL                                    ,
  servicePriceId UUID            NOT NULL                                    ,
  orderId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_bookingPreId UNIQUE (bookingPreId),
  CONSTRAINT udx_orderId UNIQUE (orderId),

  FOREIGN KEY (orderId)
      REFERENCES orders(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
