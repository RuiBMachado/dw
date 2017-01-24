-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DW
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DW
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DW` DEFAULT CHARACTER SET utf8 ;
USE `DW` ;

-- -----------------------------------------------------
-- Table `DW`.`DIM_Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`DIM_Calendario` (
  `Data` DATE NOT NULL,
  `DiaSemana` VARCHAR(20) NOT NULL,
  `Mes` VARCHAR(20) NOT NULL,
  `Ano` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DW`.`DIM_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`DIM_Cliente` (
  `Id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DW`.`DIM_Cliente_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`DIM_Cliente_H` (
  `id` INT(11) NOT NULL DEFAULT '1',
  `CC` INT(11) NOT NULL DEFAULT '1',
  `Nome` VARCHAR(45) NOT NULL,
  `Data` DATETIME NOT NULL,
  `NIF` INT(11) NOT NULL DEFAULT '1',
  `DIM_Cliente_CC` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DIM_Cliente_H_DIM_Cliente1_idx` (`DIM_Cliente_CC` ASC),
  CONSTRAINT `fk_DIM_Cliente_H_DIM_Cliente1`
    FOREIGN KEY (`DIM_Cliente_CC`)
    REFERENCES `DW`.`DIM_Cliente` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DW`.`DIM_Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`DIM_Combustivel` (
  `Id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DW`.`DIM_Combustivel_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`DIM_Combustivel_H` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(10,2) NOT NULL,
  `Data` DATETIME NOT NULL,
  `DIM_Combustivel_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DIM_Combustivel_H_DIM_Combustivel1_idx` (`DIM_Combustivel_id` ASC),
  CONSTRAINT `fk_DIM_Combustivel_H_DIM_Combustivel1`
    FOREIGN KEY (`DIM_Combustivel_id`)
    REFERENCES `DW`.`DIM_Combustivel` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `DW`.`TFVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`TFVenda` (
  `ValorPago` DECIMAL(10,2) NOT NULL,
  `QtdAbastecida` DECIMAL(10,2) NOT NULL,
  `Data` DATE NOT NULL,
  `DIM_Cliente_id` INT(11) NOT NULL,
  `DIM_Combustivel_id` INT(11) NOT NULL,
  INDEX `fk_TFVenda_DIM_Calendario_idx` (`Data` ASC),
  INDEX `fk_TFVenda_DIM_Cliente1_idx` (`DIM_Cliente_id` ASC),
  INDEX `fk_TFVenda_DIM_Combustivel1_idx` (`DIM_Combustivel_id` ASC),
  CONSTRAINT `fk_TFVenda_DIM_Calendario`
    FOREIGN KEY (`Data`)
    REFERENCES `DW`.`DIM_Calendario` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TFVenda_DIM_Cliente1`
    FOREIGN KEY (`DIM_Cliente_id`)
    REFERENCES `DW`.`DIM_Cliente` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TFVenda_DIM_Combustivel1`
    FOREIGN KEY (`DIM_Combustivel_id`)
    REFERENCES `DW`.`DIM_Combustivel` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
