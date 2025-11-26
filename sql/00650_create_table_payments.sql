USE nova;

/*
 * @script     00650_create_table_payments.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS payments;

CREATE TABLE payments (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  orderId             UUID            NOT NULL                                    ,
  walletIdFrom        UUID            NOT NULL                                    ,
  walletIdTo          UUID            NOT NULL                                    ,
  payment             INT             NOT NULL                                    ,
  paymentTimestamp    INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (orderId)
      REFERENCES orders(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (walletIdFrom)
      REFERENCES wallets(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
