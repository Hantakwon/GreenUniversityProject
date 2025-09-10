use GREEN;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_College`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_College` (
  `col_id` INT NOT NULL AUTO_INCREMENT,
  `name_kor` VARCHAR(50) NULL,
  `name_eng` VARCHAR(50) NULL,
  `title` VARCHAR(50) NULL,
  `content` TEXT NULL,
  `image` VARCHAR(100) NULL,
  PRIMARY KEY (`col_id`))
ENGINE = InnoDB;

SELECT * FROM TB_College;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Department` (
  `dept_id` INT NOT NULL AUTO_INCREMENT,
  `col_id` INT NOT NULL,
  `dept_no` CHAR(2) NOT NULL,
  `name_kor` VARCHAR(50),
  `name_eng` VARCHAR(50),
  `founded_date` DATE,
  `tel` VARCHAR(20),
  `office` VARCHAR(50),
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `uq_colid_deptno` (`col_id`, `dept_no`),   
  KEY `fk_TB_Department_TB_College1_idx` (`col_id`),
  CONSTRAINT `fk_TB_Department_TB_College1`
    FOREIGN KEY (`col_id`) REFERENCES `GREEN`.`TB_College` (`col_id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

SELECT * FROM TB_Department;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Professor` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `pro_no` VARCHAR(30) NULL,
  `rrn` VARCHAR(45) NULL,
  `name_kor` VARCHAR(30) NULL,
  `name_eng` VARCHAR(30) NULL,
  `gender` CHAR(1) NULL,
  `nationality` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `zip_code` VARCHAR(45) NULL,
  `address_basic` VARCHAR(100) NULL,
  `address_detail` VARCHAR(100) NULL,
  `statement` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE INDEX `pro_no_UNIQUE` (`pro_no` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_Professor_Academic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Professor_Academic` (
  `aca_id` INT NOT NULL AUTO_INCREMENT,
  `pro_id` INT NOT NULL,
  `school` VARCHAR(100) NULL,
  `major` VARCHAR(100) NULL,
  `graduation_at` DATE NULL,
  `degree` VARCHAR(45) NULL,
  `appointment_date` DATE NULL,
  PRIMARY KEY (`aca_id`),
  INDEX `fk_TB_Professor_Academic_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Professor_Academic_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GREEN`.`TB_Professor_Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Professor_Role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dept_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TB_Professor_Role_TB_Department1_idx` (`dept_id` ASC) VISIBLE,
  INDEX `fk_TB_Professor_Role_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Professor_Role_TB_Department1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_Professor_Role_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

