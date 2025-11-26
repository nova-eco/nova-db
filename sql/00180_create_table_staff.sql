USE nova;

/*
 * @script     00180_create_table_staff.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  accountId           UUID            NOT NULL                                    ,
  companyStaffRoleId  UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_accountId UNIQUE (accountId),

  FOREIGN KEY (accountId)
      REFERENCES accounts(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyStaffRoleId)
      REFERENCES companyStaffRoles(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
