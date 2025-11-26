USE nova;

/*
 * @script     00660_create_table_orderPayments.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS orderPayments;

CREATE TABLE orderPayments (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  orderId             UUID            NOT NULL                                    ,
  orderBalanceId      UUID            NOT NULL                                    ,
  paymentId           UUID            NULL                                        ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_orderBalanceId UNIQUE (orderBalanceId),
  CONSTRAINT udx_paymentId UNIQUE (paymentId),

  FOREIGN KEY (orderId)
      REFERENCES orders(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (orderBalanceId)
      REFERENCES orderBalances(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (paymentId)
      REFERENCES payments(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
