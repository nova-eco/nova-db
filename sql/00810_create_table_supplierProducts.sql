USE nova;

/*
 * @script     00810_create_table_supplierProducts.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS supplierProducts;

CREATE TABLE supplierProducts (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  productId           UUID            NOT NULL                                    ,
  supplierId          UUID            NOT NULL                                    ,
  supplierPackageTypeId UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (productId)
      REFERENCES products(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (supplierId)
      REFERENCES suppliers(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (supplierPackageTypeId)
      REFERENCES supplierPackageTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
