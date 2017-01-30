set SQL_SAFE_UPDATES = 0;

-- Tabelas de auditoria
use eurosuper;

delete from CupaoDesconto;
delete from Venda;
delete from Combustivel;
delete from Cliente;


delete from audCalendario;
delete from audVenda;
delete from audCombustivel;
delete from audCliente;

ALTER TABLE CupaoDesconto AUTO_INCREMENT = 1;
ALTER TABLE Venda AUTO_INCREMENT = 1;
ALTER TABLE Combustivel AUTO_INCREMENT = 1;
ALTER TABLE Cliente AUTO_INCREMENT = 1;
ALTER TABLE audVenda AUTO_INCREMENT = 1;
ALTER TABLE audCalendario AUTO_INCREMENT = 1;
ALTER TABLE audCombustivel AUTO_INCREMENT = 1;
ALTER TABLE audCliente AUTO_INCREMENT = 1;





select * from audCalendario;
select * from audVenda;
select * from audCombustivel;
select * from audCliente;



use arearetencao;

-- Tabelas de limpeza

select * from pre_CalendarioP1;
select * from pre_FactosP1;
select * from pre_CombustivelP1;
select * from pre_ClienteP1;

select * from pos_LCalendarioP1;
select * from pos_LFactosP1;
select * from pos_LCombustivelP1;
select * from pos_LClienteP1;


delete from pre_CalendarioP1;
delete from pre_FactosP1;
delete from pre_CombustivelP1;
delete from pre_ClienteP1;

delete from pos_LCalendarioP1;
delete from pos_LFactosP1;
delete from pos_LCombustivelP1;
delete from pos_LClienteP1;

ALTER TABLE pre_CalendarioP1 AUTO_INCREMENT = 1;
ALTER TABLE pre_FactosP1 AUTO_INCREMENT = 1;
ALTER TABLE pre_CombustivelP1 AUTO_INCREMENT = 1;
ALTER TABLE pre_ClienteP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_LCalendarioP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_LFactosP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_LCombustivelP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_LClienteP1 AUTO_INCREMENT = 1;





-- Tabelas de conformidade
use arearetencao;


select * from pos_ConfCalendarioP1;
select * from pos_ConfFactosP1;
select * from pos_ConfCombustivelP1;
select * from pos_ConfClienteP1;

delete from pos_ConfCalendarioP1;
delete from pos_ConfFactosP1;
delete from pos_ConfCombustivelP1;
delete from pos_ConfClienteP1;

ALTER TABLE pos_ConfCalendarioP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_ConfFactosP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_ConfClienteP1 AUTO_INCREMENT = 1;
ALTER TABLE pos_ConfCombustivelP1 AUTO_INCREMENT = 1;







-- Tabelas de conciliacao

select * from pos_factos;
select * from DataUpdate;

select * from pos_CalendarioP1;
select * from pos_DimCliente;
select * from pos_DimCliente_H;
select * from pos_DimCombustivel;
select * from pos_DimCombustivel_H;


select * from equi_Cliente;
select * from equi_Combustivel;

use arearetencao;

ALTER TABLE pos_Factos AUTO_INCREMENT = 1;
ALTER TABLE pos_DimCliente AUTO_INCREMENT = 1;
ALTER TABLE pos_DimCliente_H AUTO_INCREMENT = 1;
ALTER TABLE pos_DimCombustivel AUTO_INCREMENT = 1;
ALTER TABLE pos_DimCombustivel_H AUTO_INCREMENT = 1;
ALTER TABLE pos_Calendario AUTO_INCREMENT = 1;

ALTER TABLE equi_Cliente AUTO_INCREMENT = 1;
ALTER TABLE equi_Combustivel AUTO_INCREMENT = 1;

delete from pos_Factos;

delete from pos_Calendario;
delete from pos_DimCliente;
delete from pos_DimCliente_H;
delete from pos_DimCombustivel;
delete from pos_DimCombustivel_H;


delete from equi_Cliente;
delete from equi_Combustivel;

-- Apaga dados do dw
use DW;
ALTER TABLE DIM_Calendario AUTO_INCREMENT = 1;
ALTER TABLE DIM_Cliente_H AUTO_INCREMENT = 1;
ALTER TABLE DIM_Cliente AUTO_INCREMENT = 1;
ALTER TABLE DIM_Combustivel AUTO_INCREMENT = 1;
ALTER TABLE DIM_Combustivel_H AUTO_INCREMENT = 1;



delete from TFVenda;
delete from DIM_Calendario;
delete from DIM_Cliente_H;
delete from DIM_Cliente;
delete from DIM_Combustivel_H;
delete from DIM_Combustivel;




-- Testes update de clientes

use eurosuper;

update  cliente 
	set UNome = 'toto'
    where cc=13901961;

-- Testes update de combustivel

use eurosuper;

update  combustivel 
	set custoLitro = 5.70
    where Tipo ='Gasolina 98' ;

