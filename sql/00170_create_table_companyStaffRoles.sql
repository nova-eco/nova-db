USE nova;

/*
 * @script     00170_create_table_companyStaffRoles.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyStaffRoles;

CREATE TABLE companyStaffRoles (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  companyStaffRoleSequenceNumber INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
