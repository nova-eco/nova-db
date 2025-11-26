USE nova;

/*
 * @script     00290_create_table_salonTimeSlot.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS salonTimeSlot;

CREATE TABLE salonTimeSlot (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  timeSlotId          UUID            NOT NULL                                    ,
  salonId             UUID            NOT NULL                                    ,
	timeSlotSequenceValue INT(10)       NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_time_slot_per_salon UNIQUE (timeSlotId, salonId),

  FOREIGN KEY (timeSlotId)
      REFERENCES timeSlots(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (salonId)
      REFERENCES salons(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
