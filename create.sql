-- -----------------------------------------------------
-- area table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS area (
  Area INT NOT NULL,
  Area_Name VARCHAR(45) NOT NULL,
  PRIMARY KEY (Area))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- rpt_no table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS rpt_no (
  Rpt_Dist_No INT NOT NULL,
  Area INT NOT NULL,
  PRIMARY KEY (Rpt_Dist_No),
  CONSTRAINT fk_rpt_no_area
  FOREIGN KEY (Area)
    REFERENCES  area (Area)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;  

-- -----------------------------------------------------
-- premise table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS premise (
  Premise_Cd INT NOT NULL,
  Premis_Desc VARCHAR(100),
  PRIMARY KEY (Premise_Cd))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- weapon table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS weapon (
  Weapon_Used_Cd INT NOT NULL,
  Weapon_Desc VARCHAR(100) NOT NULL,
  PRIMARY KEY (Weapon_Used_Cd))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- status table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS status (
  Status VARCHAR(2) NOT NULL,
  Status_Desc VARCHAR(45) NOT NULL,
  PRIMARY KEY (Status))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- location table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS location (
  Location_Id INT NOT NULL,
  Location VARCHAR(45) NOT NULL,
  Cross_Street VARCHAR(100),
  Lat DECIMAL(9,6) NOT NULL,
  Lon DECIMAL(9,6) NULL,
  PRIMARY KEY (Location_Id),
  UNIQUE (Location, Lat, Lon))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- mocode_description table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mocode_description (
  Mocodes VARCHAR(30) NOT NULL,
  Description VARCHAR(255),
  PRIMARY KEY (Mocodes))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- incident table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS incident (
  DR_NO INT NOT NULL,
  Date_Rptd VARCHAR(100) NOT NULL,
  Date_OCC VARCHAR(100) NOT NULL,
  Time_OCC VARCHAR(4) NOT NULL,
  Vict_Age INT,
  Vict_Sex VARCHAR(1),
  Vict_Descent VARCHAR(2),
  Premise_Cd INT NOT NULL,
  Weapon_Used_Cd INT,
  Status VARCHAR(2) NOT NULL,
  Location_Id INT NOT NULL,
  Rpt_Dist_No INT NOT NULL,
  PRIMARY KEY (DR_NO),
  CONSTRAINT fk_incident_rpt_no
    FOREIGN KEY (Rpt_Dist_No)
    REFERENCES  rpt_no (Rpt_Dist_No)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_incident_premise
    FOREIGN KEY (Premise_Cd)
    REFERENCES premise (Premise_Cd)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_incident_weapon
    FOREIGN KEY (Weapon_Used_Cd)
    REFERENCES weapon (Weapon_Used_Cd)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_incident_status 
    FOREIGN KEY (Status)
    REFERENCES status (Status)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_incident_location
    FOREIGN KEY (Location_Id)
    REFERENCES location (Location_Id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- mocode table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mocode (
  DR_NO INT NOT NULL,
  Mocodes VARCHAR(30) NOT NULL,
  PRIMARY KEY (DR_NO, Mocodes),
  CONSTRAINT fk_mocode_incident
    FOREIGN KEY (DR_NO)
    REFERENCES incident (DR_NO)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_mocode_mocode_description
    FOREIGN KEY (Mocodes)
    REFERENCES mocode_description (Mocodes)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- crime_code_description table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS crime_code_description (
  Crm_Cd INT NOT NULL,
  -- gonna make these two null for now and see whats up later
  Description VARCHAR(100),
  Part INT,
  PRIMARY KEY (Crm_Cd))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- crime_code table
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS crime_code (
  DR_NO INT NOT NULL,
  Crm_Cd INT NOT NULL,
  Crm_Level INT NOT NULL,
  PRIMARY KEY (DR_NO, Crm_Cd),
  CONSTRAINT fk_crime_code_crime_code_description
    FOREIGN KEY (Crm_Cd)
    REFERENCES crime_code_description (Crm_Cd)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_crime_code_incident
    FOREIGN KEY (DR_NO)
    REFERENCES incident (DR_NO)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

