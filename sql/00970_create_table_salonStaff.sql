USE nova;

/*
 * @script     00970_create_table_salonStaff.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS salonStaff;

CREATE TABLE salonStaff (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  staffId             UUID            NOT NULL                                    ,
  salonId         UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_staffId_per_salonId UNIQUE (staffId, salonId),

  FOREIGN KEY (staffId)
      REFERENCES staff(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (salonId)
      REFERENCES salons(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
