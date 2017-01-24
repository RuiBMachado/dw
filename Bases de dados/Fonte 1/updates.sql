use eurosuper;

-- Cliente
INSERT INTO Cliente
	VALUES  (13943421,'ola','Carlos',210492631,3),
			(49020942,'adeus','Carlos',210492631,3);

UPDATE `eurosuper`.`cliente` SET `PNome`='Amares' WHERE `CC`=13901961;
SET SQL_SAFE_UPDATES = 0;

use arearetencao;
delete from qua_LfactosP1;
select * from equi_Cliente;