USE nova;

/*
 * @script     00530_create_table_companyWallets.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyWallets;

CREATE TABLE companyWallets (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  walletId            UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (walletId)
      REFERENCES wallets(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
