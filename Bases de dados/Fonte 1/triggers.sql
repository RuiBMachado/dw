USE `eurosuper` ;

-- TRIGGERS PARA AS TABELAS DE AUDITORIA DA eurosuper - Cliente

Drop trigger if exists dw_AudClienteInsert;
Drop trigger if exists dw_AudClienteUpdate;
Drop trigger if exists dw_AudClienteDelete;

Drop trigger if exists dw_AudCombustivelInsert;
Drop trigger if exists dw_AudCombustivelUpdate;
Drop trigger if exists dw_AudCombustivelDelete;

Drop trigger if exists dw_AudVendaInsert;

-- -------------------- audCliente --------------------
-- Insert
DELIMITER $$
CREATE TRIGGER dw_AudClienteInsert AFTER INSERT on eurosuper.cliente
FOR EACH ROW
  BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (new.cc,new.PNome,new.UNome,'I',now(),new.NIF);
END $$

-- Update
DELIMITER $$
CREATE TRIGGER dw_AudClienteUpdate AFTER UPDATE on eurosuper.cliente
FOR EACH ROW
  BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (new.cc,new.PNome,new.UNome,'U',now(),new.NIF);
END $$

-- Delete
DELIMITER $$
CREATE TRIGGER dw_AudClienteDelete AFTER DELETE on eurosuper.cliente
FOR EACH ROW
BEGIN
  INSERT INTO eurosuper.audCliente (CC,PNome,UNome,Operacao,DataOperacao,NIF) 
  VALUES (old.cc,old.PNome,old.UNome,'D',now(),old.NIF);
END $$
-- -------------------- audCombustivel --------------------
-- Insert
DELIMITER $$
CREATE TRIGGER dw_AudCombustivelInsert AFTER INSERT on eurosuper.combustivel
FOR EACH ROW
  BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao) 
  VALUES (new.Tipo,new.custoLitro,'I',now());
END $$

-- Update
DELIMITER $$
CREATE TRIGGER dw_AudCombustivelUpdate AFTER UPDATE on eurosuper.combustivel
FOR EACH ROW
  BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao) 
  VALUES (new.Tipo,new.custoLitro,'U',now());
END $$

-- Delete
DELIMITER $$
CREATE TRIGGER dw_AudCombustivelDelete AFTER DELETE on eurosuper.combustivel
FOR EACH ROW
  BEGIN
  INSERT INTO eurosuper.audCombustivel (Tipo,Preco,Operacao,DataOperacao) 
  VALUES (old.Tipo,old.custoLitro,'D',now());
END $$

-- -------------------- audVenda e audCalendario --------------------

DELIMITER $$
CREATE TRIGGER dw_AudVendaInsert AFTER INSERT on eurosuper.venda
FOR EACH ROW
  BEGIN
    DECLARE v_data Datetime;
    DECLARE v_CCCliente INT;
    DECLARE v_idCombustivel INT;
    DECLARE v_QtdAbastecida FLOAT;
    DECLARE v_TotalPago FLOAT;
            
    Select A.`data`, A.QtdAbastecida, A.TotalPago,A.idCombustivel,A.CCCliente 
        INTO v_data, v_QtdAbastecida, v_TotalPago, v_idCombustivel, v_CCCliente
      From Venda as A
      where v_CCCliente is not null; 
      
   INSERT INTO eurosuper.audCalendario (`Data`, Operacao, DataOperacao) 
    VALUES (new.data, 'I', now()); 
        
    INSERT INTO eurosuper.audVenda (`Data`, QtdAbastecida, TotalPago, CCCliente, idCombustivel, Operacao, DataOperacao) 
    VALUES (new.data, new.QtdAbastecida, new.TotalPago, new.CCCliente, new.idCombustivel, 'I', now());
END $$
