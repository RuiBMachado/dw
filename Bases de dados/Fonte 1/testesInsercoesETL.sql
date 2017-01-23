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

-- Tabelas de conciliacao
use arearetencao;

select * from pos_factos;
select * from DataUpdate;

select * from pos_CalendarioP1;
select * from pos_DimCliente;
select * from pos_DimCliente_H;
select * from pos_DimCombustivel;
select * from pos_DimCombustivel_H;


select * from equi_Cliente;
select * from equi_Combustivel;

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
delete from DIM_Calendario;
delete from DIM_Cliente;
delete from DIM_Cliente_H;
delete from DIM_Combustivel;
delete from DIM_Combustivel_H;
delete from TFVenda;




-- Testes update de clientes

use eurosuper;

update  cliente 
	set UNome = 'toto'
    where cc=13901961;

-- Testes update de combustivel

use eurosuper;

update  combustivel 
	set custoLitro = 1.70
    where Tipo ='Gasolina 95' ;

