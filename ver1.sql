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

SELECT * FROM TB_Professor;
SELECT * FROM TB_Professor_Academic;
SELECT * FROM TB_Professor_Role;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Student` (
  `std_id` INT NOT NULL AUTO_INCREMENT,
  `dept_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
  `std_no` VARCHAR(30) NOT NULL,
  `rrn` CHAR(14) NOT NULL,
  `name_kor` VARCHAR(45) NULL,
  `name_eng` VARCHAR(45) NULL,
  `gender` CHAR(1) NULL,
  `nationality` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `zip_code` VARCHAR(45) NULL,
  `address_basic` VARCHAR(100) NULL,
  `address_detail` VARCHAR(100) NULL,
  `entrance_date` DATE NULL,
  `graduate_date` DATE NULL,
  `category` VARCHAR(45) NULL,
  `grade` VARCHAR(45) NULL,
  `semester` VARCHAR(45) NULL,
  `statement` VARCHAR(45) NULL,
  PRIMARY KEY (`std_id`),
  UNIQUE INDEX `std_no_UNIQUE` (`std_no` ASC) VISIBLE,
  INDEX `fk_TB_Student_TB_Department1_idx` (`dept_id` ASC) VISIBLE,
  INDEX `fk_TB_Student_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Student_TB_Department1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_Student_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM TB_Student;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_Lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Lecture` (
  `lec_id` INT NOT NULL AUTO_INCREMENT,
  `pro_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  `lec_no` VARCHAR(30) NOT NULL,
  `grade` VARCHAR(45) NULL,
  `semester` VARCHAR(45) NULL,
  `credit` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `lec_name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `day_of_week` VARCHAR(45) NULL,
  `evaluation` VARCHAR(45) NULL,
  `textbook` VARCHAR(45) NULL,
  `classroom` VARCHAR(45) NULL,
  `max_enrollment` INT NULL,
  PRIMARY KEY (`lec_id`),
  INDEX `fk_TB_Lecture_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  INDEX `fk_TB_Lecture_TB_Department1_idx` (`dept_id` ASC) VISIBLE,
  UNIQUE INDEX `lec_no_UNIQUE` (`lec_no` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Lecture_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_Lecture_TB_Department1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_ENROLLMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_ENROLLMENT` (
  `enr_id`      INT NOT NULL AUTO_INCREMENT,
  `std_id`      INT NOT NULL,
  `lec_id`      INT NOT NULL,
  `enrolled_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`enr_id`),
  UNIQUE KEY `uq_std_lec` (`std_id`, `lec_id`),   -- 학생×강의 중복 수강 방지
  INDEX `fk_TB_ENROLLMENT_TB_Student1_idx` (`std_id` ASC) VISIBLE,
  INDEX `fk_TB_ENROLLMENT_TB_Lecture1_idx` (`lec_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_ENROLLMENT_TB_Student1`
    FOREIGN KEY (`std_id`)
    REFERENCES `GREEN`.`TB_Student` (`std_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_ENROLLMENT_TB_Lecture1`
    FOREIGN KEY (`lec_id`)
    REFERENCES `GREEN`.`TB_Lecture` (`lec_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;