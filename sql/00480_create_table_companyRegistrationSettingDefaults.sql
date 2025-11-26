USE nova;

/*
 * @script     00480_create_table_companyRegistrationSettingDefaults.sql
 *
 * @created    25th November 2025
 * @author     admin <admin@nova.eco>
 */
DROP TABLE IF EXISTS companyRegistrationSettingDefaults;

CREATE TABLE companyRegistrationSettingDefaults (

  id                  UUID            NOT NULL    DEFAULT     UUID()  PRIMARY KEY ,
  organisationId      UUID            NOT NULL                                    ,
  companyRegistrationSettingCategoryId UUID            NOT NULL                                    ,
  companyRegistrationSettingValueTypeId UUID            NOT NULL                                    ,
  companyRegistrationSettingValueVarTypeId UUID            NOT NULL                                    ,
  value               VARCHAR(255)    NOT NULL                                    ,
  created             TIMESTAMP       NOT NULL    DEFAULT     CURRENT_DATE()            ,
  modified            TIMESTAMP       NULL        ON UPDATE   CURRENT_TIMESTAMP   ,

  FOREIGN KEY (companyRegistrationSettingCategoryId)
      REFERENCES companyRegistrationSettingCategories(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyRegistrationSettingValueTypeId)
      REFERENCES companyRegistrationSettingValueTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (companyRegistrationSettingValueVarTypeId)
      REFERENCES companyRegistrationSettingValueVarTypes(id)
      ON UPDATE CASCADE ON DELETE RESTRICT,

  FOREIGN KEY (organisationId)
      REFERENCES organisations(id)
      ON UPDATE CASCADE ON DELETE RESTRICT

) ENGINE = InnoDB;
