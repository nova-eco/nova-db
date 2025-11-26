USE nova;

/*
 * @script     00470_create_table_companyRegistrationSettings.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyRegistrationSettings;

CREATE TABLE companyRegistrationSettings (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  companyId           UUID            NOT NULL                                    ,
  companyRegistrationSettingCategoryId UUID            NOT NULL                                    ,
  companyRegistrationSettingValueTypeId UUID            NOT NULL                                    ,
  companyRegistrationSettingValueVarTypeId UUID            NOT NULL                                    ,
  companyRegistrationSettingSequenceNumber INT             NOT NULL                                    ,
  value               VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (companyId)
      REFERENCES companies(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyRegistrationSettingCategoryId)
      REFERENCES companyRegistrationSettingCategories(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyRegistrationSettingValueTypeId)
      REFERENCES companyRegistrationSettingValueTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyRegistrationSettingValueVarTypeId)
      REFERENCES companyRegistrationSettingValueVarTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
