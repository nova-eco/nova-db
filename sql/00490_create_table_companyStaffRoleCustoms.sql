USE nova;

/*
 * @script     00490_create_table_companyStaffRoleCustoms.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyStaffRoleCustoms;

CREATE TABLE companyStaffRoleCustoms (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyStaffRoleId  UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(100)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_companyStaffRoleId UNIQUE (companyStaffRoleId),
  CONSTRAINT udx_name UNIQUE (name),

  FOREIGN KEY (companyStaffRoleId)
      REFERENCES companyStaffRoles(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
