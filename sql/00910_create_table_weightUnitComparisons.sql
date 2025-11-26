USE nova;

/*
 * @script     00910_create_table_weightUnitComparisons.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS weightUnitComparisons;

CREATE TABLE weightUnitComparisons (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  fromWeightUnitId    UUID            NOT NULL                                    ,
  toWeightUnitId      UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  comparisonValue     DECIMAL         NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT udx_comparisonValue UNIQUE (comparisonValue),
  CONSTRAINT unique_from_and_to_weight_units UNIQUE (fromWeightUnitId, toWeightUnitId),

  FOREIGN KEY (fromWeightUnitId)
      REFERENCES weightUnits(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
