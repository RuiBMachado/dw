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
  `id` INT AUTO_INCREMENT,
  `Tipo` VARCHAR(45),
  `CustoL` FLOAT,
  `TotalPago` FLOAT,
  `QtdAbastecida` FLOAT,
  `Data` VARCHAR(10),
  `Nome` VARCHAR(45),
  `CC` INT,
  `NIF` INT,
  `DataOperacao` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Insert
DELIMITER $$
CREATE TRIGGER NEOInsert AFTER INSERT on Fonte2.audNeo
FOR EACH ROW
  BEGIN
  INSERT INTO Fonte2.audNeo (id,Tipo,CustoL,TotalPago,QtdAbastecida,Data,Nome,CC,NIF,DataOperacao) 
  VALUES (new.Tipo,new.CustoL,new.TotalPago,new.QtdAbastecida,new.Data,new.Nome,new.CC,new.NIF,now());
END $$
