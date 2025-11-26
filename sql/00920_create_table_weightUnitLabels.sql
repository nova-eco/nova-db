USE nova;

/*
 * @script     00920_create_table_weightUnitLabels.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS weightUnitLabels;

CREATE TABLE weightUnitLabels (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  weightUnitId        UUID            NOT NULL                                    ,
  languageId          UUID            NOT NULL                                    ,
  label               VARCHAR(20)     NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,
  
  CONSTRAINT unique_weight_per_language UNIQUE (languageId, weightUnitId),
  CONSTRAINT unique_label_per_language UNIQUE (languageId, label),

  FOREIGN KEY (languageId)
      REFERENCES languages(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (weightUnitId)
      REFERENCES weightUnits(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
