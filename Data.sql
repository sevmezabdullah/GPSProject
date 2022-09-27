USE [master]
GO
/****** Object:  Database [GPSProject]    Script Date: 27.09.2022 10:56:30 ******/
CREATE DATABASE [GPSProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GPSProject', FILENAME = N'C:\Users\383585\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\GPSProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GPSProject_log', FILENAME = N'C:\Users\383585\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\GPSProject.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GPSProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GPSProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GPSProject] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [GPSProject] SET ANSI_NULLS ON 
GO
ALTER DATABASE [GPSProject] SET ANSI_PADDING ON 
GO
ALTER DATABASE [GPSProject] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [GPSProject] SET ARITHABORT ON 
GO
ALTER DATABASE [GPSProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GPSProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GPSProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GPSProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GPSProject] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [GPSProject] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [GPSProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GPSProject] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [GPSProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GPSProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GPSProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GPSProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GPSProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GPSProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GPSProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GPSProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GPSProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GPSProject] SET RECOVERY FULL 
GO
ALTER DATABASE [GPSProject] SET  MULTI_USER 
GO
ALTER DATABASE [GPSProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GPSProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GPSProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GPSProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GPSProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GPSProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GPSProject] SET QUERY_STORE = OFF
GO
USE [GPSProject]
GO
/****** Object:  Table [dbo].[CoordinateImages]    Script Date: 27.09.2022 10:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoordinateImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinateId] [int] NOT NULL,
	[ImagePath] [varchar](250) NOT NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordinates]    Script Date: 27.09.2022 10:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [varchar](250) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Contact] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Town] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 27.09.2022 10:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Level] [nvarchar](10) NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[Logger] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[MachineName] [nvarchar](50) NULL,
	[IpAddress] [nvarchar](150) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PKlogs3214EC07B05587A5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 27.09.2022 10:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[CoordinateId] [int] NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27.09.2022 10:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[Town] [varchar](50) NOT NULL,
	[Rank] [varchar](50) NOT NULL,
 CONSTRAINT [PKUsers3214EC07BC3FFEDB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Coordinates] FOREIGN KEY([CoordinateId])
REFERENCES [dbo].[Coordinates] ([Id])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Coordinates]
GO
USE [master]
GO
ALTER DATABASE [GPSProject] SET  READ_WRITE 
GO
