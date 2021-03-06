USE [master]
GO
/****** Object:  Database [cbaPlacas]    Script Date: 26/05/2019 22:23:13 ******/
CREATE DATABASE [cbaPlacas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cbaPlacas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\cbaPlacas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cbaPlacas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\cbaPlacas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cbaPlacas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cbaPlacas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cbaPlacas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cbaPlacas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cbaPlacas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cbaPlacas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cbaPlacas] SET ARITHABORT OFF 
GO
ALTER DATABASE [cbaPlacas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cbaPlacas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cbaPlacas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cbaPlacas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cbaPlacas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cbaPlacas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cbaPlacas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cbaPlacas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cbaPlacas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cbaPlacas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cbaPlacas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cbaPlacas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cbaPlacas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cbaPlacas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cbaPlacas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cbaPlacas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cbaPlacas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cbaPlacas] SET RECOVERY FULL 
GO
ALTER DATABASE [cbaPlacas] SET  MULTI_USER 
GO
ALTER DATABASE [cbaPlacas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cbaPlacas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cbaPlacas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cbaPlacas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cbaPlacas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cbaPlacas] SET QUERY_STORE = OFF
GO
USE [cbaPlacas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [cbaPlacas]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[COD] [smallint] NULL,
	[idLinea] [smallint] NOT NULL,
	[idChapa] [smallint] NOT NULL,
	[idHoja] [smallint] NOT NULL,
	[idMarco] [smallint] NOT NULL,
	[idMadera] [smallint] NOT NULL,
	[idMano] [smallint] NOT NULL,
	[precio] [money] NOT NULL,
	[stock] [smallint] NOT NULL,
	[VALIDO_DESDE] [date] NOT NULL,
	[VALIDO_HASTA] [date] NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEMS]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMS](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCTO] [smallint] NOT NULL,
	[ID_PEDIDO] [smallint] NOT NULL,
	[CANT] [int] NOT NULL,
	[MONTO] [money] NOT NULL,
	[ID_ESTADO] [smallint] NOT NULL,
	[MARCO_TER] [int] NOT NULL,
	[HOJAS_TER] [int] NOT NULL,
	[ENSAMBLADOS] [int] NOT NULL,
	[EN_DEPOSITO] [int] NOT NULL,
	[STOCK] [int] NOT NULL,
	[ULT_MODIF] [date] NOT NULL,
	[P_IMPRIMIR] [int] NOT NULL,
 CONSTRAINT [PK_ITEMS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [smallint] NOT NULL,
	[CANT_TOTAL] [smallint] NOT NULL,
	[PRECIO_TOTAL] [money] NOT NULL,
	[ID_ESTADO] [smallint] NOT NULL,
	[FECHA_RECIBIDO] [date] NOT NULL,
	[FECHA_MODIFICADO] [date] NULL,
	[FECHA_ENTREGADO] [date] NULL,
 CONSTRAINT [PK_pedidos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CUIT] [nvarchar](13) NOT NULL,
	[NOMBRE] [nvarchar](100) NOT NULL,
	[TELEFONO] [nvarchar](50) NULL,
	[MAIL] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[CIUDAD] [nvarchar](50) NULL,
	[PROVINCIA] [nvarchar](50) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lineas]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lineas](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lineas_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maderas]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maderas](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nchar](10) NOT NULL,
	[COD_MAT] [smallint] NULL,
 CONSTRAINT [PK_maderas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manos]    Script Date: 26/05/2019 22:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_manos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcos]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcos](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_marcos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hojas]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hojas](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
 CONSTRAINT [PK_hojas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chapas]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chapas](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[COD_MAT] [int] NULL,
 CONSTRAINT [PK_chapas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ETIQUETAS_INTERNAS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ETIQUETAS_INTERNAS]
AS
SELECT        CL.NOMBRE, PE.ID, I.CANT AS CANT_ITEM, PE.CANT_TOTAL, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.CLIENTES AS CL ON PE.ID_CLIENTE = CL.ID INNER JOIN
                         master.dbo.spt_values AS t2 ON t2.type = 'P' AND t2.number < I.ENSAMBLADOS + I.STOCK
GO
/****** Object:  Table [dbo].[estados]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[id] [smallint] NOT NULL,
	[nombre] [nchar](15) NOT NULL,
	[sig_estado] [varchar](50) NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ITEMS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ITEMS]
AS
SELECT        I.ID AS ID_ITEM, I.ID_PEDIDO, I.CANT, I.CANT - I.STOCK AS P_FAB, I.ID_PRODUCTO, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, 
                         E.nombre AS ESTADO, I.STOCK, I.MARCO_TER, I.HOJAS_TER, I.ENSAMBLADOS AS ENSAMBLADAS, I.EN_DEPOSITO AS DEPOSITO, P.stock AS STOCK_PROD, I.ENSAMBLADOS - I.EN_DEPOSITO AS P_ALM, I.ID_ESTADO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.estados AS E ON I.ID_ESTADO = E.id
GO
/****** Object:  View [dbo].[VW_ETIQUETAS_STOCK]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ETIQUETAS_STOCK]
AS
SELECT        CL.NOMBRE, PE.ID, I.CANT AS CANT_ITEM, PE.CANT_TOTAL, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.CLIENTES AS CL ON PE.ID_CLIENTE = CL.ID INNER JOIN
                         master.dbo.spt_values AS t2 ON t2.type = 'P' AND t2.number < I.STOCK
GO
/****** Object:  View [dbo].[VW_PEDIDOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PEDIDOS]
AS
SELECT        I.ID AS ITEM, I.ID_PEDIDO, I.CANT, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, E.id AS ID_ESTADO, E.nombre AS ESTADO, P.stock, 
                         PE.ID_CLIENTE, CL.NOMBRE AS CLIENTE, PE.FECHA_RECIBIDO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.estados AS E ON I.ID_ESTADO = E.id INNER JOIN
                         dbo.CLIENTES AS CL ON PE.ID_CLIENTE = CL.ID
GO
/****** Object:  View [dbo].[VW_PEDIDOS_EN_CURSO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PEDIDOS_EN_CURSO]
AS
SELECT        P.ID, C.NOMBRE AS Cliente, P.CANT_TOTAL AS Cantidad, E.id AS ID_ESTADO, E.nombre AS Estado, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO, SUM(I.ENSAMBLADOS + I.STOCK) AS Terminados, CONVERT(varchar(10), 
                         SUM(I.ENSAMBLADOS + I.STOCK) * 100 / P.CANT_TOTAL) + '%' AS PORCENT_AVANCE
FROM            dbo.PEDIDOS AS P INNER JOIN
                         dbo.CLIENTES AS C ON P.ID_CLIENTE = C.ID INNER JOIN
                         dbo.estados AS E ON E.id = P.ID_ESTADO INNER JOIN
                         dbo.ITEMS AS I ON P.ID = I.ID_PEDIDO
WHERE        (P.ID_ESTADO NOT IN (5, 6, 7)) AND (I.ID_ESTADO NOT IN (5, 6, 7))
GROUP BY P.ID, C.NOMBRE, P.CANT_TOTAL, E.id, E.nombre, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO
GO
/****** Object:  View [dbo].[VW_PRODUCTOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PRODUCTOS]
AS
SELECT        P.id, P.COD, L.nombre AS LINEA, C.nombre AS CHAPA, H.nombre AS HOJA, M.nombre AS MARCO, D.NOMBRE AS MADERA, N.nombre AS MANO, P.precio, P.stock, L.id AS ID_LINEA, C.id AS ID_CHAPA, H.id AS ID_HOJA, 
                         M.id AS ID_MARCO, D.ID AS ID_MADERA, N.id AS ID_MANO
FROM            dbo.PRODUCTOS AS P INNER JOIN
                         dbo.lineas AS L ON L.id = P.idLinea INNER JOIN
                         dbo.chapas AS C ON C.id = P.idChapa INNER JOIN
                         dbo.hojas AS H ON H.id = P.idHoja INNER JOIN
                         dbo.marcos AS M ON M.id = P.idMarco INNER JOIN
                         dbo.maderas AS D ON D.ID = P.idMadera INNER JOIN
                         dbo.manos AS N ON N.id = P.idMano
WHERE        (P.VALIDO_HASTA IS NULL)
GO
/****** Object:  View [dbo].[VW_PEDIDOS_TODOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PEDIDOS_TODOS]
AS
SELECT        P.ID, C.NOMBRE AS Cliente, P.ID_CLIENTE, P.CANT_TOTAL AS Cantidad, P.PRECIO_TOTAL AS Precio, E.id AS ID_ESTADO, E.nombre AS Estado, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO
FROM            dbo.PEDIDOS AS P INNER JOIN
                         dbo.CLIENTES AS C ON P.ID_CLIENTE = C.ID INNER JOIN
                         dbo.estados AS E ON E.id = P.ID_ESTADO
GO
/****** Object:  View [dbo].[VW_PEDIDOS_CLIENTE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PEDIDOS_CLIENTE]
AS
SELECT        P.ID, P.ID_CLIENTE, P.CANT_TOTAL, P.ID_ESTADO, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO, E.nombre AS ESTADO, C.NOMBRE AS CLIENTE
FROM            dbo.PEDIDOS AS P INNER JOIN
                         dbo.CLIENTES AS C ON C.ID = P.ID_CLIENTE INNER JOIN
                         dbo.estados AS E ON E.id = P.ID_ESTADO
GO
/****** Object:  View [dbo].[VW_VENTAS_POR_PRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_VENTAS_POR_PRODUCTO]
AS
SELECT        L.id, L.nombre, PE.FECHA_RECIBIDO, I.CANT, C.NOMBRE AS CLIENTE
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.CLIENTES AS C ON C.ID = PE.ID_CLIENTE
WHERE        (PE.ID_CLIENTE <> 0)
GO
/****** Object:  View [dbo].[VW_PEDIDOS_MODIFICAR]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_PEDIDOS_MODIFICAR]
AS
SELECT DISTINCT TOP (100) PERCENT P.ID AS [Nro Pedido], C.NOMBRE AS Cliente, P.CANT_TOTAL AS Cantidad, E.nombre AS Estado, P.FECHA_RECIBIDO AS [Fecha Recibido], P.FECHA_MODIFICADO AS [Ultima Modificacion]
FROM            dbo.PEDIDOS AS P INNER JOIN
                         dbo.CLIENTES AS C ON P.ID_CLIENTE = C.ID INNER JOIN
                         dbo.estados AS E ON E.id = P.ID_ESTADO INNER JOIN
                         dbo.ITEMS AS I ON P.ID = I.ID_PEDIDO
WHERE        (I.ID_ESTADO NOT IN (4, 5, 6, 7))
GO
/****** Object:  View [dbo].[VW_REMITOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_REMITOS]
AS
SELECT        PE.ID AS PEDIDO, I.CANT, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, E.nombre AS ESTADO, CL.CUIT, CL.NOMBRE AS CLIENTE, 
                         CL.DIRECCION, CL.CIUDAD, CL.PROVINCIA
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.estados AS E ON I.ID_ESTADO = E.id INNER JOIN
                         dbo.CLIENTES AS CL ON CL.ID = PE.ID_CLIENTE
WHERE        (I.ID_ESTADO = 4)
GO
/****** Object:  View [dbo].[VW_ORDENES]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ORDENES]
AS
SELECT        PE.ID AS PEDIDO, I.CANT, I.STOCK, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, CL.CUIT, CL.NOMBRE AS CLIENTE
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.estados AS E ON I.ID_ESTADO = E.id INNER JOIN
                         dbo.CLIENTES AS CL ON CL.ID = PE.ID_CLIENTE
WHERE        (I.ID_ESTADO BETWEEN 0 AND 4)
GO
/****** Object:  View [dbo].[VW_ETIQUETAS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ETIQUETAS]
AS
SELECT        CL.NOMBRE, PE.ID, I.CANT AS CANT_ITEM, PE.CANT_TOTAL, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, I.ID_ESTADO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.CLIENTES AS CL ON PE.ID_CLIENTE = CL.ID INNER JOIN
                         master.dbo.spt_values AS t2 ON t2.type = 'P' AND t2.number < I.P_IMPRIMIR
GO
/****** Object:  View [dbo].[VW_ETIQUETAS_SIMPLE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ETIQUETAS_SIMPLE]
AS
SELECT        CL.NOMBRE, PE.ID, I.ID AS ID_ITEM, I.CANT AS CANT_ITEM, PE.CANT_TOTAL, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.CLIENTES AS CL ON PE.ID_CLIENTE = CL.ID
WHERE        (PE.ID_ESTADO BETWEEN 2 AND 4)
GO
/****** Object:  Table [dbo].[DESPIECE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESPIECE](
	[ID_PROD] [smallint] NOT NULL,
	[ID_PIEZA] [smallint] NOT NULL,
	[CONSUMO] [float] NOT NULL,
	[EN_PROGRESO] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEMS_TEMP]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEMS_TEMP](
	[ID] [smallint] NOT NULL,
	[ID_PRODUCTO] [smallint] NOT NULL,
	[ID_PEDIDO] [smallint] NOT NULL,
	[CANT] [int] NOT NULL,
	[MONTO] [money] NOT NULL,
	[ID_ESTADO] [smallint] NOT NULL,
	[MARCO_TER] [int] NOT NULL,
	[HOJAS_TER] [int] NOT NULL,
	[ENSAMBLADOS] [int] NOT NULL,
	[EN_DEPOSITO] [int] NOT NULL,
	[STOCK] [int] NOT NULL,
	[ULT_MODIF] [date] NOT NULL,
 CONSTRAINT [PK_ITEMS_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIALES]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIALES](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[UNIDAD] [nchar](25) NOT NULL,
	[STOCK_RESERVADO] [float] NOT NULL,
	[STOCK_DISPONIBLE] [float] NOT NULL,
	[ES_LINEA] [bit] NULL,
 CONSTRAINT [PK_MATERIALES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_ITEMS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_ITEMS](
	[ID_ITEM] [smallint] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[ENTRADA] [nvarchar](100) NOT NULL,
	[USUARIO] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_MATERIALES]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_MATERIALES](
	[FECHA] [datetime] NOT NULL,
	[CAMBIOS] [nvarchar](200) NOT NULL,
	[USUARIO] [nchar](50) NOT NULL,
	[COD_PIEZA] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_PEDIDOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_PEDIDOS](
	[ID_PEDIDO] [smallint] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[ENTRADA] [nvarchar](100) NOT NULL,
	[USUARIO] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_PRODUCTOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_PRODUCTOS](
	[FECHA] [datetime] NOT NULL,
	[CAMBIOS] [nvarchar](100) NOT NULL,
	[USUARIO] [nvarchar](100) NOT NULL,
	[COD_PRODUCTO] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chapas] ON 

INSERT [dbo].[chapas] ([id], [nombre], [COD_MAT]) VALUES (0, N'CH22      ', 8)
INSERT [dbo].[chapas] ([id], [nombre], [COD_MAT]) VALUES (1, N'CH20      ', 9)
INSERT [dbo].[chapas] ([id], [nombre], [COD_MAT]) VALUES (2, N'CH18      ', 10)
SET IDENTITY_INSERT [dbo].[chapas] OFF
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (0, N'30-70931701-2', N'CORDOBA PLACAS', N'461-2484', N'jmpcba@gmail.com', N'Bahamas 4546', N'CORDOBA', N'Cordoba')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (1, N'34-11111111-1', N'Ferrocons', N'333', N'jmpcba@gmail.com', N'calle numero 123', N'Cordoba', N'Cordoba')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (2, N'30-22222222-2', N'zarate', N'222', N'jmpcba@gmail.com', N'OTRA DIRECCION', N'CORDOBA', N'CORDOBA')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (4, N'30-12345678-9', N'Darsie', N'1111', N'jmpcba@gmail.com', N'velez sarsfield 3000', N'cordoba', N'cordoba')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (5, N'30-04444444-4', N'sanchez', N'4444444444444', N'jmpcba@gmail.com', N'123 su casa', N'cordoba', N'cordoba')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (7, N'12-34567890-1', N'prueba', N'12345', N'jmpcba@gmail.com', N'una dir', N'ciudad', N'Catamarca')
INSERT [dbo].[CLIENTES] ([ID], [CUIT], [NOMBRE], [TELEFONO], [MAIL], [DIRECCION], [CIUDAD], [PROVINCIA]) VALUES (10, N'23-24220759-9', N'DE PRUEBAS', N'456-2947', N'jmpcba@gmail.com', N'una dir', N'resistencia', N'Chaco')
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 8, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 9, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 10, 0.1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 10, 0.1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 10, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 6, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 6, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 7, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 7, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (2, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (3, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (4, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (5, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (6, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (7, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (8, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (9, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (10, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (11, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (12, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (13, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 12, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (14, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (15, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (16, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (17, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (18, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (19, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (20, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (21, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (22, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (23, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (24, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (26, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 16, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (27, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (28, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (29, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (30, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (31, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (32, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (33, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (34, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (35, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (36, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (37, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (38, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (39, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 12, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (40, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (41, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (42, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (43, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (44, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (45, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (46, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (47, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (48, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (49, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (50, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (51, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 16, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (52, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (53, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (54, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (55, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (56, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (57, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (58, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (59, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (60, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (61, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (62, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (63, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (64, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 12, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (65, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (66, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (67, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (68, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (69, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (70, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (71, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (72, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (73, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (74, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (75, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (76, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 16, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (77, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (78, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (79, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (80, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (81, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (82, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (83, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (84, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (85, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (86, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (134, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (135, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 11, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (136, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (137, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (138, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (139, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (140, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (141, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (142, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (143, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (144, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (145, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (146, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (147, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 15, 3, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (148, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (149, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (150, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (151, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (152, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (153, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (154, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (155, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (156, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (157, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (158, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (159, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (160, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 11, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (161, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (162, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (163, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (164, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (165, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (166, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (167, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (168, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (169, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (170, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (171, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (172, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 15, 3, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (173, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (174, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (175, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (176, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (177, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (178, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (179, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (180, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (181, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (182, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (183, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (184, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (185, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 11, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (186, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (187, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (188, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (189, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (190, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (191, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (192, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (193, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (194, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (195, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (196, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (197, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 15, 0, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (198, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (199, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (200, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (201, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (202, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 15, 0, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (203, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 5, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 8, 0.1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (1, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (25, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (87, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (88, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (89, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (90, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (91, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 12, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (92, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (93, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (94, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (95, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (96, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (97, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (98, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (99, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (100, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (101, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (102, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (103, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 16, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (104, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (105, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (106, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (107, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (108, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (109, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (110, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (111, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (112, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (113, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (114, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (115, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (116, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 12, 0.5, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (117, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (118, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (119, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (120, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (121, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (122, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (123, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (124, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (125, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (126, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (127, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (128, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 16, 1, 0)
GO
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (129, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (130, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (131, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 14, 9, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 15, 3, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 16, 1, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 17, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (132, 18, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 11, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 12, 0.5, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 13, 1.6, 0)
INSERT [dbo].[DESPIECE] ([ID_PROD], [ID_PIEZA], [CONSUMO], [EN_PROGRESO]) VALUES (133, 14, 9, 0)
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (0, N'RECIBIDO       ', N'1;8;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (1, N'EN COLA        ', N'0;2;8;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (2, N'EN PRODUCCION  ', N'1;3;8;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (3, N'DEPOSITO       ', N'3;5;8;7;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (4, N'ENVIADO        ', N'4;6;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (5, N'ENTREGADO      ', N'5;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (6, N'STOCK          ', N'0;')
INSERT [dbo].[estados] ([id], [nombre], [sig_estado]) VALUES (7, N'CANCELADO      ', N'0;')
SET IDENTITY_INSERT [dbo].[hojas] ON 

INSERT [dbo].[hojas] ([id], [nombre]) VALUES (0, N'60CM                ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (1, N'70CM                ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (2, N'80CM                ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (3, N'90CM                ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (4, N'1 X 1,90            ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (5, N'1,20 X 1,90         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (6, N'1,50 X 1,90         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (7, N'1,80 X 1,90         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (8, N'2 X 1,90            ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (9, N'1 X 2,30            ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (10, N'1,20 X 2,30         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (11, N'1,50 X 2,30         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (12, N'1,80 X 2,30         ')
INSERT [dbo].[hojas] ([id], [nombre]) VALUES (13, N'2 X 2,30            ')
SET IDENTITY_INSERT [dbo].[hojas] OFF
SET IDENTITY_INSERT [dbo].[ITEMS] ON 

INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (3, 1, 113, 1, 0.0000, 6, 1, 1, 1, 1, 0, CAST(N'2018-07-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (4, 184, 114, 1, 0.0000, 6, 1, 1, 1, 1, 0, CAST(N'2018-07-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (5, 1, 117, 5, 0.0000, 6, 2, 2, 2, 2, 3, CAST(N'2018-07-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (6, 89, 117, 10, 0.0000, 6, 10, 10, 10, 10, 0, CAST(N'2018-07-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (7, 1, 118, 5, 0.0000, 6, 3, 3, 3, 3, 5, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (8, 79, 118, 8, 0.0000, 6, 3, 3, 3, 3, 5, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (9, 180, 118, 10, 0.0000, 6, 5, 5, 5, 5, 5, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (10, 1, 119, 20, 0.0000, 5, 15, 15, 15, 15, 5, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (11, 89, 119, 15, 0.0000, 5, 15, 15, 15, 15, 0, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (12, 1, 120, 10, 0.0000, 6, 5, 5, 5, 5, 5, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (13, 25, 120, 10, 0.0000, 6, 5, 5, 5, 5, 5, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (14, 89, 120, 10, 0.0000, 6, 10, 10, 10, 10, 0, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (15, 185, 120, 10, 0.0000, 6, 7, 7, 7, 7, 3, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (16, 15, 121, 10, 0.0000, 6, 5, 5, 5, 5, 5, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (17, 153, 121, 15, 0.0000, 6, 5, 5, 5, 5, 10, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (18, 1, 122, 50, 0.0000, 5, 50, 50, 50, 50, 0, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (19, 25, 122, 50, 0.0000, 5, 39, 39, 39, 39, 11, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (20, 89, 122, 50, 0.0000, 5, 31, 31, 31, 31, 19, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (21, 89, 123, 1, 0.0000, 6, 0, 0, 0, 0, 1, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (118, 1, 222, 20, 0.0000, 7, 10, 10, 10, 10, 0, CAST(N'2018-08-06' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (119, 41, 222, 15, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-06' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (120, 52, 223, 45, 0.0000, 7, 45, 45, 45, 45, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (121, 168, 223, 20, 0.0000, 7, 10, 10, 10, 10, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (122, 17, 224, 10, 0.0000, 5, 0, 0, 0, 0, 10, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (123, 51, 224, 10, 0.0000, 5, 5, 5, 5, 5, 5, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (124, 25, 225, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-08-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (125, 41, 226, 15, 0.0000, 5, 15, 15, 15, 15, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (126, 25, 227, 30, 0.0000, 6, 20, 30, 30, 30, 0, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (127, 89, 227, 20, 0.0000, 6, 20, 20, 20, 20, 0, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (128, 153, 227, 20, 0.0000, 6, 14, 14, 14, 14, 6, CAST(N'2018-07-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (129, 89, 228, 10, 0.0000, 5, 5, 5, 5, 5, 5, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (130, 57, 228, 15, 0.0000, 5, 9, 9, 9, 9, 6, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (131, 121, 229, 20, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (132, 41, 230, 25, 0.0000, 5, 0, 0, 0, 0, 20, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (133, 105, 230, 30, 0.0000, 5, 0, 0, 0, 0, 30, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (134, 186, 231, 35, 0.0000, 7, 5, 5, 5, 5, 5, CAST(N'2018-08-06' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (234, 89, 230, 3, 0.0000, 5, 0, 0, 0, 0, 3, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (235, 88, 230, 7, 0.0000, 5, 0, 0, 0, 0, 7, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (236, 172, 230, 5, 0.0000, 5, 0, 0, 0, 0, 5, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (237, 24, 229, 15, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (238, 88, 229, 12, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (239, 184, 225, 15, 0.0000, 5, 5, 5, 5, 5, 10, CAST(N'2018-08-23' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (240, 4, 328, 5, 0.0000, 5, 5, 5, 5, 5, 0, CAST(N'2018-09-03' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (241, 25, 329, 5, 0.0000, 6, 5, 5, 5, 5, 0, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (242, 25, 330, 9, 0.0000, 7, 5, 5, 5, 0, 0, CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (243, 1, 332, 9, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (244, 25, 333, 2, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-08-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (245, 25, 334, 15, 0.0000, 7, 3, 3, 3, 0, 10, CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (246, 153, 335, 40, 0.0000, 4, 40, 40, 40, 40, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (247, 1, 336, 16, 0.0000, 7, 2, 2, 2, 2, 10, CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (248, 41, 328, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-09-03' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (249, 41, 337, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (250, 153, 337, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-08-20' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (349, 88, 437, 30, 0.0000, 5, 25, 25, 25, 25, 5, CAST(N'2018-08-28' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (350, 180, 437, 35, 0.0000, 5, 30, 30, 30, 30, 5, CAST(N'2018-08-28' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (351, 25, 438, 15, 0.0000, 5, 15, 15, 15, 15, 0, CAST(N'2018-09-03' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (352, 1, 438, 15, 0.0000, 5, 15, 15, 15, 15, 0, CAST(N'2018-09-03' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (353, 89, 438, 10, 0.0000, 5, 3, 3, 3, 3, 7, CAST(N'2018-09-03' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (354, 1, 439, 10, 0.0000, 7, 2, 2, 2, 0, 0, CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (355, 1, 440, 20, 0.0000, 7, 2, 2, 2, 0, 10, CAST(N'2018-08-22' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (356, 185, 441, 20, 0.0000, 5, 10, 10, 10, 10, 10, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (357, 25, 442, 25, 0.0000, 5, 20, 20, 20, 20, 5, CAST(N'2018-09-02' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (358, 185, 442, 5, 0.0000, 5, 0, 0, 0, 0, 5, CAST(N'2018-09-02' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (359, 89, 443, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-09-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (360, 177, 443, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-09-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (361, 89, 444, 22, 0.0000, 5, 22, 22, 22, 22, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (362, 185, 443, 20, 0.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-09-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (363, 29, 445, 20, 0.0000, 5, 10, 10, 10, 10, 10, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (364, 89, 445, 25, 0.0000, 5, 25, 25, 25, 25, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (365, 25, 446, 8, 0.0000, 5, 0, 0, 0, 0, 8, CAST(N'2018-11-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (366, 89, 446, 30, 0.0000, 5, 30, 30, 30, 30, 0, CAST(N'2018-11-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (462, 5, 545, 10, 0.0000, 7, 0, 0, 3, 0, 6, CAST(N'2018-12-30' AS Date), 3)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (463, 174, 545, 20, 0.0000, 7, 0, 0, 11, 0, 0, CAST(N'2018-12-30' AS Date), 11)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (464, 1, 546, 25, 8762.5000, 6, 0, 0, 0, 0, 25, CAST(N'2018-09-02' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (465, 169, 546, 25, 0.0000, 6, 0, 0, 0, 0, 25, CAST(N'2018-09-02' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (466, 41, 547, 19, 0.0000, 7, 0, 0, 2, 1, 0, CAST(N'2018-12-28' AS Date), 1)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (467, 133, 547, 19, 0.0000, 7, 0, 0, 2, 1, 0, CAST(N'2018-12-28' AS Date), 1)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (468, 1, 548, 11, 0.0000, 7, 2, 2, 2, 2, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (469, 25, 548, 22, 0.0000, 7, 2, 2, 2, 2, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (470, 185, 549, 45, 0.0000, 5, 32, 32, 32, 32, 13, CAST(N'2018-09-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (471, 25, 550, 15, 0.0000, 4, 15, 15, 15, 15, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (472, 69, 550, 15, 0.0000, 4, 15, 15, 15, 15, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (473, 1, 551, 22, 7711.0000, 5, 0, 0, 0, 0, 22, CAST(N'2018-09-24' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (474, 1, 552, 15, 7010.0000, 5, 10, 10, 10, 10, 5, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (475, 5, 552, 5, 4251.2500, 5, 0, 0, 0, 0, 5, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (476, 17, 552, 10, 0.0000, 5, 0, 0, 0, 0, 10, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (477, 25, 552, 25, 0.0000, 5, 5, 5, 5, 5, 20, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (478, 44, 552, 25, 0.0000, 5, 25, 25, 25, 25, 0, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (479, 194, 553, 5, 0.0000, 6, 5, 5, 5, 5, 0, CAST(N'2018-09-08' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (480, 24, 554, 50, 0.0000, 6, 50, 50, 50, 50, 0, CAST(N'2018-09-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (481, 190, 335, 5, 16303.0000, 4, 5, 5, 5, 5, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (482, 1, 555, 20, 23936.0000, 5, 20, 20, 20, 20, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (483, 25, 556, 10, 15844.0000, 5, 10, 10, 10, 10, 0, CAST(N'2018-09-10' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (484, 25, 555, 10, 15844.0000, 5, 10, 10, 10, 10, 0, CAST(N'2018-09-25' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (485, 1, 558, 101, 0.0000, 3, 0, 0, 79, 79, 22, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (486, 1, 560, 50, 0.0000, 6, 8, 8, 35, 35, 15, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (487, 24, 560, 50, 0.0000, 6, 3, 3, 42, 42, 8, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (488, 185, 560, 2, 0.0000, 7, 2, 2, 2, 2, 0, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (489, 1, 561, 20, 0.0000, 5, 0, 0, 20, 20, 0, CAST(N'2018-11-05' AS Date), 0)
GO
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (490, 25, 561, 20, 0.0000, 5, 0, 0, 20, 20, 0, CAST(N'2018-11-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (491, 1, 562, 10, 0.0000, 6, 0, 0, 0, 0, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (492, 25, 562, 20, 0.0000, 6, 0, 0, 10, 10, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (493, 50, 563, 25, 0.0000, 2, 0, 0, 5, 5, 10, CAST(N'2018-12-09' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (494, 62, 563, 25, 0.0000, 2, 0, 0, 4, 4, 0, CAST(N'2018-12-09' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (495, 185, 564, 20, 0.0000, 4, 20, 20, 20, 20, 0, CAST(N'2018-11-04' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (496, 1, 565, 25, 0.0000, 3, 0, 0, 25, 25, 0, CAST(N'2018-11-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (497, 113, 565, 12, 0.0000, 3, 0, 0, 2, 2, 10, CAST(N'2018-11-05' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (593, 1, 663, 8, 0.0000, 5, 0, 0, 8, 8, 0, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (594, 153, 663, 10, 0.0000, 5, 0, 0, 0, 0, 10, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (595, 25, 664, 15, 0.0000, 3, 0, 0, 10, 10, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (596, 89, 664, 20, 0.0000, 3, 0, 0, 15, 15, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (597, 77, 665, 15, 0.0000, 4, 0, 0, 5, 5, 10, CAST(N'2019-04-11' AS Date), 5)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (598, 153, 665, 15, 0.0000, 4, 0, 0, 5, 5, 10, CAST(N'2019-04-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (599, 188, 666, 20, 0.0000, 5, 0, 0, 20, 20, 0, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (600, 105, 666, 15, 0.0000, 5, 0, 0, 0, 0, 15, CAST(N'2018-11-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (601, 186, 667, 5, 0.0000, 3, 0, 0, 1, 1, 4, CAST(N'2018-11-13' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (602, 187, 667, 5, 0.0000, 3, 0, 0, 2, 2, 3, CAST(N'2018-11-13' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (603, 89, 668, 5, 0.0000, 5, 0, 0, 4, 4, 1, CAST(N'2019-04-11' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (701, 1, 767, 5, 0.0000, 5, 0, 0, 5, 5, 0, CAST(N'2018-12-09' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (702, 89, 767, 5, 0.0000, 5, 0, 0, 3, 3, 2, CAST(N'2018-12-09' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (703, 25, 768, 8, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (704, 1, 768, 2, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (705, 89, 769, 3, 0.0000, 5, 0, 0, 1, 1, 2, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (706, 25, 770, 10, 0.0000, 7, 0, 0, 0, 0, 10, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (707, 1, 770, 5, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (708, 1, 771, 11, 0.0000, 7, 0, 0, 0, 0, 6, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (709, 89, 771, 20, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (710, 1, 772, 8, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (711, 2, 773, 8, 0.0000, 2, 0, 0, 0, 0, 2, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (712, 13, 773, 8, 0.0000, 2, 0, 0, 0, 0, 2, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (713, 1, 774, 8, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-04-13' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (714, 2, 775, 3, 0.0000, 5, 0, 0, 3, 3, 0, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (715, 25, 776, 4, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (716, 1, 563, 1, 0.0000, 3, 0, 0, 0, 0, 1, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (717, 1, 545, 21, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-30' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (718, 185, 545, 1, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-30' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (719, 25, 545, 5, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-30' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (720, 1, 545, 1, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-30' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (721, 25, 545, 2, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2018-12-30' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (722, 153, 548, 2, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (723, 1, 548, 10, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (724, 185, 548, 13, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (725, 153, 548, 7, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (726, 41, 548, 8, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (727, 153, 548, 4, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (728, 25, 558, 2, 0.0000, 3, 0, 0, 2, 2, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (729, 25, 548, 6, 0.0000, 7, 0, 0, 0, 0, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (730, 41, 548, 4, 0.0000, 5, 0, 0, 4, 4, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (731, 1, 548, 6, 0.0000, 5, 0, 0, 6, 6, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (732, 89, 548, 2, 0.0000, 5, 0, 0, 2, 2, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (733, 185, 548, 5, 0.0000, 5, 0, 0, 5, 5, 0, CAST(N'2019-01-01' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (734, 169, 560, 5, 0.0000, 7, 0, 0, 2, 0, 2, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (735, 25, 777, 85, 131792.5000, 5, 0, 0, 75, 75, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (736, 147, 777, 90, 139545.0000, 5, 0, 0, 80, 80, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (737, 185, 777, 10, 15505.0000, 5, 0, 0, 10, 10, 0, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (738, 25, 778, 5, 7752.5000, 4, 0, 0, 5, 5, 0, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (739, 89, 778, 10, 15505.0000, 4, 0, 0, 5, 5, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (740, 121, 779, 15, 23257.5000, 5, 0, 0, 10, 10, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (741, 185, 779, 20, 31010.0000, 5, 0, 0, 18, 18, 2, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (742, 185, 563, 10, 15505.0000, 2, 0, 0, 1, 0, 0, CAST(N'2019-05-26' AS Date), 1)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (743, 1, 780, 10, 15505.0000, 4, 0, 0, 5, 5, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (744, 169, 780, 10, 15505.0000, 4, 0, 0, 5, 5, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (745, 73, 780, 10, 15505.0000, 4, 0, 0, 5, 5, 5, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (746, 171, 781, 50, 77525.0000, 5, 0, 0, 40, 40, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (747, 1, 781, 15, 23257.5000, 5, 0, 0, 5, 5, 10, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (748, 89, 782, 85, 131792.5000, 0, 0, 0, 0, 0, 0, CAST(N'2019-05-26' AS Date), 0)
INSERT [dbo].[ITEMS] ([ID], [ID_PRODUCTO], [ID_PEDIDO], [CANT], [MONTO], [ID_ESTADO], [MARCO_TER], [HOJAS_TER], [ENSAMBLADOS], [EN_DEPOSITO], [STOCK], [ULT_MODIF], [P_IMPRIMIR]) VALUES (749, 89, 783, 25, 38762.5000, 0, 0, 0, 0, 0, 0, CAST(N'2019-05-26' AS Date), 0)
SET IDENTITY_INSERT [dbo].[ITEMS] OFF
SET IDENTITY_INSERT [dbo].[lineas] ON 

INSERT [dbo].[lineas] ([id], [nombre]) VALUES (1, N'LIVIANA')
INSERT [dbo].[lineas] ([id], [nombre]) VALUES (2, N'INTERMEDIA')
INSERT [dbo].[lineas] ([id], [nombre]) VALUES (3, N'PESADA')
INSERT [dbo].[lineas] ([id], [nombre]) VALUES (4, N'FRENTE PLACARD')
SET IDENTITY_INSERT [dbo].[lineas] OFF
SET IDENTITY_INSERT [dbo].[maderas] ON 

INSERT [dbo].[maderas] ([ID], [NOMBRE], [COD_MAT]) VALUES (0, N'PINO      ', 5)
INSERT [dbo].[maderas] ([ID], [NOMBRE], [COD_MAT]) VALUES (1, N'CEDRILLO  ', 6)
INSERT [dbo].[maderas] ([ID], [NOMBRE], [COD_MAT]) VALUES (2, N'CEDRO     ', 7)
SET IDENTITY_INSERT [dbo].[maderas] OFF
SET IDENTITY_INSERT [dbo].[manos] ON 

INSERT [dbo].[manos] ([id], [nombre]) VALUES (0, N'DERECHA   ')
INSERT [dbo].[manos] ([id], [nombre]) VALUES (1, N'IZQUIERDA ')
INSERT [dbo].[manos] ([id], [nombre]) VALUES (2, N'CORREDIZO ')
SET IDENTITY_INSERT [dbo].[manos] OFF
SET IDENTITY_INSERT [dbo].[marcos] ON 

INSERT [dbo].[marcos] ([id], [nombre]) VALUES (0, N'6CM       ')
INSERT [dbo].[marcos] ([id], [nombre]) VALUES (1, N'10CM      ')
INSERT [dbo].[marcos] ([id], [nombre]) VALUES (2, N'15CM      ')
INSERT [dbo].[marcos] ([id], [nombre]) VALUES (3, N'17CM      ')
INSERT [dbo].[marcos] ([id], [nombre]) VALUES (4, N'DURLOCK   ')
SET IDENTITY_INSERT [dbo].[marcos] OFF
SET IDENTITY_INSERT [dbo].[MATERIALES] ON 

INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (5, N'PINO', N'HOJA                     ', -66.100000000000023, 220, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (6, N'EUCALIPTO', N'HOJA                     ', -25.100000000000009, 10000, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (7, N'CEDRO', N'HOJA                     ', -1.1000000000000085, 9823, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (8, N'CH22', N'TON                      ', -24.79999999999999, 9966.9000000000033, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (9, N'CH20', N'TON                      ', 6.3000000000000123, 9943.2000000000044, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (10, N'CH18', N'TON                      ', -18.1, 9924, 1)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (11, N'MADERA 1.5 x 3 x 3', N'UN                       ', -154.5, 10000, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (12, N'MADERA 1.5 x 4 x 3', N'UN                       ', -154.5, 10000, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (13, N'MADERA 1.5 x 6 x 3', N'UN                       ', 8.4999999999983853, 8867.2000000000062, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (14, N'TORNILLO T2 6 X 1', N'UN                       ', 237.89999999999964, 2000, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (15, N'BISAGRA', N'UN                       ', -880.09999999999991, 550, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (16, N'CERRADURA', N'UN                       ', -10.099999999999909, 192, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (17, N'RESINA', N'LTS                      ', -154.5, 10000, 0)
INSERT [dbo].[MATERIALES] ([id], [NOMBRE], [UNIDAD], [STOCK_RESERVADO], [STOCK_DISPONIBLE], [ES_LINEA]) VALUES (18, N'PINTURA', N'LTS                      ', -154.5, 10000, 0)
SET IDENTITY_INSERT [dbo].[MATERIALES] OFF
SET IDENTITY_INSERT [dbo].[PEDIDOS] ON 

INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (113, 1, 1, 1.0000, 6, CAST(N'2018-07-06' AS Date), CAST(N'2018-07-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (114, 1, 1, 1.0000, 6, CAST(N'2018-07-06' AS Date), CAST(N'2018-07-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (117, 1, 15, 15.0000, 6, CAST(N'2018-07-08' AS Date), CAST(N'2018-07-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (118, 1, 23, 0.0000, 6, CAST(N'2018-07-10' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (119, 1, 35, 0.0000, 5, CAST(N'2018-07-11' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (120, 1, 40, 40.0000, 6, CAST(N'2018-07-11' AS Date), CAST(N'2018-07-23' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (121, 1, 25, 25.0000, 6, CAST(N'2018-07-11' AS Date), CAST(N'2018-07-23' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (122, 1, 150, 0.0000, 5, CAST(N'2018-07-13' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (123, 1, 1, 1.0000, 6, CAST(N'2018-07-13' AS Date), CAST(N'2018-07-23' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (222, 1, 35, 0.0000, 7, CAST(N'2018-07-18' AS Date), CAST(N'2018-08-06' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (223, 1, 65, 0.0000, 7, CAST(N'2018-07-18' AS Date), CAST(N'2018-08-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (224, 1, 20, 0.0000, 5, CAST(N'2018-07-22' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (225, 1, 35, 0.0000, 5, CAST(N'2018-07-22' AS Date), CAST(N'2018-08-23' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (226, 1, 15, 0.0000, 5, CAST(N'2018-07-22' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (227, 2, 70, 70.0000, 6, CAST(N'2018-07-22' AS Date), CAST(N'2018-07-23' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (228, 5, 25, 0.0000, 5, CAST(N'2018-07-28' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (229, 4, 47, 0.0000, 7, CAST(N'2018-07-28' AS Date), CAST(N'2018-08-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (230, 4, 70, 0.0000, 5, CAST(N'2018-07-29' AS Date), CAST(N'2018-11-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (231, 4, 35, 0.0000, 7, CAST(N'2018-07-29' AS Date), CAST(N'2018-08-06' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (328, 4, 25, 0.0000, 5, CAST(N'2018-08-08' AS Date), CAST(N'2018-09-03' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (329, 2, 5, 0.0000, 6, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (330, 2, 9, 0.0000, 7, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-22' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (332, 1, 9, 0.0000, 7, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (333, 4, 2, 0.0000, 7, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (334, 2, 15, 0.0000, 7, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-22' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (335, 2, 45, 16303.0000, 4, CAST(N'2018-08-08' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (336, 2, 16, 0.0000, 7, CAST(N'2018-08-08' AS Date), CAST(N'2018-08-22' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (337, 1, 40, 0.0000, 5, CAST(N'2018-08-20' AS Date), CAST(N'2018-08-20' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (437, 2, 65, 0.0000, 5, CAST(N'2018-08-20' AS Date), CAST(N'2018-08-28' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (438, 2, 40, 0.0000, 5, CAST(N'2018-08-21' AS Date), CAST(N'2018-09-03' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (439, 5, 10, 0.0000, 7, CAST(N'2018-08-22' AS Date), CAST(N'2018-08-22' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (440, 5, 20, 0.0000, 7, CAST(N'2018-08-22' AS Date), CAST(N'2018-08-22' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (441, 1, 20, 0.0000, 5, CAST(N'2018-08-22' AS Date), CAST(N'2018-11-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (442, 5, 30, 0.0000, 5, CAST(N'2018-08-22' AS Date), CAST(N'2018-09-02' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (443, 4, 60, 0.0000, 5, CAST(N'2018-08-22' AS Date), CAST(N'2018-09-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (444, 5, 22, 0.0000, 5, CAST(N'2018-08-23' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (445, 1, 45, 0.0000, 5, CAST(N'2018-08-28' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (446, 4, 38, 0.0000, 5, CAST(N'2018-08-29' AS Date), CAST(N'2018-11-05' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (545, 5, 8, 0.0000, 7, CAST(N'2018-09-01' AS Date), CAST(N'2018-12-30' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (546, 0, 50, 8763.0000, 6, CAST(N'2018-09-02' AS Date), CAST(N'2018-09-02' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (547, 1, 38, 0.0000, 7, CAST(N'2018-09-03' AS Date), CAST(N'2018-12-28' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (548, 0, 17, 0.0000, 5, CAST(N'2018-09-05' AS Date), CAST(N'2019-01-01' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (549, 1, 45, 0.0000, 5, CAST(N'2018-09-05' AS Date), CAST(N'2018-09-05' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (550, 5, 30, 0.0000, 4, CAST(N'2018-09-05' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (551, 1, 22, 7711.0000, 5, CAST(N'2018-09-05' AS Date), CAST(N'2018-09-24' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (552, 1, 80, 11261.0000, 5, CAST(N'2018-09-08' AS Date), CAST(N'2018-09-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (553, 0, 5, 0.0000, 6, CAST(N'2018-09-08' AS Date), CAST(N'2018-09-08' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (554, 0, 50, 0.0000, 6, CAST(N'2018-09-09' AS Date), CAST(N'2018-09-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (555, 0, 30, 39780.0000, 5, CAST(N'2018-09-10' AS Date), CAST(N'2018-09-25' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (556, 1, 10, 15844.0000, 5, CAST(N'2018-09-10' AS Date), CAST(N'2018-09-10' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (558, 1, 103, 0.0000, 3, CAST(N'2018-09-10' AS Date), CAST(N'2019-02-06' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (560, 0, 100, 0.0000, 6, CAST(N'2018-09-17' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (561, 0, 40, 0.0000, 5, CAST(N'2018-09-17' AS Date), CAST(N'2018-11-05' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (562, 0, 30, 0.0000, 6, CAST(N'2018-09-17' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (563, 2, 61, 15505.0000, 2, CAST(N'2018-09-17' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (564, 0, 20, 0.0000, 4, CAST(N'2018-09-17' AS Date), CAST(N'2018-11-04' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (565, 5, 37, 0.0000, 3, CAST(N'2018-09-18' AS Date), CAST(N'2018-11-05' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (663, 1, 18, 0.0000, 5, CAST(N'2018-11-11' AS Date), CAST(N'2018-11-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (664, 4, 35, 0.0000, 3, CAST(N'2018-11-11' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (665, 1, 30, 0.0000, 4, CAST(N'2018-11-11' AS Date), CAST(N'2019-04-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (666, 2, 35, 0.0000, 5, CAST(N'2018-11-11' AS Date), CAST(N'2018-11-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (667, 1, 10, 0.0000, 3, CAST(N'2018-11-11' AS Date), CAST(N'2018-11-13' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (668, 1, 5, 0.0000, 5, CAST(N'2018-11-11' AS Date), CAST(N'2019-04-11' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (767, 0, 10, 0.0000, 5, CAST(N'2018-12-09' AS Date), CAST(N'2018-12-09' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (768, 1, 10, 0.0000, 7, CAST(N'2018-12-25' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (769, 2, 3, 0.0000, 5, CAST(N'2018-12-26' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (770, 1, 15, 0.0000, 7, CAST(N'2018-12-26' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (771, 1, 31, 0.0000, 7, CAST(N'2018-12-26' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (772, 2, 8, 0.0000, 7, CAST(N'2018-12-26' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (773, 1, 16, 0.0000, 2, CAST(N'2018-12-26' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (774, 1, 8, 0.0000, 7, CAST(N'2018-12-26' AS Date), CAST(N'2019-04-13' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (775, 2, 3, 0.0000, 5, CAST(N'2018-12-26' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (776, 2, 4, 0.0000, 7, CAST(N'2018-12-26' AS Date), CAST(N'2018-12-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (777, 4, 185, 286842.5000, 5, CAST(N'2019-04-13' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (778, 1, 15, 23257.5000, 4, CAST(N'2019-04-25' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (779, 2, 35, 54267.5000, 5, CAST(N'2019-05-26' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (780, 1, 30, 46515.0000, 4, CAST(N'2019-05-26' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (781, 5, 65, 100782.5000, 5, CAST(N'2019-05-26' AS Date), CAST(N'2019-05-26' AS Date), NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (782, 2, 85, 131792.5000, 0, CAST(N'2019-05-26' AS Date), NULL, NULL)
INSERT [dbo].[PEDIDOS] ([ID], [ID_CLIENTE], [CANT_TOTAL], [PRECIO_TOTAL], [ID_ESTADO], [FECHA_RECIBIDO], [FECHA_MODIFICADO], [FECHA_ENTREGADO]) VALUES (783, 4, 25, 38762.5000, 0, CAST(N'2019-05-26' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[PEDIDOS] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 

INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (1, 1, 1, 0, 0, 0, 0, 0, 1550.5000, 249, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (2, 2, 1, 0, 1, 0, 0, 0, 1550.5000, 34, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (3, 3, 1, 0, 2, 0, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (4, 4, 1, 0, 3, 0, 0, 0, 1550.5000, 50, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (5, 5, 1, 0, 0, 1, 0, 0, 1550.5000, 40, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (6, 6, 1, 0, 1, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (7, 7, 1, 0, 2, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (8, 8, 1, 0, 3, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (9, 9, 1, 0, 0, 2, 0, 0, 1550.5000, 50, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (10, 10, 1, 0, 1, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (11, 11, 1, 0, 2, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (12, 12, 1, 0, 3, 2, 0, 0, 1550.5000, 46, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (13, 13, 1, 0, 0, 0, 0, 1, 1550.5000, 44, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (14, 14, 1, 0, 1, 0, 0, 1, 1550.5000, 46, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (15, 15, 1, 0, 2, 0, 0, 1, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (16, 16, 1, 0, 3, 0, 0, 1, 1550.5000, 46, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (17, 17, 1, 0, 0, 1, 0, 1, 1550.5000, 16, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (18, 18, 1, 0, 1, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (19, 19, 1, 0, 2, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (20, 20, 1, 0, 3, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (21, 21, 1, 0, 0, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (22, 22, 1, 0, 1, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (23, 23, 1, 0, 2, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (24, 24, 1, 0, 3, 2, 0, 1, 1550.5000, 136, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (25, 25, 2, 1, 0, 1, 0, 0, 1550.5000, 25, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (26, 26, 2, 1, 1, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (27, 27, 2, 1, 2, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (28, 28, 2, 1, 3, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (29, 29, 2, 1, 0, 2, 0, 0, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (30, 30, 2, 1, 1, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (31, 31, 2, 1, 2, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (32, 32, 2, 1, 3, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (33, 33, 2, 1, 0, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (34, 34, 2, 1, 1, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (35, 35, 2, 1, 2, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (36, 36, 2, 1, 3, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (37, 37, 2, 1, 0, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (38, 38, 2, 1, 1, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (39, 39, 2, 1, 2, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (40, 40, 2, 1, 3, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (41, 41, 2, 1, 0, 1, 1, 0, 1550.5000, 37, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (42, 42, 2, 1, 1, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (43, 43, 2, 1, 2, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (44, 44, 2, 1, 3, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (45, 45, 2, 1, 0, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (46, 46, 2, 1, 1, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (47, 47, 2, 1, 2, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (48, 48, 2, 1, 3, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (49, 49, 2, 1, 0, 3, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (50, 50, 2, 1, 1, 3, 1, 0, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (51, 51, 2, 1, 2, 3, 1, 0, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (52, 52, 2, 1, 3, 3, 1, 0, 1550.5000, 65, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (53, 53, 2, 1, 0, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (54, 54, 2, 1, 1, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (55, 55, 2, 1, 2, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (56, 56, 2, 1, 3, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (57, 57, 2, 1, 0, 1, 0, 1, 1550.5000, 30, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (58, 58, 2, 1, 1, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (59, 59, 2, 1, 2, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (60, 60, 2, 1, 3, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (61, 61, 2, 1, 0, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (62, 62, 2, 1, 1, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (63, 63, 2, 1, 2, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (64, 64, 2, 1, 3, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (65, 65, 2, 1, 0, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (66, 66, 2, 1, 1, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (67, 67, 2, 1, 2, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (68, 68, 2, 1, 3, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (69, 69, 2, 1, 0, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (70, 70, 2, 1, 1, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (71, 71, 2, 1, 2, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (72, 72, 2, 1, 3, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (73, 73, 2, 1, 0, 1, 1, 1, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (74, 74, 2, 1, 1, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (75, 75, 2, 1, 2, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (76, 76, 2, 1, 3, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (77, 77, 2, 1, 0, 2, 1, 1, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (78, 78, 2, 1, 1, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (79, 79, 2, 1, 2, 2, 1, 1, 1550.5000, 43, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (80, 80, 2, 1, 3, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (81, 81, 2, 1, 0, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (82, 82, 2, 1, 1, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (83, 83, 2, 1, 2, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (84, 84, 2, 1, 3, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (85, 85, 2, 1, 0, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (86, 86, 2, 1, 1, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (87, 87, 2, 1, 2, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (88, 88, 2, 1, 3, 4, 1, 1, 1550.5000, 24, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (89, 89, 3, 2, 0, 1, 0, 0, 1550.5000, 5, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (90, 90, 3, 2, 1, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (91, 91, 3, 2, 2, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (92, 92, 3, 2, 3, 1, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (93, 93, 3, 2, 0, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (94, 94, 3, 2, 1, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (95, 95, 3, 2, 2, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (96, 96, 3, 2, 3, 2, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (97, 97, 3, 2, 0, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (98, 98, 3, 2, 1, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (99, 99, 3, 2, 2, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
GO
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (100, 100, 3, 2, 3, 3, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (101, 101, 3, 2, 0, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (102, 102, 3, 2, 1, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (103, 103, 3, 2, 2, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (104, 104, 3, 2, 3, 4, 0, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (105, 105, 3, 2, 0, 1, 1, 0, 1550.5000, 21, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (106, 106, 3, 2, 1, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (107, 107, 3, 2, 2, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (108, 108, 3, 2, 3, 1, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (109, 109, 3, 2, 0, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (110, 110, 3, 2, 1, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (111, 111, 3, 2, 2, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (112, 112, 3, 2, 3, 2, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (113, 113, 3, 2, 0, 3, 1, 0, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (114, 114, 3, 2, 1, 3, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (115, 115, 3, 2, 2, 3, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (116, 116, 3, 2, 3, 3, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (117, 117, 3, 2, 0, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (118, 118, 3, 2, 1, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (119, 119, 3, 2, 2, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (120, 120, 3, 2, 3, 4, 1, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (121, 121, 3, 2, 0, 1, 0, 1, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (122, 122, 3, 2, 1, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (123, 123, 3, 2, 2, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (124, 124, 3, 2, 3, 1, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (125, 125, 3, 2, 0, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (126, 126, 3, 2, 1, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (127, 127, 3, 2, 2, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (128, 128, 3, 2, 3, 2, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (129, 129, 3, 2, 0, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (130, 130, 3, 2, 1, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (131, 131, 3, 2, 2, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (132, 132, 3, 2, 3, 3, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (133, 133, 3, 2, 0, 4, 0, 1, 1550.5000, 38, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (134, 134, 3, 2, 1, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (135, 135, 3, 2, 2, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (136, 136, 3, 2, 3, 4, 0, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (137, 137, 3, 2, 0, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (138, 138, 3, 2, 1, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (139, 139, 3, 2, 2, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (140, 140, 3, 2, 3, 1, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (141, 141, 3, 2, 0, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (142, 142, 3, 2, 1, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (143, 143, 3, 2, 2, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (144, 144, 3, 2, 3, 2, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (145, 145, 3, 2, 0, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (146, 146, 3, 2, 1, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (147, 147, 3, 2, 2, 3, 1, 1, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (148, 148, 3, 2, 3, 3, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (149, 149, 3, 2, 0, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (150, 150, 3, 2, 1, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (151, 151, 3, 2, 2, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (152, 152, 3, 2, 3, 4, 1, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (153, 153, 3, 2, 0, 1, 2, 0, 1550.5000, 20, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (154, 154, 3, 2, 1, 1, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (155, 155, 3, 2, 2, 1, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (156, 156, 3, 2, 3, 1, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (157, 157, 3, 2, 0, 2, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (158, 158, 3, 2, 1, 2, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (159, 159, 3, 2, 2, 2, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (160, 160, 3, 2, 3, 2, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (161, 161, 3, 2, 0, 3, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (162, 162, 3, 2, 1, 3, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (163, 163, 3, 2, 2, 3, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (164, 164, 3, 2, 3, 3, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (165, 165, 3, 2, 0, 4, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (166, 166, 3, 2, 1, 4, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (167, 167, 3, 2, 2, 4, 2, 0, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (168, 168, 3, 2, 3, 4, 2, 0, 1550.5000, 46, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (169, 169, 3, 2, 0, 1, 2, 1, 1550.5000, 33, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (170, 170, 3, 2, 1, 1, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (171, 171, 3, 2, 2, 1, 2, 1, 1550.5000, 26, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (172, 172, 3, 2, 3, 1, 2, 1, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (173, 173, 3, 2, 0, 2, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (174, 174, 3, 2, 1, 2, 2, 1, 1550.5000, 47, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (175, 175, 3, 2, 2, 2, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (176, 176, 3, 2, 3, 2, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (177, 177, 3, 2, 0, 3, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (178, 178, 3, 2, 1, 3, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (179, 179, 3, 2, 2, 3, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (180, 180, 3, 2, 3, 3, 2, 1, 1550.5000, 31, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (181, 181, 3, 2, 0, 4, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (182, 182, 3, 2, 1, 4, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (183, 183, 3, 2, 2, 4, 2, 1, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (184, 184, 3, 2, 3, 4, 2, 1, 1550.5000, 37, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (185, 185, 4, 2, 4, 1, 0, 2, 1550.5000, 0, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (186, 186, 4, 2, 5, 1, 0, 2, 1550.5000, 37, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (187, 187, 4, 2, 6, 1, 0, 2, 1550.5000, 33, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (188, 188, 4, 2, 7, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (189, 189, 4, 2, 8, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (190, 190, 4, 2, 9, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (191, 191, 4, 2, 10, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (192, 192, 4, 2, 11, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (193, 193, 4, 2, 12, 1, 0, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (194, 194, 4, 2, 13, 1, 0, 2, 1550.5000, 41, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (195, 195, 4, 2, 4, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (196, 196, 4, 2, 5, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (197, 197, 4, 2, 6, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (198, 198, 4, 2, 7, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (199, 199, 4, 2, 8, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
GO
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (200, 200, 4, 2, 9, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (201, 201, 4, 2, 10, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (202, 202, 4, 2, 11, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (203, 203, 4, 2, 12, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
INSERT [dbo].[PRODUCTOS] ([id], [COD], [idLinea], [idChapa], [idHoja], [idMarco], [idMadera], [idMano], [precio], [stock], [VALIDO_DESDE], [VALIDO_HASTA]) VALUES (204, 204, 4, 2, 13, 1, 2, 2, 1550.5000, 36, CAST(N'2019-03-23' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:13:07.040' AS DateTime), N'ITEM 134: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:13:07.040' AS DateTime), N'ITEM 134: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:13:07.040' AS DateTime), N'ITEM 134: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-05T21:16:20.407' AS DateTime), N'ITEM 134: CANTIDAD - Anterior: 10 CANTIDAD Nueva: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-05T21:17:47.177' AS DateTime), N'ITEM 134: CANTIDAD - Anterior: 15 CANTIDAD Nueva: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T18:21:12.820' AS DateTime), N'ITEM 134: CANTIDAD - Anterior: 25 CANTIDAD Nueva: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T20:10:06.477' AS DateTime), N'ITEM 134: PRODUCTO - Anterior: 185 PRODUCTO Nuevo: 195', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T20:11:37.370' AS DateTime), N'ITEM 134: PRODUCTO - Anterior: 195 PRODUCTO Nuevo: 196', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-08-06T20:13:01.477' AS DateTime), N'ITEM 132: PRODUCTO - Anterior: 25 PRODUCTO Nuevo: 41', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-08-06T20:14:15.330' AS DateTime), N'ITEM 132: PRODUCTO - Anterior: 41 PRODUCTO Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-08-06T20:17:06.003' AS DateTime), N'ITEM 132: PRODUCTO - Anterior: 25 PRODUCTO Nuevo: 41', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (133, CAST(N'2018-08-06T20:17:20.480' AS DateTime), N'ITEM 133: PRODUCTO - Anterior: 89 PRODUCTO Nuevo: 105', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-06T21:44:34.957' AS DateTime), N'ITEM 118: CANTIDAD - Anterior: 15 CANTIDAD Nueva: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-06T21:49:06.783' AS DateTime), N'ITEM 118: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (119, CAST(N'2018-08-06T21:49:07.850' AS DateTime), N'ITEM 119: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (120, CAST(N'2018-08-08T15:20:20.750' AS DateTime), N'ITEM 120: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (121, CAST(N'2018-08-08T15:20:20.767' AS DateTime), N'ITEM 121: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (131, CAST(N'2018-08-08T16:10:08.317' AS DateTime), N'ITEM 131: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (237, CAST(N'2018-08-08T16:10:08.347' AS DateTime), N'ITEM 237: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (238, CAST(N'2018-08-08T16:10:08.380' AS DateTime), N'ITEM 238: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-12T21:20:21.873' AS DateTime), N'ITEM 123: MARCOS TERMINADOS - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-12T21:20:21.873' AS DateTime), N'ITEM 123: HOJAS TERMINADAS - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-12T21:20:21.877' AS DateTime), N'ITEM 123: ENSAMBLADAS - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-12T21:20:29.730' AS DateTime), N'ITEM 123: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-12T21:20:29.730' AS DateTime), N'ITEM 123: EN DEPOSITO - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T11:01:00.220' AS DateTime), N'ITEM 129: MARCOS TERMINADOS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T11:01:00.220' AS DateTime), N'ITEM 129: HOJAS TERMINADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T11:01:00.240' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T11:01:00.247' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:33:23.987' AS DateTime), N'ITEM 130: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:33:44.840' AS DateTime), N'ITEM 130: EN DEPOSITO - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:36:08.507' AS DateTime), N'ITEM 129: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:36:08.507' AS DateTime), N'ITEM 129: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:36:08.507' AS DateTime), N'ITEM 129: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:36:08.517' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:36:08.517' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:36:23.977' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:36:23.977' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:36:23.977' AS DateTime), N'ITEM 130: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:37:25.137' AS DateTime), N'ITEM 129: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:37:25.137' AS DateTime), N'ITEM 129: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:37:25.147' AS DateTime), N'ITEM 130: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T13:42:48.583' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T13:42:48.583' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T13:43:05.233' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T15:01:52.967' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T15:01:52.967' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T15:01:52.967' AS DateTime), N'ITEM 130: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T15:02:10.110' AS DateTime), N'ITEM 130: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T15:05:08.697' AS DateTime), N'ITEM 240: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T15:05:08.860' AS DateTime), N'ITEM 248: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-18T15:24:13.310' AS DateTime), N'ITEM 241: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (242, CAST(N'2018-08-18T15:25:24.320' AS DateTime), N'ITEM 242: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:03:07.140' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:03:07.140' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:03:07.140' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:03:18.560' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:07:21.517' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:07:21.517' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:07:21.517' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:07:46.213' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-07-29T06:26:08.260' AS DateTime), N'ITEM 10: MARCOS TERMINADOS - Anterior: 2 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-07-29T06:26:08.260' AS DateTime), N'ITEM 10: HOJAS TERMINADAS - Anterior: 2 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-07-29T06:26:08.260' AS DateTime), N'ITEM 10: ENSAMBLADAS - Anterior: 2 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-07-29T06:26:08.410' AS DateTime), N'ITEM 11: MARCOS TERMINADOS - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-07-29T06:26:08.410' AS DateTime), N'ITEM 11: ENSAMBLADAS - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-07-29T06:27:44.593' AS DateTime), N'ITEM 132: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (133, CAST(N'2018-07-29T06:27:44.643' AS DateTime), N'ITEM 133: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T10:59:32.670' AS DateTime), N'ITEM 134: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:10:20.497' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:10:20.527' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:10:20.527' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:10:34.823' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:12:43.217' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:12:43.233' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:12:43.233' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:12:52.160' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:35:21.657' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:35:21.657' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:35:21.657' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:35:43.017' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T17:05:03.477' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T17:05:03.477' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T17:05:03.477' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T17:05:54.590' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (245, CAST(N'2018-08-18T17:20:02.683' AS DateTime), N'ITEM 245: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-18T17:21:29.750' AS DateTime), N'ITEM 246: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (122, CAST(N'2018-08-18T17:27:44.957' AS DateTime), N'ITEM 122: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-18T17:27:44.967' AS DateTime), N'ITEM 123: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-18T17:33:12.220' AS DateTime), N'ITEM 124: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-18T17:33:12.227' AS DateTime), N'ITEM 239: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-08-18T17:36:34.783' AS DateTime), N'ITEM 132: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (133, CAST(N'2018-08-18T17:36:34.797' AS DateTime), N'ITEM 133: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (234, CAST(N'2018-08-18T17:36:34.810' AS DateTime), N'ITEM 234: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (235, CAST(N'2018-08-18T17:36:34.820' AS DateTime), N'ITEM 235: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (236, CAST(N'2018-08-18T17:36:34.830' AS DateTime), N'ITEM 236: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:45:30.920' AS DateTime), N'ITEM 240: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:45:30.923' AS DateTime), N'ITEM 240: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:45:30.923' AS DateTime), N'ITEM 240: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:45:31.080' AS DateTime), N'ITEM 248: MARCOS TERMINADOS - Anterior: 0 Nuevo: 20', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:45:31.083' AS DateTime), N'ITEM 248: HOJAS TERMINADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:45:31.083' AS DateTime), N'ITEM 248: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:45:44.080' AS DateTime), N'ITEM 240: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:45:44.080' AS DateTime), N'ITEM 240: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:45:44.100' AS DateTime), N'ITEM 248: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:45:44.107' AS DateTime), N'ITEM 248: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-18T17:55:35.533' AS DateTime), N'ITEM 240: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-08-18T17:55:35.547' AS DateTime), N'ITEM 248: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:13:03.370' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:13:03.370' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:13:03.370' AS DateTime), N'ITEM 130: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T18:13:24.680' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 9 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T18:13:24.683' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 9 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T18:13:24.683' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 9 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T18:13:39.453' AS DateTime), N'ITEM 125: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T18:13:39.457' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 9 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-18T18:19:01.603' AS DateTime), N'ITEM 247: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:44:46.770' AS DateTime), N'ITEM 130: MARCOS TERMINADOS - Anterior: 6 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:44:46.770' AS DateTime), N'ITEM 130: HOJAS TERMINADAS - Anterior: 6 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:44:46.770' AS DateTime), N'ITEM 130: ENSAMBLADAS - Anterior: 6 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:44:50.210' AS DateTime), N'ITEM 134: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:44:50.210' AS DateTime), N'ITEM 134: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:45:48.560' AS DateTime), N'ITEM 134: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-07-29T11:46:18.580' AS DateTime), N'ITEM 134: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T01:11:26.990' AS DateTime), N'ITEM 134: CANTIDAD - Anterior: 20 CANTIDAD Nueva: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T21:02:37.637' AS DateTime), N'ITEM 134: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (244, CAST(N'2018-08-08T17:36:25.737' AS DateTime), N'ITEM 244: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (243, CAST(N'2018-08-08T17:36:39.843' AS DateTime), N'ITEM 243: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-08-08T18:07:33.930' AS DateTime), N'ITEM 240: PRODUCTO - Anterior: 16 PRODUCTO Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (234, CAST(N'2018-08-08T18:16:06.573' AS DateTime), N'ITEM 234: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (235, CAST(N'2018-08-08T18:16:06.620' AS DateTime), N'ITEM 235: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (236, CAST(N'2018-08-08T18:16:06.650' AS DateTime), N'ITEM 236: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-08T18:16:29.990' AS DateTime), N'ITEM 239: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-08T18:16:49.750' AS DateTime), N'ITEM 124: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-08T18:16:57.390' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:17:57.503' AS DateTime), N'ITEM 10: EN DEPOSITO - Anterior: 20 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-08-08T18:17:57.537' AS DateTime), N'ITEM 11: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-08-08T18:17:57.537' AS DateTime), N'ITEM 11: EN DEPOSITO - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-08T18:18:46.293' AS DateTime), N'ITEM 123: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:24:15.937' AS DateTime), N'ITEM 10: MARCOS TERMINADOS - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:24:15.937' AS DateTime), N'ITEM 10: HOJAS TERMINADAS - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:24:15.937' AS DateTime), N'ITEM 10: ENSAMBLADAS - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:24:34.303' AS DateTime), N'ITEM 10: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-08T18:24:34.303' AS DateTime), N'ITEM 10: EN DEPOSITO - Anterior: 10 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-18T13:28:28.087' AS DateTime), N'ITEM 129: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T13:28:28.100' AS DateTime), N'ITEM 130: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:44:57.737' AS DateTime), N'ITEM 130: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-18T18:44:57.737' AS DateTime), N'ITEM 130: EN DEPOSITO - Anterior: 5 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (7, CAST(N'2018-08-18T18:56:16.293' AS DateTime), N'ITEM 7: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-18T18:56:16.323' AS DateTime), N'ITEM 8: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (9, CAST(N'2018-08-18T18:56:16.347' AS DateTime), N'ITEM 9: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T12:21:56.370' AS DateTime), N'ITEM 241: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T12:21:56.370' AS DateTime), N'ITEM 241: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T12:21:56.370' AS DateTime), N'ITEM 241: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-20T12:34:00.433' AS DateTime), N'ITEM 125: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-08-20T16:01:38.347' AS DateTime), N'ITEM 129: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-08-20T16:01:38.360' AS DateTime), N'ITEM 130: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:24:08.603' AS DateTime), N'ITEM 241: MARCOS TERMINADOS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:24:08.603' AS DateTime), N'ITEM 241: HOJAS TERMINADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:24:08.603' AS DateTime), N'ITEM 241: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:24:21.270' AS DateTime), N'ITEM 241: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:24:21.273' AS DateTime), N'ITEM 241: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-20T16:25:29.813' AS DateTime), N'ITEM 10: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-08-20T16:25:31.763' AS DateTime), N'ITEM 11: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (18, CAST(N'2018-08-20T16:32:49.310' AS DateTime), N'ITEM 18: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (19, CAST(N'2018-08-20T16:32:50.463' AS DateTime), N'ITEM 19: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (20, CAST(N'2018-08-20T16:32:51.803' AS DateTime), N'ITEM 20: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (241, CAST(N'2018-08-20T16:33:20.890' AS DateTime), N'ITEM 241: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T17:56:39.583' AS DateTime), N'ITEM 249: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T17:56:45.870' AS DateTime), N'ITEM 250: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:02:30.320' AS DateTime), N'ITEM 249: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:02:30.320' AS DateTime), N'ITEM 249: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:02:30.320' AS DateTime), N'ITEM 249: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:02:30.443' AS DateTime), N'ITEM 250: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:02:30.443' AS DateTime), N'ITEM 250: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:02:30.443' AS DateTime), N'ITEM 250: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:03:00.193' AS DateTime), N'ITEM 249: EN DEPOSITO - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:03:00.203' AS DateTime), N'ITEM 250: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T20:27:28.517' AS DateTime), N'ITEM 134: CANTIDAD - Anterior: 30 CANTIDAD Nueva: 35', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (134, CAST(N'2018-08-06T20:27:28.517' AS DateTime), N'ITEM 134: PRODUCTO - Anterior: 196 PRODUCTO Nuevo: 186', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-08-06T22:12:00.167' AS DateTime), N'ITEM 132: CANTIDAD - Anterior: 20 CANTIDAD Nueva: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (18, CAST(N'2018-08-12T18:39:24.613' AS DateTime), N'ITEM 18: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (19, CAST(N'2018-08-12T18:39:27.057' AS DateTime), N'ITEM 19: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (20, CAST(N'2018-08-12T18:39:28.027' AS DateTime), N'ITEM 20: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (10, CAST(N'2018-08-12T19:39:17.000' AS DateTime), N'ITEM 10: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (11, CAST(N'2018-08-12T19:39:17.253' AS DateTime), N'ITEM 11: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-20T18:04:33.177' AS DateTime), N'ITEM 247: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-20T18:04:33.177' AS DateTime), N'ITEM 247: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-20T18:04:33.177' AS DateTime), N'ITEM 247: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (122, CAST(N'2018-08-20T18:04:54.423' AS DateTime), N'ITEM 122: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (123, CAST(N'2018-08-20T18:04:54.437' AS DateTime), N'ITEM 123: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (7, CAST(N'2018-08-20T18:07:07.617' AS DateTime), N'ITEM 7: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T18:07:07.800' AS DateTime), N'ITEM 8: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (9, CAST(N'2018-08-20T18:07:07.963' AS DateTime), N'ITEM 9: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-20T18:08:29.117' AS DateTime), N'ITEM 246: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-20T18:08:29.117' AS DateTime), N'ITEM 246: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-20T18:08:29.117' AS DateTime), N'ITEM 246: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:11:30.467' AS DateTime), N'ITEM 249: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:11:30.467' AS DateTime), N'ITEM 249: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:11:30.467' AS DateTime), N'ITEM 249: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:11:30.603' AS DateTime), N'ITEM 250: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:11:30.603' AS DateTime), N'ITEM 250: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:11:30.603' AS DateTime), N'ITEM 250: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:12:03.077' AS DateTime), N'ITEM 249: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:12:03.087' AS DateTime), N'ITEM 250: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:12:48.123' AS DateTime), N'ITEM 249: MARCOS TERMINADOS - Anterior: 4 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:12:48.123' AS DateTime), N'ITEM 249: HOJAS TERMINADAS - Anterior: 4 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:12:48.127' AS DateTime), N'ITEM 249: ENSAMBLADAS - Anterior: 4 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:12:48.270' AS DateTime), N'ITEM 250: MARCOS TERMINADOS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:12:48.273' AS DateTime), N'ITEM 250: HOJAS TERMINADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:12:48.273' AS DateTime), N'ITEM 250: ENSAMBLADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:14:46.310' AS DateTime), N'ITEM 249: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:14:46.310' AS DateTime), N'ITEM 249: EN DEPOSITO - Anterior: 4 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:14:46.330' AS DateTime), N'ITEM 250: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:14:46.330' AS DateTime), N'ITEM 250: EN DEPOSITO - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:15:59.993' AS DateTime), N'ITEM 249: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:16:00.007' AS DateTime), N'ITEM 250: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T18:16:20.997' AS DateTime), N'ITEM 249: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T18:16:21.010' AS DateTime), N'ITEM 250: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-20T18:16:30.000' AS DateTime), N'ITEM 247: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T21:59:23.620' AS DateTime), N'ITEM 8: MARCOS TERMINADOS - Anterior: 4 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T21:59:23.620' AS DateTime), N'ITEM 8: HOJAS TERMINADAS - Anterior: 4 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T21:59:23.620' AS DateTime), N'ITEM 8: ENSAMBLADAS - Anterior: 4 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:19:47.103' AS DateTime), N'ITEM 8: MARCOS TERMINADOS - Anterior: 3 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:19:47.103' AS DateTime), N'ITEM 8: ENSAMBLADAS - Anterior: 3 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:20:10.820' AS DateTime), N'ITEM 8: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:20:10.820' AS DateTime), N'ITEM 8: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:20:10.820' AS DateTime), N'ITEM 8: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:22:30.093' AS DateTime), N'ITEM 8: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:22:30.110' AS DateTime), N'ITEM 8: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (9, CAST(N'2018-08-20T22:22:30.127' AS DateTime), N'ITEM 9: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (9, CAST(N'2018-08-20T22:22:30.127' AS DateTime), N'ITEM 9: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (7, CAST(N'2018-08-20T22:32:09.320' AS DateTime), N'ITEM 7: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:32:09.333' AS DateTime), N'ITEM 8: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (9, CAST(N'2018-08-20T22:32:09.350' AS DateTime), N'ITEM 9: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:31:38.460' AS DateTime), N'ITEM 350: MARCOS TERMINADOS - Anterior: 3 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:31:38.463' AS DateTime), N'ITEM 350: HOJAS TERMINADAS - Anterior: 3 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-13T23:03:49.120' AS DateTime), N'ITEM 124: MARCOS TERMINADOS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-13T23:03:49.120' AS DateTime), N'ITEM 124: HOJAS TERMINADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-13T23:03:49.120' AS DateTime), N'ITEM 124: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-13T23:03:49.267' AS DateTime), N'ITEM 239: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-13T23:03:49.267' AS DateTime), N'ITEM 239: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-13T23:03:49.267' AS DateTime), N'ITEM 239: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-13T23:04:02.810' AS DateTime), N'ITEM 124: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-13T23:04:02.810' AS DateTime), N'ITEM 124: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-13T23:04:02.830' AS DateTime), N'ITEM 239: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-13T23:04:02.840' AS DateTime), N'ITEM 239: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T17:38:30.497' AS DateTime), N'ITEM 249: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T17:38:30.633' AS DateTime), N'ITEM 250: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T17:39:00.517' AS DateTime), N'ITEM 249: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T17:39:00.517' AS DateTime), N'ITEM 249: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (249, CAST(N'2018-08-20T17:39:00.517' AS DateTime), N'ITEM 249: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T17:39:00.660' AS DateTime), N'ITEM 250: MARCOS TERMINADOS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T17:39:00.663' AS DateTime), N'ITEM 250: HOJAS TERMINADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (250, CAST(N'2018-08-20T17:39:00.663' AS DateTime), N'ITEM 250: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (8, CAST(N'2018-08-20T22:19:47.103' AS DateTime), N'ITEM 8: HOJAS TERMINADAS - Anterior: 3 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:31:38.463' AS DateTime), N'ITEM 350: ENSAMBLADAS - Anterior: 3 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:33:06.330' AS DateTime), N'ITEM 350: EN DEPOSITO - Anterior: 2 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:34:16.837' AS DateTime), N'ITEM 350: MARCOS TERMINADOS - Anterior: 20 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:34:16.837' AS DateTime), N'ITEM 350: HOJAS TERMINADAS - Anterior: 20 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:34:16.837' AS DateTime), N'ITEM 350: ENSAMBLADAS - Anterior: 20 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:34:42.503' AS DateTime), N'ITEM 350: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:34:42.503' AS DateTime), N'ITEM 350: EN DEPOSITO - Anterior: 20 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-22T02:35:01.737' AS DateTime), N'ITEM 349: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-22T02:35:01.750' AS DateTime), N'ITEM 350: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-08-22T11:46:41.000' AS DateTime), N'ITEM 356: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-08-22T11:47:42.100' AS DateTime), N'ITEM 356: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-08-22T11:47:42.100' AS DateTime), N'ITEM 356: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-08-22T11:47:42.100' AS DateTime), N'ITEM 356: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-08-22T23:39:11.083' AS DateTime), N'ITEM 357: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (358, CAST(N'2018-08-22T23:39:11.210' AS DateTime), N'ITEM 358: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-08-23T23:05:17.937' AS DateTime), N'ITEM 356: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (124, CAST(N'2018-08-23T23:05:34.187' AS DateTime), N'ITEM 124: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (239, CAST(N'2018-08-23T23:05:34.270' AS DateTime), N'ITEM 239: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:41:26.913' AS DateTime), N'ITEM 361: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:06.240' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:06.240' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:06.240' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:50.940' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:50.940' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:45:50.940' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:46:53.340' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:46:53.340' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:46:53.340' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:20.110' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:20.123' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:20.123' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:57.017' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:57.017' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-25T17:49:57.017' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-08-27T22:58:32.027' AS DateTime), N'ITEM 362: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-08-27T22:58:56.007' AS DateTime), N'ITEM 361: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (464, CAST(N'2018-09-02T21:43:17.153' AS DateTime), N'ITEM 464: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (465, CAST(N'2018-09-02T21:43:17.190' AS DateTime), N'ITEM 465: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (464, CAST(N'2018-09-02T21:45:06.717' AS DateTime), N'ITEM 464: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (465, CAST(N'2018-09-02T21:45:06.753' AS DateTime), N'ITEM 465: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (464, CAST(N'2018-09-02T21:58:24.590' AS DateTime), N'ITEM 464: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:14:48.663' AS DateTime), N'ITEM 125: MARCOS TERMINADOS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:14:48.710' AS DateTime), N'ITEM 125: HOJAS TERMINADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:14:48.710' AS DateTime), N'ITEM 125: ENSAMBLADAS - Anterior: 6 Nuevo: 7', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-08-18T16:15:06.017' AS DateTime), N'ITEM 125: EN DEPOSITO - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T21:59:41.583' AS DateTime), N'ITEM 363: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-08-28T21:59:41.770' AS DateTime), N'ITEM 364: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (365, CAST(N'2018-08-29T01:52:29.850' AS DateTime), N'ITEM 365: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-08-29T01:52:30.033' AS DateTime), N'ITEM 366: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-08-29T01:52:53.583' AS DateTime), N'ITEM 366: MARCOS TERMINADOS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-08-29T01:52:53.583' AS DateTime), N'ITEM 366: HOJAS TERMINADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-08-29T01:52:53.583' AS DateTime), N'ITEM 366: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (465, CAST(N'2018-09-02T21:58:24.600' AS DateTime), N'ITEM 465: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T21:59:19.180' AS DateTime), N'ITEM 357: MARCOS TERMINADOS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T21:59:19.183' AS DateTime), N'ITEM 357: HOJAS TERMINADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T21:59:19.183' AS DateTime), N'ITEM 357: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T21:59:32.597' AS DateTime), N'ITEM 357: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T21:59:32.597' AS DateTime), N'ITEM 357: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T22:00:02.297' AS DateTime), N'ITEM 357: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (358, CAST(N'2018-09-02T22:00:02.310' AS DateTime), N'ITEM 358: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (357, CAST(N'2018-09-02T22:00:28.313' AS DateTime), N'ITEM 357: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (358, CAST(N'2018-09-02T22:00:28.323' AS DateTime), N'ITEM 358: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-09-03T15:26:33.317' AS DateTime), N'ITEM 462: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-09-03T15:26:33.583' AS DateTime), N'ITEM 463: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-03T15:27:26.750' AS DateTime), N'ITEM 356: MARCOS TERMINADOS - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-03T15:27:26.750' AS DateTime), N'ITEM 356: HOJAS TERMINADAS - Anterior: 1 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-03T15:27:26.750' AS DateTime), N'ITEM 356: ENSAMBLADAS - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-03T15:28:15.687' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 4 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-03T15:28:15.687' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 6 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-03T15:28:15.687' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 4 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-03T15:28:28.463' AS DateTime), N'ITEM 363: EN DEPOSITO - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-03T15:28:28.480' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 4 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-09-03T15:29:42.053' AS DateTime), N'ITEM 351: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-09-03T15:29:42.070' AS DateTime), N'ITEM 352: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-09-03T15:29:42.100' AS DateTime), N'ITEM 353: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-09-03T15:29:58.027' AS DateTime), N'ITEM 351: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-09-03T15:29:58.027' AS DateTime), N'ITEM 352: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-09-03T15:29:58.043' AS DateTime), N'ITEM 353: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (240, CAST(N'2018-09-03T15:30:20.583' AS DateTime), N'ITEM 240: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (248, CAST(N'2018-09-03T15:30:20.600' AS DateTime), N'ITEM 248: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:20:45.257' AS DateTime), N'ITEM 470: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:21:27.330' AS DateTime), N'ITEM 470: MARCOS TERMINADOS - Anterior: 0 Nuevo: 32', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:21:27.330' AS DateTime), N'ITEM 470: HOJAS TERMINADAS - Anterior: 0 Nuevo: 32', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:21:27.330' AS DateTime), N'ITEM 470: ENSAMBLADAS - Anterior: 0 Nuevo: 32', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:21:59.813' AS DateTime), N'ITEM 470: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:21:59.813' AS DateTime), N'ITEM 470: EN DEPOSITO - Anterior: 0 Nuevo: 32', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:22:16.767' AS DateTime), N'ITEM 470: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (470, CAST(N'2018-09-05T10:22:35.937' AS DateTime), N'ITEM 470: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-08T20:11:59.320' AS DateTime), N'ITEM 471: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-08T20:11:59.510' AS DateTime), N'ITEM 472: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (476, CAST(N'2018-09-08T21:54:23.450' AS DateTime), N'ITEM 476: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T21:54:23.607' AS DateTime), N'ITEM 477: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T21:54:23.767' AS DateTime), N'ITEM 478: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:58:11.637' AS DateTime), N'ITEM 474: MARCOS TERMINADOS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:58:11.637' AS DateTime), N'ITEM 474: HOJAS TERMINADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:58:11.637' AS DateTime), N'ITEM 474: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T21:58:11.793' AS DateTime), N'ITEM 477: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-21T22:07:14.790' AS DateTime), N'ITEM 246: MARCOS TERMINADOS - Anterior: 5 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-21T22:07:14.790' AS DateTime), N'ITEM 246: HOJAS TERMINADAS - Anterior: 5 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-21T22:07:14.790' AS DateTime), N'ITEM 246: ENSAMBLADAS - Anterior: 5 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-21T22:07:29.397' AS DateTime), N'ITEM 246: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-08-21T22:07:29.413' AS DateTime), N'ITEM 246: EN DEPOSITO - Anterior: 0 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (247, CAST(N'2018-08-22T01:08:32.923' AS DateTime), N'ITEM 247: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (245, CAST(N'2018-08-22T01:12:18.117' AS DateTime), N'ITEM 245: MARCOS TERMINADOS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (245, CAST(N'2018-08-22T01:12:18.120' AS DateTime), N'ITEM 245: HOJAS TERMINADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (245, CAST(N'2018-08-22T01:12:18.120' AS DateTime), N'ITEM 245: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (245, CAST(N'2018-08-22T01:13:45.867' AS DateTime), N'ITEM 245: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (242, CAST(N'2018-08-22T01:17:31.050' AS DateTime), N'ITEM 242: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (242, CAST(N'2018-08-22T01:17:31.053' AS DateTime), N'ITEM 242: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (242, CAST(N'2018-08-22T01:17:31.053' AS DateTime), N'ITEM 242: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (242, CAST(N'2018-08-22T01:18:39.617' AS DateTime), N'ITEM 242: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (354, CAST(N'2018-08-22T01:20:54.593' AS DateTime), N'ITEM 354: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (354, CAST(N'2018-08-22T01:21:11.150' AS DateTime), N'ITEM 354: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (354, CAST(N'2018-08-22T01:21:11.150' AS DateTime), N'ITEM 354: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (354, CAST(N'2018-08-22T01:21:11.150' AS DateTime), N'ITEM 354: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (354, CAST(N'2018-08-22T01:31:56.690' AS DateTime), N'ITEM 354: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (355, CAST(N'2018-08-22T01:34:43.580' AS DateTime), N'ITEM 355: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (355, CAST(N'2018-08-22T01:35:14.010' AS DateTime), N'ITEM 355: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (355, CAST(N'2018-08-22T01:35:14.013' AS DateTime), N'ITEM 355: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (355, CAST(N'2018-08-22T01:35:14.013' AS DateTime), N'ITEM 355: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (355, CAST(N'2018-08-22T01:35:48.007' AS DateTime), N'ITEM 355: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-08-23T20:34:41.633' AS DateTime), N'ITEM 359: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-08-23T20:34:53.927' AS DateTime), N'ITEM 360: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:54:23.373' AS DateTime), N'ITEM 474: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (475, CAST(N'2018-09-08T21:54:23.417' AS DateTime), N'ITEM 475: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T21:58:11.793' AS DateTime), N'ITEM 477: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T21:58:11.793' AS DateTime), N'ITEM 477: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T21:58:11.963' AS DateTime), N'ITEM 478: MARCOS TERMINADOS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T21:58:11.963' AS DateTime), N'ITEM 478: HOJAS TERMINADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T21:58:11.963' AS DateTime), N'ITEM 478: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:59:21.847' AS DateTime), N'ITEM 474: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T21:59:21.847' AS DateTime), N'ITEM 474: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T21:59:21.860' AS DateTime), N'ITEM 477: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T21:59:21.893' AS DateTime), N'ITEM 478: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:02:23.637' AS DateTime), N'ITEM 477: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:02:23.637' AS DateTime), N'ITEM 477: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:02:23.637' AS DateTime), N'ITEM 477: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:02:23.793' AS DateTime), N'ITEM 478: MARCOS TERMINADOS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:02:23.793' AS DateTime), N'ITEM 478: HOJAS TERMINADAS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:02:23.797' AS DateTime), N'ITEM 478: ENSAMBLADAS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:02:33.693' AS DateTime), N'ITEM 477: EN DEPOSITO - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:02:33.703' AS DateTime), N'ITEM 478: EN DEPOSITO - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:13.340' AS DateTime), N'ITEM 477: MARCOS TERMINADOS - Anterior: 3 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:13.343' AS DateTime), N'ITEM 477: HOJAS TERMINADAS - Anterior: 3 Nuevo: 5', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:13.343' AS DateTime), N'ITEM 477: ENSAMBLADAS - Anterior: 3 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:13.497' AS DateTime), N'ITEM 478: MARCOS TERMINADOS - Anterior: 21 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:13.497' AS DateTime), N'ITEM 478: HOJAS TERMINADAS - Anterior: 21 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:13.497' AS DateTime), N'ITEM 478: ENSAMBLADAS - Anterior: 21 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:22.300' AS DateTime), N'ITEM 477: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:22.300' AS DateTime), N'ITEM 477: EN DEPOSITO - Anterior: 3 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:22.323' AS DateTime), N'ITEM 478: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:22.323' AS DateTime), N'ITEM 478: EN DEPOSITO - Anterior: 21 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T22:03:59.217' AS DateTime), N'ITEM 474: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (475, CAST(N'2018-09-08T22:03:59.240' AS DateTime), N'ITEM 475: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (476, CAST(N'2018-09-08T22:03:59.253' AS DateTime), N'ITEM 476: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:03:59.433' AS DateTime), N'ITEM 477: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:38:01.570' AS DateTime), N'ITEM 349: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:38:01.740' AS DateTime), N'ITEM 350: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:38:47.303' AS DateTime), N'ITEM 349: MARCOS TERMINADOS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:38:47.303' AS DateTime), N'ITEM 349: HOJAS TERMINADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:38:47.303' AS DateTime), N'ITEM 349: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:38:47.443' AS DateTime), N'ITEM 350: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:38:47.443' AS DateTime), N'ITEM 350: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:38:47.443' AS DateTime), N'ITEM 350: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:39:38.610' AS DateTime), N'ITEM 349: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:39:38.623' AS DateTime), N'ITEM 350: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:53:45.893' AS DateTime), N'ITEM 349: MARCOS TERMINADOS - Anterior: 3 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:53:45.893' AS DateTime), N'ITEM 349: HOJAS TERMINADAS - Anterior: 3 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:53:45.893' AS DateTime), N'ITEM 349: ENSAMBLADAS - Anterior: 3 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:53:53.143' AS DateTime), N'ITEM 349: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-21T22:53:53.143' AS DateTime), N'ITEM 349: EN DEPOSITO - Anterior: 3 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:58:00.427' AS DateTime), N'ITEM 350: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:58:00.427' AS DateTime), N'ITEM 350: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-21T22:58:00.427' AS DateTime), N'ITEM 350: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:03:54.283' AS DateTime), N'ITEM 351: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:03:54.440' AS DateTime), N'ITEM 352: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:04:28.107' AS DateTime), N'ITEM 351: MARCOS TERMINADOS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:04:28.107' AS DateTime), N'ITEM 351: HOJAS TERMINADAS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:04:28.107' AS DateTime), N'ITEM 351: ENSAMBLADAS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:05:20.310' AS DateTime), N'ITEM 351: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (351, CAST(N'2018-08-21T23:05:20.340' AS DateTime), N'ITEM 351: EN DEPOSITO - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:08:19.737' AS DateTime), N'ITEM 352: MARCOS TERMINADOS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:08:19.737' AS DateTime), N'ITEM 352: HOJAS TERMINADAS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:08:19.753' AS DateTime), N'ITEM 352: ENSAMBLADAS - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:09:10.997' AS DateTime), N'ITEM 353: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:11:38.073' AS DateTime), N'ITEM 352: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (352, CAST(N'2018-08-21T23:11:38.090' AS DateTime), N'ITEM 352: EN DEPOSITO - Anterior: 0 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:12:48.607' AS DateTime), N'ITEM 353: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:12:48.607' AS DateTime), N'ITEM 353: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:12:48.607' AS DateTime), N'ITEM 353: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:13:19.597' AS DateTime), N'ITEM 353: MARCOS TERMINADOS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:13:19.597' AS DateTime), N'ITEM 353: HOJAS TERMINADAS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:13:19.597' AS DateTime), N'ITEM 353: ENSAMBLADAS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:14:02.730' AS DateTime), N'ITEM 353: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (353, CAST(N'2018-08-21T23:14:02.730' AS DateTime), N'ITEM 353: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:03:59.453' AS DateTime), N'ITEM 478: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:11.780' AS DateTime), N'ITEM 479: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:23.767' AS DateTime), N'ITEM 479: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:23.767' AS DateTime), N'ITEM 479: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:23.767' AS DateTime), N'ITEM 479: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:32.073' AS DateTime), N'ITEM 479: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:05:32.073' AS DateTime), N'ITEM 479: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (479, CAST(N'2018-09-08T22:12:14.810' AS DateTime), N'ITEM 479: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (474, CAST(N'2018-09-08T22:13:18.820' AS DateTime), N'ITEM 474: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (475, CAST(N'2018-09-08T22:13:18.833' AS DateTime), N'ITEM 475: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (476, CAST(N'2018-09-08T22:13:18.843' AS DateTime), N'ITEM 476: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (477, CAST(N'2018-09-08T22:13:18.867' AS DateTime), N'ITEM 477: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (478, CAST(N'2018-09-08T22:13:18.880' AS DateTime), N'ITEM 478: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:41:02.253' AS DateTime), N'ITEM 482: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:41:02.393' AS DateTime), N'ITEM 484: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-09-16T23:59:22.453' AS DateTime), N'ITEM 485: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-09-17T00:14:39.937' AS DateTime), N'ITEM 486: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-09-17T00:14:57.827' AS DateTime), N'ITEM 487: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-09-17T00:15:00.030' AS DateTime), N'ITEM 488: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:01:17.107' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:01:17.123' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:01:17.123' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-08-28T22:01:17.310' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-08-28T22:01:17.310' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 0 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-08-28T22:01:17.310' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:02:38.057' AS DateTime), N'ITEM 363: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-08-28T22:02:38.303' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:03:13.693' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:03:13.693' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-08-28T22:03:13.693' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (349, CAST(N'2018-08-28T22:04:16.097' AS DateTime), N'ITEM 349: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (350, CAST(N'2018-08-28T22:04:16.110' AS DateTime), N'ITEM 350: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-09-17T00:22:07.470' AS DateTime), N'ITEM 489: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-09-17T00:22:07.630' AS DateTime), N'ITEM 490: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (491, CAST(N'2018-09-17T19:41:06.213' AS DateTime), N'ITEM 491: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2018-09-17T19:41:06.230' AS DateTime), N'ITEM 492: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (493, CAST(N'2018-09-17T20:00:29.713' AS DateTime), N'ITEM 493: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (494, CAST(N'2018-09-17T20:00:29.713' AS DateTime), N'ITEM 494: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-17T20:03:16.390' AS DateTime), N'ITEM 495: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-17T23:39:33.790' AS DateTime), N'ITEM 481: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-17T23:44:11.947' AS DateTime), N'ITEM 481: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-17T23:44:11.947' AS DateTime), N'ITEM 481: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-18T09:57:35.720' AS DateTime), N'ITEM 495: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-18T11:01:44.300' AS DateTime), N'ITEM 495: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-18T11:01:44.300' AS DateTime), N'ITEM 495: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (473, CAST(N'2018-09-23T23:56:12.500' AS DateTime), N'ITEM 473: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (473, CAST(N'2018-09-24T00:14:27.930' AS DateTime), N'ITEM 473: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-24T00:16:06.647' AS DateTime), N'ITEM 482: EN DEPOSITO - Anterior: 0 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-24T00:16:06.650' AS DateTime), N'ITEM 484: EN DEPOSITO - Anterior: 0 Nuevo: 6', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:18:26.200' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:18:26.200' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:18:26.200' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:18:26.327' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:18:26.327' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:18:26.327' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:18:57.683' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:18:57.697' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:27:25.143' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-24T00:33:41.583' AS DateTime), N'ITEM 481: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-24T00:33:41.583' AS DateTime), N'ITEM 481: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:30:30.393' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:30:30.393' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:30:30.410' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:30:30.533' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:30:30.533' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:30:30.533' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:31:14.103' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:31:14.117' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:36:21.423' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:36:21.427' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:36:21.427' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (246, CAST(N'2018-09-25T06:43:21.417' AS DateTime), N'ITEM 246: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-25T06:43:21.420' AS DateTime), N'ITEM 481: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:46:18.880' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:46:18.880' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:46:18.880' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:46:24.993' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:46:24.997' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:04.793' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 6 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:04.793' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 6 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (466, CAST(N'2018-09-05T03:10:31.840' AS DateTime), N'ITEM 466: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (467, CAST(N'2018-09-05T03:10:31.970' AS DateTime), N'ITEM 467: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-05T03:14:11.443' AS DateTime), N'ITEM 468: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-05T03:14:11.623' AS DateTime), N'ITEM 469: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (473, CAST(N'2018-09-06T20:23:41.887' AS DateTime), N'ITEM 473: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:27:25.143' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:24.973' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:24.973' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:24.973' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:41.813' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:41.813' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:41.813' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:46.940' AS DateTime), N'ITEM 361: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:30:46.940' AS DateTime), N'ITEM 361: EN DEPOSITO - Anterior: 5 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:32:31.020' AS DateTime), N'ITEM 361: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:35:58.020' AS DateTime), N'ITEM 361: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:13.963' AS DateTime), N'ITEM 366: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:13.963' AS DateTime), N'ITEM 366: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:13.963' AS DateTime), N'ITEM 366: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:40.970' AS DateTime), N'ITEM 366: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:52.923' AS DateTime), N'ITEM 366: MARCOS TERMINADOS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:52.923' AS DateTime), N'ITEM 366: HOJAS TERMINADAS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:37:52.923' AS DateTime), N'ITEM 366: ENSAMBLADAS - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:08.110' AS DateTime), N'ITEM 366: EN DEPOSITO - Anterior: 5 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:22.610' AS DateTime), N'ITEM 366: MARCOS TERMINADOS - Anterior: 7 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:22.610' AS DateTime), N'ITEM 366: HOJAS TERMINADAS - Anterior: 7 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:22.610' AS DateTime), N'ITEM 366: ENSAMBLADAS - Anterior: 7 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:31.487' AS DateTime), N'ITEM 366: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-25T07:38:31.487' AS DateTime), N'ITEM 366: EN DEPOSITO - Anterior: 7 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:31.027' AS DateTime), N'ITEM 482: MARCOS TERMINADOS - Anterior: 11 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:31.027' AS DateTime), N'ITEM 482: HOJAS TERMINADAS - Anterior: 11 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:31.043' AS DateTime), N'ITEM 482: ENSAMBLADAS - Anterior: 11 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:41:31.043' AS DateTime), N'ITEM 484: MARCOS TERMINADOS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:41:31.043' AS DateTime), N'ITEM 484: HOJAS TERMINADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:41:31.043' AS DateTime), N'ITEM 484: ENSAMBLADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:43.467' AS DateTime), N'ITEM 482: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:50.547' AS DateTime), N'ITEM 482: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:41:50.547' AS DateTime), N'ITEM 482: EN DEPOSITO - Anterior: 11 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:41:50.560' AS DateTime), N'ITEM 484: EN DEPOSITO - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:47:41.240' AS DateTime), N'ITEM 484: MARCOS TERMINADOS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:47:41.240' AS DateTime), N'ITEM 484: HOJAS TERMINADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:47:41.240' AS DateTime), N'ITEM 484: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:13.033' AS DateTime), N'ITEM 484: MARCOS TERMINADOS - Anterior: 8 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:13.033' AS DateTime), N'ITEM 484: HOJAS TERMINADAS - Anterior: 8 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:13.050' AS DateTime), N'ITEM 484: ENSAMBLADAS - Anterior: 8 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:21.017' AS DateTime), N'ITEM 484: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:21.017' AS DateTime), N'ITEM 484: EN DEPOSITO - Anterior: 7 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:50:36.390' AS DateTime), N'ITEM 482: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:50:36.390' AS DateTime), N'ITEM 484: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-25T07:52:13.230' AS DateTime), N'ITEM 482: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-25T07:52:13.230' AS DateTime), N'ITEM 484: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (129, CAST(N'2018-09-25T07:52:42.933' AS DateTime), N'ITEM 129: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (130, CAST(N'2018-09-25T07:52:42.933' AS DateTime), N'ITEM 130: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-25T07:53:08.100' AS DateTime), N'ITEM 495: MARCOS TERMINADOS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-25T07:53:08.100' AS DateTime), N'ITEM 495: HOJAS TERMINADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-25T07:53:08.100' AS DateTime), N'ITEM 495: ENSAMBLADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-25T07:53:28.717' AS DateTime), N'ITEM 495: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-09-25T07:53:28.717' AS DateTime), N'ITEM 495: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T00:55:22.053' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T00:55:22.053' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (481, CAST(N'2018-09-10T15:32:11.963' AS DateTime), N'ITEM 481: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:44:46.200' AS DateTime), N'ITEM 480: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:15.760' AS DateTime), N'ITEM 480: MARCOS TERMINADOS - Anterior: 0 Nuevo: 50', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:15.763' AS DateTime), N'ITEM 480: HOJAS TERMINADAS - Anterior: 0 Nuevo: 50', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:15.763' AS DateTime), N'ITEM 480: ENSAMBLADAS - Anterior: 0 Nuevo: 50', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:41.150' AS DateTime), N'ITEM 480: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:41.150' AS DateTime), N'ITEM 480: EN DEPOSITO - Anterior: 0 Nuevo: 50', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (480, CAST(N'2018-09-10T15:45:59.123' AS DateTime), N'ITEM 480: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:26:23.953' AS DateTime), N'ITEM 483: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:27:17.997' AS DateTime), N'ITEM 483: MARCOS TERMINADOS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:27:17.997' AS DateTime), N'ITEM 483: HOJAS TERMINADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:27:18.000' AS DateTime), N'ITEM 483: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:27:26.543' AS DateTime), N'ITEM 483: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:27:26.547' AS DateTime), N'ITEM 483: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:28:30.840' AS DateTime), N'ITEM 483: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (483, CAST(N'2018-09-10T16:29:28.660' AS DateTime), N'ITEM 483: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:46:35.420' AS DateTime), N'ITEM 482: MARCOS TERMINADOS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:46:35.420' AS DateTime), N'ITEM 482: HOJAS TERMINADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:46:35.420' AS DateTime), N'ITEM 482: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:46:35.550' AS DateTime), N'ITEM 484: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:46:35.550' AS DateTime), N'ITEM 484: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:46:35.553' AS DateTime), N'ITEM 484: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:50:28.870' AS DateTime), N'ITEM 482: MARCOS TERMINADOS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:50:28.870' AS DateTime), N'ITEM 482: HOJAS TERMINADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (482, CAST(N'2018-09-10T18:50:28.873' AS DateTime), N'ITEM 482: ENSAMBLADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:51:34.093' AS DateTime), N'ITEM 484: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:51:34.097' AS DateTime), N'ITEM 484: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (484, CAST(N'2018-09-10T18:51:34.097' AS DateTime), N'ITEM 484: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-10T18:53:23.287' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-10T18:53:23.287' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-10T18:53:23.287' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-10T18:53:50.957' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-10T18:53:50.957' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-10T18:53:50.957' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-10T19:02:28.423' AS DateTime), N'ITEM 356: EN DEPOSITO - Anterior: 1 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-09-10T19:06:46.650' AS DateTime), N'ITEM 366: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-10T19:13:43.547' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-10T19:13:43.560' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:17:41.510' AS DateTime), N'ITEM 359: MARCOS TERMINADOS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:17:41.510' AS DateTime), N'ITEM 359: HOJAS TERMINADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:17:41.510' AS DateTime), N'ITEM 359: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:17:41.667' AS DateTime), N'ITEM 360: MARCOS TERMINADOS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:17:41.670' AS DateTime), N'ITEM 360: HOJAS TERMINADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:17:41.670' AS DateTime), N'ITEM 360: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:17:41.680' AS DateTime), N'ITEM 362: MARCOS TERMINADOS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:17:41.680' AS DateTime), N'ITEM 362: HOJAS TERMINADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:19:06.820' AS DateTime), N'ITEM 359: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:19:06.833' AS DateTime), N'ITEM 360: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:21:07.227' AS DateTime), N'ITEM 359: MARCOS TERMINADOS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:21:07.230' AS DateTime), N'ITEM 359: HOJAS TERMINADAS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:21:07.230' AS DateTime), N'ITEM 359: ENSAMBLADAS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:21:13.110' AS DateTime), N'ITEM 359: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:21:13.110' AS DateTime), N'ITEM 359: EN DEPOSITO - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-10T19:26:39.180' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 5 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-10T19:26:39.183' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 5 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-10T19:26:39.183' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 5 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:27:08.167' AS DateTime), N'ITEM 360: MARCOS TERMINADOS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:27:08.167' AS DateTime), N'ITEM 360: HOJAS TERMINADAS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:27:08.167' AS DateTime), N'ITEM 360: ENSAMBLADAS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:27:08.323' AS DateTime), N'ITEM 362: MARCOS TERMINADOS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:27:08.323' AS DateTime), N'ITEM 362: HOJAS TERMINADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:27:08.327' AS DateTime), N'ITEM 362: ENSAMBLADAS - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:27:29.237' AS DateTime), N'ITEM 360: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:27:29.240' AS DateTime), N'ITEM 360: EN DEPOSITO - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:27:29.263' AS DateTime), N'ITEM 362: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:27:29.263' AS DateTime), N'ITEM 362: EN DEPOSITO - Anterior: 0 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:28:16.870' AS DateTime), N'ITEM 359: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:28:16.883' AS DateTime), N'ITEM 360: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:28:16.897' AS DateTime), N'ITEM 362: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (359, CAST(N'2018-09-10T19:30:34.310' AS DateTime), N'ITEM 359: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (360, CAST(N'2018-09-10T19:30:34.320' AS DateTime), N'ITEM 360: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (362, CAST(N'2018-09-10T19:30:34.333' AS DateTime), N'ITEM 362: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T00:55:22.053' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T00:55:22.210' AS DateTime), N'ITEM 487: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T00:55:22.210' AS DateTime), N'ITEM 487: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T00:55:22.210' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T00:59:02.880' AS DateTime), N'ITEM 487: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T00:59:02.880' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-11-04T00:59:03.007' AS DateTime), N'ITEM 488: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-11-04T00:59:03.020' AS DateTime), N'ITEM 488: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-11-04T00:59:03.020' AS DateTime), N'ITEM 488: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:40:48.250' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 17 Nuevo: 18', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:40:48.253' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 17 Nuevo: 18', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:40:48.253' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 17 Nuevo: 18', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:42:01.773' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 18 Nuevo: 19', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:42:04.090' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 18 Nuevo: 19', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:42:06.580' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 18 Nuevo: 19', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:43:52.390' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 19 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:43:53.757' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 19 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:43:58.797' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 19 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:59:10.307' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:59:10.307' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:59:10.310' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:13:02.190' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:13:02.400' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:17:03.343' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 6 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:17:03.343' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 6 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:17:03.343' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:17:03.480' AS DateTime), N'ITEM 487: MARCOS TERMINADOS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:17:03.480' AS DateTime), N'ITEM 487: HOJAS TERMINADAS - Anterior: 1 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:17:03.480' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:20:18.653' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 3 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:20:42.243' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:21:27.343' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:21:27.507' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 3 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:21:57.930' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 9 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T02:22:07.613' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:22:07.643' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T11:20:21.820' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 9 Nuevo: 10', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T11:20:22.010' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T11:55:44.770' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 10 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T11:56:00.280' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 9 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T11:56:00.297' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (495, CAST(N'2018-11-04T11:57:08.163' AS DateTime), N'ITEM 495: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (466, CAST(N'2018-11-04T12:04:52.663' AS DateTime), N'ITEM 466: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (467, CAST(N'2018-11-04T12:04:52.933' AS DateTime), N'ITEM 467: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (466, CAST(N'2018-11-04T12:05:03.500' AS DateTime), N'ITEM 466: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (467, CAST(N'2018-11-04T12:05:03.510' AS DateTime), N'ITEM 467: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (466, CAST(N'2018-11-04T17:54:13.010' AS DateTime), N'ITEM 466: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (467, CAST(N'2018-11-04T17:54:13.167' AS DateTime), N'ITEM 467: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-11-04T19:51:47.827' AS DateTime), N'ITEM 462: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-11-04T19:51:47.963' AS DateTime), N'ITEM 463: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-11-04T22:02:45.023' AS DateTime), N'ITEM 485: ENSAMBLADAS - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-11-04T22:03:26.250' AS DateTime), N'ITEM 485: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-11-04T22:33:55.330' AS DateTime), N'ITEM 462: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:27:25.143' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:27:25.290' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:27:25.290' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:27:25.290' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:29:36.203' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:29:36.213' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:30:43.920' AS DateTime), N'ITEM 471: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:30:43.920' AS DateTime), N'ITEM 471: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:30:43.920' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:30:44.047' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:30:44.047' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:30:44.047' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-24T00:30:52.580' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-24T00:30:52.600' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-25T12:59:00.980' AS DateTime), N'ITEM 468: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-25T12:59:00.980' AS DateTime), N'ITEM 468: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-25T12:59:00.980' AS DateTime), N'ITEM 468: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-25T12:59:01.167' AS DateTime), N'ITEM 469: MARCOS TERMINADOS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-25T12:59:01.167' AS DateTime), N'ITEM 469: HOJAS TERMINADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-25T12:59:01.167' AS DateTime), N'ITEM 469: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-25T12:59:29.743' AS DateTime), N'ITEM 468: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-09-25T12:59:29.743' AS DateTime), N'ITEM 468: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-25T12:59:29.823' AS DateTime), N'ITEM 469: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-09-25T12:59:29.840' AS DateTime), N'ITEM 469: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-11-04T22:33:55.330' AS DateTime), N'ITEM 462: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-11-04T22:33:55.410' AS DateTime), N'ITEM 463: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-11-04T22:33:55.410' AS DateTime), N'ITEM 463: ENSAMBLADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:05:10.067' AS DateTime), N'ITEM 489: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:05:10.073' AS DateTime), N'ITEM 490: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:05:16.277' AS DateTime), N'ITEM 489: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:05:16.277' AS DateTime), N'ITEM 490: EN DEPOSITO - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:07:23.097' AS DateTime), N'ITEM 489: ENSAMBLADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:07:23.103' AS DateTime), N'ITEM 490: ENSAMBLADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:07:28.877' AS DateTime), N'ITEM 489: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:07:28.880' AS DateTime), N'ITEM 489: EN DEPOSITO - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:07:28.880' AS DateTime), N'ITEM 490: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:07:28.883' AS DateTime), N'ITEM 490: EN DEPOSITO - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:07:50.080' AS DateTime), N'ITEM 489: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:07:50.083' AS DateTime), N'ITEM 490: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:08:08.753' AS DateTime), N'ITEM 489: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:08:08.757' AS DateTime), N'ITEM 490: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:15:37.483' AS DateTime), N'ITEM 496: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:15:37.620' AS DateTime), N'ITEM 497: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:16:47.920' AS DateTime), N'ITEM 496: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:16:47.920' AS DateTime), N'ITEM 496: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:16:48.070' AS DateTime), N'ITEM 497: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:16:48.070' AS DateTime), N'ITEM 497: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:17:24.773' AS DateTime), N'ITEM 496: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:17:24.783' AS DateTime), N'ITEM 497: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:18:06.363' AS DateTime), N'ITEM 496: ENSAMBLADAS - Anterior: 4 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:18:06.507' AS DateTime), N'ITEM 497: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:18:26.110' AS DateTime), N'ITEM 496: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (496, CAST(N'2018-11-05T18:18:26.113' AS DateTime), N'ITEM 496: EN DEPOSITO - Anterior: 4 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:18:26.133' AS DateTime), N'ITEM 497: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (497, CAST(N'2018-11-05T18:18:26.137' AS DateTime), N'ITEM 497: EN DEPOSITO - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (365, CAST(N'2018-11-05T18:20:12.120' AS DateTime), N'ITEM 365: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-11-05T18:20:12.130' AS DateTime), N'ITEM 366: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (365, CAST(N'2018-11-05T18:21:06.970' AS DateTime), N'ITEM 365: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (366, CAST(N'2018-11-05T18:21:06.983' AS DateTime), N'ITEM 366: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:19:19.470' AS DateTime), N'ITEM 593: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:04.793' AS DateTime), N'ITEM 471: ENSAMBLADAS - Anterior: 6 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:04.803' AS DateTime), N'ITEM 472: MARCOS TERMINADOS - Anterior: 7 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:04.807' AS DateTime), N'ITEM 472: HOJAS TERMINADAS - Anterior: 7 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:04.807' AS DateTime), N'ITEM 472: ENSAMBLADAS - Anterior: 7 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:12.327' AS DateTime), N'ITEM 471: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:12.327' AS DateTime), N'ITEM 471: EN DEPOSITO - Anterior: 6 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:12.330' AS DateTime), N'ITEM 472: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:12.330' AS DateTime), N'ITEM 472: EN DEPOSITO - Anterior: 7 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (471, CAST(N'2018-09-25T06:47:30.880' AS DateTime), N'ITEM 471: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (472, CAST(N'2018-09-25T06:47:30.880' AS DateTime), N'ITEM 472: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:49:48.687' AS DateTime), N'ITEM 356: MARCOS TERMINADOS - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:49:48.687' AS DateTime), N'ITEM 356: HOJAS TERMINADAS - Anterior: 6 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:49:48.687' AS DateTime), N'ITEM 356: ENSAMBLADAS - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:49:57.577' AS DateTime), N'ITEM 356: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:49:57.577' AS DateTime), N'ITEM 356: EN DEPOSITO - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-09-25T06:50:36.530' AS DateTime), N'ITEM 356: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (125, CAST(N'2018-09-25T06:56:23.837' AS DateTime), N'ITEM 125: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:09:10.493' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:09:10.497' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:09:10.497' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 22 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:10:42.160' AS DateTime), N'ITEM 361: MARCOS TERMINADOS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:10:42.160' AS DateTime), N'ITEM 361: HOJAS TERMINADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (361, CAST(N'2018-09-25T07:10:42.160' AS DateTime), N'ITEM 361: ENSAMBLADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:11:06.120' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 7 Nuevo: 8', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:11:06.120' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:11:29.077' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:11:29.077' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:11:29.077' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:11:29.083' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:11:29.083' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:11:29.087' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:12:57.563' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:12:57.563' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:12:57.563' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:12:57.573' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:12:57.573' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:12:57.573' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:13:49.870' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:13:49.870' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:13:49.870' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:13:49.880' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:13:49.880' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:13:49.880' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:14:21.623' AS DateTime), N'ITEM 363: EN DEPOSITO - Anterior: 6 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:14:21.623' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 7 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:15:31.483' AS DateTime), N'ITEM 363: MARCOS TERMINADOS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:15:31.487' AS DateTime), N'ITEM 363: HOJAS TERMINADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:15:31.487' AS DateTime), N'ITEM 363: ENSAMBLADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:15:31.493' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 11 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:15:31.493' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 11 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:15:31.497' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 11 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:15:58.093' AS DateTime), N'ITEM 363: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:15:58.097' AS DateTime), N'ITEM 363: EN DEPOSITO - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:15:58.097' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 11 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:15.230' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:15.230' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:15.230' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:24.090' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:43.387' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:43.387' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:16:43.387' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:23.723' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:23.723' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:23.727' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:27.150' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 14 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:55.267' AS DateTime), N'ITEM 364: MARCOS TERMINADOS - Anterior: 16 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:55.267' AS DateTime), N'ITEM 364: HOJAS TERMINADAS - Anterior: 16 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:55.267' AS DateTime), N'ITEM 364: ENSAMBLADAS - Anterior: 16 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:59.903' AS DateTime), N'ITEM 364: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:18:59.903' AS DateTime), N'ITEM 364: EN DEPOSITO - Anterior: 16 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:20:03.807' AS DateTime), N'ITEM 363: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:20:03.807' AS DateTime), N'ITEM 364: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (363, CAST(N'2018-09-25T07:20:13.740' AS DateTime), N'ITEM 363: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (364, CAST(N'2018-09-25T07:20:13.743' AS DateTime), N'ITEM 364: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (594, CAST(N'2018-11-11T20:19:19.477' AS DateTime), N'ITEM 594: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:20:00.570' AS DateTime), N'ITEM 593: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:20:00.570' AS DateTime), N'ITEM 593: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:20:25.463' AS DateTime), N'ITEM 593: ENSAMBLADAS - Anterior: 2 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:21:17.180' AS DateTime), N'ITEM 593: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:23:49.617' AS DateTime), N'ITEM 593: ENSAMBLADAS - Anterior: 3 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:24:06.240' AS DateTime), N'ITEM 593: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:24:06.243' AS DateTime), N'ITEM 593: EN DEPOSITO - Anterior: 3 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:25:25.263' AS DateTime), N'ITEM 593: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (594, CAST(N'2018-11-11T20:25:25.267' AS DateTime), N'ITEM 594: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (593, CAST(N'2018-11-11T20:26:09.510' AS DateTime), N'ITEM 593: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (594, CAST(N'2018-11-11T20:26:09.513' AS DateTime), N'ITEM 594: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-11T20:29:15.733' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 12 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-11T20:29:15.740' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-11T20:29:42.953' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 12 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-11T20:29:42.953' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2018-11-11T20:37:08.007' AS DateTime), N'ITEM 595: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2018-11-11T20:37:08.017' AS DateTime), N'ITEM 596: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2018-11-11T20:37:17.830' AS DateTime), N'ITEM 595: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2018-11-11T20:37:17.830' AS DateTime), N'ITEM 595: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2018-11-11T20:37:17.840' AS DateTime), N'ITEM 596: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2018-11-11T20:37:17.840' AS DateTime), N'ITEM 596: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2018-11-11T20:37:22.090' AS DateTime), N'ITEM 595: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2018-11-11T20:37:22.093' AS DateTime), N'ITEM 596: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-11T22:24:10.690' AS DateTime), N'ITEM 597: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-11T22:24:10.700' AS DateTime), N'ITEM 598: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:27:26.653' AS DateTime), N'ITEM 599: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (600, CAST(N'2018-11-11T22:27:26.657' AS DateTime), N'ITEM 600: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:32:30.667' AS DateTime), N'ITEM 599: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:32:30.667' AS DateTime), N'ITEM 599: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:32:54.210' AS DateTime), N'ITEM 599: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:33:20.300' AS DateTime), N'ITEM 599: ENSAMBLADAS - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:33:27.573' AS DateTime), N'ITEM 599: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:33:27.573' AS DateTime), N'ITEM 599: EN DEPOSITO - Anterior: 5 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:33:56.607' AS DateTime), N'ITEM 599: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (600, CAST(N'2018-11-11T22:33:56.610' AS DateTime), N'ITEM 600: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (599, CAST(N'2018-11-11T22:34:18.800' AS DateTime), N'ITEM 599: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (600, CAST(N'2018-11-11T22:34:18.800' AS DateTime), N'ITEM 600: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (356, CAST(N'2018-11-11T22:40:47.263' AS DateTime), N'ITEM 356: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (132, CAST(N'2018-11-11T22:42:00.917' AS DateTime), N'ITEM 132: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (133, CAST(N'2018-11-11T22:42:00.920' AS DateTime), N'ITEM 133: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (234, CAST(N'2018-11-11T22:42:00.920' AS DateTime), N'ITEM 234: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (235, CAST(N'2018-11-11T22:42:00.920' AS DateTime), N'ITEM 235: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (236, CAST(N'2018-11-11T22:42:00.923' AS DateTime), N'ITEM 236: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:04:35.900' AS DateTime), N'ITEM 486: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:04:35.900' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:04:35.930' AS DateTime), N'ITEM 487: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:04:35.930' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-11-04T01:04:35.963' AS DateTime), N'ITEM 488: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2018-11-04T01:04:35.963' AS DateTime), N'ITEM 488: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:20:35.617' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:20:35.620' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:20:35.620' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:29.053' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:29.053' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:29.053' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:58.370' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:58.373' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:21:58.373' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:19.043' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:19.047' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:19.047' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 6 Nuevo: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:41.327' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:41.330' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:22:41.330' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 7 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:16.853' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:16.853' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:16.853' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 8 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:38.267' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:38.270' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:24:38.270' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 9 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:26:14.237' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:26:14.237' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:26:14.240' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 10 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:31:04.960' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 11 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:31:04.960' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 11 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:31:04.960' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 11 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:32:51.570' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 12 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:32:51.570' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 12 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:32:51.573' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 12 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:08.230' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:08.230' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:08.233' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 13 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:42.037' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:42.037' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:35:42.040' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 14 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:38:10.817' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:38:10.817' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:38:10.820' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 15 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:39:25.350' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 16 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:39:25.353' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 16 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:39:25.353' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 16 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:00:18.477' AS DateTime), N'ITEM 489: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:00:18.477' AS DateTime), N'ITEM 489: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:00:18.487' AS DateTime), N'ITEM 490: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:00:18.490' AS DateTime), N'ITEM 490: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:00:52.720' AS DateTime), N'ITEM 489: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:00:52.720' AS DateTime), N'ITEM 490: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:01:31.347' AS DateTime), N'ITEM 489: ENSAMBLADAS - Anterior: 1 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:01:31.357' AS DateTime), N'ITEM 490: ENSAMBLADAS - Anterior: 2 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (489, CAST(N'2018-11-05T00:01:44.400' AS DateTime), N'ITEM 489: EN DEPOSITO - Anterior: 1 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (490, CAST(N'2018-11-05T00:01:44.400' AS DateTime), N'ITEM 490: EN DEPOSITO - Anterior: 2 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2018-11-11T22:48:10.810' AS DateTime), N'ITEM 603: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2018-11-11T22:48:50.457' AS DateTime), N'ITEM 603: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2018-11-11T22:48:50.460' AS DateTime), N'ITEM 603: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (601, CAST(N'2018-11-12T02:03:36.123' AS DateTime), N'ITEM 601: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (601, CAST(N'2018-11-12T02:03:36.123' AS DateTime), N'ITEM 601: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:46:39.780' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:46:39.827' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:46:39.827' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:47:02.560' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:47:02.560' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:47:02.563' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 21 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:53:08.957' AS DateTime), N'ITEM 486: MARCOS TERMINADOS - Anterior: 22 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:53:08.957' AS DateTime), N'ITEM 486: HOJAS TERMINADAS - Anterior: 22 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2018-11-04T01:53:08.957' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 22 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:06.130' AS DateTime), N'ITEM 487: CANTIDAD - Anterior: 10 CANTIDAD Nueva: 50', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:06.133' AS DateTime), N'ITEM 487: PRODUCTO - Anterior: 25 PRODUCTO Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:06.133' AS DateTime), N'ITEM 487: ESTADO - Anterior: DEPOSITO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:06.133' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 2 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:37.613' AS DateTime), N'ITEM 487: MARCOS TERMINADOS - Anterior: 2 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:37.617' AS DateTime), N'ITEM 487: HOJAS TERMINADAS - Anterior: 2 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T01:54:37.617' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 2 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:04:06.103' AS DateTime), N'ITEM 487: PRODUCTO - Anterior: 1 PRODUCTO Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2018-11-04T02:04:29.990' AS DateTime), N'ITEM 487: PRODUCTO - Anterior: 5 PRODUCTO Nuevo: 24', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (601, CAST(N'2018-11-11T22:45:11.000' AS DateTime), N'ITEM 601: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (602, CAST(N'2018-11-11T22:45:11.007' AS DateTime), N'ITEM 602: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (602, CAST(N'2018-11-12T02:03:36.270' AS DateTime), N'ITEM 602: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (602, CAST(N'2018-11-12T02:03:36.270' AS DateTime), N'ITEM 602: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T22:48:32.603' AS DateTime), N'ITEM 597: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T22:48:32.603' AS DateTime), N'ITEM 597: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-12T22:48:32.753' AS DateTime), N'ITEM 598: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-12T22:48:32.753' AS DateTime), N'ITEM 598: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T23:13:35.650' AS DateTime), N'ITEM 597: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-12T23:13:35.810' AS DateTime), N'ITEM 598: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (601, CAST(N'2018-11-13T00:10:17.587' AS DateTime), N'ITEM 601: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (601, CAST(N'2018-11-13T00:10:17.587' AS DateTime), N'ITEM 601: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (602, CAST(N'2018-11-13T00:10:17.590' AS DateTime), N'ITEM 602: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (602, CAST(N'2018-11-13T00:10:17.590' AS DateTime), N'ITEM 602: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2018-12-05T22:02:22.093' AS DateTime), N'ITEM 492: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2018-12-05T22:02:22.100' AS DateTime), N'ITEM 492: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-09T12:29:36.557' AS DateTime), N'ITEM 485: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-09T12:29:36.557' AS DateTime), N'ITEM 485: ENSAMBLADAS - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-09T12:29:41.537' AS DateTime), N'ITEM 485: EN DEPOSITO - Anterior: 10 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-09T12:31:46.493' AS DateTime), N'ITEM 485: ENSAMBLADAS - Anterior: 20 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-09T12:32:12.490' AS DateTime), N'ITEM 485: EN DEPOSITO - Anterior: 20 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (493, CAST(N'2018-12-09T13:48:57.783' AS DateTime), N'ITEM 493: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (494, CAST(N'2018-12-09T13:48:57.913' AS DateTime), N'ITEM 494: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (494, CAST(N'2018-12-09T13:48:57.923' AS DateTime), N'ITEM 494: ENSAMBLADAS - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (493, CAST(N'2018-12-09T13:50:19.523' AS DateTime), N'ITEM 493: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (494, CAST(N'2018-12-09T13:50:19.533' AS DateTime), N'ITEM 494: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:00:57.387' AS DateTime), N'ITEM 705: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:01:49.017' AS DateTime), N'ITEM 705: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:01:49.017' AS DateTime), N'ITEM 705: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:02:00.273' AS DateTime), N'ITEM 705: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:02:00.273' AS DateTime), N'ITEM 705: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:03:00.747' AS DateTime), N'ITEM 705: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (705, CAST(N'2018-12-26T02:03:16.487' AS DateTime), N'ITEM 705: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (703, CAST(N'2018-12-26T14:26:07.350' AS DateTime), N'ITEM 703: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (704, CAST(N'2018-12-26T14:26:07.353' AS DateTime), N'ITEM 704: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (708, CAST(N'2018-12-26T18:21:12.653' AS DateTime), N'ITEM 708: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (709, CAST(N'2018-12-26T18:21:12.657' AS DateTime), N'ITEM 709: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-12-26T21:21:42.520' AS DateTime), N'ITEM 468: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-12-30T11:24:38.937' AS DateTime), N'ITEM 462: CANTIDAD - Anterior: 10 CANTIDAD Nueva: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-12-30T11:24:38.937' AS DateTime), N'ITEM 462: MONTO - Anterior: 3505 MONTO Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T23:20:07.383' AS DateTime), N'ITEM 597: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T23:20:07.390' AS DateTime), N'ITEM 597: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2018-11-12T23:20:23.917' AS DateTime), N'ITEM 597: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-12T23:20:35.717' AS DateTime), N'ITEM 598: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2018-11-12T23:20:35.717' AS DateTime), N'ITEM 598: ENSAMBLADAS - Anterior: 4 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (493, CAST(N'2018-12-09T13:48:57.783' AS DateTime), N'ITEM 493: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (706, CAST(N'2018-12-26T14:11:25.350' AS DateTime), N'ITEM 706: ESTADO - Anterior: DEPOSITO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (707, CAST(N'2018-12-26T14:11:25.367' AS DateTime), N'ITEM 707: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (711, CAST(N'2018-12-30T11:31:33.597' AS DateTime), N'ITEM 711: PRODUCTO - Anterior: 1 PRODUCTO Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-12-30T12:02:32.633' AS DateTime), N'ITEM 462: PRODUCTO - Anterior: 1 PRODUCTO Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-12-30T12:02:32.653' AS DateTime), N'ITEM 463: PRODUCTO - Anterior: 89 PRODUCTO Nuevo: 174', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-12-30T21:57:48.670' AS DateTime), N'ITEM 469: CANTIDAD - Anterior: 20 CANTIDAD Nueva: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (463, CAST(N'2018-12-30T22:04:31.383' AS DateTime), N'ITEM 463: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-12-30T22:22:00.570' AS DateTime), N'ITEM 468: CANTIDAD - Anterior: 10 CANTIDAD Nueva: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2018-12-30T22:22:00.570' AS DateTime), N'ITEM 468: MONTO - Anterior: 3505 MONTO Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (723, CAST(N'2018-12-30T22:29:51.730' AS DateTime), N'ITEM 723: CANTIDAD - Anterior: 5 CANTIDAD Nueva: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (724, CAST(N'2018-12-30T22:37:35.723' AS DateTime), N'ITEM 724: CANTIDAD - Anterior: 5 CANTIDAD Nueva: 9', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (724, CAST(N'2018-12-30T22:37:41.583' AS DateTime), N'ITEM 724: CANTIDAD - Anterior: 9 CANTIDAD Nueva: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (722, CAST(N'2018-12-30T22:37:58.000' AS DateTime), N'ITEM 722: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (725, CAST(N'2018-12-30T22:47:16.840' AS DateTime), N'ITEM 725: CANTIDAD - Anterior: 4 CANTIDAD Nueva: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2018-12-30T23:18:46.650' AS DateTime), N'ITEM 727: CANTIDAD - Anterior: 1 CANTIDAD Nueva: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (723, CAST(N'2018-12-30T23:30:30.713' AS DateTime), N'ITEM 723: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (725, CAST(N'2018-12-31T08:27:49.810' AS DateTime), N'ITEM 725: CANTIDAD - Anterior: 6 CANTIDAD Nueva: 7', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2018-12-31T08:28:24.533' AS DateTime), N'ITEM 485: CANTIDAD - Anterior: 100 CANTIDAD Nueva: 101', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2018-12-31T16:39:13.933' AS DateTime), N'ITEM 730: CANTIDAD - Anterior: 1 CANTIDAD Nueva: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (725, CAST(N'2018-12-31T16:50:52.967' AS DateTime), N'ITEM 725: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:25:25.610' AS DateTime), N'ITEM 730: CANTIDAD - Anterior: 2 CANTIDAD Nueva: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:25:25.613' AS DateTime), N'ITEM 730: PRODUCTO - Anterior: 25 PRODUCTO Nuevo: 41', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2019-01-01T13:26:06.260' AS DateTime), N'ITEM 727: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:27:00.180' AS DateTime), N'ITEM 730: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:27:00.613' AS DateTime), N'ITEM 731: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:44:28.400' AS DateTime), N'ITEM 730: ESTADO - Anterior: DEPOSITO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:44:28.437' AS DateTime), N'ITEM 731: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:45:48.410' AS DateTime), N'ITEM 730: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:45:48.590' AS DateTime), N'ITEM 731: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:46:06.320' AS DateTime), N'ITEM 730: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:46:06.320' AS DateTime), N'ITEM 730: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:46:06.360' AS DateTime), N'ITEM 731: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:46:06.360' AS DateTime), N'ITEM 731: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:49:20.350' AS DateTime), N'ITEM 730: ESTADO - Anterior: DEPOSITO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:49:20.387' AS DateTime), N'ITEM 731: ESTADO - Anterior: DEPOSITO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:50:56.133' AS DateTime), N'ITEM 730: ENSAMBLADAS - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:51:25.713' AS DateTime), N'ITEM 731: ENSAMBLADAS - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:59:28.887' AS DateTime), N'ITEM 730: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T13:59:28.887' AS DateTime), N'ITEM 730: EN DEPOSITO - Anterior: 3 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:59:28.917' AS DateTime), N'ITEM 731: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T13:59:28.920' AS DateTime), N'ITEM 731: EN DEPOSITO - Anterior: 5 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T14:06:16.957' AS DateTime), N'ITEM 730: ESTADO - Anterior: DEPOSITO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T14:06:17.133' AS DateTime), N'ITEM 731: ESTADO - Anterior: DEPOSITO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:06:17.350' AS DateTime), N'ITEM 732: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:08:00.783' AS DateTime), N'ITEM 732: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:08:00.787' AS DateTime), N'ITEM 732: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:20:25.097' AS DateTime), N'ITEM 732: ENSAMBLADAS - Anterior: 2 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:23:05.237' AS DateTime), N'ITEM 732: EN DEPOSITO - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:23:31.103' AS DateTime), N'ITEM 732: ENSAMBLADAS - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:23:40.003' AS DateTime), N'ITEM 732: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T14:23:40.007' AS DateTime), N'ITEM 732: EN DEPOSITO - Anterior: 1 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2019-01-01T14:25:41.830' AS DateTime), N'ITEM 485: ENSAMBLADAS - Anterior: 25 Nuevo: 79', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2018-11-13T00:03:45.123' AS DateTime), N'ITEM 603: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T21:02:46.260' AS DateTime), N'ITEM 701: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T21:02:49.163' AS DateTime), N'ITEM 701: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T21:02:49.163' AS DateTime), N'ITEM 701: EN DEPOSITO - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T21:03:12.370' AS DateTime), N'ITEM 701: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T21:03:12.373' AS DateTime), N'ITEM 702: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T21:03:20.370' AS DateTime), N'ITEM 701: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T21:03:20.373' AS DateTime), N'ITEM 702: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (706, CAST(N'2018-12-26T11:17:44.707' AS DateTime), N'ITEM 706: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (707, CAST(N'2018-12-26T11:17:44.987' AS DateTime), N'ITEM 707: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (710, CAST(N'2018-12-26T18:36:40.510' AS DateTime), N'ITEM 710: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (715, CAST(N'2018-12-26T18:40:06.040' AS DateTime), N'ITEM 715: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (466, CAST(N'2018-12-28T20:24:20.007' AS DateTime), N'ITEM 466: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T16:00:53.140' AS DateTime), N'ITEM 733: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T16:00:53.140' AS DateTime), N'ITEM 733: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (468, CAST(N'2019-01-01T16:02:35.190' AS DateTime), N'ITEM 468: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2019-01-01T16:02:35.207' AS DateTime), N'ITEM 469: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (722, CAST(N'2019-01-01T16:02:35.223' AS DateTime), N'ITEM 722: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (723, CAST(N'2019-01-01T16:02:35.237' AS DateTime), N'ITEM 723: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (724, CAST(N'2019-01-01T16:02:35.253' AS DateTime), N'ITEM 724: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (725, CAST(N'2019-01-01T16:02:35.283' AS DateTime), N'ITEM 725: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (726, CAST(N'2019-01-01T16:02:35.283' AS DateTime), N'ITEM 726: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2019-01-01T16:02:35.300' AS DateTime), N'ITEM 727: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (729, CAST(N'2019-01-01T16:02:35.317' AS DateTime), N'ITEM 729: ESTADO - Anterior: CANCELADO       Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T16:02:35.330' AS DateTime), N'ITEM 730: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T16:02:35.330' AS DateTime), N'ITEM 731: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T16:02:35.347' AS DateTime), N'ITEM 732: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T16:02:35.380' AS DateTime), N'ITEM 733: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (728, CAST(N'2019-01-01T22:13:59.843' AS DateTime), N'ITEM 728: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (728, CAST(N'2019-01-01T22:14:21.917' AS DateTime), N'ITEM 728: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2019-01-01T22:14:39.497' AS DateTime), N'ITEM 485: ESTADO - Anterior: CANCELADO       Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2019-01-01T22:14:39.497' AS DateTime), N'ITEM 485: EN DEPOSITO - Anterior: 25 Nuevo: 79', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (728, CAST(N'2019-01-01T22:14:39.500' AS DateTime), N'ITEM 728: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (728, CAST(N'2019-01-01T22:14:39.500' AS DateTime), N'ITEM 728: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-01-01T22:21:59.130' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 13 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-01-01T22:21:59.287' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 6 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (734, CAST(N'2019-01-01T22:21:59.463' AS DateTime), N'ITEM 734: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (734, CAST(N'2019-01-01T22:23:19.060' AS DateTime), N'ITEM 734: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-01-01T22:23:43.607' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 13 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-01-01T22:23:43.623' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 6 Nuevo: 20', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2019-04-09T20:57:14.253' AS DateTime), N'ITEM 597: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2019-04-09T20:57:14.257' AS DateTime), N'ITEM 597: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2019-04-09T20:57:14.270' AS DateTime), N'ITEM 598: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2019-04-11T00:37:43.267' AS DateTime), N'ITEM 603: EN DEPOSITO - Anterior: 0 Nuevo: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2019-04-11T00:38:25.940' AS DateTime), N'ITEM 603: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (603, CAST(N'2019-04-11T00:38:53.273' AS DateTime), N'ITEM 603: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-04-11T00:39:37.673' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 20 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-04-11T00:40:02.237' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 20 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-04-11T00:45:27.977' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 20 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (597, CAST(N'2019-04-11T00:50:28.220' AS DateTime), N'ITEM 597: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (598, CAST(N'2019-04-11T00:50:28.237' AS DateTime), N'ITEM 598: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-04-11T00:51:16.213' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 21 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (713, CAST(N'2019-04-13T17:07:26.147' AS DateTime), N'ITEM 713: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:36:56.707' AS DateTime), N'ITEM 738: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:36:56.740' AS DateTime), N'ITEM 739: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T20:48:18.860' AS DateTime), N'ITEM 701: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T20:48:19.013' AS DateTime), N'ITEM 702: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T20:49:11.360' AS DateTime), N'ITEM 701: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T20:49:11.360' AS DateTime), N'ITEM 701: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T20:49:11.500' AS DateTime), N'ITEM 702: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T20:49:11.503' AS DateTime), N'ITEM 702: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (701, CAST(N'2018-12-09T20:51:47.337' AS DateTime), N'ITEM 701: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T20:51:47.360' AS DateTime), N'ITEM 702: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (702, CAST(N'2018-12-09T20:51:47.360' AS DateTime), N'ITEM 702: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:39:27.483' AS DateTime), N'ITEM 738: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:39:27.653' AS DateTime), N'ITEM 739: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:41:58.420' AS DateTime), N'ITEM 738: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:41:58.600' AS DateTime), N'ITEM 739: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:42:42.390' AS DateTime), N'ITEM 738: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:42:42.400' AS DateTime), N'ITEM 739: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-05-26T18:47:00.087' AS DateTime), N'ITEM 486: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-05-26T18:49:46.047' AS DateTime), N'ITEM 487: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2019-05-26T18:54:56.223' AS DateTime), N'ITEM 492: ENSAMBLADAS - Anterior: 2 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2019-05-26T18:55:37.123' AS DateTime), N'ITEM 492: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2019-05-26T18:55:37.127' AS DateTime), N'ITEM 492: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (491, CAST(N'2019-05-26T19:02:15.963' AS DateTime), N'ITEM 491: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (492, CAST(N'2019-05-26T19:02:15.977' AS DateTime), N'ITEM 492: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2019-05-26T19:25:19.997' AS DateTime), N'ITEM 595: ENSAMBLADAS - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2019-05-26T19:25:20.143' AS DateTime), N'ITEM 596: ENSAMBLADAS - Anterior: 5 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2019-05-26T19:25:25.710' AS DateTime), N'ITEM 595: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (595, CAST(N'2019-05-26T19:25:25.710' AS DateTime), N'ITEM 595: EN DEPOSITO - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2019-05-26T19:25:25.787' AS DateTime), N'ITEM 596: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (596, CAST(N'2019-05-26T19:25:25.790' AS DateTime), N'ITEM 596: EN DEPOSITO - Anterior: 5 Nuevo: 15', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T20:22:37.687' AS DateTime), N'ITEM 740: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T20:22:37.727' AS DateTime), N'ITEM 741: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T20:23:09.790' AS DateTime), N'ITEM 740: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T20:23:09.980' AS DateTime), N'ITEM 741: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (711, CAST(N'2019-05-26T21:45:38.357' AS DateTime), N'ITEM 711: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (712, CAST(N'2019-05-26T21:45:38.403' AS DateTime), N'ITEM 712: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:04:06.447' AS DateTime), N'ITEM 743: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:04:06.603' AS DateTime), N'ITEM 744: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:04:06.777' AS DateTime), N'ITEM 745: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:04:16.887' AS DateTime), N'ITEM 743: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:04:17.063' AS DateTime), N'ITEM 744: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:04:17.220' AS DateTime), N'ITEM 745: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:04:24.360' AS DateTime), N'ITEM 743: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:04:24.360' AS DateTime), N'ITEM 743: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:04:24.383' AS DateTime), N'ITEM 744: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:04:24.383' AS DateTime), N'ITEM 744: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:04:24.410' AS DateTime), N'ITEM 745: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:04:24.413' AS DateTime), N'ITEM 745: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T22:20:21.997' AS DateTime), N'ITEM 735: ENSAMBLADAS - Anterior: 1 Nuevo: 75', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T22:20:22.143' AS DateTime), N'ITEM 736: ENSAMBLADAS - Anterior: 1 Nuevo: 80', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T22:20:22.303' AS DateTime), N'ITEM 737: ENSAMBLADAS - Anterior: 1 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T22:20:50.420' AS DateTime), N'ITEM 735: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T22:20:50.420' AS DateTime), N'ITEM 735: EN DEPOSITO - Anterior: 0 Nuevo: 75', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T22:20:50.460' AS DateTime), N'ITEM 736: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T22:20:50.460' AS DateTime), N'ITEM 736: EN DEPOSITO - Anterior: 0 Nuevo: 80', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T22:20:50.490' AS DateTime), N'ITEM 737: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T22:20:50.490' AS DateTime), N'ITEM 737: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T22:21:09.357' AS DateTime), N'ITEM 735: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T22:21:09.380' AS DateTime), N'ITEM 736: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T22:21:09.397' AS DateTime), N'ITEM 737: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (467, CAST(N'2018-12-28T21:06:23.563' AS DateTime), N'ITEM 467: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-12-30T20:10:37.250' AS DateTime), N'ITEM 462: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (717, CAST(N'2018-12-30T22:06:59.130' AS DateTime), N'ITEM 717: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (718, CAST(N'2018-12-30T22:11:37.443' AS DateTime), N'ITEM 718: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (717, CAST(N'2018-12-30T22:12:19.153' AS DateTime), N'ITEM 717: CANTIDAD - Anterior: 1 CANTIDAD Nueva: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (717, CAST(N'2018-12-30T22:12:28.510' AS DateTime), N'ITEM 717: CANTIDAD - Anterior: 6 CANTIDAD Nueva: 11', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (717, CAST(N'2018-12-30T22:14:11.613' AS DateTime), N'ITEM 717: CANTIDAD - Anterior: 11 CANTIDAD Nueva: 16', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (717, CAST(N'2018-12-30T22:17:05.740' AS DateTime), N'ITEM 717: CANTIDAD - Anterior: 16 CANTIDAD Nueva: 21', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (719, CAST(N'2018-12-30T22:17:08.853' AS DateTime), N'ITEM 719: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (720, CAST(N'2018-12-30T22:17:08.870' AS DateTime), N'ITEM 720: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (721, CAST(N'2018-12-30T22:17:08.883' AS DateTime), N'ITEM 721: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-12-30T22:18:17.130' AS DateTime), N'ITEM 469: CANTIDAD - Anterior: 21 CANTIDAD Nueva: 22', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (469, CAST(N'2018-12-30T23:10:53.580' AS DateTime), N'ITEM 469: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2018-12-30T23:12:34.407' AS DateTime), N'ITEM 727: CANTIDAD - Anterior: 1 CANTIDAD Nueva: 2', NULL)
GO
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2018-12-30T23:14:19.773' AS DateTime), N'ITEM 727: CANTIDAD - Anterior: 2 CANTIDAD Nueva: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (730, CAST(N'2019-01-01T16:11:30.623' AS DateTime), N'ITEM 730: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (731, CAST(N'2019-01-01T16:11:30.640' AS DateTime), N'ITEM 731: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (732, CAST(N'2019-01-01T16:11:30.653' AS DateTime), N'ITEM 732: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T16:11:30.730' AS DateTime), N'ITEM 733: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (488, CAST(N'2019-01-01T16:15:16.397' AS DateTime), N'ITEM 488: ESTADO - Anterior: DEPOSITO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (734, CAST(N'2019-01-01T16:16:51.750' AS DateTime), N'ITEM 734: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (485, CAST(N'2019-01-01T22:06:27.977' AS DateTime), N'ITEM 485: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T22:21:29.447' AS DateTime), N'ITEM 735: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T22:21:29.463' AS DateTime), N'ITEM 736: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T22:21:29.473' AS DateTime), N'ITEM 737: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (462, CAST(N'2018-12-30T11:28:24.557' AS DateTime), N'ITEM 462: CANTIDAD - Anterior: 15 CANTIDAD Nueva: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2018-12-30T11:44:16.480' AS DateTime), N'ITEM 714: PRODUCTO - Anterior: 1 PRODUCTO Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2018-12-30T11:44:36.850' AS DateTime), N'ITEM 714: PRODUCTO - Anterior: 13 PRODUCTO Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (724, CAST(N'2018-12-31T08:26:45.970' AS DateTime), N'ITEM 724: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (726, CAST(N'2018-12-31T08:26:46.160' AS DateTime), N'ITEM 726: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2018-12-31T08:27:11.517' AS DateTime), N'ITEM 727: CANTIDAD - Anterior: 3 CANTIDAD Nueva: 4', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (727, CAST(N'2018-12-31T08:27:11.533' AS DateTime), N'ITEM 727: PRODUCTO - Anterior: 89 PRODUCTO Nuevo: 153', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (729, CAST(N'2018-12-31T16:29:46.060' AS DateTime), N'ITEM 729: CANTIDAD - Anterior: 5 CANTIDAD Nueva: 6', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (729, CAST(N'2018-12-31T16:30:29.673' AS DateTime), N'ITEM 729: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T15:52:16.007' AS DateTime), N'ITEM 733: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (733, CAST(N'2019-01-01T15:53:41.710' AS DateTime), N'ITEM 733: ENSAMBLADAS - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:42:12.613' AS DateTime), N'ITEM 738: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (738, CAST(N'2019-05-26T10:42:12.613' AS DateTime), N'ITEM 738: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:42:12.690' AS DateTime), N'ITEM 739: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (739, CAST(N'2019-05-26T10:42:12.690' AS DateTime), N'ITEM 739: EN DEPOSITO - Anterior: 0 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:06:51.513' AS DateTime), N'ITEM 714: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:07:28.097' AS DateTime), N'ITEM 714: ENSAMBLADAS - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:07:42.383' AS DateTime), N'ITEM 714: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:07:42.387' AS DateTime), N'ITEM 714: EN DEPOSITO - Anterior: 0 Nuevo: 3', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:10:43.597' AS DateTime), N'ITEM 714: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (714, CAST(N'2019-05-26T19:11:59.660' AS DateTime), N'ITEM 714: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T21:33:02.620' AS DateTime), N'ITEM 735: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T21:37:04.607' AS DateTime), N'ITEM 736: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T21:37:04.650' AS DateTime), N'ITEM 737: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (735, CAST(N'2019-05-26T21:39:23.547' AS DateTime), N'ITEM 735: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (736, CAST(N'2019-05-26T21:39:23.720' AS DateTime), N'ITEM 736: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (737, CAST(N'2019-05-26T21:39:23.877' AS DateTime), N'ITEM 737: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (716, CAST(N'2019-05-26T22:01:14.963' AS DateTime), N'ITEM 716: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (742, CAST(N'2019-05-26T22:01:14.997' AS DateTime), N'ITEM 742: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (742, CAST(N'2019-05-26T22:02:28.613' AS DateTime), N'ITEM 742: ENSAMBLADAS - Anterior: 0 Nuevo: 1', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:03:41.743' AS DateTime), N'ITEM 743: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:03:41.797' AS DateTime), N'ITEM 744: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:03:41.833' AS DateTime), N'ITEM 745: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (743, CAST(N'2019-05-26T22:06:26.050' AS DateTime), N'ITEM 743: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (744, CAST(N'2019-05-26T22:06:26.060' AS DateTime), N'ITEM 744: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (745, CAST(N'2019-05-26T22:06:26.080' AS DateTime), N'ITEM 745: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:14:12.233' AS DateTime), N'ITEM 746: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:14:12.290' AS DateTime), N'ITEM 747: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:14:36.927' AS DateTime), N'ITEM 746: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:14:37.120' AS DateTime), N'ITEM 747: ENSAMBLADAS - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:14:44.740' AS DateTime), N'ITEM 746: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:14:44.753' AS DateTime), N'ITEM 747: EN DEPOSITO - Anterior: 0 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:15:10.690' AS DateTime), N'ITEM 746: ENSAMBLADAS - Anterior: 2 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:15:10.900' AS DateTime), N'ITEM 747: ENSAMBLADAS - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:15:31.320' AS DateTime), N'ITEM 746: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:15:31.320' AS DateTime), N'ITEM 746: EN DEPOSITO - Anterior: 2 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:15:31.357' AS DateTime), N'ITEM 747: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:15:31.357' AS DateTime), N'ITEM 747: EN DEPOSITO - Anterior: 2 Nuevo: 5', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:15:46.087' AS DateTime), N'ITEM 746: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:15:46.097' AS DateTime), N'ITEM 747: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (746, CAST(N'2019-05-26T22:16:05.100' AS DateTime), N'ITEM 746: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (747, CAST(N'2019-05-26T22:16:05.120' AS DateTime), N'ITEM 747: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T22:16:54.123' AS DateTime), N'ITEM 740: ENSAMBLADAS - Anterior: 5 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T22:16:54.317' AS DateTime), N'ITEM 741: ENSAMBLADAS - Anterior: 5 Nuevo: 18', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T22:16:59.360' AS DateTime), N'ITEM 740: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T22:16:59.360' AS DateTime), N'ITEM 740: EN DEPOSITO - Anterior: 0 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T22:16:59.400' AS DateTime), N'ITEM 741: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T22:16:59.400' AS DateTime), N'ITEM 741: EN DEPOSITO - Anterior: 0 Nuevo: 18', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T22:17:13.743' AS DateTime), N'ITEM 740: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T22:17:13.757' AS DateTime), N'ITEM 741: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (740, CAST(N'2019-05-26T22:17:30.933' AS DateTime), N'ITEM 740: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (741, CAST(N'2019-05-26T22:17:30.953' AS DateTime), N'ITEM 741: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-05-26T18:35:43.677' AS DateTime), N'ITEM 486: ENSAMBLADAS - Anterior: 25 Nuevo: 35', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-05-26T18:35:43.860' AS DateTime), N'ITEM 487: ENSAMBLADAS - Anterior: 25 Nuevo: 42', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-05-26T18:36:57.913' AS DateTime), N'ITEM 486: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (486, CAST(N'2019-05-26T18:36:57.917' AS DateTime), N'ITEM 486: EN DEPOSITO - Anterior: 25 Nuevo: 35', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-05-26T18:36:57.940' AS DateTime), N'ITEM 487: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_ITEMS] ([ID_ITEM], [FECHA], [ENTRADA], [USUARIO]) VALUES (487, CAST(N'2019-05-26T18:36:57.940' AS DateTime), N'ITEM 487: EN DEPOSITO - Anterior: 20 Nuevo: 42', NULL)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T14:22:48.197' AS DateTime), N'STOCK ANTERIOR: 190, NUEVO: 200', N'MANU                                              ', 5)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T14:23:13.970' AS DateTime), N'STOCK ANTERIOR: 200, NUEVO: 200', N'MANU                                              ', 5)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T14:28:26.500' AS DateTime), N'STOCK ANTERIOR: 9917, NUEVO: 10000', N'MANU                                              ', 6)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T17:02:04.980' AS DateTime), N'STOCK ANTERIOR: 0, NUEVO: 150', N'MANU                                              ', 20)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T17:28:42.820' AS DateTime), N'NOMBRE ANTERIOR PROBANDO, NUEVO NOM PRUE', N'MANU                                              ', 20)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-06T17:28:42.833' AS DateTime), N'UNIDAD ANTERIOR: PROBANDO UNIDAD          , NUEVA: UNIDAD PRUE', N'MANU                                              ', 20)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-08T22:29:43.153' AS DateTime), N'NOMBRE ANTERIOR PINO, NUEVO PINO 1ERA', N'MANU                                              ', 5)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-08T22:29:55.050' AS DateTime), N'NOMBRE ANTERIOR PINO 1ERA, NUEVO PINO', N'MANU                                              ', 5)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-08T23:05:44.060' AS DateTime), N'NUEVA PIEZA', N'MANU                                              ', 0)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-08T23:06:01.630' AS DateTime), N'NOMBRE ANTERIOR OTROA PRIEBA, NUEVO OTRA PRUEBA', N'MANU                                              ', 21)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-08T23:06:36.320' AS DateTime), N'pieza eliminada', N'MANU                                              ', 21)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-04-25T22:16:02.017' AS DateTime), N'STOCK ANTERIOR: 897, NUEVO: 900', N'MANU                                              ', 14)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-05-26T20:02:20.670' AS DateTime), N'STOCK ANTERIOR: 250, NUEVO: 220', N'administracion@cbaplacas.com                      ', 5)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-05-26T21:30:05.673' AS DateTime), N'STOCK ANTERIOR: 295, NUEVO: 500', N'administracion@cbaplacas.com                      ', 15)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-05-26T21:31:28.157' AS DateTime), N'STOCK ANTERIOR: 500, NUEVO: 550', N'administracion@cbaplacas.com                      ', 15)
INSERT [dbo].[REGISTRO_MATERIALES] ([FECHA], [CAMBIOS], [USUARIO], [COD_PIEZA]) VALUES (CAST(N'2019-05-26T21:32:40.990' AS DateTime), N'STOCK ANTERIOR: 900, NUEVO: 2000', N'administracion@cbaplacas.com                      ', 14)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (230, CAST(N'2018-07-29T06:24:59.440' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (230, CAST(N'2018-07-29T06:27:44.703' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T10:58:32.890' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T10:59:32.713' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T11:13:07.080' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T11:44:50.253' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-08-06T21:03:38.170' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (222, CAST(N'2018-08-06T21:49:10.717' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (230, CAST(N'2018-08-06T22:46:17.343' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 55 Nuevo: 70', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (223, CAST(N'2018-08-08T15:20:20.797' AS DateTime), N'PEDIDO: PRECIO - Anterior: 65 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (223, CAST(N'2018-08-08T15:20:20.797' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-08T16:52:41.567' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (329, CAST(N'2018-08-08T16:55:19.730' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (330, CAST(N'2018-08-08T17:01:21.560' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (332, CAST(N'2018-08-08T17:07:24.880' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (333, CAST(N'2018-08-08T17:13:35.607' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (334, CAST(N'2018-08-08T17:17:17.423' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (336, CAST(N'2018-08-08T17:33:53.417' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (333, CAST(N'2018-08-08T17:36:25.770' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (332, CAST(N'2018-08-08T17:36:39.860' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-08T18:07:50.020' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 5 Nuevo: 25', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (225, CAST(N'2018-08-08T18:16:49.813' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (226, CAST(N'2018-08-08T18:16:57.420' AS DateTime), N'PEDIDO: PRECIO - Anterior: 15 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (226, CAST(N'2018-08-08T18:16:57.420' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (119, CAST(N'2018-08-08T18:24:34.350' AS DateTime), N'PEDIDO: PRECIO - Anterior: 35 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (119, CAST(N'2018-08-08T18:24:34.350' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (224, CAST(N'2018-08-12T21:20:29.777' AS DateTime), N'PEDIDO: PRECIO - Anterior: 20 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (224, CAST(N'2018-08-12T21:20:29.780' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (228, CAST(N'2018-08-18T11:01:00.277' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-18T15:05:08.897' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (329, CAST(N'2018-08-18T15:24:13.330' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (330, CAST(N'2018-08-18T15:25:24.337' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (334, CAST(N'2018-08-18T17:20:03.007' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-08-18T17:21:29.787' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (230, CAST(N'2018-08-18T17:36:34.857' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-18T17:45:31.127' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T11:45:48.587' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (231, CAST(N'2018-07-29T11:46:18.613' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (225, CAST(N'2018-08-18T17:33:12.263' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-18T17:45:44.580' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-08-18T17:55:35.570' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (226, CAST(N'2018-08-18T18:13:39.490' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (336, CAST(N'2018-08-18T18:19:01.640' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (228, CAST(N'2018-08-18T18:44:57.780' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-18T18:56:16.383' AS DateTime), N'PEDIDO: PRECIO - Anterior: 23 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-18T18:56:16.387' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (329, CAST(N'2018-08-20T12:21:56.407' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (226, CAST(N'2018-08-20T12:34:00.460' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (336, CAST(N'2018-08-20T18:04:33.213' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (224, CAST(N'2018-08-20T18:04:54.470' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-20T18:07:08.017' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-08-20T18:08:29.150' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T18:14:46.390' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T18:16:00.037' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T18:16:21.020' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-20T21:59:23.667' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-20T22:22:30.173' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-20T22:49:17.287' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-22T02:34:42.543' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-22T02:35:01.760' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-08-22T09:53:20.560' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-08-22T11:46:41.053' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-08-22T11:47:42.140' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-08-22T11:56:09.820' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-08-22T23:39:11.343' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-08-22T23:44:25.070' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (225, CAST(N'2018-08-23T23:05:34.307' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-08-25T17:41:26.960' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (229, CAST(N'2018-08-06T22:47:01.997' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 20 Nuevo: 35', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (224, CAST(N'2018-08-18T17:27:45.000' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (229, CAST(N'2018-08-06T22:52:11.160' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 35 Nuevo: 47', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (225, CAST(N'2018-08-06T22:57:36.233' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 20 Nuevo: 35', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (122, CAST(N'2018-08-12T18:39:30.753' AS DateTime), N'PEDIDO: PRECIO - Anterior: 150 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (122, CAST(N'2018-08-12T18:39:30.753' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (119, CAST(N'2018-08-12T19:39:17.317' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (228, CAST(N'2018-08-20T16:01:38.387' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (329, CAST(N'2018-08-20T16:24:21.360' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (119, CAST(N'2018-08-20T16:25:33.220' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (122, CAST(N'2018-08-20T16:32:53.710' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (329, CAST(N'2018-08-20T16:33:20.913' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (118, CAST(N'2018-08-20T22:32:09.380' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-08-25T17:45:06.270' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-08-27T22:57:51.710' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 40 Nuevo: 60', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-08-28T21:55:22.707' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-08-28T21:59:41.820' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-09-01T14:12:18.150' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (546, CAST(N'2018-09-02T21:40:42.250' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (546, CAST(N'2018-09-02T21:43:17.240' AS DateTime), N'PEDIDO: PRECIO - Anterior: 8762 Nuevo: 8763', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (546, CAST(N'2018-09-02T21:43:17.240' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (546, CAST(N'2018-09-02T21:45:06.780' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (546, CAST(N'2018-09-02T21:58:24.630' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-09-02T21:59:19.223' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-09-02T21:59:32.627' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-09-02T22:00:02.340' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (442, CAST(N'2018-09-02T22:00:28.353' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (547, CAST(N'2018-09-03T15:24:18.290' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-09-03T15:29:42.133' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-09-03T15:29:58.060' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (328, CAST(N'2018-09-03T15:30:20.643' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (547, CAST(N'2018-09-05T03:10:32.023' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
GO
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-09-05T03:13:10.770' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-09-05T03:14:11.660' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:11:40.067' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (229, CAST(N'2018-08-08T16:10:08.487' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-08-08T17:29:04.230' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (225, CAST(N'2018-08-13T23:04:02.880' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-08-29T01:49:30.033' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-08-29T01:52:30.080' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-08-29T01:52:53.623' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-09-03T15:26:33.630' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (551, CAST(N'2018-09-05T10:19:04.577' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:20:45.293' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:21:27.363' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:22:00.393' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:22:16.783' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (549, CAST(N'2018-09-05T10:22:35.953' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (550, CAST(N'2018-09-08T20:11:59.547' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T21:54:23.823' AS DateTime), N'PEDIDO: PRECIO - Anterior: 9508 Nuevo: 11261', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T21:54:23.827' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T21:58:12.000' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T22:03:22.377' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T22:03:59.607' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (553, CAST(N'2018-09-08T22:04:58.740' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (553, CAST(N'2018-09-08T22:05:11.827' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (553, CAST(N'2018-09-08T22:05:23.790' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (553, CAST(N'2018-09-08T22:05:32.107' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-10T18:19:33.783' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 20 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-10T18:19:33.783' AS DateTime), N'PEDIDO: PRECIO - Anterior: 23936 Nuevo: 39780', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-10T18:41:02.450' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2018-09-16T23:59:32.630' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2018-09-17T00:04:56.773' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2018-09-17T00:15:00.070' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-09-17T00:21:30.210' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (562, CAST(N'2018-09-17T19:31:43.427' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (562, CAST(N'2018-09-17T19:41:06.243' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2018-09-17T19:53:24.337' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (564, CAST(N'2018-09-17T20:01:32.357' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (565, CAST(N'2018-09-18T18:25:54.837' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T17:38:13.460' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T17:38:30.683' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (337, CAST(N'2018-08-20T17:39:00.697' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-09-17T00:22:07.690' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2018-09-17T20:00:29.730' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (564, CAST(N'2018-09-17T20:03:16.403' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (551, CAST(N'2018-09-23T23:56:12.530' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (551, CAST(N'2018-09-24T00:14:27.947' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-24T00:33:41.623' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-25T06:43:21.440' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (550, CAST(N'2018-09-25T06:47:12.347' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (550, CAST(N'2018-09-25T06:47:30.883' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-09-25T06:49:57.610' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-09-25T06:50:36.557' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (226, CAST(N'2018-09-25T06:56:23.850' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-09-25T07:18:59.923' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-09-25T07:20:03.827' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-09-25T07:20:13.747' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-09-25T07:30:46.970' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-09-25T07:32:31.037' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-09-25T07:35:58.037' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-09-25T07:38:31.500' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-25T07:50:21.030' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-25T07:50:36.420' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-25T07:52:13.243' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (228, CAST(N'2018-09-25T07:52:42.933' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (564, CAST(N'2018-09-25T07:53:28.747' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2018-11-04T00:55:22.290' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (564, CAST(N'2018-11-04T11:57:08.197' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (547, CAST(N'2018-11-04T12:04:53.010' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-11-04T19:51:48.020' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-08-21T22:07:29.443' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (336, CAST(N'2018-08-22T01:08:32.950' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (334, CAST(N'2018-08-22T01:12:18.167' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (334, CAST(N'2018-08-22T01:13:45.900' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (330, CAST(N'2018-08-22T01:17:31.097' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (330, CAST(N'2018-08-22T01:18:39.663' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (439, CAST(N'2018-08-22T01:20:37.927' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (439, CAST(N'2018-08-22T01:20:54.630' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (439, CAST(N'2018-08-22T01:21:11.193' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (439, CAST(N'2018-08-22T01:32:10.530' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (440, CAST(N'2018-08-22T01:33:16.650' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (440, CAST(N'2018-08-22T01:34:43.620' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (440, CAST(N'2018-08-22T01:35:14.060' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (440, CAST(N'2018-08-22T01:35:48.017' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-08-23T20:35:08.747' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (444, CAST(N'2018-08-23T20:39:05.263' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (553, CAST(N'2018-09-08T22:12:14.843' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T22:13:18.910' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2018-11-04T22:02:45.057' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-11-05T00:07:28.917' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-11-05T00:07:50.087' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-11-05T00:08:08.757' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (565, CAST(N'2018-11-05T18:15:37.663' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (565, CAST(N'2018-11-05T18:16:48.113' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (565, CAST(N'2018-11-05T18:18:26.170' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-11-05T18:20:12.157' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (446, CAST(N'2018-11-05T18:21:07.010' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:17:22.017' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (664, CAST(N'2018-11-11T20:31:15.460' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:32:30.687' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:33:27.577' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
GO
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:33:56.610' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:34:18.800' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-21T22:38:01.803' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-21T22:38:47.473' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-21T22:53:53.190' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:03:27.097' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:03:54.503' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:04:28.170' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:07:44.140' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 30 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:09:11.043' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:12:48.667' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (438, CAST(N'2018-08-21T23:14:10.233' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (561, CAST(N'2018-11-05T00:00:18.510' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:19:19.493' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:20:00.590' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (441, CAST(N'2018-11-11T22:40:47.267' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (230, CAST(N'2018-11-11T22:42:00.927' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (667, CAST(N'2018-11-11T22:45:11.007' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2018-11-11T22:48:10.810' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2018-11-11T22:48:50.460' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (667, CAST(N'2018-11-12T02:03:36.307' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2018-11-12T22:48:32.797' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2018-11-13T00:03:45.140' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (562, CAST(N'2018-12-05T22:02:22.153' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2018-12-09T13:48:57.983' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (768, CAST(N'2018-12-25T23:59:19.703' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T01:59:40.117' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T02:00:57.447' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T02:01:49.060' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T02:02:00.303' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T02:03:00.783' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (769, CAST(N'2018-12-26T02:03:16.503' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (768, CAST(N'2018-12-26T14:26:07.383' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (771, CAST(N'2018-12-26T18:19:17.330' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (771, CAST(N'2018-12-26T18:21:12.673' AS DateTime), N'PEDIDO: PRECIO - Anterior: 3505 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (445, CAST(N'2018-08-28T22:01:17.357' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (437, CAST(N'2018-08-28T22:04:16.160' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (552, CAST(N'2018-09-08T21:11:09.187' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (554, CAST(N'2018-09-09T12:25:47.010' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-17T23:40:00.850' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (667, CAST(N'2018-11-13T00:10:17.607' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (770, CAST(N'2018-12-26T11:04:56.890' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (770, CAST(N'2018-12-26T14:11:25.413' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T12:02:32.687' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 35 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2018-12-30T20:24:44.237' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 50 Nuevo: 51', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T20:38:27.770' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 30 Nuevo: 31', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T20:46:36.130' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 31 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T20:47:45.727' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 22 Nuevo: 27', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T21:57:57.860' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 31 Nuevo: 21', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T21:57:57.860' AS DateTime), N'PEDIDO: PRECIO - Anterior: 3505 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:21:39.380' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 22 Nuevo: 24', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:22:00.607' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 35 Nuevo: 24', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:22:00.607' AS DateTime), N'PEDIDO: PRECIO - Anterior: 3505 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:29:15.813' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 24 Nuevo: 29', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:29:33.440' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 29 Nuevo: 34', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:29:51.743' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 45 Nuevo: 34', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:30:18.753' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 34 Nuevo: 39', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:30:58.740' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 39 Nuevo: 43', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:32:28.933' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 43 Nuevo: 47', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:34:31.643' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 47 Nuevo: 51', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:37:35.763' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 54 Nuevo: 43', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:37:41.597' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 58 Nuevo: 47', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:37:58.013' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 47 Nuevo: 45', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:38:18.587' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 45 Nuevo: 49', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:41:29.013' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 49 Nuevo: 53', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:56:35.360' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 64 Nuevo: 59', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:18:46.683' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 75 Nuevo: 40', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:30:30.747' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 40 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T08:27:49.850' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 77 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2018-12-31T08:28:41.033' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 101 Nuevo: 103', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:39:13.980' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 85 Nuevo: 13', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:39:13.980' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2019-04-11T00:38:25.953' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2019-04-11T00:38:53.290' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2019-04-11T00:50:07.613' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2019-04-11T00:50:28.250' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (777, CAST(N'2019-04-13T12:03:23.430' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (774, CAST(N'2019-04-13T17:07:26.190' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (778, CAST(N'2019-04-25T22:06:35.067' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (778, CAST(N'2019-05-26T10:36:56.803' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (778, CAST(N'2019-05-26T10:42:12.737' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (778, CAST(N'2019-05-26T10:42:42.413' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-05-26T18:36:57.983' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (664, CAST(N'2019-05-26T19:25:25.860' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-05-26T18:49:46.080' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (562, CAST(N'2019-05-26T19:02:15.993' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (779, CAST(N'2019-05-26T20:22:37.817' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (773, CAST(N'2019-05-26T21:45:38.450' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (780, CAST(N'2019-05-26T22:04:24.447' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (777, CAST(N'2019-05-26T22:20:50.523' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (777, CAST(N'2019-05-26T22:21:09.423' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (777, CAST(N'2019-05-26T22:21:29.487' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (562, CAST(N'2019-05-26T18:55:37.150' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (777, CAST(N'2019-05-26T21:37:04.703' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (550, CAST(N'2018-09-05T10:14:26.180' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (551, CAST(N'2018-09-06T20:23:41.923' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (770, CAST(N'2018-12-26T11:17:45.033' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (773, CAST(N'2018-12-26T18:28:43.900' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (774, CAST(N'2018-12-26T18:32:52.713' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (775, CAST(N'2018-12-26T18:35:54.397' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
GO
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (776, CAST(N'2018-12-26T18:36:21.397' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (772, CAST(N'2018-12-26T18:36:40.550' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (776, CAST(N'2018-12-26T18:40:06.057' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:50:52.997' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 13 Nuevo: 6', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T13:23:46.750' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 6 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T13:25:25.673' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 93 Nuevo: 14', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T13:26:06.300' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 14 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T13:27:00.667' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T13:44:28.483' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:04:42.570' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 10 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:04:42.570' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:06:17.390' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:20:26.570' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2019-01-01T14:25:41.873' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:39:58.650' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 12 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T14:39:58.650' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T16:02:37.750' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2019-01-01T22:13:59.863' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2019-01-01T22:14:39.520' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-01-01T22:23:19.077' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 105 Nuevo: 100', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-10T15:16:45.203' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 40 Nuevo: 45', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-10T15:16:45.207' AS DateTime), N'PEDIDO: PRECIO - Anterior: 0 Nuevo: 16303', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (335, CAST(N'2018-09-10T15:32:12.027' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (554, CAST(N'2018-09-10T15:44:46.257' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (554, CAST(N'2018-09-10T15:45:15.800' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (554, CAST(N'2018-09-10T15:45:41.213' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (554, CAST(N'2018-09-10T15:45:59.157' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: STOCK          ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-10T16:09:05.220' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:11:10.067' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:26:24.020' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:27:18.043' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:27:26.580' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:28:30.870' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (556, CAST(N'2018-09-10T16:29:28.690' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (555, CAST(N'2018-09-10T18:46:35.590' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (550, CAST(N'2018-09-10T18:54:29.363' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2018-09-10T19:01:16.503' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-09-10T19:17:41.717' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-09-10T19:27:29.313' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-09-10T19:28:16.930' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (443, CAST(N'2018-09-10T19:30:34.383' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (564, CAST(N'2018-09-18T09:57:35.733' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2018-11-12T23:20:07.410' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T20:45:50.347' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T21:02:49.167' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T21:03:12.373' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T21:03:20.377' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-09-25T12:59:01.213' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2018-11-11T22:21:22.800' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:25:11.080' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (667, CAST(N'2018-11-11T22:43:37.673' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (668, CAST(N'2018-11-11T22:46:03.310' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T20:48:19.050' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (767, CAST(N'2018-12-09T20:49:11.527' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:24:06.260' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:25:25.283' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (663, CAST(N'2018-11-11T20:26:09.530' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (664, CAST(N'2018-11-11T20:37:08.033' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (664, CAST(N'2018-11-11T20:37:17.840' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN COLA         Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2018-11-11T22:24:10.720' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (666, CAST(N'2018-11-11T22:27:26.677' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (665, CAST(N'2018-11-12T23:13:35.850' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: EN COLA        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T20:49:47.567' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 27 Nuevo: 28', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T20:52:03.343' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 28 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:06:59.163' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 30 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:11:37.520' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 9 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:12:19.177' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 45 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:12:28.520' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 50 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:15:41.923' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 55 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:17:05.773' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 60 Nuevo: 8', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T22:17:08.893' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:18:17.157' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 32 Nuevo: 22', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T22:18:17.157' AS DateTime), N'PEDIDO: PRECIO - Anterior: 3505 Nuevo: 0', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:09:05.473' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 59 Nuevo: 60', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:09:15.997' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 60 Nuevo: 61', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:10:53.613' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 61 Nuevo: 38', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:12:34.443' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 74 Nuevo: 39', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-30T23:14:19.800' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 73 Nuevo: 39', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T16:02:14.160' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T16:11:30.793' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-01-01T16:15:01.273' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 102 Nuevo: 107', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-01-01T16:15:01.273' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-01-01T16:15:16.413' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 107 Nuevo: 105', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (560, CAST(N'2019-01-01T16:16:51.810' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (558, CAST(N'2019-01-01T22:06:28.023' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 103 Nuevo: 2', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (771, CAST(N'2018-12-26T18:21:12.673' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (772, CAST(N'2018-12-26T18:26:25.310' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (547, CAST(N'2018-12-28T21:06:23.600' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: CANCELADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T11:25:09.810' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 35 Nuevo: 30', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (545, CAST(N'2018-12-30T11:28:26.647' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 30 Nuevo: 35', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T08:26:46.003' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 30 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T08:26:46.173' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 17 Nuevo: 9', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T08:27:11.547' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 76 Nuevo: 10', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:29:15.540' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 11 Nuevo: 16', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:29:46.077' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 83 Nuevo: 17', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:30:29.690' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 17 Nuevo: 11', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2018-12-31T16:30:42.707' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 11 Nuevo: 12', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (548, CAST(N'2019-01-01T15:52:16.053' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (775, CAST(N'2019-05-26T19:06:51.577' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (775, CAST(N'2019-05-26T19:07:42.447' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
GO
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (775, CAST(N'2019-05-26T19:10:43.610' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (775, CAST(N'2019-05-26T19:11:59.670' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (779, CAST(N'2019-05-26T19:46:23.810' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2019-05-26T19:48:26.403' AS DateTime), N'PEDIDO: CANTIDAD - Anterior: 51 Nuevo: 61', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2019-05-26T19:48:26.403' AS DateTime), N'PEDIDO: PRECIO - Anterior: 0 Nuevo: 15505', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2019-05-26T19:48:26.403' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: RECIBIDO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (563, CAST(N'2019-05-26T22:01:15.050' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (780, CAST(N'2019-05-26T22:03:24.083' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (780, CAST(N'2019-05-26T22:03:41.883' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (780, CAST(N'2019-05-26T22:06:26.097' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (781, CAST(N'2019-05-26T22:09:35.047' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (782, CAST(N'2019-05-26T22:11:28.213' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (783, CAST(N'2019-05-26T22:13:09.910' AS DateTime), N'PEDIDO: RECIBIDO', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (781, CAST(N'2019-05-26T22:14:12.360' AS DateTime), N'PEDIDO: ESTADO - Anterior: RECIBIDO        Nuevo: EN PRODUCCION  ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (781, CAST(N'2019-05-26T22:15:31.387' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (781, CAST(N'2019-05-26T22:15:46.110' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (781, CAST(N'2019-05-26T22:16:05.133' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (779, CAST(N'2019-05-26T22:16:59.440' AS DateTime), N'PEDIDO: ESTADO - Anterior: EN PRODUCCION   Nuevo: DEPOSITO       ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (779, CAST(N'2019-05-26T22:17:13.770' AS DateTime), N'PEDIDO: ESTADO - Anterior: DEPOSITO        Nuevo: ENVIADO        ', NULL)
INSERT [dbo].[REGISTRO_PEDIDOS] ([ID_PEDIDO], [FECHA], [ENTRADA], [USUARIO]) VALUES (779, CAST(N'2019-05-26T22:17:30.967' AS DateTime), N'PEDIDO: ESTADO - Anterior: ENVIADO         Nuevo: ENTREGADO      ', NULL)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-03-29T04:15:46.073' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 150', N'MANU      ', 1)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:04:21.473' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 1500', N'MANU      ', 2)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:05:13.050' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 1500', N'MANU      ', 4)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:10:08.070' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 2500', N'MANU      ', 1)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:10:08.257' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 2500', N'MANU      ', 3)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:10:08.413' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 2500', N'MANU      ', 5)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:14:06.260' AS DateTime), N'PRECIO ANTERIOR: 1500,00, NUEVO 1875,00', N'MANU      ', 4)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T23:14:31.913' AS DateTime), N'PRECIO ANTERIOR: 1875,00, NUEVO 1500,00', N'MANU      ', 4)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-03-29T04:15:46.087' AS DateTime), N'STOCK ANTERIOR: 210, NUEVO 220', N'MANU      ', 1)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T22:57:10.440' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 1500', N'MANU      ', 1)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T22:58:03.440' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 1500', N'MANU      ', 3)
INSERT [dbo].[REGISTRO_PRODUCTOS] ([FECHA], [CAMBIOS], [USUARIO], [COD_PRODUCTO]) VALUES (CAST(N'2019-04-04T22:58:03.580' AS DateTime), N'PRECIO ANTERIOR: 0,00, NUEVO 1500', N'MANU      ', 5)
ALTER TABLE [dbo].[DESPIECE] ADD  CONSTRAINT [DF_DESPIECE_EN_PROGRESO]  DEFAULT ((1)) FOR [EN_PROGRESO]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_ID_ESTADO]  DEFAULT ((0)) FOR [ID_ESTADO]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_MARCO_TER]  DEFAULT ((0)) FOR [MARCO_TER]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_HOJAS_TER_1]  DEFAULT ((0)) FOR [HOJAS_TER]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_ENSAMBLADOS_1]  DEFAULT ((0)) FOR [ENSAMBLADOS]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_EN_DEPOSITO_1]  DEFAULT ((0)) FOR [EN_DEPOSITO]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_STOCK_1]  DEFAULT ((0)) FOR [STOCK]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_ULT_MODIF]  DEFAULT (CONVERT([date],getdate())) FOR [ULT_MODIF]
GO
ALTER TABLE [dbo].[ITEMS] ADD  CONSTRAINT [DF_ITEMS_P_IMPRIMIRº]  DEFAULT ((0)) FOR [P_IMPRIMIR]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_ID_ESTADO]  DEFAULT ((0)) FOR [ID_ESTADO]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_MARCO_TER]  DEFAULT ((0)) FOR [MARCO_TER]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_HOJAS_TER_1]  DEFAULT ((0)) FOR [HOJAS_TER]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_ENSAMBLADOS_1]  DEFAULT ((0)) FOR [ENSAMBLADOS]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_EN_DEPOSITO_1]  DEFAULT ((0)) FOR [EN_DEPOSITO]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_STOCK_1]  DEFAULT ((0)) FOR [STOCK]
GO
ALTER TABLE [dbo].[ITEMS_TEMP] ADD  CONSTRAINT [DF_ITEMS_TEMP_ULT_MODIF]  DEFAULT (CONVERT([date],getdate())) FOR [ULT_MODIF]
GO
ALTER TABLE [dbo].[MATERIALES] ADD  CONSTRAINT [DF_MATERIALES_STOCK_RESERVADO]  DEFAULT ((0)) FOR [STOCK_RESERVADO]
GO
ALTER TABLE [dbo].[MATERIALES] ADD  CONSTRAINT [DF_MATERIALES_STOCK_DISPONIBLE]  DEFAULT ((0)) FOR [STOCK_DISPONIBLE]
GO
ALTER TABLE [dbo].[MATERIALES] ADD  CONSTRAINT [DF_MATERIALES_ES_LINEA]  DEFAULT ((0)) FOR [ES_LINEA]
GO
ALTER TABLE [dbo].[PEDIDOS] ADD  CONSTRAINT [DF_pedidos_estado]  DEFAULT ((0)) FOR [ID_ESTADO]
GO
ALTER TABLE [dbo].[PEDIDOS] ADD  CONSTRAINT [DF_PEDIDOS_FECHA_RECIBIDO]  DEFAULT (CONVERT([date],getdate())) FOR [FECHA_RECIBIDO]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_idMano]  DEFAULT ((0)) FOR [idMano]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_precio]  DEFAULT ((0)) FOR [precio]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_stock]  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_VALIDO_DESDE]  DEFAULT (getdate()) FOR [VALIDO_DESDE]
GO
ALTER TABLE [dbo].[REGISTRO_ITEMS] ADD  CONSTRAINT [DF_REGISTRO_ITEMS_FECHA]  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[REGISTRO_MATERIALES] ADD  CONSTRAINT [DF_REGISTRO_MATERIALES_FECHA]  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[REGISTRO_PEDIDOS] ADD  CONSTRAINT [DF_REGISTRO_PEDIDOS_FECHA]  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[REGISTRO_PRODUCTOS] ADD  CONSTRAINT [DF_REGISTRO_PRODUCTOS_FECHA]  DEFAULT (getdate()) FOR [FECHA]
GO
ALTER TABLE [dbo].[DESPIECE]  WITH CHECK ADD  CONSTRAINT [FK_DESPIECE_MATERIALES] FOREIGN KEY([ID_PIEZA])
REFERENCES [dbo].[MATERIALES] ([id])
GO
ALTER TABLE [dbo].[DESPIECE] CHECK CONSTRAINT [FK_DESPIECE_MATERIALES]
GO
ALTER TABLE [dbo].[DESPIECE]  WITH CHECK ADD  CONSTRAINT [FK_DESPIECE_PRODUCTOS] FOREIGN KEY([ID_PROD])
REFERENCES [dbo].[PRODUCTOS] ([id])
GO
ALTER TABLE [dbo].[DESPIECE] CHECK CONSTRAINT [FK_DESPIECE_PRODUCTOS]
GO
ALTER TABLE [dbo].[ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_pedidos] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDOS] ([ID])
GO
ALTER TABLE [dbo].[ITEMS] CHECK CONSTRAINT [FK_ITEMS_pedidos]
GO
ALTER TABLE [dbo].[ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_PRODUCTOS] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTOS] ([id])
GO
ALTER TABLE [dbo].[ITEMS] CHECK CONSTRAINT [FK_ITEMS_PRODUCTOS]
GO
ALTER TABLE [dbo].[ITEMS_TEMP]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_TEMP_pedidos] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDOS] ([ID])
GO
ALTER TABLE [dbo].[ITEMS_TEMP] CHECK CONSTRAINT [FK_ITEMS_TEMP_pedidos]
GO
ALTER TABLE [dbo].[ITEMS_TEMP]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_TEMP_PRODUCTOS] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTOS] ([id])
GO
ALTER TABLE [dbo].[ITEMS_TEMP] CHECK CONSTRAINT [FK_ITEMS_TEMP_PRODUCTOS]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_clientes] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTES] ([ID])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK_pedidos_clientes]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_PEDIDOS_estados] FOREIGN KEY([ID_ESTADO])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[PEDIDOS] CHECK CONSTRAINT [FK_PEDIDOS_estados]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_chapas] FOREIGN KEY([idChapa])
REFERENCES [dbo].[chapas] ([id])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_chapas]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_hojas] FOREIGN KEY([idHoja])
REFERENCES [dbo].[hojas] ([id])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_hojas]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_lineas] FOREIGN KEY([idLinea])
REFERENCES [dbo].[lineas] ([id])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_lineas]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_maderas] FOREIGN KEY([idMadera])
REFERENCES [dbo].[maderas] ([ID])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_maderas]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_manos] FOREIGN KEY([idMano])
REFERENCES [dbo].[manos] ([id])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_manos]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_marcos] FOREIGN KEY([idMarco])
REFERENCES [dbo].[marcos] ([id])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_marcos]
GO
ALTER TABLE [dbo].[REGISTRO_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_ITEMS_ITEMS] FOREIGN KEY([ID_ITEM])
REFERENCES [dbo].[ITEMS] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_ITEMS] CHECK CONSTRAINT [FK_REGISTRO_ITEMS_ITEMS]
GO
ALTER TABLE [dbo].[REGISTRO_PEDIDOS]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_PEDIDOS_PEDIDOS] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDOS] ([ID])
GO
ALTER TABLE [dbo].[REGISTRO_PEDIDOS] CHECK CONSTRAINT [FK_REGISTRO_PEDIDOS_PEDIDOS]
GO
/****** Object:  StoredProcedure [dbo].[SP_COMBO_CHAPA]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMBO_CHAPA]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT P.idChapa as id, NOMBRE from PRODUCTOS P
inner join CHAPAS c on c.id=P.idChapa
where idLinea =@LINEA AND P.VALIDO_HASTA IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[SP_COMBO_HOJA]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMBO_HOJA]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT P.idHoja as id, NOMBRE from PRODUCTOS P
inner join hojas H on H.id=P.idHoja
where idLinea =@LINEA AND P.VALIDO_HASTA IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[SP_COMBO_MADERA]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMBO_MADERA]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT P.idMadera as id, M.NOMBRE from PRODUCTOS P
inner join MADERAS M on M.id=P.idMadera
where idLinea =@LINEA AND P.VALIDO_HASTA IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[SP_COMBO_MANO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMBO_MANO]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT P.idMano as id, M.NOMBRE from PRODUCTOS P
inner join MANOS M on M.id=P.idMano
where idLinea =@LINEA AND P.VALIDO_HASTA IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[SP_COMBO_MARCO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMBO_MARCO]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT DISTINCT P.idMarco as id, M.NOMBRE from PRODUCTOS P
inner join marcos M on M.id=P.idMarco
where idLinea =@LINEA AND P.VALIDO_HASTA IS NULL

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DESPIECE_PEDIDO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DESPIECE_PEDIDO]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT D.ID_PIEZA, M.NOMBRE,  SUM(I.CANT*D.CONSUMO) AS CONSUMO, M.STOCK_DISPONIBLE, CASE  WHEN M.STOCK_DISPONIBLE - SUM(I.CANT*D.CONSUMO) >= 0 THEN NULL ELSE M.STOCK_DISPONIBLE - SUM(I.CANT*D.CONSUMO)  END as FALTANTE FROM DESPIECE D
		INNER JOIN ITEMS I ON I.ID_PRODUCTO = D.ID_PROD
		INNER JOIN MATERIALES M ON ID_PIEZA=M.id
		WHERE I.ID_PEDIDO=@ID_PEDIDO AND ID_ESTADO < 2
	GROUP BY D.ID_PIEZA, M.NOMBRE, M.STOCK_DISPONIBLE
	ORDER BY NOMBRE

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DESPIECE_PRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DESPIECE_PRODUCTO] 
	-- Add the parameters for the stored procedure here
	@ID_PROD SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DESPIECE.ID_PIEZA, MATERIALES.NOMBRE, DESPIECE.CONSUMO, MATERIALES.UNIDAD, MATERIALES.STOCK_DISPONIBLE FROM DESPIECE
INNER JOIN MATERIALES ON MATERIALES.ID = DESPIECE.ID_PIEZA
WHERE DESPIECE.ID_PROD=@ID_PROD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DESPIECE_PRODUCTO_RECALC]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DESPIECE_PRODUCTO_RECALC]
	-- Add the parameters for the stored procedure here
	
	@ID_PEDIDO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT D.ID_PIEZA, M.NOMBRE,  SUM((I.CANT-I.STOCK)*D.CONSUMO) AS CONSUMO, M.STOCK_DISPONIBLE, CASE  WHEN M.STOCK_DISPONIBLE - SUM((I.CANT-I.STOCK)*D.CONSUMO) > 0 THEN NULL ELSE M.STOCK_DISPONIBLE - SUM((I.CANT-I.STOCK)*D.CONSUMO)  END as FALTANTE FROM DESPIECE D
		INNER JOIN ITEMS_TEMP I ON I.ID_PRODUCTO = D.ID_PROD
		INNER JOIN MATERIALES M ON ID_PIEZA=M.id
		WHERE I.ID_PEDIDO=@ID_PEDIDO
	GROUP BY D.ID_PIEZA, M.NOMBRE, M.STOCK_DISPONIBLE
	ORDER BY NOMBRE

	DELETE ITEMS_TEMP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_IDPRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_IDPRODUCTO]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT,
	@CHAPA SMALLINT,
	@HOJA SMALLINT,
	@MARCO SMALLINT,
	@MADERA SMALLINT,
	@MANO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID FROM PRODUCTOS WHERE(IDLINEA = @LINEA AND idChapa = @CHAPA AND idHoja = @HOJA AND idMarco = @MARCO AND idMadera = @MADERA AND idMano = @MANO)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MATERIALES]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_MATERIALES]
	-- Add the parameters for the stored procedure here
	@ID_CHAPA SMALLINT,
	@ID_MADERA SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT M.ID, M.NOMBRE, M.UNIDAD FROM MATERIALES M
WHERE M.ES_LINEA=0

UNION

SELECT M.ID, M.NOMBRE, M.UNIDAD FROM MATERIALES M
INNER JOIN chapas C ON C.COD_MAT = M.id
WHERE M.ES_LINEA=1 AND C.ID=@ID_CHAPA

UNION

SELECT M.ID, M.NOMBRE, M.UNIDAD FROM MATERIALES M
INNER JOIN MADERAS MA ON MA.COD_MAT = M.id
WHERE M.ES_LINEA=1 AND MA.ID=@ID_MADERA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_PRODUCTO]
	-- Add the parameters for the stored procedure here
	@LINEA SMALLINT,
	@CHAPA SMALLINT,
	@HOJA SMALLINT,
	@MARCO SMALLINT,
	@MADERA SMALLINT,
	@MANO SMALLINT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM PRODUCTOS WHERE(IDLINEA = @LINEA AND idChapa = @CHAPA AND idHoja = @HOJA AND idMarco = @MARCO AND idMadera = @MADERA AND idMano = @MANO AND VALIDO_HASTA IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRODUCTO_POR_ID]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_PRODUCTO_POR_ID]
	-- Add the parameters for the stored procedure here
	@ID smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM PRODUCTOS WHERE (id=@ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getStock]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getStock] 
	-- Add the parameters for the stored procedure here
	@IDLINEA smallint,
	@IDCHAPA smallint,
	@IDHOJA smallint,
	@IDMARCO smallint,
	@IDMADERA smallint,
	@IDMANO smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT L.NOMBRE as LINEA, H.NOMBRE AS HOJA, M.NOMBRE AS MARCO, D.NOMBRE AS MADERA, C.NOMBRE AS CHAPA, N.NOMBRE AS MANO, STOCK AS STOCK FROM PRODUCTOS P
		INNER JOIN LINEAS L ON L.ID=P.IDLINEA
		INNER JOIN CHAPAS C ON C.ID=P.IDCHAPA
		INNER JOIN HOJAS H ON H.ID=P.IDHOJA
		INNER JOIN MARCOS M ON M.ID=P.IDMARCO
		INNER JOIN MADERAS D ON D.ID=P.IDMADERA
		INNER JOIN MANOS N ON N.ID= P.IDMANO
		WHERE (IDLINEA=@IDLINEA AND IDCHAPA=@IDCHAPA AND IDHOJA=@IDHOJA AND IDMARCO=@IDMARCO AND IDMADERA=@IDMADERA AND IDMANO=@IDMANO)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_CLIENTE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_CLIENTE]
	-- Add the parameters for the stored procedure here
		@CUIT varchar(13),	       
        @NOMBRE varchar(50),
        @TELEFONO varchar(50),
        @MAIL varchar(50),
        @DIRECCION varchar(50),
        @CIUDAD varchar(50),
        @PROVINCIA varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CLIENTES (CUIT, NOMBRE, TELEFONO, MAIL, DIRECCION, CIUDAD, PROVINCIA) VALUES (@CUIT, @NOMBRE, @TELEFONO, @MAIL, @DIRECCION, @CIUDAD, @PROVINCIA)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_ITEM]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_ITEM]
	-- Add the parameters for the stored procedure here
	@ID_PRODUCTO smallint, 
	@ID_PEDIDO smallint, 
	@CANT int, 
	@MONTO money, 
	@STOCK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ITEMS (ID_PRODUCTO, ID_PEDIDO, CANT, MONTO, STOCK) VALUES(@ID_PRODUCTO, @ID_PEDIDO, @CANT, @MONTO, @STOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PEDIDO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_PEDIDO]
	-- Add the parameters for the stored procedure here
	@CLIENTE SMALLINT,
	@CANT SMALLINT,
	@PRECIO MONEY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.PEDIDOS (ID_CLIENTE, CANT_TOTAL, PRECIO_TOTAL) VALUES (@CLIENTE, @CANT, @PRECIO)
	DECLARE @ID SMALLINT = (SELECT MAX(ID) FROM PEDIDOS)
	INSERT INTO REGISTRO_PEDIDOS (ID_PEDIDO, ENTRADA) VALUES (@ID, 'PEDIDO: RECIBIDO')
	SELECT MAX(ID) FROM PEDIDOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_PRODUCTO]
	-- Add the parameters for the stored procedure here
	@ID_LINEA SMALLINT,
	@ID_CHAPA SMALLINT,
	@ID_HOJA SMALLINT,
	@ID_MARCO SMALLINT,
	@ID_MADERA SMALLINT,
	@ID_MANO SMALLINT,
	@PRECIO MONEY
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- INSERTAR PRODUCTO NUEVO
	DECLARE @COD INTEGER = (SELECT MAX(COD) FROM PRODUCTOS)
	INSERT INTO PRODUCTOS(COD, idLinea, idChapa, idHoja, idMarco, idMadera, idMano, precio) VALUES (@COD +1, @ID_LINEA, @ID_CHAPA, @ID_HOJA, @ID_MARCO, @ID_MADERA, @ID_MANO, @PRECIO)
	SELECT MAX(ID) FROM PRODUCTOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEM_ID]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEM_ID]
	-- Add the parameters for the stored procedure here
	@ID_ITEM SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select I.id as ITEM, PE.ID AS PEDIDO, L.nombre as Linea, H.nombre as HOJA, M.nombre as MARCO, MA.nombre as MADERA, C.nombre as CHAPA, I.CANT as CANT, N.nombre as MANO, I.STOCK from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID = @ID_ITEM
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEM_STOCK_TEMP]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEM_STOCK_TEMP] 
	-- Add the parameters for the stored procedure here
	@ID_ITEM SMALLINT,
	@STOCK SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ITEMS_TEMP SELECT * FROM ITEMS WHERE ID=@ID_ITEM
	UPDATE ITEMS_TEMP SET STOCK=@STOCK WHERE ID = @ID_ITEM
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO] 
	-- Add the parameters for the stored procedure here
	@idPedido smallInt
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select I.id as ITEM, I.CANT as CANT, L.nombre as LINEA, MA.nombre as MADERA, H.nombre as HOJA, M.nombre as MARCO, C.nombre as CHAPA, N.nombre as MANO, E.nombre as ESTADO from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @idPedido
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO_ENCURSO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO_ENCURSO]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select I.id as ITEM, I.CANT as CANT, L.nombre as LINEA, MA.nombre as MADERA, H.nombre as HOJA, M.nombre as MARCO, C.nombre as CHAPA, N.nombre as MANO, I.STOCK, I.MARCO_TER, I.HOJAS_TER, I.ensamblados, E.nombre as ESTADO from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @ID_PEDIDO AND I.ID_ESTADO IN (1,2)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO_ENSAMBLADOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO_ENSAMBLADOS]
	-- Add the parameters for the stored procedure here
	
	@ID_PEDIDO SMALLint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select I.id as ITEM, I.CANT as CANT, L.nombre as LINEA, MA.nombre as MADERA, H.nombre as HOJA, M.nombre as MARCO, C.nombre as CHAPA, N.nombre as MANO, I.STOCK, I.ensamblados AS ENSAMBLADAS, I.EN_DEPOSITO AS DEPOSITO,(I.ensamblados - I.EN_DEPOSITO ) AS 'PARA ALMACENAR' from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @ID_PEDIDO AND I.ID_ESTADO =2
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO_ESTADO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO_ESTADO]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLint = 0,
	@ID_ESTADO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT row_number() over(order by I.id asc) as '#', I.id as ITEM, I.CANT as CANT, L.nombre as LINEA, MA.nombre as MADERA, H.nombre as HOJA, M.nombre as MARCO, C.nombre as CHAPA, N.nombre as MANO, E.nombre as ESTADO from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @ID_PEDIDO AND I.ID_ESTADO = @ID_ESTADO

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO_ESTADO_STOCK]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO_ESTADO_STOCK]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLint = 0,
	@ID_ESTADO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select I.id as ITEM, I.CANT as CANT, L.nombre as LINEA, MA.nombre as MADERA, H.nombre as HOJA, M.nombre as MARCO, C.nombre as CHAPA, N.nombre as MANO, E.nombre as ESTADO, P.stock AS STOCK from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @ID_PEDIDO AND I.ID_ESTADO = @ID_ESTADO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ITEMS_PEDIDO_MODIFICAR]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ITEMS_PEDIDO_MODIFICAR]
	-- Add the parameters for the stored procedure here
	@idPedido smallInt
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select I.id as ITEM, I.CANT as CANT, L.ID AS ID_LINEA, L.nombre as LINEA,MA.ID AS ID_MADERA, MA.nombre as MADERA,H.ID AS ID_HOJA, H.nombre as HOJA,M.ID AS ID_MARCO, M.nombre as MARCO, C.ID AS ID_CHAPA, C.nombre as CHAPA,N.ID AS ID_MANO, N.nombre as MANO, E.nombre as ESTADO, I.ID_ESTADO from ITEMS I 
                                            INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO
											INNER JOIN pedidos PE ON PE.ID = I.ID_PEDIDO
											inner join hojas H on P.IdHoja = H.id
                                            inner join marcos M on P.idMarco = M.id
                                            inner join maderas MA on P.idMadera = MA.id
                                            inner join chapas C on P.idChapa = C.id
                                            inner join manos N on P.idMano = N.id
                                            inner join lineas L on P.idLinea = L.id
                                            inner join estados E on I.ID_ESTADO= E.id
                                            WHERE I.ID_PEDIDO = @idPedido AND I.ID_ESTADO <> 7
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LIMPIAR_PRODUCTOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LIMPIAR_PRODUCTOS]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SET NOCOUNT ON;

    DELETE DESPIECE WHERE ID_PROD>204
	DELETE PRODUCTOS WHERE ID>204
	DELETE REGISTRO_PRODUCTOS WHERE COD_PRODUCTO > 204
	UPDATE PRODUCTOS SET VALIDO_HASTA=NULL
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTA_PRODUCTOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTA_PRODUCTOS]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.ID, L.NOMBRE as LINEA, C.NOMBRE AS CHAPA, H.NOMBRE AS HOJA, M.NOMBRE AS MARCO, D.NOMBRE AS MADERA, N.NOMBRE AS MANO, P.precio AS PRECIO, P.stock AS STOCK FROM PRODUCTOS P
			INNER JOIN LINEAS L ON L.ID=P.IDLINEA
			INNER JOIN CHAPAS C ON C.ID=P.IDCHAPA
			INNER JOIN HOJAS H ON H.ID=P.IDHOJA
			INNER JOIN MARCOS M ON M.ID=P.IDMARCO
			INNER JOIN MADERAS D ON D.ID=P.IDMADERA
			INNER JOIN MANOS N ON N.ID= P.IDMANO

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PEDIDOS_EN_CURSO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PEDIDOS_EN_CURSO]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select P.ID AS 'Nro Pedido', C.nombre as Cliente, P.CANT_TOTAL as Cantidad, E.nombre as Estado, P.FECHA_RECIBIDO as 'Fecha Recibido', 
P.FECHA_MODIFICADO as 'Ultima Modificacion', sum(I.stock) AS STOCK from PEDIDOS P 
inner join clientes C on p.ID_CLIENTE = c.id
inner join estados E on E.id = P.ID_ESTADO
INNER JOIN ITEMS I ON P.ID=I.ID_PEDIDO
where P.ID_ESTADO IN (1, 2)
group by P.ID, C.NOMBRE, P.CANT_TOTAL, E.nombre, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO
order by P.FECHA_RECIBIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PEDIDOS_ITEMS_ENDEPOSITO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PEDIDOS_ITEMS_ENDEPOSITO]
	-- MUESTRA PEDIDOS QUE TENGAN ITEMS CON PUERTAS EN DEPOSITO
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select DISTINCT(P.ID) AS 'Nro Pedido', C.nombre as Cliente, P.CANT_TOTAL as Cantidad, E.nombre as Estado, E.ID AS ID_ESTADO, P.FECHA_RECIBIDO as 'Fecha Recibido', 
	P.FECHA_MODIFICADO as 'Ultima Modificacion', P.ID_CLIENTE from PEDIDOS P 
	inner join clientes C on p.ID_CLIENTE = c.id
	inner join estados E on E.id = P.ID_ESTADO
	INNER JOIN ITEMS I ON P.ID=I.ID_PEDIDO
	where I.ID_ESTADO IN (3, 4)
	order by P.FECHA_RECIBIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PEDIDOS_ITEMS_ENSAMBLADO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PEDIDOS_ITEMS_ENSAMBLADO]
	--MUESTRA PEDIDOS QUE TIENE ALGUN ITEM DONDE HAYA MAS DE UNA PUERTA ENSAMBLADA

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select DISTINCT(P.ID) AS 'Nro Pedido', C.nombre as Cliente, P.CANT_TOTAL as Cantidad, E.nombre as Estado, P.FECHA_RECIBIDO as 'Fecha Recibido', 
	P.FECHA_MODIFICADO as 'Ultima Modificacion', SUM(I.ENSAMBLADOS - I.EN_DEPOSITo) as A_ALMACENAR  from PEDIDOS P 
	inner join clientes C on p.ID_CLIENTE = c.id
	inner join estados E on E.id = P.ID_ESTADO
	left JOIN ITEMS I ON P.ID=I.ID_PEDIDO
	where I.ENSAMBLADOS > 0 AND (I.CANT - I.STOCK-I.EN_DEPOSITO>0) AND P.ID_ESTADO <> 7
	GROUP BY P.ID, C.nombre, P.CANT_TOTAL, E.nombre, P.FECHA_RECIBIDO, P.FECHA_MODIFICADO
	order by P.FECHA_RECIBIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PEDIDOS_POR_ESTADO_ITEM]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PEDIDOS_POR_ESTADO_ITEM]
	-- Add the parameters for the stored procedure here
	@estado int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select P.ID AS 'Nro Pedido', C.nombre as Cliente, P.CANT_TOTAL as Cantidad, E.nombre as Estado, P.FECHA_RECIBIDO as 'Fecha Recibido', 
P.FECHA_MODIFICADO as 'Ultima Modificacion' from PEDIDOS P 
inner join clientes C on p.ID_CLIENTE = c.id
inner join estados E on E.id = P.ID_ESTADO
INNER JOIN ITEMS I ON P.ID=I.ID_PEDIDO
where I.ID_ESTADO <= @estado
order by P.FECHA_RECIBIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PEDIDOS_RECIBIDOS]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PEDIDOS_RECIBIDOS]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select DISTINCT(P.ID) AS 'Nro Pedido', C.nombre as Cliente, P.CANT_TOTAL as Cantidad, E.nombre as Estado, P.FECHA_RECIBIDO as 'Fecha Recibido', 
P.FECHA_MODIFICADO as 'Ultima Modificacion' from PEDIDOS P 
inner join clientes C on p.ID_CLIENTE = c.id
inner join estados E on E.id = P.ID_ESTADO
INNER JOIN ITEMS I ON P.ID=I.ID_PEDIDO
where I.ID_ESTADO= 0
order by P.FECHA_RECIBIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REMITO_PEDIDO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REMITO_PEDIDO]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        PE.ID AS PEDIDO, I.CANT, L.nombre AS LINEA, MA.NOMBRE AS MADERA, H.nombre AS HOJA, M.nombre AS MARCO, C.nombre AS CHAPA, N.nombre AS MANO, E.nombre AS ESTADO, CL.CUIT, CL.NOMBRE AS CLIENTE, 
                         CL.DIRECCION, CL.CIUDAD, CL.PROVINCIA
FROM            dbo.ITEMS AS I INNER JOIN
                         dbo.PRODUCTOS AS P ON P.id = I.ID_PRODUCTO INNER JOIN
                         dbo.PEDIDOS AS PE ON PE.ID = I.ID_PEDIDO INNER JOIN
                         dbo.hojas AS H ON P.idHoja = H.id INNER JOIN
                         dbo.marcos AS M ON P.idMarco = M.id INNER JOIN
                         dbo.maderas AS MA ON P.idMadera = MA.ID INNER JOIN
                         dbo.chapas AS C ON P.idChapa = C.id INNER JOIN
                         dbo.manos AS N ON P.idMano = N.id INNER JOIN
                         dbo.lineas AS L ON P.idLinea = L.id INNER JOIN
                         dbo.estados AS E ON I.ID_ESTADO = E.id INNER JOIN
                         dbo.CLIENTES AS CL ON CL.ID = PE.ID_CLIENTE
WHERE        (I.ID_ESTADO = 3) AND PE.ID=@ID_PEDIDO
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_CLIENTE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_CLIENTE]
	-- Add the parameters for the stored procedure here
		@ID SMALLINT,
		@CUIT varchar(13),	       
        @NOMBRE varchar(50),
        @TELEFONO varchar(50),
        @MAIL varchar(50),
        @DIRECCION varchar(50),
        @CIUDAD varchar(50),
        @PROVINCIA varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CLIENTES SET NOMBRE=@NOMBRE, TELEFONO=@TELEFONO, CUIT=@CUIT, MAIL=@MAIL, DIRECCION=@DIRECCION, CIUDAD=@CIUDAD, PROVINCIA=@PROVINCIA WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_DESPIECE]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_DESPIECE]
	-- Add the parameters for the stored procedure here
	@ID_PROD SMALLINT,
	@ID_PIEZA SMALLINT,
	@CONSUMO FLOAT
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE DESPIECE SET CONSUMO=@CONSUMO WHERE ID_PROD=@ID_PROD AND ID_PIEZA=@ID_PIEZA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_ITEM]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--USAR SP_UPDATE_STOCK PARA ACTUALZIAR STOCK
CREATE PROCEDURE [dbo].[SP_UPDATE_ITEM]
	-- Add the parameters for the stored procedure here
	@ID_ITEM SMALLINT,
	@ID_PRODUCTO SMALLINT,
	@CANT SMALLINT,
	@MONTO MONEY,
	@ID_ESTADO SMALLINT,
	@MARCO_TER INT,
	@HOJA_TER INT,
	@ENSAMBLADO INT,
	@EN_DEPOSITO INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CURR_CANT SMALLINT = (SELECT CANT FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_MONTO MONEY = (SELECT MONTO FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_ID_ESTADO SMALLINT = (SELECT ID_ESTADO FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_MARCO_TER SMALLINT = (SELECT MARCO_TER FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_HOJA_TER SMALLINT = (SELECT HOJAS_TER FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_ENSAMBLADO SMALLINT = (SELECT ENSAMBLADOS FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_EN_DEPOSITO SMALLINT = (SELECT EN_DEPOSITO FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_ID_PRODUCTO SMALLINT = (SELECT ID_PRODUCTO FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @ENSAMBLADOS SMALLINT = (SELECT ENSAMBLADOS FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @STOCK_ITEM SMALLINT = (SELECT STOCK FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @CURR_P_IMPRIMIR INT = (SELECT P_IMPRIMIR FROM ITEMS WHERE ID=@ID_ITEM)

	
	--CANTIDAD
	IF @CANT <> @CURR_CANT
	BEGIN
		UPDATE ITEMS SET CANT= @CANT WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' +CAST(@ID_ITEM AS VARCHAR) + ': CANTIDAD - Anterior: ' + CAST(@CURR_CANT AS VARCHAR) + ' CANTIDAD Nueva: ' + CAST(@CANT AS VARCHAR))
	END

	--PRODUCTO
	IF @ID_PRODUCTO <> @CURR_ID_PRODUCTO
	BEGIN
		UPDATE ITEMS SET ID_PRODUCTO=@ID_PRODUCTO WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' +CAST(@ID_ITEM AS VARCHAR) + ': PRODUCTO - Anterior: ' + CAST(@CURR_ID_PRODUCTO AS VARCHAR) + ' PRODUCTO Nuevo: ' + CAST(@ID_PRODUCTO AS VARCHAR))
	END

	--MONTO
	IF @MONTO <> @CURR_MONTO
	BEGIN
		UPDATE ITEMS SET MONTO= @MONTO WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM '+ CAST(@ID_ITEM AS VARCHAR) +': MONTO - Anterior: ' + CAST(@CURR_MONTO AS VARCHAR) + ' MONTO Nuevo: ' + CAST(@MONTO AS VARCHAR))
	END

	--ESTADO
	IF @ID_ESTADO <> @CURR_ID_ESTADO
	BEGIN
		DECLARE @NOM_ESTADO_NVO NCHAR(15)= (SELECT NOMBRE FROM estados WHERE ID= @ID_ESTADO)
		DECLARE @NOM_ESTADO_ACT NCHAR(15)= (SELECT NOMBRE FROM estados WHERE ID= @CURR_ID_ESTADO)
		
		UPDATE ITEMS SET ID_ESTADO= @ID_ESTADO WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' + CAST(@ID_ITEM AS VARCHAR) + ': ESTADO - Anterior: ' + cast(@NOM_ESTADO_ACT as varchar) + ' Nuevo: ' + cast(@NOM_ESTADO_NVO as varchar))
		
		--ACTUALIZAR STOCK SI SE CANCELA O SE MUEVE A ESTADO STOCK
		IF @ID_ESTADO=7 OR @ID_ESTADO=6
		BEGIN
			UPDATE PRODUCTOS SET stock = stock + @ENSAMBLADOS + @STOCK_ITEM WHERE ID=@ID_PRODUCTO
		END
	END

	--MARCO TERMINADO
	IF @MARCO_TER <> @CURR_MARCO_TER
	BEGIN
		UPDATE ITEMS SET MARCO_TER= @MARCO_TER WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' + CAST(@ID_ITEM AS VARCHAR) + ': MARCOS TERMINADOS - Anterior: ' + cast(@CURR_MARCO_TER as varchar) + ' Nuevo: ' +cast(@MARCO_TER as varchar))
	END

	--HOJAS TERMINADAS
	IF @HOJA_TER <> @CURR_HOJA_TER
	BEGIN
		UPDATE ITEMS SET HOJAS_TER= @HOJA_TER WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' + CAST(@ID_ITEM AS VARCHAR) + ': HOJAS TERMINADAS - Anterior: ' + cast(@CURR_HOJA_TER as varchar) + ' Nuevo: ' + cast(@HOJA_TER as varchar))
	END

	--ENSAMBLADAS
	IF @ENSAMBLADO <> @CURR_ENSAMBLADO
	BEGIN
		UPDATE ITEMS SET ENSAMBLADOS= @ENSAMBLADO, P_IMPRIMIR= (@ENSAMBLADO - @EN_DEPOSITO) WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' + CAST(@ID_ITEM AS VARCHAR) + ': ENSAMBLADAS - Anterior: ' + cast(@CURR_ENSAMBLADO as varchar) + ' Nuevo: ' + cast(@ENSAMBLADO as varchar))
	END

	--EN DEPOSITO
	IF @EN_DEPOSITO <> @CURR_EN_DEPOSITO
	BEGIN
		UPDATE ITEMS SET EN_DEPOSITO= @EN_DEPOSITO WHERE ID=@ID_ITEM
		INSERT INTO REGISTRO_ITEMS (ID_ITEM, ENTRADA) VALUES(@ID_ITEM, 'ITEM ' + CAST(@ID_ITEM AS VARCHAR) + ': EN DEPOSITO - Anterior: ' + cast(@CURR_EN_DEPOSITO as varchar) + ' Nuevo: ' + cast(@EN_DEPOSITO as varchar))
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_MATERIALES]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_MATERIALES]
	-- Add the parameters for the stored procedure here
	@ID_PIEZA SMALLINT,
	@CANT DECIMAL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  MATERIALES SET STOCK_DISPONIBLE = STOCK_DISPONIBLE + @CANT WHERE ID = @ID_PIEZA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PEDIDO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_PEDIDO]
	-- Add the parameters for the stored procedure here
	@ID_PEDIDO SMALLINT,
	@ID_CLIENTE SMALLINT,
	@CANT_TOTAL INT,
	@PRECIO_TOTAL DECIMAL,
	@ID_ESTADO SMALLINT,
	@FECHA_ENTREGADO DATE=NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	DECLARE @CURR_ID_CLIENTE SMALLINT = (SELECT ID_CLIENTE FROM PEDIDOS WHERE ID=@ID_PEDIDO)
	DECLARE @CURR_CANT_TOTAL SMALLINT = (SELECT CANT_TOTAL FROM PEDIDOS WHERE ID=@ID_PEDIDO)
	DECLARE @CURR_PRECIO_TOTAL DECIMAL = (SELECT PRECIO_TOTAL FROM PEDIDOS WHERE ID=@ID_PEDIDO)
	DECLARE @CURR_ID_ESTADO SMALLINT = (SELECT ID_ESTADO FROM PEDIDOS WHERE ID=@ID_PEDIDO)
	
	IF @CURR_ID_CLIENTE <> @ID_CLIENTE
	BEGIN
		DECLARE @CURR_NOMBRE_CLIENTE NCHAR(15) = (SELECT NOMBRE FROM CLIENTES WHERE ID=@CURR_ID_CLIENTE)
		DECLARE @NOMBRE_CLIENTE NCHAR(15) = (SELECT NOMBRE FROM CLIENTES WHERE ID=@ID_CLIENTE)
		
		UPDATE PEDIDOS SET ID_CLIENTE=@ID_CLIENTE WHERE ID=@ID_PEDIDO

		INSERT INTO REGISTRO_PEDIDOS (ID_PEDIDO, ENTRADA) VALUES (@ID_PEDIDO, 'PEDIDO: CLIENTE - Anterior: ' + cast(@CURR_NOMBRE_CLIENTE as varchar) + ' Nuevo: ' + cast(@NOMBRE_CLIENTE as varchar))
	END

	IF @CANT_TOTAL <> @CURR_CANT_TOTAL
	BEGIN
		UPDATE PEDIDOS SET CANT_TOTAL=@CANT_TOTAL WHERE ID=@ID_PEDIDO
		INSERT INTO REGISTRO_PEDIDOS (ID_PEDIDO, ENTRADA) VALUES (@ID_PEDIDO, 'PEDIDO: CANTIDAD - Anterior: ' + cast(@CURR_CANT_TOTAL as varchar) + ' Nuevo: ' + cast(@CANT_TOTAL as varchar))
	END

	IF  @PRECIO_TOTAL <> @CURR_PRECIO_TOTAL
	BEGIN
		UPDATE PEDIDOS SET PRECIO_TOTAL=@PRECIO_TOTAL WHERE ID=@ID_PEDIDO
		INSERT INTO REGISTRO_PEDIDOS (ID_PEDIDO, ENTRADA) VALUES (@ID_PEDIDO, 'PEDIDO: PRECIO - Anterior: ' + cast(@CURR_PRECIO_TOTAL as varchar) + ' Nuevo: ' + cast(@PRECIO_TOTAL as varchar))
	END

	IF  @CURR_ID_ESTADO <> @ID_ESTADO
	BEGIN
		DECLARE @NOM_ESTADO_NVO NCHAR(15)= (SELECT NOMBRE FROM estados WHERE ID= @ID_ESTADO)
		DECLARE @NOM_ESTADO_ACT NCHAR(15)= (SELECT NOMBRE FROM estados WHERE ID= @CURR_ID_ESTADO)

		UPDATE PEDIDOS SET ID_ESTADO=@ID_ESTADO WHERE ID=@ID_PEDIDO
		INSERT INTO REGISTRO_PEDIDOS (ID_PEDIDO, ENTRADA) VALUES (@ID_PEDIDO, 'PEDIDO: ESTADO - Anterior: ' + @NOM_ESTADO_ACT + ' Nuevo: ' + @NOM_ESTADO_NVO)
	END
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PRODUCTO]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_PRODUCTO]
	-- Add the parameters for the stored procedure here
	@ID_PRODUCTO SMALLINT,
	@ID_LINEA SMALLINT,
	@ID_CHAPA SMALLINT,
	@ID_HOJA SMALLINT,
	@ID_MARCO SMALLINT,
	@ID_MADERA SMALLINT,
	@ID_MANO SMALLINT,
	@PRECIO MONEY,
	@DESP BIT = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE PRODUCTOS SET VALIDO_HASTA=GETDATE() WHERE ID = @ID_PRODUCTO
	DECLARE @COD INTEGER = (SELECT COD FROM PRODUCTOS WHERE ID=@ID_PRODUCTO)
	DECLARE @STOCK INTEGER = (SELECT STOCK FROM PRODUCTOS WHERE ID=@ID_PRODUCTO)

	INSERT INTO PRODUCTOS(COD, idLinea, idChapa, idHoja, idMarco, idMadera, idMano, precio, STOCK) VALUES (@COD, @ID_LINEA, @ID_CHAPA, @ID_HOJA, @ID_MARCO, @ID_MADERA, @ID_MANO, @PRECIO, @STOCK)
	
	DECLARE @NVO_ID_PROD SMALLINT = (SELECT MAX(ID) FROM PRODUCTOS)

	IF @DESP = 1
	BEGIN
		INSERT INTO DESPIECE (ID_PROD, ID_PIEZA, CONSUMO) 
		SELECT ID_PROD, ID_PIEZA, CONSUMO 
		FROM DESPIECE 
		WHERE ID_PROD = @ID_PRODUCTO
		UPDATE DESPIECE SET ID_PROD = @NVO_ID_PROD, EN_PROGRESO=0 WHERE EN_PROGRESO = 1
	END
	
	SELECT MAX(ID) FROM PRODUCTOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_STOCK]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_STOCK] 
	-- Add the parameters for the stored procedure here
	@STOCK SMALLINT,
	@ID_ITEM SMALLINT
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	DECLARE @STOCK_DIFF SMALLINT = @STOCK - (SELECT STOCK FROM ITEMS WHERE ID=@ID_ITEM)
	DECLARE @ID_PRODUCTO SMALLINT = (SELECT ID_PRODUCTO FROM ITEMS WHERE ID=@ID_ITEM)

	if @STOCK_DIFF <>0
	BEGIN
		update productos set stock= (stock - @STOCK_DIFF) where id = @ID_PRODUCTO
		update items set stock = STOCK + @STOCK_DIFF WHERE ID=@ID_ITEM
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_STOCK_MATERIAL]    Script Date: 26/05/2019 22:23:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UPDATE_STOCK_MATERIAL] 
	-- Add the parameters for the stored procedure here
	@DEPO BIT = 0,
	@ID_PIEZA SMALLINT,
	@CONSUMO FLOAT,
	@CANT FLOAT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @DEPO=1
		BEGIN
			UPDATE MATERIALES SET STOCK_RESERVADO = STOCK_RESERVADO - @CANT * @CONSUMO WHERE ID=@ID_PIEZA
		END
	
	ELSE
		BEGIN
			UPDATE MATERIALES SET STOCK_RESERVADO = STOCK_RESERVADO + (@CANT * @CONSUMO), STOCK_DISPONIBLE = STOCK_DISPONIBLE - (@CANT*@CONSUMO) WHERE ID=@ID_PIEZA
		END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[10] 2[46] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 665
               Bottom = 136
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 198
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 251
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 234
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 662
               Bottom = 234
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 198
               Left = 870
               Bottom = 328
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[4] 2[42] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_INTERNAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 268
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_INTERNAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_INTERNAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_SIMPLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 268
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_SIMPLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_SIMPLE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[18] 2[49] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_STOCK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 268
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_STOCK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ETIQUETAS_STOCK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[13] 2[53] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ITEMS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 251
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ITEMS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ITEMS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ORDENES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 251
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ORDENES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ORDENES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[14] 2[50] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 102
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 907
               Bottom = 102
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 102
               Left = 699
               Bottom = 215
               Right = 869
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 102
               Left = 907
               Bottom = 215
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "N"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 251
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 136
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 119
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_CLIENTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_CLIENTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[49] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 201
               Left = 36
               Bottom = 331
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 167
               Left = 343
               Bottom = 297
               Right = 513
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 345
               Left = 346
               Bottom = 458
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 9
               Left = 337
               Bottom = 139
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_EN_CURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_EN_CURSO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 102
               Left = 870
               Bottom = 232
               Right = 1043
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 866
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_MODIFICAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_MODIFICAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 136
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 119
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_TODOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PEDIDOS_TODOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[4] 2[55] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 102
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 215
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "N"
            Begin Extent = 
               Top = 102
               Left = 662
               Bottom = 198
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PRODUCTOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PRODUCTOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_PRODUCTOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[36] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 102
               Left = 870
               Bottom = 232
               Right = 1043
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 234
               Left = 271
               Bottom = 364
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 216
               Left = 662
               Bottom = 346
               Right = 866
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "H"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 102
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MA"
            Begin Extent = 
               Top = 120
               Left = 454
               Bottom = 233
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_REMITOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
         Begin Table = "N"
            Begin Extent = 
               Top = 120
               Left = 662
               Bottom = 216
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 216
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CL"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_REMITOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_REMITOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PE"
            Begin Extent = 
               Top = 6
               Left = 460
               Bottom = 136
               Right = 664
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 702
               Bottom = 102
               Right = 872
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 910
               Bottom = 136
               Right = 1080
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_VENTAS_POR_PRODUCTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_VENTAS_POR_PRODUCTO'
GO
USE [master]
GO
ALTER DATABASE [cbaPlacas] SET  READ_WRITE 
GO
