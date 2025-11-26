USE nova;

/*
 * @script     00720_create_table_registrationCompaniesStaff.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS registrationCompaniesStaff;

CREATE TABLE registrationCompaniesStaff (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  registrationCompanyId UUID            NOT NULL                                    ,
  companyStaffRoleId  UUID            NULL                                        ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_registrationCompanyId UNIQUE (registrationCompanyId),

  FOREIGN KEY (companyStaffRoleId)
      REFERENCES companyStaffRoles(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (registrationCompanyId)
      REFERENCES registrationCompanies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
