-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  `CustoL` FLOAT NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `Data` DATE NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CC` INT(11) NOT NULL,
  `NIF` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 71
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Fonte2`.`audNeoFinal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fonte2`.`audNeoFinal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NULL DEFAULT NULL,
  `CustoL` FLOAT NULL DEFAULT NULL,
  `TotalPago` FLOAT NULL DEFAULT NULL,
  `QtdAbastecida` FLOAT NULL DEFAULT NULL,
  `Data` VARCHAR(10) NULL DEFAULT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `CC` INT(11) NULL DEFAULT NULL,
  `NIF` INT(11) NULL DEFAULT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 71
DEFAULT CHARACTER SET = utf8;

USE `Fonte2`;

DELIMITER $$
USE `Fonte2`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `Fonte2`.`NEOInsert`
AFTER INSERT ON `Fonte2`.`audNeo`
FOR EACH ROW
BEGIN
  INSERT INTO Fonte2.audNeoFinal (Tipo, CustoL, TotalPago, QtdAbastecida, Data, Nome, CC, Nif, Operacao, DataOperacao) 
  VALUES (new.Tipo,new.CustoL,new.TotalPago,new.QtdAbastecida,new.Data,new.Nome,new.CC,new.NIF,'I',now());
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
