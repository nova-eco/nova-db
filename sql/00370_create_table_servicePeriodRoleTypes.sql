USE nova;

/*
 * @script     00370_create_table_servicePeriodRoleTypes.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS servicePeriodRoleTypes;

CREATE TABLE servicePeriodRoleTypes (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  organisationProductPeriodRoleTypeId UUID            NOT NULL                                    ,
  isEnabled           BOOLEAN         NOT NULL    DEFAULT     true                ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_companyId_and_organisationProductPeriodRoleTypeId UNIQUE (companyId, organisationProductPeriodRoleTypeId),

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (organisationProductPeriodRoleTypeId)
      REFERENCES organisationProductPeriodRoleTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
