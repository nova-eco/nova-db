USE nova;

/*
 * @script     00820_create_table_supplierProductChildren.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS supplierProductChildren;

CREATE TABLE supplierProductChildren (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  supplierProductId   UUID            NOT NULL                                    ,
  supplierPackageTypeId UUID            NOT NULL                                    ,
  numChildren         INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_supplierProductId UNIQUE (supplierProductId),

  FOREIGN KEY (supplierPackageTypeId)
      REFERENCES supplierPackageTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (supplierProductId)
      REFERENCES supplierProducts(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
