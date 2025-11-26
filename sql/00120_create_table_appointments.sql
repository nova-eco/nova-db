USE nova;

/*
 * @script     00120_create_table_appointments.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS appointments;

CREATE TABLE appointments (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  bookingId           UUID            NOT NULL                                    ,
  startDateYear       INT             NOT NULL                                    ,
  startDateMonth      INT             NOT NULL                                    ,
  startDateMonthDay   INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_start_date_time_per_booking UNIQUE (bookingId, startDateYear, startDateMonth, startDateMonthDay),

  FOREIGN KEY (bookingId)
      REFERENCES bookings(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
