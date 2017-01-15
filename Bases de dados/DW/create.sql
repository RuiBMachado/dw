-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tabelafactos` DEFAULT CHARACTER SET utf8 ;
USE `tabelafactos` ;

-- -----------------------------------------------------
-- Table `mydb`.`DIM_Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`DIM_Calendario` (
  `Data` DATE NOT NULL,
  `DiaSemana` VARCHAR(20) NOT NULL,
  `Mes` VARCHAR(20) NOT NULL,
  `Ano` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`DIM_Cliente` (
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  PRIMARY KEY (`CC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`DIM_Combustivel` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TFVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`TFVenda` (
  `id` INT NOT NULL,
  `ValorPago` DECIMAL(10,2) NOT NULL,
  `QtdAbastecida` DECIMAL(10,2) NOT NULL,
  `DataInsercao` DATE NOT NULL,
  `DIM_Cliente_CC` INT NOT NULL,
  `DIM_Combustivel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TFVenda_DIM_Calendario_idx` (`DataInsercao` ASC),
  INDEX `fk_TFVenda_DIM_Cliente1_idx` (`DIM_Cliente_CC` ASC),
  INDEX `fk_TFVenda_DIM_Combustivel1_idx` (`DIM_Combustivel_id` ASC),
  CONSTRAINT `fk_TFVenda_DIM_Calendario`
    FOREIGN KEY (`DataInsercao`)
    REFERENCES `tabelafactos`.`DIM_Calendario` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TFVenda_DIM_Cliente1`
    FOREIGN KEY (`DIM_Cliente_CC`)
    REFERENCES `tabelafactos`.`DIM_Cliente` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TFVenda_DIM_Combustivel1`
    FOREIGN KEY (`DIM_Combustivel_id`)
    REFERENCES `tabelafactos`.`DIM_Combustivel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Combustivel_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`DIM_Combustivel_H` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(10,2) NOT NULL,
  `Data` DATE NOT NULL,
  `DIM_Combustivel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DIM_Combustivel_H_DIM_Combustivel1_idx` (`DIM_Combustivel_id` ASC),
  CONSTRAINT `fk_DIM_Combustivel_H_DIM_Combustivel1`
    FOREIGN KEY (`DIM_Combustivel_id`)
    REFERENCES `tabelafactos`.`DIM_Combustivel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DIM_Cliente_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabelafactos`.`DIM_Cliente_H` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Data` DATE NOT NULL,
  `NIF` INT NOT NULL,
  `DIM_Cliente_CC` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DIM_Cliente_H_DIM_Cliente1_idx` (`DIM_Cliente_CC` ASC),
  CONSTRAINT `fk_DIM_Cliente_H_DIM_Cliente1`
    FOREIGN KEY (`DIM_Cliente_CC`)
    REFERENCES `tabelafactos`.`DIM_Cliente` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
