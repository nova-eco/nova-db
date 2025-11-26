USE nova;

/*
 * @script     00060_create_table_actions.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS actions;

CREATE TABLE actions (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  performAtTimestamp  VARCHAR(255)    NOT NULL                                    ,
  hasBeenPerformed    BOOLEAN         NOT NULL    DEFAULT     false               ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   
) ENGINE = InnoDB;
