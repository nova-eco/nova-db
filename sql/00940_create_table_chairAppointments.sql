USE nova;

/*
 * @script     00940_create_table_chairAppointments.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS chairAppointments;

CREATE TABLE chairAppointments (

  id										UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY		,
  appointmentId					UUID            NOT NULL																			,
  endSalonTimeSlotId		UUID            NOT NULL																			,
  startSalonTimeSlotId	UUID            NOT NULL																			,
  chairId								UUID            NOT NULL                                      ,
  created								TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()				,
  modified							TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP			,
  
  CONSTRAINT unique_appointment_per_chair_per_timeslot UNIQUE (
		appointmentId,
		endSalonTimeSlotId,
		startSalonTimeSlotId,
		chairId
	),

  FOREIGN KEY (appointmentId)
      REFERENCES appointments(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (chairId)
      REFERENCES chairs(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (endSalonTimeSlotId)
      REFERENCES salonTimeSlot(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
