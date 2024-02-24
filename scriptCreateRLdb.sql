USE [master]
GO
/****** Object:  Database [OrdersDB]    Script Date: 24/02/2024 14:03:45 ******/
CREATE DATABASE [OrdersDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrdersDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrdersDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrdersDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OrdersDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OrdersDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrdersDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrdersDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrdersDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrdersDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrdersDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrdersDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrdersDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrdersDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrdersDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrdersDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrdersDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrdersDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrdersDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrdersDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrdersDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrdersDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrdersDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrdersDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrdersDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrdersDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrdersDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrdersDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrdersDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrdersDB] SET RECOVERY FULL 
GO
ALTER DATABASE [OrdersDB] SET  MULTI_USER 
GO
ALTER DATABASE [OrdersDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrdersDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrdersDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrdersDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrdersDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrdersDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OrdersDB', N'ON'
GO
ALTER DATABASE [OrdersDB] SET QUERY_STORE = OFF
GO
USE [OrdersDB]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Destination] [nchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[Action] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArrivalTable]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrivalTable](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[DateTimeProperty1] [datetime] NULL,
	[EntityInstanceProperty1] [nchar](2) NULL,
	[Multiplicity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Go]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Go](
	[Station] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Go1]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Go1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Station] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Go2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Go2](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Station] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[DateTimeProperty1] [datetime2](7) NOT NULL,
	[EntityInstanceProperty1] [nvarchar](2) NOT NULL,
	[City] [nvarchar](6) NOT NULL,
	[SequenceTableProperty1] [nvarchar](10) NOT NULL,
	[Multiplicity] [tinyint] NOT NULL,
	[ListProperty1] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartSequences]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartSequences](
	[PartType] [varchar](50) NULL,
	[Seq] [varchar](50) NULL,
	[AssemblyTimes] [varchar](50) NULL,
	[Symbol] [numeric](20, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTable]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTable](
	[NumberQ1] [int] NULL,
	[NumberQ2] [int] NULL,
	[ScheduledAss1] [float] NULL,
	[ScheduledAss2] [float] NULL,
	[CurrentOrder] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTable2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTable2](
	[NumberQ1] [int] NULL,
	[NumberQ2] [int] NULL,
	[ScheduledAss1] [float] NULL,
	[ScheduledAss2] [float] NULL,
	[CurrentOrder] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistics1]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics1](
	[TimeBetween4] [float] NULL,
	[TimeMPS] [float] NULL,
	[TimeShip] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistics2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics2](
	[TimeBetween4] [float] NULL,
	[time] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatisticsNormal]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatisticsNormal](
	[time] [float] NULL,
	[TimeBetween] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table1](
	[OrderId] [int] NOT NULL,
	[DateTimeProperty1] [datetime] NOT NULL,
	[EntityInstanceProperty1] [varchar](2) NOT NULL,
	[SequenceTableProperty1] [nchar](10) NOT NULL,
	[Multiplicity] [int] NOT NULL,
	[ListProperty1] [varchar](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table2](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[DateTimeProperty1] [datetime] NULL,
	[EntityInstanceProperty1] [nchar](2) NULL,
	[Multiplicity] [int] NULL,
	[ListProperty1] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table3]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table3](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[DateTimeProperty1] [datetime] NULL,
	[EntityInstanceProperty1] [nchar](2) NULL,
	[Multiplicity] [int] NULL,
	[ListProperty1] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table4]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table4](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[DateTimeProperty1] [datetime] NULL,
	[EntityInstanceProperty1] [nchar](2) NULL,
	[Multiplicity] [int] NULL,
	[ListProperty1] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeMPS]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeMPS](
	[TimeMPS] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeMPS2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeMPS2](
	[TimeMPS] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeMPStest]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeMPStest](
	[TimeMPS] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeShip]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeShip](
	[TimeShipment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeShip2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeShip2](
	[TimeShipment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeShipment]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeShipment](
	[TimeShipment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeShipment2]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeShipment2](
	[TimeShipment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeShipmenttest]    Script Date: 24/02/2024 14:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeShipmenttest](
	[TimeShipment] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [OrdersDB] SET  READ_WRITE 
GO
