use GREEN;

drop table TB_College;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_College`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_College` (
  `col_id` INT NOT NULL AUTO_INCREMENT,
  `name_kor` VARCHAR(50) NULL,
  `name_eng` VARCHAR(50) NULL,
  `title` VARCHAR(50) NULL,
  `content` TEXT NULL,
  `image` BLOB NULL,
  PRIMARY KEY (`col_id`))
ENGINE = InnoDB;

-- 대학 데이터 삽입
INSERT INTO TB_College (name_kor, name_eng, title, content) VALUES ('인문사회대학', 'Humanities And Social Sciences', '소개 제목', '소개 내용');
INSERT INTO TB_College (name_kor, name_eng, title, content) VALUES ('자연과학대학', 'Natural Sciences', '소개 제목', '소개 내용');
INSERT INTO TB_College (name_kor, name_eng, title, content) VALUES ('공과대학', 'Engineering', '소개 제목', '소개 내용');
INSERT INTO TB_College (name_kor, name_eng, title, content) VALUES ('사범대학', 'Education', '소개 제목', '소개 내용');
INSERT INTO TB_College (name_kor, name_eng, title, content) VALUES ('대학원', 'GRADUATE SCHOOL', '소개 제목', '소개 내용');

drop table TB_Department;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Department` (
  `dept_id` INT NOT NULL,
  `col_id` INT NOT NULL,
  `dept_no` CHAR(2) NULL,
  `name_kor` VARCHAR(50) NULL,
  `name_eng` VARCHAR(50) NULL,
  `founded_date` DATE NULL,
  `tel` CHAR(12) NULL,
  `office` VARCHAR(50) NULL,
  PRIMARY KEY (`dept_id`, `col_id`),
  INDEX `fk_TB_Department_TB_College_idx` (`col_id` ASC) VISIBLE,
  UNIQUE INDEX `dept_no_UNIQUE` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Department_TB_College`
    FOREIGN KEY (`col_id`)
    REFERENCES `GREEN`.`TB_College` (`col_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 학과 데이터 삽입
INSERT INTO TB_Department VALUES (1, 1, '10', '국어국문학과', 'Korean Language and Literature', CURDATE(), '051-123-1001', '추후 예정');
INSERT INTO TB_Department VALUES (2, 1, '11', '영어영문학과', 'English Language and Literature', CURDATE(), '051-123-1002', '추후 예정');
INSERT INTO TB_Department VALUES (3, 1, '12', '일어일문학과', 'Japanese Language and Literature', CURDATE(), '051-123-1003', '추후 예정');
INSERT INTO TB_Department VALUES (4, 1, '13', '중어중문학과', 'Chinese Language and Literature', CURDATE(), '051-123-1004', '추후 예정');
INSERT INTO TB_Department VALUES (5, 1, '14', '역사학과', 'History', CURDATE(), '051-123-1005', '추후 예정');
INSERT INTO TB_Department VALUES (6, 1, '15', '경제학과', 'Economics', CURDATE(), '051-123-1006', '추후 예정');
INSERT INTO TB_Department VALUES (7, 1, '16', '경영학과', 'Business Administration', CURDATE(), '051-123-1007', '추후 예정');
INSERT INTO TB_Department VALUES (8, 1, '17', '법학과', 'Law', CURDATE(), '051-123-1008', '추후 예정');
INSERT INTO TB_Department VALUES (9, 1, '18', '철학과', 'Therapy', CURDATE(), '051-123-1009', '추후 예정');
INSERT INTO TB_Department VALUES (10, 1, '19', '정치외교학과', 'Political Science and Diplomacy', CURDATE(), '051-123-1010', '추후 예정');
INSERT INTO TB_Department VALUES (11, 1, '1A', '행정학과', 'Public Administration', CURDATE(), '051-123-1011', '추후 예정');
INSERT INTO TB_Department VALUES (12, 1, '1B', '사회복지학과', 'Social Welfare', CURDATE(), '051-123-1012', '추후 예정');
INSERT INTO TB_Department VALUES (13, 1, '1C', '유아교육학과', 'Early Childhood Education', CURDATE(), '051-123-1013', '추후 예정');

drop table TB_Professor;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Professor` (
  `pro_id` INT NOT NULL AUTO_INCREMENT,
  `pro_no` VARCHAR(30) NULL,
  `rrn` VARCHAR(45) NULL,
  `name_kor` VARCHAR(30) NULL,
  `name_eng` VARCHAR(45) NULL,
  `gender` CHAR(1) NULL,
  `nationality` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `address_basic` VARCHAR(45) NULL,
  `address_detail` VARCHAR(45) NULL,
  `statement` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  PRIMARY KEY (`pro_id`))
ENGINE = InnoDB;

-- 교수 데이터 삽입
INSERT INTO TB_Professor VALUES (1, '10', '871010-1234567', '김국어', 'kimkorean', 'M', '한국', '010-1234-1234', 'korean@email.com', '12345', '부산 해운대구', '201호', '재직중', '정교수');
INSERT INTO TB_Professor VALUES (2, '11', '871010-1234567', '김영어', 'kimkorean', 'M', '한국', '010-1234-1234', 'english@email.com', '12345', '부산 해운대구', '201호', '재직중', '정교수');

drop table TB_Professor_Academic;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_Professor_Academic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Professor_Academic` (
  `aca_id` INT NOT NULL AUTO_INCREMENT,
  `pro_id` INT NOT NULL,
  `school` VARCHAR(45) NULL,
  `major` VARCHAR(45) NULL,
  `graduation_at` DATE NULL,
  `degree` VARCHAR(45) NULL,
  `appointment_date` DATE NULL,
  PRIMARY KEY (`aca_id`, `pro_id`),
  CONSTRAINT `fk_TB_Professor_Academic_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO TB_Professor_Academic VALUES (1, 1, '그린대학교', '컴퓨터공학', '2010-10-10', '박사', '2020-10-10');

drop table TB_Department_Professor;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_Department_Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Department_Professor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pro_id` INT NOT NULL,
  `col_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `pro_id`, `col_id`, `dept_id`),
  INDEX `fk_Department_Professor_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  INDEX `fk_Department_Professor_TB_Department1_idx` (`dept_id` ASC, `col_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Professor_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Department_Professor_TB_Department1`
    FOREIGN KEY (`dept_id` , `col_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id` , `col_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO TB_Department_Professor VALUES (1, 1, 1, 1, '학과장');
INSERT INTO TB_Department_Professor VALUES (2, 2, 1, 2, '학과장');



drop table TB_Student;
-- -----------------------------------------------------
-- Table `GREEN`.`TB_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Student` (
  `std_id` INT NOT NULL AUTO_INCREMENT,
  `col_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  `pro_id` INT NOT NULL,
  `rrn` CHAR(14) NOT NULL,
  `name_kor` VARCHAR(45) NULL,
  `name_eng` VARCHAR(45) NULL,
  `gender` CHAR(1) NULL,
  `nationality` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `address_basic` VARCHAR(45) NULL,
  `address_detail` VARCHAR(45) NULL,
  `entrance_date` DATE NULL,
  `graduate_date` DATE NULL,
  `statement` VARCHAR(45) NULL,
  `grade` VARCHAR(45) NULL,
  `semester` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`std_id`, `col_id`, `dept_id`),
  INDEX `fk_TB_Student_TB_Department1_idx` (`dept_id` ASC, `col_id` ASC) VISIBLE,
  INDEX `fk_TB_Student_TB_Professor1_idx` (`pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_Student_TB_Department1`
    FOREIGN KEY (`dept_id` , `col_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id` , `col_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_Student_TB_Professor1`
    FOREIGN KEY (`pro_id`)
    REFERENCES `GREEN`.`TB_Professor` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 학생 데이터 삽입
-- 학생 데이터 삽입 (임시 샘플)
INSERT INTO TB_Student 
(col_id, dept_id, pro_id, rrn, name_kor, name_eng, gender, nationality, tel, email, zip_code, address_basic, address_detail, entrance_date, graduate_date, statement, grade, semester, category)
VALUES
(1, 1, 1, '020101-3123456', '홍길동', 'Hong Gil-dong', 'M', '한국', '010-1111-2222', 'hong1@example.com', '12345', '부산 해운대구', '101호', '2021-03-02', NULL, '재학', '1', '1', '학부');

INSERT INTO TB_Student 
(col_id, dept_id, pro_id, rrn, name_kor, name_eng, gender, nationality, tel, email, zip_code, address_basic, address_detail, entrance_date, graduate_date, statement, grade, semester, category)
VALUES
(1, 1, 1, '020102-4234567', '이영희', 'Lee Young-hee', 'F', '한국', '010-2222-3333', 'lee2@example.com', '12345', '부산 해운대구', '102호', '2020-03-02', NULL, '재학', '2', '2', '학부');

INSERT INTO TB_Student 
(col_id, dept_id, pro_id, rrn, name_kor, name_eng, gender, nationality, tel, email, zip_code, address_basic, address_detail, entrance_date, graduate_date, statement, grade, semester, category)
VALUES
(1, 2, 2, '020103-5234567', '김철수', 'Kim Chul-soo', 'M', '한국', '010-3333-4444', 'kim3@example.com', '12345', '부산 해운대구', '201호', '2022-03-02', NULL, '재학', '1', '2', '학부');

INSERT INTO TB_Student 
(col_id, dept_id, pro_id, rrn, name_kor, name_eng, gender, nationality, tel, email, zip_code, address_basic, address_detail, entrance_date, graduate_date, statement, grade, semester, category)
VALUES
(1, 2, 2, '020104-6234567', '박민수', 'Park Min-soo', 'M', '한국', '010-4444-5555', 'park4@example.com', '12345', '부산 해운대구', '202호', '2019-03-02', NULL, '재학', '3', '1', '학부');

INSERT INTO TB_Student 
(col_id, dept_id, pro_id, rrn, name_kor, name_eng, gender, nationality, tel, email, zip_code, address_basic, address_detail, entrance_date, graduate_date, statement, grade, semester, category)
VALUES
(1, 2, 2, '020105-7234567', '최수정', 'Choi Soo-jung', 'F', '한국', '010-5555-6666', 'choi5@example.com', '12345', '부산 해운대구', '203호', '2021-03-02', NULL, '재학', '2', '2', '학부');


-- -----------------------------------------------------
-- Table `GREEN`.`TB_Lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_Lecture` (
  `lecNo` INT NOT NULL,
  `lenName` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `grade` VARCHAR(45) NULL,
  `semester` VARCHAR(45) NULL,
  `credit` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `start_date` VARCHAR(45) NULL,
  `end_date` VARCHAR(45) NULL,
  `start_time` VARCHAR(45) NULL,
  `end_time` VARCHAR(45) NULL,
  `day_of_week` VARCHAR(45) NULL,
  `evaluation` VARCHAR(45) NULL,
  `textbook` VARCHAR(45) NULL,
  `classroom` VARCHAR(45) NULL,
  `max_enrollment` VARCHAR(45) NULL,
  PRIMARY KEY (`lecNo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `GREEN`.`TB_EMPLOY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GREEN`.`TB_EMPLOY` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `dept_id` INT NOT NULL,
  `emp_name` VARCHAR(45) NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `fk_TB_EMPLOY_TB_Department1_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_EMPLOY_TB_Department1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `GREEN`.`TB_Department` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SELECT
  d.name_kor   AS dept_name,   -- 학과명
  p.name_kor   AS prof_name,   -- 교수명
  d.tel        AS dept_tel     -- 학과 전화
FROM TB_Department d
JOIN Department_Professor dp
  ON dp.dept_id = d.dept_id
 AND dp.col_id  = d.col_id
JOIN TB_Professor p
  ON p.pro_id   = dp.pro_id
WHERE dp.role = '학과장' AND d.col_id = 1;


SELECT 
    p.pro_no,
    p.name_kor AS professor_name,
    p.rrn,
    p.tel,
    p.email,
    d.name_kor AS department_name,
    p.position,
    p.statement,
    a.appointment_date
FROM TB_Professor p
JOIN TB_Department_Professor dp 
    ON p.pro_id = dp.pro_id
JOIN TB_Department d 
    ON dp.dept_id = d.dept_id 
   AND dp.col_id = d.col_id
LEFT JOIN TB_Professor_Academic a 
    ON p.pro_id = a.pro_id;