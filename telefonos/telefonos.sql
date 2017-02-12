Drop database if exists Telefono;

create database Telefono;

use Telefono;

Drop table if exists CLIENTES;

create table CLIENTES(
	DNI char(9) Not Null,
	Nombre varchar(20) Not Null,
	Apellido varchar(20) Not Null,
	Telefono char(9) Not Null,
	Email varchar(10) Not Null,
	primary key (DNI)
);

Drop table if exists TIENDAS;

create table TIENDAS(
	Nombre varchar(20) Not Null,
	Provincia varchar(20) Not Null,
	Localidad varchar(20) Not Null,
	Dirección varchar(20) Not Null,
	Telefono char(9) Not Null,
	DíaApertura varchar(20) Not Null default 'Lunes-Sabado',
	DíaCierre varchar(20) Not Null default 'Domingo',
	HoraApertura time Not Null default '09:00:00',
	HoraCierre time Not Null default '21:00:00',
	primary key (Nombre)
);

Drop table if exists OPERADORAS;

create table OPERADORAS(
	Nombre varchar(20) Not Null,
	ColorLogo varchar(20) Not Null,
	PorcentajeCobertura varchar(20) Not Null,
	FrecuenciaGSM varchar(4) Not Null,
	PaginaWeb varchar(30) Not Null,
	primary key (Nombre)
);

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

Drop table if exists MOVIL_LIBRE;

create table MOVIL_LIBRE(
	Marca_MOVILES varchar(20) Not Null,
	Modelo_MOVILES varchar(20) Not Null,
	Precio varchar(5) Not Null default '€',
	foreign key (Marca_MOVILES, Modelo_MOVILES) references OPERADORAS (Marca, Modelo)
);

Drop table if exists MOVIL_CONTRATO;

create table MOVIL_CONTRATO(
	Marca_MOVILES varchar(20) Not Null,
	Modelo_MOVILES varchar(20) Not Null,
	Nombre_OPERADORAS varchar(20) Not Null,
	Precio varchar(5) Not Null,
	foreign key (Marca_MOVILES, Modelo_MOVILES) references MOVILES (Marca, Modelo),
	foreign key (Nombre_OPERADORAS) references OPERADORAS (Nombre)
);

Drop table if exists OFERTAS;

create table OFERTAS(
	Nombre_OPERADORAS_TARIFAS varchar(20) Not Null,
	Nombre_TARIFAS varchar(20) Not Null,
	Marca_MOVIL_CONTRATO varchar(20),
	Modelo_MOVIL_CONTRATO varchar(20),
	foreign key (Nombre_OPERADORAS_TARIFAS, Nombre_TARIAFAS) references TARIFAS(Nombre_OPERADORAS, Nombre),
	foreign key (Marca_MOVIL_CONTRATO, Modelo_MOVIL_CONTRATO) references MOVIL_CONTRATO(Marca_MOVILES, Modelo_MOVILES)
);

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

Drop table if exists CONTRATOS;

create table CONTRATOS(
	DNI_CLIENTE char(9) Not Null,
	Nombre_TIENDA varchar(20) Not Null,
	Nombre_OPERADORAS_TARIFAS_OFERTAS varchar(20) Not Null,
	Nombre_TARIFAS_OFERTAS varchar(20) Not Null,
	Marca_MOVIL_OFERTAS varchar(20) Not Null,
	Modelo_MOVIL_OFERTAS varchar(20) Not Null,
	dia date,
	foreign key (DNI_CLIENTE) references CLIENTES(DNI),
	foreign key (Nombre_TIENDA) references TIENDAS(Nombre),
	foreign key (Nombre_OPERADORAS_TARIFAS_OFERTAS, Nombre_TARIFAS_OFERTAS) references OFERTAS(Nombre_OPERADORAS_TARIFAS,Nombre_TARIFAS),
	foreign key (Marca_MOVIL_OFERTAS, Modelo_MOVIL_OFERTAS) references OFERTAS(Marca_MOVIL_CONTRATO, Modelo_MOVIL_CONTRATO)
);