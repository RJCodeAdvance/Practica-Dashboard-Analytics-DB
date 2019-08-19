CREATE DATABASE PRACTICA_DASHBOARD
GO
USE PRACTICA_DASHBOARD
go
--------------------------------------------------
--                 TABLAS  
----------------------------------------------------------------
-------------------//PRODUCTO//---------------------------------
CREATE TABLE CATEGORIAS
(
ID INT IDENTITY (1,1) PRIMARY KEY,
CATEGORIA  NVARCHAR (150)
)
go
CREATE TABLE MARCAS
(
ID INT IDENTITY (1,1) PRIMARY KEY,
MARCA  NVARCHAR (150)
)
go
CREATE TABLE PRODUCTOS
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
ID_CATEGORIA INT,
ID_MARCA INT,
DESCRIPCION NVARCHAR (200),
PRECIO_COMPRA FLOAT,
PRECIO_VENTA FLOAT,
STOCK INT,
ESTADO NVARCHAR (15),
CONSTRAINT FK_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID),
CONSTRAINT FK_MARCA FOREIGN KEY (ID_MARCA) REFERENCES MARCAS(ID),
)  
go
-------------------//PERSONAS//------------------------------------------------------------------------------
go
CREATE TABLE EMPLEADOS 
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
DNI NVARCHAR (10),
CONTRASEÑA NVARCHAR (100),
ID_ROL INT,
NOMBRES NVARCHAR (150),
APELLIDOS NVARCHAR (150),
TELEFONO NVARCHAR (15),
DIRECCION NVARCHAR (150),
)
go
CREATE TABLE CLIENTES 
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
NOMBRES NVARCHAR (150),
APELLIDOS NVARCHAR (150),
RUC NVARCHAR (30),
TELEFONO NVARCHAR (15),
DIRECCION NVARCHAR (150),
)
go
CREATE TABLE PROVEEDORES 
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
RAZON_SOCIAL NVARCHAR (150),
RUC NVARCHAR (30),
TELEFONO NVARCHAR (15),
DIRECCION NVARCHAR (150),
)
go
-------------------//VENTA//------------------------------------------------------------------------------
CREATE TABLE VENTAS 
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
TIPO_COMPROBANTE NVARCHAR (50),
SERIE_COMPROBANTE NVARCHAR (30),
FECHA DATE,
ID_CLIENTE INT,
ID_EMPLEADO INT,
TOTAL FLOAT,
CONSTRAINT FK_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID),
CONSTRAINT FK_EMPLEADO FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS(ID)
)
go

CREATE TABLE DETALLE_VENTA
(
ID INT IDENTITY (1,1) PRIMARY KEY, 
ID_VENTA INT,
ID_PRODUCTO INT,
PRECIO_VENTA FLOAT,
CANTIDAD INT,
SUBTOTAL FLOAT,
CONSTRAINT FK_VENTA FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID),
CONSTRAINT FK_PRODUCTO_V FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID)
)
go
--INSERCION DE DATOS
INSERT INTO CATEGORIAS VALUES
(' S/C'),/*SIN CATEGORIA*/
('Preescolar'),
('Peluche'),
('Muñeca Fasion'),
('Mascota'),
('Auto'),
('Figura Animada'),
('Lanzadora'),
('Juego de rol'),
('Juego de mesa'),
('Rompecabeza'),
('Pelota'),
('Scooter'),
('Skates'),
('Accesorio')
 go

INSERT INTO MARCAS VALUES
(' S/M'),/*SIN MARCA*/
('Baby Alive'),
('Barbie'),
('Chicas Superpoderosas'),
('Disney Princesa'),
('Disney'),
('Frozen'),
('Lady Bug'),
('Play Doh'),
('Star Wars'),
('Tortugas Ninja'),
('Cars'),
('Dinotrux'),
('Hot Wheels'),
('MatchBox'),
('Nerf'),
('Transformes'),
('Boomco'),
('Avengers'),
('Batman'),
('Dragon Ball'),
('Mattel'),
('Max Steel'),
('Pokemon'),
('Mattel')
go

INSERT INTO EMPLEADOS VALUES 
('78952456','admin',1,'Juan','Algeria Torres','9658457455','Av Argentina 2015'),
('95456585','caja',2,'Rodolfo','Fernandez Ajala','5694555512','Av la Marina'),
('16584555','venta',3,'Mariela','Del lago','9632547852','Av la paz 2015'),
('78952456','',4,'Rafael','Alvarez Nava','9658457455','Av Argentina 2015'),
('78952456','',5,'Yaquelin','Caceres Aragon','9658457455','Av Argentina 2015'),
('78952456','conta',6,'Mario','Capira Noa','9658457455','Av Argentina 2015')

go
SELECT *FROM PRODUCTOS 
INSERT INTO PRODUCTOS VALUES
(	7	,	16	,'	ultra flash x10	',	44	,	43	,	30	,'	Activo'),
(	5	,	14	,'	pack 3	',	34	,	12	,	74	,'	Activo'	),
(	3	,	6	,'	Ariel	',	58	,	30	,	12	,'	Activo'),
(	8	,	22	,'	Cartas Magicas'	,	25	,	40	,	12	,'	Activo'),
(	15	,	1	,'	super cars',	10	,	15	,	20	,'	Activo'	),
(	5	,	14	,'	Azul extremo'	,	12	,	12	,	12	,'	Activo'	),
(	5	,	14	,'	black edition'	,	23	,	43	,	54	,'	Activo'	),
(	5	,	14	,'	4x4 ultimate'	,	65	,	67	,	12	,'	Activo'	),
(	5	,	14	,'	Transformes'	,	34	,	34	,	65	,'	Activo'	),
(	5	,	14	,'	Fire Edition'	,	56	,	23	,	345	,'	Activo'	),
(	3	,	6	,'	Rapuncel'	,	56	,	34	,	434	,'	Activo'),
(	3	,	6	,'	Valiente'	,	54	,	33	,	23	,'	Activo	'),
(	3	,	6	,'	Sirenita'	,	5	,	5	,	45	,'	Activo'	),
(	3	,	6	,'	Anna Frozzen'	,	12	,	4	,	43	,'	Activo'	),
(	3	,	6	,'	Elsa frozen'	,	23	,	23	,	4	,'	Activo'	),
(	7	,	16	,'	Laser Nif'	,	23	,	4	,	54	,'	Activo	'),
(	7	,	16	,'	Batman Cannon'	,	34	,	34	,	3	,'	Activo'),
(	8	,	9	,'	Monopolio PAris'	,	23	,	2	,	32	,'	Activo'	),
(	8	,	9	,'	Ajedrez StarWars'	,	34	,	34	,	43	,'	Activo	'),
(	15	,	21	,'	Goku black'	,	23	,	23	,	23	,'	Activo'	),
(	5	,	12	,'	Franchesco	',	341	,	122	,	12	,'	Activo'	),
(	5	,	12	,'	Rayo Macuin'	,	122	,	122	,	12	,'	Activo	'),
(	4	,	24	,'	Picachu	',	12	,	12	,	12	,'	Activo'	),
(	4	,	24	,'	Estrella'	,	123	,	23	,	34	,'	Activo'	),
(	4	,	24	,'	Dragon'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	Chicorita'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	Bolbason'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	rayxchu'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	Viper'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	Bobofe'	,	123	,	23	,	34	,'	Activo	'),
(	4	,	24	,'	Chaizar'	,	123	,	23	,	34	,'	Activo'	),
(	4	,	24	,'	charmilion'	,	123	,	23	,	34	,'	Activo'	),
(	15	,	12	,'	rayo'	,	123	,	23	,	34	,'	Activo	'),
(	15	,	12	,'	grua	',	123	,	23	,	34	,'	Activo'	),
(	15	,	12	,'	grulla'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	goku'	,	123	,	23	,	34	,'	Activo'),
(	6	,	21	,'	gokublack	',	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	frezzer	',	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	majimnbo'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	Cell'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	pikoro'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	gohan'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	chichi'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	bulma'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	vegeta'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	Trunsk'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	goten'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	Videl'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	krilin'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	yancha'	,	123	,	23	,	34	,'	Activo	'),
(	6	,	21	,'	nro 18'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	roshi'	,	123	,	23	,	34	,'	Activo'	),
(	6	,	21	,'	urnaibaba	',	123	,	23	,	34	,'	Activo'	),
(	8	,	1	,'	damas rosa'	,	123	,	23	,	34	,'	Activo'),
(	8	,	1	,'	mono polis cityt'	,	123	,	23	,	34	,'	Activo'	),
(	11	,	1	,'	futbol	',	234	,	34	,	34	,'	Activo'	),
(	11	,	1	,'	basket'	,	234	,	34	,	34	,'	Activo'	),
(	11	,	1	,'	tennis'	,	234	,	34	,	34	,'	Activo'	),
(	11	,	1	,'	kiko'	,	234	,	34	,	34	,'	Activo'	),
(	13	,	1	,'	chico slim'	,	234	,	34	,	34	,'	Activo'	),
(	13	,	1	,'	caros lfd	',	234	,	34	,	34	,'	Activo'	),
(	12	,	1	,'	rosa 1m	',	234	,	34	,	34	,'	Activo	'),
(	12	,	1	,'	tall da'	,	234	,	34	,	34	,'	Activo'	),
(	1	,	9	,'	laptop'	,	234	,	34	,	34	,'	Activo	'),
(	1	,	9	,'	calcu boy'	,	234	,	34	,	34	,'	Activo'	),
(	1	,	9	,'	origami'	,	234	,	34	,	34	,'	Activo	')
GO
INSERT INTO EMPLEADOS values 
('78952456',	'admin',	1,'	Juan',	'Algeria Torres','	9658457455','	Av Argentina 2015'	),
('	95456585',	'caja	',2	,'Rodolfo',	'Fernandez Ajala','	5694555512','	Av la Marina'	),
('	16584555',	'venta	',3	,'Mariela',	'Del lago','	9632547852','	Av la paz 2015'	),
('	78952456','		4	',null,'Rafael','	Alvarez Nava','	9658457455	','Av Argentina 2015'	)
go

INSERT INTO CLIENTES VALUES 
('Juan','Algeria Torres','9658457455','9658457455','Av Argentina 2015'),
('Rodolfo','Fernandez Ajala','5694555512','9658457455','Av la Marina'),
('Mariela','Del lago','9632547852','9658457455','Av la paz 2015')
GO

INSERT INTO VENTAS VALUES
('factura','6656565','19-08-2012',1,1,525),
('factura','6656565','19-08-2012',2,2,525), 
('factura','6656565','19-08-2012',3,3,525), 
('factura','6656565','19-08-2012',1,4,525), 
('factura','6656565','19-08-2012',2,5,525), 
('factura','6656565','19-08-2012',3,6,525)
GO  

INSERT INTO DETALLE_VENTA VALUES
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(4,1,56,5,894),
(4,5,56,5,894),
(4,6,56,5,894),
(4,7,56,5,894),
(4,8,56,5,894),
(4,8,56,5,894),
(4,8,56,5,894),
(4,8,56,5,894),
(4,8,56,5,894),
(2,1,56,5,894),
(2,2,56,5,894),
(2,3,56,5,894),
(2,4,56,5,894),
(2,5,56,5,894),
(2,6,56,5,894),
(3,6,56,5,894),
(3,2,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894),
(3,3,56,5,894)
go
---AGREGA MAS DATOS A LA TABLA VENTAS Y DETALLE VENTAS 

----PROCEDIMIENTOS ALMACENADOS 
----------------------ESTADISTICAS GENERALES
create proc DashboardDatos
@totVentas float output,
@nprod int output,
@nmarc int output,
@ncateg int output,
@nclient int output,
@nprove int output,
@nemple int output
as
Set @totVentas =(select sum(total)as TotalVentas from VENTAS )
Set @nclient=(select count (ID)  as Clientes from CLIENTES)
Set @nprove =(select count (ID) as Proveedores from PROVEEDORES)
Set @nemple  =(select count (ID)as Empleados from EMPLEADOS )
Set @nprod=(select count (ID) as Productos  from PRODUCTOS)
set @nmarc  = (select count (ID) AS marcas from MARCAS)
set @ncateg  = (select count (ID) AS categorias from CATEGORIAS)
go

----------------------TOP 5 PRODUCTOS PREFERIDOS / MAS VENDIDOS 
create proc ProdPreferidos
as
Select Top 5 C.CATEGORIA+' '+M.MARCA +' '+P.DESCRIPCION as Producto , COUNT(ID_PRODUCTO ) AS nroVentas 
from DETALLE_VENTA 
inner join PRODUCTOS AS P ON P.ID =DETALLE_VENTA.ID_PRODUCTO 
inner join CATEGORIAS as C ON C.ID = P.ID_CATEGORIA 
inner join MARCAS AS M ON M.ID = P.ID_MARCA 
Group by ID_PRODUCTO,P.DESCRIPCION,C.CATEGORIA,M.MARCA    
Order by count(5) desc
go
----------------------CANTIDAD DE PRODUCTOS POR CATEGORIA
create proc ProdPorCategoria
as
select C.CATEGORIA  , COUNT(ID_CATEGORIA ) as nroProductos
from 
productos as P 
inner join CATEGORIAS as C ON C.ID=P.ID_CATEGORIA 
group by C.CATEGORIA
order by count(1) DESC
go

