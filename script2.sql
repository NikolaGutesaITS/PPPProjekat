USE [master]
GO
/****** Object:  Database [projekat]    Script Date: 12/21/2018 4:04:05 AM ******/
CREATE DATABASE [projekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\projekat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\projekat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [projekat] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projekat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projekat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projekat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projekat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projekat] SET ARITHABORT OFF 
GO
ALTER DATABASE [projekat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projekat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projekat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projekat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projekat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projekat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projekat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projekat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projekat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projekat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projekat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projekat] SET RECOVERY FULL 
GO
ALTER DATABASE [projekat] SET  MULTI_USER 
GO
ALTER DATABASE [projekat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projekat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projekat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projekat] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'projekat', N'ON'
GO
ALTER DATABASE [projekat] SET QUERY_STORE = OFF
GO
USE [projekat]
GO
/****** Object:  Table [dbo].[KontaktOsoba]    Script Date: 12/21/2018 4:04:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KontaktOsoba](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](50) NOT NULL,
	[prezime] [varchar](50) NOT NULL,
	[RadnoMesto] [varchar](50) NOT NULL,
	[TelefonFK] [int] NOT NULL,
	[MailFK] [int] NOT NULL,
 CONSTRAINT [PK_KontaktOsoba] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaMailAdresa]    Script Date: 12/21/2018 4:04:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaMailAdresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oznaka] [varchar](50) NOT NULL,
	[adresa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ListaMailAdresa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaSkola]    Script Date: 12/21/2018 4:04:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaSkola](
	[idS] [int] IDENTITY(1,1) NOT NULL,
	[NazivSkole] [varchar](50) NOT NULL,
	[AdresaReg] [varchar](50) NOT NULL,
	[Opstina] [varchar](50) NOT NULL,
	[PostanskiBroj] [int] NOT NULL,
	[MaticniBroj] [int] NOT NULL,
	[pib] [nvarchar](50) NOT NULL,
	[BrojRacuna] [nvarchar](50) NOT NULL,
	[WebStranica] [nvarchar](50) NOT NULL,
	[KontaktOsobaFK] [int] NOT NULL,
	[SlikaPecat] [varchar](50) NULL,
	[Beleske] [varchar](50) NULL,
 CONSTRAINT [PK_ListaSkola] PRIMARY KEY CLUSTERED 
(
	[idS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListaTelefona]    Script Date: 12/21/2018 4:04:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaTelefona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oznaka] [varchar](50) NOT NULL,
	[brojTelefona] [nvarchar](50) NOT NULL,
	[lokal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ListaTelefona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 12/21/2018 4:04:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[userType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KontaktOsoba] ON 

INSERT [dbo].[KontaktOsoba] ([id], [ime], [prezime], [RadnoMesto], [TelefonFK], [MailFK]) VALUES (1, N'Nikola', N'Radunovic', N'Direktor', 1, 1)
SET IDENTITY_INSERT [dbo].[KontaktOsoba] OFF
SET IDENTITY_INSERT [dbo].[ListaMailAdresa] ON 

INSERT [dbo].[ListaMailAdresa] ([id], [oznaka], [adresa]) VALUES (1, N'kucna', N'Jurija Gagarina 154')
SET IDENTITY_INSERT [dbo].[ListaMailAdresa] OFF
SET IDENTITY_INSERT [dbo].[ListaSkola] ON 

INSERT [dbo].[ListaSkola] ([idS], [NazivSkole], [AdresaReg], [Opstina], [PostanskiBroj], [MaticniBroj], [pib], [BrojRacuna], [WebStranica], [KontaktOsobaFK], [SlikaPecat], [Beleske]) VALUES (6, N'Mladost2', N'Mladost', N'Mladost', 12, 12, N'12', N'12', N'www.google.com', 1, NULL, NULL)
INSERT [dbo].[ListaSkola] ([idS], [NazivSkole], [AdresaReg], [Opstina], [PostanskiBroj], [MaticniBroj], [pib], [BrojRacuna], [WebStranica], [KontaktOsobaFK], [SlikaPecat], [Beleske]) VALUES (7, N'Mladost2', N'miki', N'miki', 12, 121, N'12', N'12', N'www.google.com', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ListaSkola] OFF
SET IDENTITY_INSERT [dbo].[ListaTelefona] ON 

INSERT [dbo].[ListaTelefona] ([id], [oznaka], [brojTelefona], [lokal]) VALUES (1, N'kucni', N'011172233', N'kucni')
SET IDENTITY_INSERT [dbo].[ListaTelefona] OFF
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [username], [password], [userType]) VALUES (1, N'nikola', N'nikola', N'user')
INSERT [dbo].[login] ([id], [username], [password], [userType]) VALUES (2, N'nikola1', N'nikola1', N'admin')
INSERT [dbo].[login] ([id], [username], [password], [userType]) VALUES (3, N'nikola12', N'nikola12', N'user2')
INSERT [dbo].[login] ([id], [username], [password], [userType]) VALUES (17, N'gustav', N'pravi', N'user')
INSERT [dbo].[login] ([id], [username], [password], [userType]) VALUES (18, N'grav', N'grav', N'user')
SET IDENTITY_INSERT [dbo].[login] OFF
ALTER TABLE [dbo].[KontaktOsoba]  WITH CHECK ADD  CONSTRAINT [FK_KontaktOsoba_ListaMailAdresa] FOREIGN KEY([MailFK])
REFERENCES [dbo].[ListaMailAdresa] ([id])
GO
ALTER TABLE [dbo].[KontaktOsoba] CHECK CONSTRAINT [FK_KontaktOsoba_ListaMailAdresa]
GO
ALTER TABLE [dbo].[KontaktOsoba]  WITH CHECK ADD  CONSTRAINT [FK_KontaktOsoba_ListaTelefona] FOREIGN KEY([TelefonFK])
REFERENCES [dbo].[ListaTelefona] ([id])
GO
ALTER TABLE [dbo].[KontaktOsoba] CHECK CONSTRAINT [FK_KontaktOsoba_ListaTelefona]
GO
ALTER TABLE [dbo].[ListaSkola]  WITH CHECK ADD  CONSTRAINT [FK_ListaSkola_KontaktOsoba] FOREIGN KEY([KontaktOsobaFK])
REFERENCES [dbo].[KontaktOsoba] ([id])
GO
ALTER TABLE [dbo].[ListaSkola] CHECK CONSTRAINT [FK_ListaSkola_KontaktOsoba]
GO
USE [master]
GO
ALTER DATABASE [projekat] SET  READ_WRITE 
GO
