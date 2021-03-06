USE [master]
GO
/****** Object:  Database [LOJA_DE_JOGOS]    Script Date: 17/06/2017 14:36:30 ******/
CREATE DATABASE [LOJA_DE_JOGOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LOJA_DE_JOGOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LOJA_DE_JOGOS.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LOJA_DE_JOGOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LOJA_DE_JOGOS_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LOJA_DE_JOGOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET  MULTI_USER 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LOJA_DE_JOGOS]
GO
/****** Object:  Table [dbo].[Chave_Produto]    Script Date: 17/06/2017 14:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chave_Produto](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[idJogo] [int] NULL,
	[chave] [varchar](10) NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 17/06/2017 14:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[horaCompra] [time](7) NOT NULL,
	[idUser] [int] NULL,
	[idJogo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[horaCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genero]    Script Date: 17/06/2017 14:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Jogo]    Script Date: 17/06/2017 14:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jogo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idGenero] [int] NOT NULL,
	[nome] [varchar](35) NOT NULL,
	[desenvolvedora] [varchar](35) NULL,
	[distribuidora] [varchar](35) NULL,
	[valor] [decimal](6, 2) NULL,
	[descricao] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/06/2017 14:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](35) NULL,
	[username] [varchar](35) NULL,
	[email] [varchar](35) NULL,
	[senha] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Chave_Produto]  WITH CHECK ADD FOREIGN KEY([idJogo])
REFERENCES [dbo].[Jogo] ([id])
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD FOREIGN KEY([idJogo])
REFERENCES [dbo].[Jogo] ([id])
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD FOREIGN KEY([idGenero])
REFERENCES [dbo].[Genero] ([id])
GO
USE [master]
GO
ALTER DATABASE [LOJA_DE_JOGOS] SET  READ_WRITE 
GO
