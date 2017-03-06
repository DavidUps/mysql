Drop database if exists ZOO;

create database ZOO;

use ZOO;

create table ZOO (nombre varchar(20),
				ciudad varchar(20),
				pais varchar(20),
				tamaño ENUM ('categoria A','categoria B'),
				presupuesto decimal unsigned, 
			primary key (nombre));

create table ESPECIE(nomcientifico varchar(20),
				nomvulgar varchar(20) not null,
				familia varchar(20),
				peligro varchar(20),
			primary key (nomcientifico));

create table ANIMAL(id int,
					nomzoo varchar(20),
					nomespecie varchar(20),
					sexo enum('Masculino','Femenino'),
					anonacimiento year,
					pais varchar(20),
					continente varchar(20),
				primary key (id),
				CONSTRAINT fk_1 foreign key (nomzoo) references ZOO(nombre),
				CONSTRAINT fk_2 foreign key (nomespecie) references ESPECIE(nomcientifico));

/* Auto inrementar el id */

alter table ANIMAL modify id int auto_increment;

/* Modificar la foreign key */

alter table ANIMAL Drop foreign key  fk_1;

alter table ANIMAL add CONSTRAINT fk_1 foreign key (nomzoo) references ZOO(nombre) on update cascade on delete set null;

/* Insertar datos */
insert into ZOO (nombre, ciudad, pais, tamaño, presupuesto)
	values("Zoo Madrid","Madrid","España","Categoria A","642");
insert into ESPECIE (nomcientifico, nomvulgar, familia, peligro)
	values("Pantera","Tigre","Felinos","Alto");
insert into ANIMAL(nomzoo, nomespecie, sexo,anonacimiento,pais,continente)
	values("Zoo Madrid","Pantera","Masculino","2013","India","Asia");

/* Cambiar datos*/

update ZOO set nombre="Zoo Madrid-Vodafone" where nombre="Zoo Madrid";

/* Ver que tienen */

select * from ZOO;

select * from ESPECIE;

select * from ANIMAL;

