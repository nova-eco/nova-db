USE nova;

/*
 * @script     00690_create_table_organisationProducts.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS organisationProducts;

CREATE TABLE organisationProducts (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  productId           UUID            NOT NULL                                    ,
  organisationId      UUID            NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (productId)
      REFERENCES products(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
