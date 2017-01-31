set SQL_SAFE_UPDATES = 0;
use fonte2;


insert into audNeoFinal values
	(1,'Gasoleo',2.30,23,10,'2015-10-23','Xavier Rodrigues',13932552,219077634,'I',now()),
	(2,'Gasolina 95',1.50,15,10,'2015-05-10','Tomas Santos',13932554,219089734,'I',now()),
	(3,'Gasolina 98',1.90,19,10,'2015-01-19','Francisco Souto',13987552,216357634,'I',now());



select * from audNeo;


use fonte2;
delete from audNeoFinal;
delete from audNeo;

use arearetencao;
delete from pos_ConfNeo;
delete from pos_LNeo;



select * from pos_LNeo;
select * from pos_ConfNeo;
