create database EJERCICIOS_DDL;
use EJERCICIOS_DDL;
-- Ejercicio 1
CREATE TABLE Estación
(
identificador int PRIMARY KEY,
Latitud int,
Longitud int,
Altitud int
);
CREATE TABLE Muestra
(
-- clave foranea de la tabla Estación
identificadorEstacion int,
Fecha date,
Temperatura_mínima int,
Temperatura_máxima int,
Precipitaciones int,
Humedad_mínima int,
Humedad_máxima int,
Velocidad_del_viento_mínima int,
Velocidad_del_viento_máxima int,
FOREIGN KEY (identificadorEstacion) references Estación(identificador)
);
insert into Muestra values(1,str_to_date('28-01-2010','%d-%m-%Y'),10,20,2,5,6,7,8);
-- Ejercicio 2
create table Editorial
(
ClaveEditorial int primary key,
Nombre varchar(10),
Dirección varchar(20),
Teléfono varchar(9)
);
create table Libro
(
ClaveLibro int primary key,
Título varchar(10),
Idioma varchar(10),
Formato varchar(10),
ClaveEditorial int,
FOREIGN KEY (ClaveEditorial) references Editorial(ClaveEditorial)
);
create table Tema
(
ClaveTema int primary key,
Nombre varchar(10)
);
create table autor
(
ClaveAutor int primary key,
Nombre varchar(10)
);
create table Ejemplar
(
ClaveEjemplar int primary key,
ClaveLibro int,
NúmeroOrden int primary key,
Edición int,
Ubicación varchar(20),
Categoría varchar(15),
FOREIGN KEY (ClaveLibro) references Libro(ClaveLibro)
);
create table Préstamo
(
ClaveSocio int,
ClaveEjemplar int,
NúmeroOrden int,
Fecha_préstamo date,
Fecha_devolución date,
Notas varchar(50),
FOREIGN KEY (ClaveSocio) references Socio(ClaveSocio),
FOREIGN KEY (ClaveEjemplar) references Ejemplar(ClaveEjemplar),
FOREIGN KEY (NúmeroOrden) references Ejemplar(NúmeroOrden)
);
create table Socio
(
ClaveSocio int primary key,
Nombre varchar(10),
Dirección varchar(20),
Teléfono varchar(9),
Categoría varchar(15)
);
create table Trata_sobre
(
ClaveLibro int,
ClaveTema int,
FOREIGN KEY (ClaveLibro) references Libro(ClaveLibro),
FOREIGN KEY (ClaveTema) references Tema(ClaveTema)
);
create table Escrito_por
(
ClaveLibro int references Libro(ClaveLibro),
ClaveAutor int references Autor(ClaveAutor)
);
-- Ejercicio 3 La tienda de informática
create table FABRICANTES
(
Codigo int primary key,
Nombre varchar(10)
);
create table ARTICULOS
(
Codigo int primary key,
Nombre varchar(100),
Precio int,
Fabricante int,
FOREIGN KEY (Fabricante) references FABRICANTES(Codigo)
);
-- Ejercicio 4 Empleados
create table DEPARTAMENTOS
(
Codigo int primary key,
Nombre varchar(100),
Presupuesto int
);
create table EMPLEADOS
(
DNI varchar(8) primary key,
Nombre varchar(100),
Apellidos varchar(255),
Departamento int,
FOREIGN KEY (Departamento) references DEPARTAMENTOS(Codigo)
);
-- Ejercicio 5 Los Almacenes
create table ALMACENES
(
Codigo int primary key,
Lugar varchar(100),
Capacidad int
);
create table CAJAS
(
NumReferencia char(5) primary key,
Contenido varchar(100),
Valor int,
Almacen int,
FOREIGN KEY (Almacen) references ALMACENES(Codigo)
);
-- Ejercicio 6 Películas y salas
create table PELICULAS
(
Codigo int primary key,
Nombre varchar(100),
CalificacionEdad int
);
create table SALAS
(
Código int primary key,
Nombre varchar(100),
Pelicula int references PELICULAS(Codigo),
FOREIGN KEY (Pelicula) references PELICULAS(Codigo)
);
-- Ejercicio 7 Los Directores
create table DESPACHOS
(
Numero int NOT NULL,
Capacidad int,
PRIMARY KEY (Numero)
);
create table DIRECTORES
(
DNI varchar(8) NOT NULL,
NomApels varchar(255),
DNIJefe varchar(8),
Despacho int,
PRIMARY KEY (DNI),
FOREIGN KEY (Despacho) references DESPACHOS(Numero),
FOREIGN KEY (DNIJefe) references DIRECTORES(DNI)
);
-- Ejercicio 8 Piezas y proveedores
create table PIEZAS
(
Codigo int primary key,
Nombre varchar(100)
);
create table PROVEEDORES
(
Id char(4) primary key,
Nombre varchar(100)
);
create table SUMINISTRA
(
CodigoPieza int,
IdProveedor char(4),
Precio int,
FOREIGN KEY (CodigoPieza) references PIEZAS(Codigo),
FOREIGN KEY (IdProveedor) references PROVEEDORES(Id),
PRIMARY KEY (CodigoPieza,IdProveedor)
);
-- Ejercicio 9 Los Científicos
create table CIENTIFICOS
(
DNI varchar(8) primary key,
NomApels varchar(255)
);
create table PROYECTO
(
Id char(4) primary key,
Nombre varchar(255),
Horas int
);
create table ASIGNADO_A
(
Cientifico varchar(8),
Proyecto char(4),
FOREIGN KEY (Cientifico) references CIENTIFICOS(DNI),
FOREIGN KEY (Proyecto) references PROYECTO(Id),
PRIMARY KEY (Cientifico,Proyecto)
);
-- Ejercicio 10 Los Grandeds Almacenes
create table PRODUCTOS
(
Codigo int primary key,
Nombre varchar(100),
Precio int
);
create table CAJEROS
(
Codigo int primary key,
NomApels varchar(255)
);
create table MAQUINAS_REGISTRADORAS
(
Codigo int primary key,
Piso int
);
create table VENTA
(
Cajero int,
Maquina int,
Producto int,
FOREIGN KEY (Cajero) references CAJEROS(Codigo),
FOREIGN KEY (Maquina) references MAQUINAS_REGISTRADORAS(Codigo),
FOREIGN KEY (Producto) references PRODUCTOS(Codigo),
PRIMARY KEY (Cajero,Maquina,Producto)
);
-- Ejercicio 11 Los Investigadores
create table FACULTAD
(
Codigo int primary key,
Nombre varchar(100)
);
create table INVESTIGADORES
(
DNI varchar(8) primary key,
NomApels varchar(255),
Facultad int,
FOREIGN KEY (Facultad) references FACULTAD(Codigo)
);
create table EQUIPOS
(
NumSerie char(4) primary key,
Nombre varchar(100),
Facultad int,
FOREIGN KEY (Facultad) references FACULTAD(Codigo)
);
create table RESERVA
(
DNI varchar(8),
NumSerie char(4),
Comienzo date,
Fin date,
FOREIGN KEY (DNI) references INVESTIGADORES(DNI),
FOREIGN KEY (NumSerie) references EQUIPOS(NumSerie),
PRIMARY KEY (DNI,NumSerie)
);
-- Ejercicio 12
create table PROFESORES
(
nombre varchar(50) unique,
DNI varchar(8) primary key,
direccion varchar(50),
titulación varchar(50),
Gana int not null
);
create table CURSOS
(
nombre varchar(50) unique,
codigo int primary key,
max_alumnos int,
profesor varchar(8),
fecha_inicio date,
fecha_fin date,
horas int not null,
FOREIGN KEY (profesor) references PROFESORES(DNI) on delete set null,
check (date(fecha_fin)>date(fecha_inicio))
);
create table ALUMNOS
(
DNI int primary key,
nombre varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
direccion varchar(100),
fecha_nacimiento date,
sexo char(1),
curso int,
CONSTRAINT CHECK (sexo='H' or sexo='M'),
FOREIGN KEY (curso) references CURSOS(codigo) on delete set null
);