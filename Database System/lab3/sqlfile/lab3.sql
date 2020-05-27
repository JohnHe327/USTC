-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab3` DEFAULT CHARACTER SET utf8mb4 ;
SHOW WARNINGS;
USE `lab3` ;

-- -----------------------------------------------------
-- Table `lab3`.`Campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Campus` (
  `Campus_id` VARCHAR(10) NOT NULL,
  `Campus_name` VARCHAR(45) NOT NULL,
  `Campus_address` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`Campus_id` ASC),
  PRIMARY KEY (`Campus_id`),
  UNIQUE INDEX `Campus_name_UNIQUE` (`Campus_name` ASC),
  UNIQUE INDEX `Campus_address_UNIQUE` (`Campus_address` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Person` (
  `Person_id` VARCHAR(18) NOT NULL,
  `Person_id_type` ENUM("身份证", "护照") NOT NULL,
  `Person_name` VARCHAR(45) NOT NULL,
  `Person_gender` ENUM("男", "女") NOT NULL,
  `Person_date_of_birth` DATE NULL,
  `Person_nationality` VARCHAR(45) NULL,
  PRIMARY KEY (`Person_id`),
  UNIQUE INDEX `Person_id_UNIQUE` (`Person_id` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Teacher` (
  `Teacher_id` VARCHAR(10) NOT NULL,
  `Teacher_person_id` VARCHAR(18) NOT NULL,
  `Teacher_entry_date` DATE NOT NULL,
  `Teacher_email` VARCHAR(45) NULL,
  `Teacher_major_id` VARCHAR(10) NULL,
  `Teacher_rank` ENUM("教授", "副教授") NULL,
  PRIMARY KEY (`Teacher_id`),
  INDEX `fk_Teacher_Person1_idx` (`Teacher_person_id` ASC),
  INDEX `fk_Teacher_Major1_idx` (`Teacher_major_id` ASC),
  UNIQUE INDEX `Teacher_id_UNIQUE` (`Teacher_id` ASC),
  UNIQUE INDEX `Teacher_email_UNIQUE` (`Teacher_email` ASC),
  UNIQUE INDEX `Teacher_person_id_UNIQUE` (`Teacher_person_id` ASC),
  CONSTRAINT `fk_Teacher_Person1`
    FOREIGN KEY (`Teacher_person_id`)
    REFERENCES `lab3`.`Person` (`Person_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Teacher_Major1`
    FOREIGN KEY (`Teacher_major_id`)
    REFERENCES `lab3`.`Major` (`Major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Major` (
  `Major_id` VARCHAR(10) NOT NULL,
  `Major_name` VARCHAR(45) NOT NULL,
  `Major_address` VARCHAR(45) NULL,
  `Major_campus_id` VARCHAR(10) NOT NULL,
  `Major_leader` VARCHAR(10) NULL,
  PRIMARY KEY (`Major_id`),
  UNIQUE INDEX `Major_id_UNIQUE` (`Major_id` ASC),
  INDEX `fk_Major_Campus1_idx` (`Major_campus_id` ASC),
  INDEX `fk_Major_Teacher1_idx` (`Major_leader` ASC),
  UNIQUE INDEX `Major_name_UNIQUE` (`Major_name` ASC),
  CONSTRAINT `fk_Major_Campus1`
    FOREIGN KEY (`Major_campus_id`)
    REFERENCES `lab3`.`Campus` (`Campus_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Major_Teacher1`
    FOREIGN KEY (`Major_leader`)
    REFERENCES `lab3`.`Teacher` (`Teacher_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Class` (
  `Class_id` VARCHAR(15) NOT NULL,
  `Class_name` VARCHAR(45) NOT NULL,
  `Class_create_date` DATE NOT NULL,
  `Class_head_teacher` VARCHAR(10) NOT NULL,
  `Class_grade` YEAR NOT NULL,
  `Class_major` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Class_id`),
  UNIQUE INDEX `Class_id_UNIQUE` (`Class_id` ASC),
  INDEX `fk_Class_Major_idx` (`Class_major` ASC),
  INDEX `fk_Class_head_teacher_idx` (`Class_head_teacher` ASC),
  CONSTRAINT `fk_Class_Major`
    FOREIGN KEY (`Class_major`)
    REFERENCES `lab3`.`Major` (`Major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Class_head_teacher`
    FOREIGN KEY (`Class_head_teacher`)
    REFERENCES `lab3`.`Teacher` (`Teacher_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Student` (
  `Student_id` VARCHAR(10) NOT NULL,
  `Student_person_id` VARCHAR(18) NOT NULL,
  `Student_email` VARCHAR(45) NULL,
  `Student_class` VARCHAR(15) NOT NULL,
  `Student_major_id` VARCHAR(10) NOT NULL,
  `Student_time_of_enrollment` DATE NOT NULL,
  PRIMARY KEY (`Student_id`),
  UNIQUE INDEX `Student_id_UNIQUE` (`Student_id` ASC),
  INDEX `fk_Student_Class1_idx` (`Student_class` ASC),
  INDEX `fk_Student_Person1_idx` (`Student_person_id` ASC),
  INDEX `fk_Student_Major1_idx` (`Student_major_id` ASC),
  UNIQUE INDEX `Student_person_id_UNIQUE` (`Student_person_id` ASC),
  UNIQUE INDEX `Student_email_UNIQUE` (`Student_email` ASC),
  CONSTRAINT `fk_Student_Class`
    FOREIGN KEY (`Student_class`)
    REFERENCES `lab3`.`Class` (`Class_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_Person`
    FOREIGN KEY (`Student_person_id`)
    REFERENCES `lab3`.`Person` (`Person_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_Major1`
    FOREIGN KEY (`Student_major_id`)
    REFERENCES `lab3`.`Major` (`Major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Contact information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Contact information` (
  `Person_id` VARCHAR(18) NOT NULL,
  `Person_address` VARCHAR(45) NULL,
  `Person_postcode` DECIMAL(6) NULL,
  `Person_phone_number` DECIMAL(11) NULL,
  INDEX `fk_Contact information_Person1_idx` (`Person_id` ASC),
  PRIMARY KEY (`Person_id`),
  UNIQUE INDEX `Person_id_UNIQUE` (`Person_id` ASC),
  UNIQUE INDEX `Person_phone_number_UNIQUE` (`Person_phone_number` ASC),
  CONSTRAINT `fk_Contact information_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `lab3`.`Person` (`Person_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Student status change`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Student status change` (
  `Change_id` VARCHAR(10) NOT NULL,
  `Change_date` DATE NOT NULL,
  `Original_class_id` VARCHAR(15) NOT NULL,
  `Current_class_id` VARCHAR(15) NOT NULL,
  `Change_type` ENUM("专业", "年级") NOT NULL,
  PRIMARY KEY (`Change_id`),
  UNIQUE INDEX `Change_id_UNIQUE` (`Change_id` ASC),
  INDEX `fk_Student status change_Class1_idx` (`Original_class_id` ASC),
  INDEX `fk_Student status change_Class2_idx` (`Current_class_id` ASC),
  CONSTRAINT `fk_Student status change_Class1`
    FOREIGN KEY (`Original_class_id`)
    REFERENCES `lab3`.`Class` (`Class_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student status change_Class2`
    FOREIGN KEY (`Current_class_id`)
    REFERENCES `lab3`.`Class` (`Class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Student major change`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Student major change` (
  `Change_id` VARCHAR(10) NOT NULL,
  `Student_id` VARCHAR(10) NOT NULL,
  `Change_league_member` ENUM("是", "否", "不是团员") NOT NULL,
  INDEX `fk_Student major change_Student status change1_idx` (`Change_id` ASC),
  PRIMARY KEY (`Change_id`),
  UNIQUE INDEX `Change_id_UNIQUE` (`Change_id` ASC),
  INDEX `fk_Student major change_Student1_idx` (`Student_id` ASC),
  UNIQUE INDEX `Student_Student_id_UNIQUE` (`Student_id` ASC),
  CONSTRAINT `fk_Student major change_Student status change1`
    FOREIGN KEY (`Change_id`)
    REFERENCES `lab3`.`Student status change` (`Change_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student major change_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `lab3`.`Student` (`Student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Student grade change`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Student grade change` (
  `Change_id` VARCHAR(10) NOT NULL,
  `Student_id` VARCHAR(10) NOT NULL,
  `Change_reason` ENUM("休学", "支教") NOT NULL,
  INDEX `fk_Student grade change_Student status change1_idx` (`Change_id` ASC),
  UNIQUE INDEX `Student status change_Change_id_UNIQUE` (`Change_id` ASC),
  PRIMARY KEY (`Change_id`),
  INDEX `fk_Student grade change_Student1_idx` (`Student_id` ASC),
  UNIQUE INDEX `Student_Student_id_UNIQUE` (`Student_id` ASC),
  CONSTRAINT `fk_Student grade change_Student status change1`
    FOREIGN KEY (`Change_id`)
    REFERENCES `lab3`.`Student status change` (`Change_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student grade change_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `lab3`.`Student` (`Student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Course` (
  `Course_id` VARCHAR(10) NOT NULL,
  `Course_name` VARCHAR(45) NOT NULL,
  `Course_major_id` VARCHAR(10) NOT NULL,
  `Course_evaluation_method` ENUM("考试", "答辩") NOT NULL,
  PRIMARY KEY (`Course_id`),
  UNIQUE INDEX `Course_id_UNIQUE` (`Course_id` ASC),
  INDEX `fk_Course_Major1_idx` (`Course_major_id` ASC),
  CONSTRAINT `fk_Course_Major1`
    FOREIGN KEY (`Course_major_id`)
    REFERENCES `lab3`.`Major` (`Major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Time_slot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Time_slot` (
  `Time_slot_id` VARCHAR(10) NOT NULL,
  `Day` ENUM("星期一", "星期二", "星期三", "星期四", "星期五") NOT NULL,
  `Piece` ENUM("1", "2", "3", "4", "5", "6", "7", "8", "9") NOT NULL,
  PRIMARY KEY (`Time_slot_id`),
  UNIQUE INDEX `Time_slot_id_UNIQUE` (`Time_slot_id` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Section` (
  `Course_id` VARCHAR(10) NOT NULL,
  `Teacher_id` VARCHAR(10) NOT NULL,
  `Year` YEAR NOT NULL,
  `Semester` ENUM("春", "秋") NOT NULL,
  `Time_slot_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Course_id`, `Teacher_id`, `Year`, `Semester`),
  INDEX `fk_Course_has_Time slot_Time slot1_idx` (`Time_slot_id` ASC),
  INDEX `fk_Course_has_Time slot_Course1_idx` (`Course_id` ASC),
  INDEX `fk_Course_has_Time slot_Teacher1_idx` (`Teacher_id` ASC),
  CONSTRAINT `fk_Course_has_Time slot_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `lab3`.`Course` (`Course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_has_Time slot_Time slot1`
    FOREIGN KEY (`Time_slot_id`)
    REFERENCES `lab3`.`Time_slot` (`Time_slot_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_has_Time slot_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `lab3`.`Teacher` (`Teacher_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lab3`.`Takes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab3`.`Takes` (
  `Student_id` VARCHAR(10) NOT NULL,
  `Section_Course_id` VARCHAR(10) NOT NULL,
  `Section_Teacher_id` VARCHAR(10) NOT NULL,
  `Section_Year` YEAR NOT NULL,
  `Section_Semester` ENUM("春", "秋") NOT NULL,
  `Grade` INT NULL,
  INDEX `fk_Takes_Student1_idx` (`Student_id` ASC),
  PRIMARY KEY (`Student_id`, `Section_Course_id`),
  INDEX `fk_Takes_Section1_idx` (`Section_Course_id` ASC, `Section_Teacher_id` ASC, `Section_Year` ASC, `Section_Semester` ASC),
  CONSTRAINT `fk_Takes_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `lab3`.`Student` (`Student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Takes_Section1`
    FOREIGN KEY (`Section_Course_id` , `Section_Teacher_id` , `Section_Year` , `Section_Semester`)
    REFERENCES `lab3`.`Section` (`Course_id` , `Teacher_id` , `Year` , `Semester`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
