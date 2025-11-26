USE nova;

/*
 * @script     00380_create_table_servicePeriods.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS servicePeriods;

CREATE TABLE servicePeriods (

  id												UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY			,
  serviceId									UUID            NOT NULL																				,
  servicePeriodRoleTypeId		UUID            NOT NULL																				,
  temporalDurationId				UUID            NOT NULL																				,
  serviceSequenceNumber			INT(10)					NOT NULL																				,
  created										TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()          ,
  modified									TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP				,

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (servicePeriodRoleTypeId)
      REFERENCES servicePeriodRoleTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (temporalDurationId)
      REFERENCES temporalDurations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
