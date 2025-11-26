USE nova;

/*
 * @script     00830_create_table_supplierProductPrices.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS supplierProductPrices;

CREATE TABLE supplierProductPrices (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  supplierProductId   UUID            NOT NULL                                    ,
  supplierPriceTypeId UUID            NOT NULL                                    ,
  priceValue          DECIMAL         NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (supplierPriceTypeId)
      REFERENCES supplierPriceTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (supplierProductId)
      REFERENCES supplierProducts(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
