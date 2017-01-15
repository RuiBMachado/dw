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
CREATE SCHEMA IF NOT EXISTS `arearetencao` DEFAULT CHARACTER SET utf8 ;
USE `arearetencao` ;

-- -----------------------------------------------------
-- Table `mydb`.`pre_ClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_ClienteP1` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_LClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LClienteP1` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qua_LClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LClienteP1` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_ConfClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfClienteP1` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equi_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`equi_Cliente` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qua_equiCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_equiCliente` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_DimCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCliente` (
  `id` INT NOT NULL,
  `CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_DimCliente_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCliente_H` (
  `id` INT NOT NULL,
  `DIM_Cliente_CC` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pre_CalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_CalendarioP1` (
  `id` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qua_CalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_CalendarioP1` (
  `id` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_LCalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LCalendarioP1` (
  `id` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_ConfCalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfCalendarioP1` (
  `id` INT NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_Calendario` (
  `Data` DATE NOT NULL,
  `Mes` INT NOT NULL,
  `Ano` INT NOT NULL,
  `DiaSemana` INT NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pre_CombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_CombustivelP1` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_LCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LCombustivelP1` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qua_LCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LCombustivelP1` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_ConfCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfCombustivelP1` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equi_Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`equi_Combustivel` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qua_equiCombustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_equiCombustivel` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_DimCombustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCombustivel` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pos_DimCombustivel_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCombustivel_H` (
  `id` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `DIM_Combustivel_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
