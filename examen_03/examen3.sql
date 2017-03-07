drop database if exists Peli;

create database Peli;

use Peli;

create table PARTICIPA(CodActor int,
						CodPeli int,
						primary key(CodActor)
						);

create table ACTOR(CodActor int,
					Nombre varchar(20),
					FechaNacimiento date,
					primary key(CodActor)
					);

create table PELICULA(CodPeli int,
						Titulo varchar(20),
						Año year,
						Duracion int,
						Genero varchar(20),
						Recaudacion int,
						primary key(CodPeli)
						);
create table GENERO(IdGenero int auto_increment,
					Nombre varchar(20),
					primary key(IdGenero),
					);

alter table PELICULA add CONSTRAINT fk_1 foreign key(Genero) references GENERO(nombre);

insert into ACTOR(CodActor,Nombre,FechaNacimiento)
		values("1","Jonh","1996-12-06");

insert into ACTOR(CodActor, Nombre, FechaNacimiento)
		values("2","Carry","1968-03-12");

insert into ACTOR(CodActor, Nombre, FechaNacimiento)
		values("3","David", "1996-09-12");

insert into PELICULA(CodPeli,Titulo,Año,Duracion,Genero,Recaudacion)
		values("1","BiGFISH","1996","130","Drama","1000000");

update PELICULA set Recaudacion="200000" *0.8 where Recaudacion="200000";