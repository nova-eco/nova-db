USE nova;

/*
 * @script     00430_create_table_servicePrices.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS servicePrices;

CREATE TABLE servicePrices (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  serviceId           UUID            NOT NULL                                    ,
  servicePriceTypeId  UUID            NOT NULL                                    ,
  currencyId          UUID            NOT NULL                                    ,
  priceMajorUnitValue INT(10)         NOT NULL																		,
  priceMinorUnitValue INT(10)							NULL    DEFAULT     0										,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_price_type_and_product_combination UNIQUE (serviceId, servicePriceTypeId),

  FOREIGN KEY (serviceId)
      REFERENCES services(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (servicePriceTypeId)
      REFERENCES servicePriceTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (currencyId)
      REFERENCES currencies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
