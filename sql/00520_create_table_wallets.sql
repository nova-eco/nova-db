USE nova;

/*
 * @script     00520_create_table_wallets.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS wallets;

CREATE TABLE wallets (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  balance             INT             NOT NULL    DEFAULT     0                   ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   
) ENGINE = InnoDB;
