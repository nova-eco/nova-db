USE nova;

/*
 * @script     00360_create_table_organisationProductPeriodRoleTypes.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS organisationProductPeriodRoleTypes;

CREATE TABLE organisationProductPeriodRoleTypes (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  organisationId      UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_product_period_role_type_per_organisation UNIQUE (organisationId, name),

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
