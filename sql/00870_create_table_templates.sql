USE nova;

/*
 * @script     00870_create_table_templates.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS templates;

CREATE TABLE templates (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  templateCategoryId  UUID            NOT NULL                                    ,
  description         VARCHAR(200)    NOT NULL                                    ,
  name                VARCHAR(100)    NOT NULL                                    ,
  value               VARCHAR(10000)  NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()      ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (templateCategoryId)
      REFERENCES templateCategories(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
