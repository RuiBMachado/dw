-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Fonte2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Fonte2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fonte2` DEFAULT CHARACTER SET utf8 ;
USE `Fonte2` ;

-- -----------------------------------------------------
-- Table `Fonte2`.`audNeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fonte2`.`audNeo` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `CustoL` FLOAT NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `Data` DATETIME NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CC` INT NOT NULL,
  `NIF` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
