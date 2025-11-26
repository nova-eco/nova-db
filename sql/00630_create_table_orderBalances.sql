USE nova;

/*
 * @script     00630_create_table_orderBalances.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS orderBalances;

CREATE TABLE orderBalances (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  orderId             UUID            NOT NULL                                    ,
  balance             INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (orderId)
      REFERENCES orders(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
