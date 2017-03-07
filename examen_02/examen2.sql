drop database if exists Libreria;

Create database Libreria;

use Libreria;

Create table SOCIOS (NumSocio int auto_increment,
					Nombre varchar(20),
					Direccion varchar(20),
					NumTelefono char(9),
					FechaInscripcion year,

					primary key(NumSocio)
					);

Create table LIBROS (NumLibro int auto_increment,
					Titulo varchar(20),
					Autor varchar(20),
					echaEdicion year,

					primary key(NumLibro)
					);

Create table PRESTAMOS (ID int auto_increment,
						NumSocio int auto_increment,
						NumLibro int auto_increment,
						FechaEntrega year,
						FechaRetiro year,

						primary key(ID),

						CONSTRAINT fk_1 foreign key(NumSocio) references SOCIOS(NumSocio),
						CONSTRAINT fk_2 foreign key(NumLibro) references LIBROS(NumLibro)
						);

Alter table PRESTAMOS drop foreign key fk_1;


Alter table PRESTAMOS add CONSTRAINT fk_1 foreign key(NumSocio) references SOCIOS(NumSocio) on update cascade on delete set null;

Alter table PRESTAMOS drop foreign key fk_2;

Alter table PRESTAMOS add CONSTRAINT fk_2 foreign key (NumLibro) references LIBROS(NumLibro) on update cascade on delete set null;

insert into SOCIOS (Nombre, Direccion, NumTelefono,FechaInscripcion)
	   values("MARTA CANA", "MONTEVIDEO", "600200200", "1992");

insert into LIBROS (Titulo, Autor, FechaEdicion)
		values("LA FURIA", "ELBIO LENTO", "2012");

insert into PRESTAMOS (FechaRetiro,FechaEntrega)
		values("2003", "2001");

