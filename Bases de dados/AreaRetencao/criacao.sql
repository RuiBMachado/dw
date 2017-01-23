-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema arearetencao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema arearetencao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `arearetencao` DEFAULT CHARACTER SET utf8 ;
USE `arearetencao` ;

-- -----------------------------------------------------
-- Table `arearetencao`.`DataUpdate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`DataUpdate` (
  `id` INT(11) NOT NULL,
  `UltimoUpCliente` DATETIME NOT NULL,
  `UltimoUpCombus` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`equi_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`equi_Cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `CC` INT(11) NOT NULL,
  `Fonte1` INT(11) NOT NULL,
  `Fonte2` INT(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`equi_Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`equi_Combustivel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Fonte1` INT(11) NOT NULL,
  `Fonte2` INT(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_Calendario` (
  `Data` DATE NOT NULL,
  `Mes` INT(11) NOT NULL,
  `Ano` INT(11) NOT NULL,
  `DiaSemana` INT(11) NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_ConfCalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfCalendarioP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_ConfClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfClienteP1` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_ConfCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfCombustivelP1` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_ConfFactosP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfFactosP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `DataInsercao` DATE NOT NULL,
  `IdCliente` INT(11) NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  `ValorPago` DECIMAL(10,2) NOT NULL,
  `QtdAbastecida` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_ConfNeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_ConfNeo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `CustoL` DECIMAL(4,3) NOT NULL,
  `TotalPago` DECIMAL(10,2) NOT NULL,
  `QtdAbastecida` DECIMAL(10,2) NOT NULL,
  `Data` DATE NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CC` INT(11) NOT NULL,
  `NIF` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_DimCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCliente` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_DimCliente_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCliente_H` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `DIM_Cliente_CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13901964
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_DimCombustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCombustivel` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_DimCombustivel_H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_DimCombustivel_H` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `DIM_Combustivel_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 69
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_Factos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_Factos` (
  `id` INT(11) NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `DataInsercao` DATE NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `IdCliente` INT(11) NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  `ValorPago` DECIMAL(10,2) NOT NULL,
  `QtdAbastecida` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_LCalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LCalendarioP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_LClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LClienteP1` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_LCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LCombustivelP1` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_LFactosP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LFactosP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `idCombustivel` INT(11) NOT NULL,
  `CCCliente` INT(11) NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pos_LNeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pos_LNeo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `CustoL` FLOAT NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `Data` VARCHAR(10) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CC` INT(11) NOT NULL,
  `NIF` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pre_CalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_CalendarioP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pre_ClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_ClienteP1` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pre_CombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_CombustivelP1` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`pre_FactosP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`pre_FactosP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `idCombustivel` INT(11) NOT NULL,
  `CCCliente` INT(11) NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_CalendarioP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_CalendarioP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_LClienteP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LClienteP1` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_LCombustivelP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LCombustivelP1` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_LFactosP1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LFactosP1` (
  `id` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `idCombustivel` INT(11) NOT NULL,
  `CCCliente` INT(11) NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_LNeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_LNeo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  `CustoL` FLOAT NULL DEFAULT NULL,
  `TotalPago` FLOAT NULL DEFAULT NULL,
  `QtdAbastecida` FLOAT NULL DEFAULT NULL,
  `Data` VARCHAR(10) NULL DEFAULT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `CC` INT(11) NULL DEFAULT NULL,
  `NIF` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_equiCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_equiCliente` (
  `id` INT(11) NOT NULL,
  `CC` INT(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arearetencao`.`qua_equiCombustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arearetencao`.`qua_equiCombustivel` (
  `id` INT(11) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATE NOT NULL,
  `IdCombustivel` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
