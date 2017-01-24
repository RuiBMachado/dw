-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eurosuper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eurosuper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eurosuper` DEFAULT CHARACTER SET utf8 ;
USE `eurosuper` ;

-- -----------------------------------------------------
-- Table `eurosuper`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Cliente` (
  `CC` INT(11) NOT NULL,
  `PNome` VARCHAR(15) NOT NULL,
  `UNome` VARCHAR(15) NOT NULL,
  `NIF` INT(11) NOT NULL,
  `PontosAcumulados` INT(11) NOT NULL,
  PRIMARY KEY (`CC`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`Combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Combustivel` (
  `idCombustivel` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(20) NOT NULL,
  `pontos` INT(11) NOT NULL,
  `QtdTanque` INT(11) NOT NULL,
  `custoLitro` DECIMAL(4,3) NOT NULL,
  PRIMARY KEY (`idCombustivel`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`CupaoDesconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`CupaoDesconto` (
  `idCD` INT(11) NOT NULL,
  `valorDesconto` INT(11) NOT NULL,
  `Validade` DATETIME NOT NULL,
  `DataAtribuição` DATETIME NOT NULL,
  `FlagUsado` INT(11) NOT NULL,
  `CCClient` INT(11) NOT NULL,
  PRIMARY KEY (`idCD`),
  INDEX `fk_cliente_idx` (`CCClient` ASC),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`CCClient`)
    REFERENCES `eurosuper`.`Cliente` (`CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`Venda` (
  `idVenda` INT(11) NOT NULL,
  `Periodo` VARCHAR(15) NOT NULL,
  `NomeFuncionario` VARCHAR(45) NOT NULL,
  `QtdAbastecida` FLOAT NOT NULL,
  `FlagDesconto` INT(11) NOT NULL,
  `Data` DATETIME NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `idCombustivel` INT(11) NOT NULL,
  `CCCliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE INDEX `idVenda_UNIQUE` (`idVenda` ASC),
  INDEX `fk_Venda_Combustivel_idx` (`idCombustivel` ASC),
  INDEX `fk_Venda_Cliente1_idx` (`CCCliente` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`audCalendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`audCalendario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 657
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`audCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`audCliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `CC` INT(11) NOT NULL,
  `PNome` VARCHAR(15) NOT NULL,
  `UNome` VARCHAR(15) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `NIF` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1374
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`audCombustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`audCombustivel` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(20) NOT NULL,
  `Preco` DECIMAL(4,3) NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  `IdCombustivel` INT(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 475
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eurosuper`.`audVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eurosuper`.`audVenda` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `QtdAbastecida` FLOAT NOT NULL,
  `TotalPago` FLOAT NOT NULL,
  `idCombustivel` INT(11) NOT NULL,
  `CCCliente` INT(11) NOT NULL,
  `Data` DATETIME NOT NULL,
  `Operacao` ENUM('I', 'U', 'D') NOT NULL,
  `DataOperacao` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 652
DEFAULT CHARACTER SET = utf8;

USE `eurosuper`;

DELIMITER $$
USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudClienteDelete`
AFTER DELETE ON `eurosuper`.`Cliente`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (old.cc,old.PNome,old.UNome,'D',now(),old.NIF);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudClienteInsert`
AFTER INSERT ON `eurosuper`.`Cliente`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (new.cc,new.PNome,new.UNome,'I',now(),new.NIF);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudClienteUpdate`
AFTER UPDATE ON `eurosuper`.`Cliente`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (new.cc,new.PNome,new.UNome,'U',now(),new.NIF);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudCombustivelDelete`
AFTER DELETE ON `eurosuper`.`Combustivel`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao,idCombustivel) 
  VALUES (old.Tipo,old.custoLitro,'D',now(),old.idCombustivel);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudCombustivelInsert`
AFTER INSERT ON `eurosuper`.`Combustivel`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao,idCombustivel) 
  VALUES (new.Tipo,new.custoLitro,'I',now(),new.idCombustivel);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudCombustivelUpdate`
AFTER UPDATE ON `eurosuper`.`Combustivel`
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao,idCombustivel) 
  VALUES (new.Tipo,new.custoLitro,'U',now(),new.idCombustivel);
END$$

USE `eurosuper`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eurosuper`.`dw_AudVendaInsert`
AFTER INSERT ON `eurosuper`.`Venda`
FOR EACH ROW
BEGIN
      
   INSERT INTO eurosuper.audCalendario (`Data`, Operacao, DataOperacao) 
    VALUES (new.data, 'I', now()); 
        
    INSERT INTO eurosuper.audVenda (`Data`, QtdAbastecida, TotalPago, CCCliente, idCombustivel, Operacao, DataOperacao) 
    VALUES (new.data, new.QtdAbastecida, new.TotalPago, new.CCCliente, new.idCombustivel, 'I', now());
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
