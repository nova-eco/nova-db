USE nova;

/*
 * @script     00900_create_table_userWallets.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS userWallets;

CREATE TABLE userWallets (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userId              UUID            NOT NULL                                    ,
  walletId            UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (walletId)
      REFERENCES wallets(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
