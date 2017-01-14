-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eurosuper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eurosuper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eurosuper` DEFAULT CHARACTER SET utf8 ;
USE `eurosuper` ;

-- -----------------------------------------------------
-- Table `eurosuper`.`Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Combustivel` (
  `idCombustivel` INT NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `pontos` INT NOT NULL,
  `QtdTanque` INT NOT NULL,
  `custoLitro` DECIMAL(4,3) NOT NULL,
  PRIMARY KEY (`idCombustivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eurosuper`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Cliente` (
  `CC` INT NOT NULL,
  `PNome` VARCHAR(15) NOT NULL,
  `UNome` VARCHAR(15) NOT NULL,
  `NIF` INT NOT NULL,
  `PontosAcumulados` INT NOT NULL,
  PRIMARY KEY (`CC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eurosuper`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Venda` (
  `idVenda` INT NOT NULL,
  `Periodo` VARCHAR(15) NOT NULL,
  `NomeFuncionario` VARCHAR(45) NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `FlagDesconto` INT NOT NULL,
  `Data` DATETIME NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `idCombustivel` INT NOT NULL,
  `CCCliente` INT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE INDEX `idVenda_UNIQUE` (`idVenda` ASC),
  INDEX `fk_Venda_Combustivel_idx` (`idCombustivel` ASC),
  INDEX `fk_Venda_Cliente1_idx` (`CCCliente` ASC),
  CONSTRAINT `fk_Venda_Combustivel`
    FOREIGN KEY (`idCombustivel`)
    REFERENCES `eurosuper`.`Combustivel` (`idCombustivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`CCCliente`)
    REFERENCES `eurosuper`.`Cliente` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eurosuper`.`CupaoDesconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`CupaoDesconto` (
  `idCD` INT NOT NULL,
  `valorDesconto` INT NOT NULL,
  `Validade` DATETIME NOT NULL,
  `DataAtribuição` DATETIME NOT NULL,
  `FlagUsado` INT NOT NULL,
  `CCClient` INT NOT NULL,
  PRIMARY KEY (`idCD`),
  INDEX `fk_Cupom Desconto_Cliente1_idx` (`CCClient` ASC),
  CONSTRAINT `fk_Cupom Desconto_Cliente1`
    FOREIGN KEY (`CCClient`)
    REFERENCES `eurosuper`.`Cliente` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
