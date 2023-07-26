-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema testdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema testdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `testdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`department_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department_info` (
  `dep_id` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `represent` VARCHAR(45) NULL,
  `call` VARCHAR(45) NULL,
  PRIMARY KEY (`dep_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor_info` (
  `pro_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `major` VARCHAR(45) NOT NULL,
  `birthdate` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `department_info_dep_id` INT NOT NULL,
  PRIMARY KEY (`pro_id`),
  INDEX `fk_professor_info_department_info1_idx` (`department_info_dep_id` ASC) VISIBLE,
  CONSTRAINT `fk_professor_info_department_info1`
    FOREIGN KEY (`department_info_dep_id`)
    REFERENCES `mydb`.`department_info` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student_info` (
  `std_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `grade` INT NOT NULL,
  `major` VARCHAR(30) NOT NULL,
  `birthdate` VARCHAR(20) NULL,
  `phone` VARCHAR(45) NULL,
  `department_info_dep_id` INT NOT NULL,
  `professor_info_pro_id` INT NOT NULL,
  PRIMARY KEY (`std_id`),
  INDEX `fk_student_info_department_info1_idx` (`department_info_dep_id` ASC) VISIBLE,
  INDEX `fk_student_info_professor_info1_idx` (`professor_info_pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_info_department_info1`
    FOREIGN KEY (`department_info_dep_id`)
    REFERENCES `mydb`.`department_info` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_info_professor_info1`
    FOREIGN KEY (`professor_info_pro_id`)
    REFERENCES `mydb`.`professor_info` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject_info` (
  `subject_id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `professor` VARCHAR(45) NOT NULL,
  `credit` INT NOT NULL,
  `max_personnal` INT NULL,
  `department_info_dep_id` INT NOT NULL,
  `professor_info_pro_id` INT NOT NULL,
  PRIMARY KEY (`subject_id`),
  INDEX `fk_subject_info_department_info1_idx` (`department_info_dep_id` ASC) VISIBLE,
  INDEX `fk_subject_info_professor_info1_idx` (`professor_info_pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_subject_info_department_info1`
    FOREIGN KEY (`department_info_dep_id`)
    REFERENCES `mydb`.`department_info` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_info_professor_info1`
    FOREIGN KEY (`professor_info_pro_id`)
    REFERENCES `mydb`.`professor_info` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_info` (
  `student_info_std_id` INT NOT NULL,
  `subject_info_subject_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`student_info_std_id`, `subject_info_subject_id`),
  INDEX `fk_student_info_has_subject_info_subject_info1_idx` (`subject_info_subject_id` ASC) VISIBLE,
  INDEX `fk_student_info_has_subject_info_student_info_idx` (`student_info_std_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_info_has_subject_info_student_info`
    FOREIGN KEY (`student_info_std_id`)
    REFERENCES `mydb`.`student_info` (`std_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_info_has_subject_info_subject_info1`
    FOREIGN KEY (`subject_info_subject_id`)
    REFERENCES `mydb`.`subject_info` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`assistant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`assistant` (
  `assistant_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `department_info_dep_id` INT NOT NULL,
  `professor_info_pro_id` INT NOT NULL,
  PRIMARY KEY (`assistant_id`),
  INDEX `fk_assistant_department_info1_idx` (`department_info_dep_id` ASC) VISIBLE,
  INDEX `fk_assistant_professor_info1_idx` (`professor_info_pro_id` ASC) VISIBLE,
  CONSTRAINT `fk_assistant_department_info1`
    FOREIGN KEY (`department_info_dep_id`)
    REFERENCES `mydb`.`department_info` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assistant_professor_info1`
    FOREIGN KEY (`professor_info_pro_id`)
    REFERENCES `mydb`.`professor_info` (`pro_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `testdb` ;

-- -----------------------------------------------------
-- Table `testdb`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`user_info` (
  `id` INT NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `gender` VARCHAR(50) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
