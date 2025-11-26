USE nova;

/*
 * @script     00930_create_table_weightUnitOrders.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS weightUnitOrders;

CREATE TABLE weightUnitOrders (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  weightUnitId        UUID            NOT NULL                                    ,
  weightUnitOrder     INT             NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_weightUnitId UNIQUE (weightUnitId),
  CONSTRAINT udx_order UNIQUE (weightUnitOrder),

  FOREIGN KEY (weightUnitId)
      REFERENCES weightUnits(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
