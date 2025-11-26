USE nova;

/*
 * @script     00300_create_table_bookingPre.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS bookingPre;

CREATE TABLE bookingPre (

  id										UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  serviceId							UUID            NOT NULL                                    ,
  endSalonTimeSlotId		UUID            NOT NULL                                    ,
  staffId								UUID            NOT NULL                                    ,
  startSalonTimeSlotId	UUID            NOT NULL                                    ,
  userId								UUID            NOT NULL                                    ,
  salonId								UUID            NOT NULL                                    ,
  chairId								UUID            NOT NULL                                    ,
  startDateMonth				INT             NOT NULL                                    ,
  startDateMonthDay			INT             NOT NULL                                    ,
  startDateYear					INT             NOT NULL                                    ,

  validUntilTimestampSeconds VARCHAR(255) NOT NULL                                  ,

  created								TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified							TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_pre_booking_per_member_of_staff UNIQUE (
		endSalonTimeSlotId,
		staffId,
		startSalonTimeSlotId,
		startDateYear,
		startDateMonth,
		startDateMonthDay
	),
  CONSTRAINT unique_pre_booking_per_member_of_user UNIQUE (
		endSalonTimeSlotId,
		startSalonTimeSlotId,
		userId,
		startDateYear,
		startDateMonth,
		startDateMonthDay
	),
  CONSTRAINT unique_pre_booking_per_salon_chair UNIQUE (
		endSalonTimeSlotId,
		startSalonTimeSlotId,
		salonId,
		chairId,
		startDateYear,
		startDateMonth,
		startDateMonthDay
	),

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (endSalonTimeSlotId)
      REFERENCES salonTimeSlot(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (chairId)
      REFERENCES chairs(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (endSalonTimeSlotId)
      REFERENCES salonTimeSlot(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
