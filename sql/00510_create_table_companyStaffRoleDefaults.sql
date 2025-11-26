USE nova;

/*
 * @script     00510_create_table_companyStaffRoleDefaults.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyStaffRoleDefaults;

CREATE TABLE companyStaffRoleDefaults (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyStaffRoleId  UUID            NOT NULL                                    ,
  staffRoleDefaultId  UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_companyStaffRoleId UNIQUE (companyStaffRoleId),

  FOREIGN KEY (companyStaffRoleId)
      REFERENCES companyStaffRoles(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (staffRoleDefaultId)
      REFERENCES staffRoleDefaults(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
