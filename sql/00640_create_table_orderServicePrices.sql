USE nova;

/*
 * @script     00640_create_table_orderServicePrices.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS orderServicePrices;

CREATE TABLE orderServicePrices (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  servicePriceId UUID            NOT NULL                                    ,
  orderId             UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_orderId UNIQUE (orderId),

  FOREIGN KEY (servicePriceId)
      REFERENCES servicePrices(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (orderId)
      REFERENCES orders(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
