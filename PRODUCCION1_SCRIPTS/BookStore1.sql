USE [master]
GO
/****** Object:  Database [Bookstore1]    Script Date: 17/12/2019 14:18:41 ******/
CREATE DATABASE [Bookstore1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bookstore_almacen', FILENAME = N'C:\data\Bookstore_almacen.mdf' , SIZE = 20480KB , MAXSIZE = 40960KB , FILEGROWTH = 10240KB ), 
 FILEGROUP [Bookstore_Data] 
( NAME = N'Bookstore_compras', FILENAME = N'C:\data\Bookstore_compras.ndf' , SIZE = 10240KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB ), 
( NAME = N'Bookstore_ventas', FILENAME = N'C:\data\Bookstore_ventas.ndf' , SIZE = 10240KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Bookstore_log', FILENAME = N'C:\log\Bookstore_log.ldf' , SIZE = 10240KB , MAXSIZE = 30720KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [Bookstore1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bookstore1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bookstore1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookstore1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookstore1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookstore1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookstore1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookstore1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bookstore1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstore1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookstore1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstore1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookstore1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bookstore1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookstore1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookstore1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookstore1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookstore1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bookstore1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookstore1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bookstore1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bookstore1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bookstore1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookstore1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bookstore1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bookstore1] SET RECOVERY FULL 
GO
ALTER DATABASE [Bookstore1] SET  MULTI_USER 
GO
ALTER DATABASE [Bookstore1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bookstore1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bookstore1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bookstore1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bookstore1', N'ON'
GO
USE [Bookstore1]
GO
/****** Object:  Schema [almacen]    Script Date: 17/12/2019 14:18:42 ******/
CREATE SCHEMA [almacen]
GO
/****** Object:  Schema [compras]    Script Date: 17/12/2019 14:18:42 ******/
CREATE SCHEMA [compras]
GO
/****** Object:  Schema [ventas]    Script Date: 17/12/2019 14:18:42 ******/
CREATE SCHEMA [ventas]
GO
/****** Object:  Table [almacen].[AUTOR]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [almacen].[AUTOR](
	[IDAUTOR] [int] NOT NULL,
	[NOMBRE] [char](256) NOT NULL,
	[APELLIDO] [char](256) NOT NULL,
	[INICIALES] [char](4) NOT NULL,
 CONSTRAINT [PK_AUTOR] PRIMARY KEY CLUSTERED 
(
	[IDAUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [almacen].[EDICION]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [almacen].[EDICION](
	[IDEDICION] [int] NOT NULL,
	[ANIO] [int] NOT NULL,
	[NUMEROCOPIAS] [int] NOT NULL,
 CONSTRAINT [PK_EDICION] PRIMARY KEY CLUSTERED 
(
	[IDEDICION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [almacen].[EDICIONLIBRO]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [almacen].[EDICIONLIBRO](
	[IDLIBROEDICION] [int] NOT NULL,
	[IDLIBRO] [int] NULL,
	[IDEDICION] [int] NULL,
	[PRECIO] [float] NOT NULL,
 CONSTRAINT [PK_EDICIONLIBRO] PRIMARY KEY CLUSTERED 
(
	[IDLIBROEDICION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [almacen].[LIBRO]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [almacen].[LIBRO](
	[IDLIBRO] [int] NOT NULL,
	[TITULO] [char](256) NOT NULL,
	[ISBN] [char](256) NOT NULL,
	[IDIOMA] [char](256) NOT NULL,
	[GENERO] [char](256) NOT NULL,
	[TIPO] [char](256) NOT NULL,
 CONSTRAINT [PK_LIBRO] PRIMARY KEY CLUSTERED 
(
	[IDLIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [almacen].[LIBROAUTOR]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [almacen].[LIBROAUTOR](
	[IDLIBROAUTOR] [int] NOT NULL,
	[IDAUTOR] [int] NULL,
	[IDLIBRO] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [compras].[info_libros]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [compras].[info_libros](
	[CODLIED] [int] NULL,
	[IDLIBRO] [int] NULL,
	[TITULO] [char](256) NULL,
	[ISBN] [char](256) NULL,
	[IDIOMA] [char](256) NULL,
	[GENERO] [char](256) NULL,
	[TIPO] [char](256) NULL,
	[IDLIBROEDICION] [int] NULL,
	[IDEDICION] [int] NULL,
	[PRECIO] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ventas].[CLIENTE]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ventas].[CLIENTE](
	[IDCLIENTE] [int] NOT NULL,
	[CEDULA] [char](256) NOT NULL,
	[NOMBRE] [char](256) NOT NULL,
	[APELLIDO] [char](256) NOT NULL,
	[TELEFONO] [varchar](10) NOT NULL,
	[GARANTE] [int] NULL,
	[LIMITECREDITO] [numeric](8, 2) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[IDCLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Bookstore_Data]
) ON [Bookstore_Data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ventas].[DETALLE]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ventas].[DETALLE](
	[IDDETALLE] [int] NOT NULL,
	[IDLIBROEDICION] [int] NULL,
	[IDFACTURA] [int] NULL,
	[CANTIDAD] [int] NOT NULL,
	[PRECIO] [float] NULL
) ON [Bookstore_Data]

GO
/****** Object:  Table [ventas].[DEUDOR]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ventas].[DEUDOR](
	[IDDEUDOR] [int] NOT NULL,
	[IDCLIENTE] [int] NOT NULL,
	[GARANTE] [int] NOT NULL,
	[LIMITECREDITO] [numeric](8, 2) NULL,
	[SALDODEUDOR] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDEUDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ventas].[FACTURA]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ventas].[FACTURA](
	[IDFACTURA] [int] NOT NULL,
	[IDCLIENTE] [int] NULL,
	[FECHA] [datetime] NOT NULL,
	[TIPOFAC] [varchar](10) NULL,
	[MONTOTOTAL] [numeric](8, 2) NULL,
 CONSTRAINT [PK_FACTURA] PRIMARY KEY CLUSTERED 
(
	[IDFACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Bookstore_Data]
) ON [Bookstore_Data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ventas].[PAGOS]    Script Date: 17/12/2019 14:18:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ventas].[PAGOS](
	[IDPAGOS] [int] NOT NULL,
	[IDCLIENTE] [int] NOT NULL,
	[FECHAPAGO] [date] NOT NULL,
	[VALORPAGO] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPAGOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [almacen].[EDICIONLIBRO]  WITH CHECK ADD  CONSTRAINT [FK_EDICIONL_TIENE_LIBRO] FOREIGN KEY([IDLIBRO])
REFERENCES [almacen].[LIBRO] ([IDLIBRO])
GO
ALTER TABLE [almacen].[EDICIONLIBRO] CHECK CONSTRAINT [FK_EDICIONL_TIENE_LIBRO]
GO
ALTER TABLE [almacen].[LIBROAUTOR]  WITH CHECK ADD  CONSTRAINT [FK_LIBROAUT_ESCRIBE_AUTOR] FOREIGN KEY([IDAUTOR])
REFERENCES [almacen].[AUTOR] ([IDAUTOR])
GO
ALTER TABLE [almacen].[LIBROAUTOR] CHECK CONSTRAINT [FK_LIBROAUT_ESCRIBE_AUTOR]
GO
ALTER TABLE [ventas].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_CONTIENE_FACTURA] FOREIGN KEY([IDFACTURA])
REFERENCES [ventas].[FACTURA] ([IDFACTURA])
GO
ALTER TABLE [ventas].[DETALLE] CHECK CONSTRAINT [FK_DETALLE_CONTIENE_FACTURA]
GO
ALTER TABLE [ventas].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_ESTA_EN_EDICIONL] FOREIGN KEY([IDLIBROEDICION])
REFERENCES [almacen].[EDICIONLIBRO] ([IDLIBROEDICION])
GO
ALTER TABLE [ventas].[DETALLE] CHECK CONSTRAINT [FK_DETALLE_ESTA_EN_EDICIONL]
GO
ALTER TABLE [ventas].[DEUDOR]  WITH CHECK ADD FOREIGN KEY([IDCLIENTE])
REFERENCES [ventas].[CLIENTE] ([IDCLIENTE])
GO
ALTER TABLE [ventas].[FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_REALIZA_CLIENTE] FOREIGN KEY([IDCLIENTE])
REFERENCES [ventas].[CLIENTE] ([IDCLIENTE])
GO
ALTER TABLE [ventas].[FACTURA] CHECK CONSTRAINT [FK_FACTURA_REALIZA_CLIENTE]
GO
ALTER TABLE [ventas].[PAGOS]  WITH CHECK ADD FOREIGN KEY([IDCLIENTE])
REFERENCES [ventas].[CLIENTE] ([IDCLIENTE])
GO
USE [master]
GO
ALTER DATABASE [Bookstore1] SET  READ_WRITE 
GO
