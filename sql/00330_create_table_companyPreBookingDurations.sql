USE nova;

/*
 * @script     00330_create_table_companyPreBookingDurations.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyPreBookingDurations;

CREATE TABLE companyPreBookingDurations (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  organisationPreBookingDurationId UUID            NOT NULL                                    ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_company_organisation_pre_booking_duration UNIQUE (companyId, organisationPreBookingDurationId),

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (organisationPreBookingDurationId)
      REFERENCES organisationPreBookingDurations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
