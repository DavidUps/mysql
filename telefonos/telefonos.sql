Drop database if exists Telefono;

create database Telefono;

use Telefono;

Drop table if exists CLIENTES;

create table CLIENTES(
	DNI char(9) Not Null,
	Nombre varchar(20) Not Null,
	Apellido varchar(20) Not Null,
	Telefono char(9) Not Null,
	Email varchar(40) Not Null,
	primary key (DNI)
);

insert into CLIENTES (DNI, Nombre, Apellido, Telefono, Email)
	values ('023213Y','David', 'Arribas', '619238923', 'davidarribasc@gmial.com');

insert into CLIENTES (DNI, Nombre, Apellido, Telefono, Email)
	values ('232334F','Paco', 'Jhones', '612374582', 'pacojhones@gmail.com');

insert into CLIENTES (DNI, Nombre, Apellido, Telefono, Email)
	values ('675756F','Fernando', 'Macedonio', '987345983', 'fernandomacedonio@gmail.com');

insert into CLIENTES (DNI, Nombre, Apellido, Telefono, Email)
	values ('873483F','José', 'Fino', '612373442', 'joselfino@gmail.com');

insert into CLIENTES (DNI, Nombre, Apellido, Telefono, Email)
	values ('988932F','Esther', 'Aguas', '6134455582', 'estheraguas@gmail.com');


Drop table if exists TIENDAS;

create table TIENDAS(
	Nombre varchar(20) Not Null,
	Provincia varchar(20) Not Null,
	Localidad varchar(20) Not Null,
	Dirección varchar(20) Not Null,
	Telefono char(9) Not Null,
	DíaApertura varchar(20) Not Null default 'Lunes-Sabado',
	DíaCierre varchar(20) Not Null default 'Domingo',
	HoraApertura time Not Null default '10:00:00',
	HoraCierre time Not Null default '20:00:00',
	primary key (Nombre)
);

insert into TIENDAS (Nombre, Provincia, Localidad, Dirección, Telefono, DíaApertura, DíaCierre, HoraApertura, HoraCierre)
	values ('TelePhone', 'Madrid', 'Madrid', 'avenida del telefono', '987654321', 'Lunes', 'Domingo','10:00:00', '20:00:00');
insert into TIENDAS (Nombre, Provincia, Localidad, Dirección, Telefono, DíaApertura, DíaCierre, HoraApertura, HoraCierre)
	values ('Pepenophone', 'Barcelona', 'Barcelona', 'avenida del pequeñotelefono', '987698321', 'Lunes', 'viernes', '10:00:00', '20:00:00');
insert into TIENDAS (Nombre, Provincia, Localidad, Dirección, Telefono, DíaApertura, DíaCierre, HoraApertura, HoraCierre)
	values ('ElTelefonoDePepe', 'Valencia', 'Valencia', 'Calle de la conexion', '987234321', 'Lunes', 'Martes', '10:00:00', '20:00:00');
insert into TIENDAS (Nombre, Provincia, Localidad, Dirección, Telefono, DíaApertura, DíaCierre, HoraApertura, HoraCierre)
	values ('Algetephone', 'Madrid', 'Madrid', 'calle sagrario', '987654332', 'Lunes', 'Domingo','10:00:00', '20:00:00');
insert into TIENDAS (Nombre, Provincia, Localidad, Dirección, Telefono, DíaApertura, DíaCierre, HoraApertura, HoraCierre)
	values ('Patxiphone', 'Navarra', 'Pamplona', 'calle fuenctecillas', '987652332', 'Lunes', 'Sabado','10:00:00', '20:00:00');

Drop table if exists OPERADORAS;

create table OPERADORAS(
	Nombre varchar(20) Not Null,
	ColorLogo varchar(20) Not Null,
	PorcentajeCobertura varchar(20) Not Null,
	FrecuenciaGSM varchar(4) Not Null,
	PaginaWeb varchar(30) Not Null,
	primary key (Nombre)
);

insert into OPERADORAS(Nombre, ColorLogo, PorcentajeCobertura, FrecuenciaGSM, PaginaWeb)
	values ('Vodofone', 'rojo', '20%', '380', 'Vodofone.com' );

insert into OPERADORAS(Nombre, ColorLogo, PorcentajeCobertura, FrecuenciaGSM, PaginaWeb)
	values ('Naranja', 'naranja', '40%', '410', 'Naranja.com' );
	
insert into OPERADORAS(Nombre, ColorLogo, PorcentajeCobertura, FrecuenciaGSM, PaginaWeb)
	values ('Moviteorito', 'azul', '22%', '450', 'Moviteorito.com' );
	
insert into OPERADORAS(Nombre, ColorLogo, PorcentajeCobertura, FrecuenciaGSM, PaginaWeb)
	values ('FreeMovil', 'morado', '70%', '750', 'FreeMovil.com' );
	
insert into OPERADORAS(Nombre, ColorLogo, PorcentajeCobertura, FrecuenciaGSM, PaginaWeb)
	values ('UbuntuPhone', 'naranja', '100%', '1900', 'Ubuntu.com' );

Drop table if exists TARIFAS;

create table TARIFAS(
	Nombre varchar(20) Not Null,
	Nombre_OPERADORAS varchar(20) Not Null,
	TamañoDatos varchar(4) Not Null,
	TipoDatos varchar(3) Not Null,
	MinutosGratis varchar(6) Not Null default '000min',
	SMSGratis varchar(6) Not Null,
	primary key (Nombre),
	foreign key (Nombre_OPERADORAS) references OPERADORAS (Nombre)
);

insert into TARIFAS(Nombre, Nombre_OPERADORAS, TamañoDatos, TipoDatos, MinutosGratis, SMSGratis)
	values('Leon', 'Vodofone', '1G', '3G', '500min', '600sms');
insert into TARIFAS(Nombre, Nombre_OPERADORAS, TamañoDatos, TipoDatos, MinutosGratis, SMSGratis)
	values('Delfín', 'Naranja', '0.5GB', '4G', '700min', '500sms');
insert into TARIFAS(Nombre, Nombre_OPERADORAS, TamañoDatos, TipoDatos, MinutosGratis, SMSGratis)
	values('Coche', 'Moviteorito', '5G', '5G', '300min', '900sms');
insert into TARIFAS(Nombre, Nombre_OPERADORAS, TamañoDatos, TipoDatos, MinutosGratis, SMSGratis)
	values('Rata', 'FreeMovil', '1G', '2G', '50min', '40sms');
insert into TARIFAS(Nombre, Nombre_OPERADORAS, TamañoDatos, TipoDatos, MinutosGratis, SMSGratis)
	values('Linux', 'UbuntuPhone', '4G', '3G', '400min', '200sms');	

Drop table if exists MOVILES;

create table MOVILES(
	Marca varchar(20) Not Null,
	Modelo varchar(20) Not Null,
	Descripción varchar(50) Not Null,
	SO varchar(20) Not Null,
	RAM varchar(4) Not Null,
	PulgadasPantalla varchar(4) Not Null,
	CamaraMpx varchar(5) Not Null,
	primary key (Marca, Modelo)
);

insert into MOVILES (Marca, Modelo, Descripción, SO, RAM, PulgadasPantalla, CamaraMpx)
	values('iphone', '6', 'ios', '1GB', '6"', '12mpx');
insert into MOVILES (Marca, Modelo, Descripción, SO, RAM, PulgadasPantalla, CamaraMpx)
	values('nokia', '9863', 'windowsphone', '2GB', '5"', '6mpx');
insert into MOVILES (Marca, Modelo, Descripción, SO, RAM, PulgadasPantalla, CamaraMpx)
	values('asus', 'zenphone', 'android', '4GB', '10"', '20mpx');
insert into MOVILES (Marca, Modelo, Descripción, SO, RAM, PulgadasPantalla, CamaraMpx)
	values('motorola', 'g', 'android', '1GB', '6"', '12mpx');
insert into MOVILES (Marca, Modelo, Descripción, SO, RAM, PulgadasPantalla, CamaraMpx)
	values('iphone', '7', 'ios', '2GB', '9"', '25mpx');

Drop table if exists MOVIL_LIBRE;

create table MOVIL_LIBRE(
	Marca_MOVILES varchar(20) Not Null,
	Modelo_MOVILES varchar(20) Not Null,
	Precio varchar(5) Not Null default '€',
	foreign key (Marca_MOVILES, Modelo_MOVILES) references OPERADORAS (Marca, Modelo)
);

insert into MOVIL_LIBRE(Marca_MOVILES, Modelo_MOVILES, Precio)
	values('iphone', '6', '540€');
insert into MOVIL_LIBRE(Marca_MOVILES, Modelo_MOVILES, Precio)
	values('nokia', '9863', '240€');
insert into MOVIL_LIBRE(Marca_MOVILES, Modelo_MOVILES, Precio)
	values('asus', 'zenphone', '640€');
insert into MOVIL_LIBRE(Marca_MOVILES, Modelo_MOVILES, Precio)
	values('motorola', 'g', '340€');
insert into MOVIL_LIBRE(Marca_MOVILES, Modelo_MOVILES, Precio)
	values('iphone', '7', '940€');

Drop table if exists MOVIL_CONTRATO;

create table MOVIL_CONTRATO(
	Marca_MOVILES varchar(20) Not Null,
	Modelo_MOVILES varchar(20) Not Null,
	Nombre_OPERADORAS varchar(20) Not Null,
	Precio varchar(5) Not Null,
	foreign key (Marca_MOVILES, Modelo_MOVILES) references MOVILES (Marca, Modelo),
	foreign key (Nombre_OPERADORAS) references OPERADORAS (Nombre)
);

insert into MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES, Nombre_OPERADORAS,Precio)
	values('iphone', '6', 'Vodofone', '270€');
insert into MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES, Nombre_OPERADORAS,Precio)
	values('nokia', '9863', 'naranja', '120€');
insert into MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES, Nombre_OPERADORAS,Precio)
	values('asus', 'zenphone', 'Moviteorito', '320€');
insert into MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES, Nombre_OPERADORAS,Precio)
	values('motorola', 'g', 'FreeMovil', '170€');
insert into MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES, Nombre_OPERADORAS,Precio)
	values('iphone', '7', 'UbuntuPhone', '470€');

Drop table if exists OFERTAS;

create table OFERTAS(
	Nombre_OPERADORAS_TARIFAS varchar(20) Not Null,
	Nombre_TARIFAS varchar(20) Not Null,
	Marca_MOVIL_CONTRATO varchar(20),
	Modelo_MOVIL_CONTRATO varchar(20),
	foreign key (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS) references TARIFAS(Nombre_OPERADORAS, Nombre),
	foreign key (Marca_MOVIL_CONTRATO, Modelo_MOVIL_CONTRATO) references MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES)
);

insert into OFERTAS (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS,Marca_MOVILES_CONTRATO,Modelo_MOVILES_CONTRARO)
	values('Vodofone', 'Leon', 'iphone', '6');
insert into OFERTAS (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS,Marca_MOVILES_CONTRATO,Modelo_MOVILES_CONTRARO)
	values('naranja', 'Delfín', 'nokia', '9863');
insert into OFERTAS (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS,Marca_MOVILES_CONTRATO,Modelo_MOVILES_CONTRARO)
	values('Moviteorito', 'Coche', 'asus', 'zenphone');
insert into OFERTAS (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS,Marca_MOVILES_CONTRATO,Modelo_MOVILES_CONTRARO)
	values('FreeMovil', ' Rata', 'motorola', 'g');
insert into OFERTAS (Nombre_OPERADORAS_TARIFAS, Nombre_TARIFAS,Marca_MOVILES_CONTRATO,Modelo_MOVILES_CONTRARO)
	values('UbuntuPhone', 'Linux', 'iphone', '7');

Drop table if exists COMPRAS;

create table COMPRAS(
	DNI_CLIENTE char(9) Not Null,
	Nombre_TIENDA varchar(20) Not Null,
	Marca_MOVIL_OFERTAS varchar(20) Not Null,
	Modelo_MOVIL_OFERTAS varchar(20) Not Null,
	Día date Not Null,
	foreign key(DNI_CLIENTE) references CLIENTES (DNI),
	foreign key(Nombre_TIENDA) references TIENDAS (Nombre),
	foreign key(Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS) references OFERTAS(Modelo_MOVILES_CONTRARO, Marca_MOVILES_CONTRATO)
);

insert into COMPRAS( DNI_CLIENTE, Nombre_TIENDA, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values ('023213Y', 'TelePhone', 'iphone', '6', '12-12-17' );
insert into COMPRAS( DNI_CLIENTE, Nombre_TIENDA, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values ('232334F', 'Pepenophone', 'nokia', '9863', '02-09-17');
insert into COMPRAS( DNI_CLIENTE, Nombre_TIENDA, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values ('675756F', 'ElTelefonoDePepe', 'asus', 'zenphone', '03-03-17');
insert into COMPRAS( DNI_CLIENTE, Nombre_TIENDA, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values ('873483F', 'Algetephone', 'motorola', 'g', '05-03-17');
insert into COMPRAS( DNI_CLIENTE, Nombre_TIENDA, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values ('988932F', 'Patxiphone', 'iphone', '7', '07-9-17');

Drop table if exists CONTRATOS;

create table CONTRATOS(
	DNI_CLIENTE char(9) Not Null,
	Nombre_TIENDA varchar(20) Not Null,
	Nombre_OPERADORAS_TARIFAS_OFERTAS varchar(20) Not Null,
	Nombre_TARIFAS_OFERTAS varchar(20) Not Null,
	Marca_MOVIL_OFERTAS varchar(20) Not Null,
	Modelo_MOVIL_OFERTAS varchar(20) Not Null,
	Día date,
	foreign key (DNI_CLIENTE) references CLIENTES(DNI),
	foreign key (Nombre_TIENDA) references TIENDAS(Nombre),
	foreign key (Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS) references OFERTAS(Nombre_OPERADORAS_TARIFAS,Nombre_TARIFAS),
	foreign key (Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS) references OFERTAS(Marca_MOVIL_CONTRATO, Modelo_MOVIL_CONTRATO)
);

insert into CONTRATOS(DNI_CLIENTE, Nombre_TIENDA, Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values('023213Y');
insert into CONTRATOS(DNI_CLIENTE, Nombre_TIENDA, Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values('232334F');
insert into CONTRATOS(DNI_CLIENTE, Nombre_TIENDA, Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values('675756F');
insert into CONTRATOS(DNI_CLIENTE, Nombre_TIENDA, Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values('873483F');
insert into CONTRATOS(DNI_CLIENTE, Nombre_TIENDA, Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS, Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS, Día)
	values('988932F');