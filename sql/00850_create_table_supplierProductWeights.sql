USE nova;

/*
 * @script     00850_create_table_supplierProductWeights.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS supplierProductWeights;

CREATE TABLE supplierProductWeights (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  supplierProductId   UUID            NOT NULL                                    ,
  weightUnitId        UUID            NOT NULL                                    ,
  weightValue         DECIMAL         NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_supplierProductId UNIQUE (supplierProductId),

  FOREIGN KEY (supplierProductId)
      REFERENCES supplierProducts(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (weightUnitId)
      REFERENCES weightUnits(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
