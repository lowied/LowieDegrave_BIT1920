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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `gene_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gene_name` VARCHAR(128) NULL,
  `seq_region_start` INT UNSIGNED NOT NULL,
  `seq_region_end` INT UNSIGNED NOT NULL,
  `chromosome` TINYINT(2) NULL,
  `gene_description` TEXT(100) NULL,
  PRIMARY KEY (`gene_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `patient_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `Gender` ENUM('M', 'F') NOT NULL,
  `Age_of_diagnosis` INT(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`patient_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `syndrome_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_description` VARCHAR(45) NULL,
  `gene_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`syndrome_id`),
  INDEX `gene_id_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `gene_id`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`Gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients_with_syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients_with_syndrome` (
  `id` INT UNSIGNED NOT NULL,
  `patient_id` INT(10) UNSIGNED NOT NULL,
  `syndrome_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_id_idx` (`patient_id` ASC) VISIBLE,
  INDEX `syndrome_id_idx` (`syndrome_id` ASC) VISIBLE,
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `mydb`.`Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `syndrome_id`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `mydb`.`Syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
