USE nova;

/*
 * @script     00100_create_table_orders.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  userId              UUID            NOT NULL                                    ,
  orderTimestamp      VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (userId)
      REFERENCES users(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
