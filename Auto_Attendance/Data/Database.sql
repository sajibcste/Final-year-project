USE [master]
GO
/****** Object:  Database [Attendance]    Script Date: 03/28/2016 17:18:54 ******/
CREATE DATABASE [Attendance] ON  PRIMARY 
( NAME = N'Attendance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Attendance.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Attendance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Attendance_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Attendance] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Attendance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Attendance] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Attendance] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Attendance] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Attendance] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Attendance] SET ARITHABORT OFF
GO
ALTER DATABASE [Attendance] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Attendance] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Attendance] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Attendance] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Attendance] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Attendance] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Attendance] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Attendance] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Attendance] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Attendance] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Attendance] SET  ENABLE_BROKER
GO
ALTER DATABASE [Attendance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Attendance] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Attendance] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Attendance] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Attendance] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Attendance] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Attendance] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Attendance] SET  READ_WRITE
GO
ALTER DATABASE [Attendance] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Attendance] SET  MULTI_USER
GO
ALTER DATABASE [Attendance] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Attendance] SET DB_CHAINING OFF
GO
USE [Attendance]
GO
/****** Object:  Table [dbo].[Temp]    Script Date: 03/28/2016 17:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp](
	[Student] [varchar](50) NULL,
	[Attendance] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Temp] ([Student], [Attendance]) VALUES (N'Hardik Barve', N'1')
INSERT [dbo].[Temp] ([Student], [Attendance]) VALUES (N'Poona Yadav', N'0')
/****** Object:  Table [dbo].[TeacherDetails]    Script Date: 03/28/2016 17:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherDetails](
	[Tid] [varchar](50) NULL,
	[Tname] [varchar](50) NULL,
	[Subject] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TeacherDetails] ([Tid], [Tname], [Subject], [Address], [Contact], [Email], [Gender], [Age], [Password]) VALUES (N'101', N'Amish Vora', N'Asp .Net', N'Goregaon', N'9664341438', N'amishvora@gmail.com', N'Male', N'23', N'1234')
INSERT [dbo].[TeacherDetails] ([Tid], [Tname], [Subject], [Address], [Contact], [Email], [Gender], [Age], [Password]) VALUES (N'102', N'Neeraj Sawant', N'SQL', N'Goregaon', N'9959464166', N'nrj@gmail.com', N'Male', N'25', N'12345')
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 03/28/2016 17:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[Sid] [varchar](50) NULL,
	[Sname] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Dob] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[Teacher] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[StudentDetails] ([Sid], [Sname], [Address], [Contact], [Email], [Gender], [Dob], [Class], [Teacher]) VALUES (N'1001', N'Hardik Barve', N'Borivali (W)', N'9876543210', N'hardikbarve440@gmail.com', N'1992-10-19', N'Male', N'MCA 3rd Year', N'Amish Vora')
INSERT [dbo].[StudentDetails] ([Sid], [Sname], [Address], [Contact], [Email], [Gender], [Dob], [Class], [Teacher]) VALUES (N'1002', N'Mary', N'Dahisar', N'9876543210', N'marycom@gmail.com', N'1991-01-07', N'Female', N'MCA 3rd Year', N'Neeraj Sawant')
INSERT [dbo].[StudentDetails] ([Sid], [Sname], [Address], [Contact], [Email], [Gender], [Dob], [Class], [Teacher]) VALUES (N'1003', N'Poona Yadav', N'Goregaon', N'9876543210', N'poonam@gmail.com', N'1991-12-02', N'Female', N'MCA 3rd Year', N'Amish Vora')
INSERT [dbo].[StudentDetails] ([Sid], [Sname], [Address], [Contact], [Email], [Gender], [Dob], [Class], [Teacher]) VALUES (N'1004', N'Jyotsna', N'Borivali (E), Mumbai, Maharashtra', N'9876543210', N'Jyotsna@gmail.com', N'1992-01-15', N'Female', N'MCA 2nd Year', N'Neeraj Sawant')
/****** Object:  Table [dbo].[Attendance]    Script Date: 03/28/2016 17:18:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendance](
	[Sid] [varchar](50) NULL,
	[Sname] [varchar](50) NULL,
	[Tid] [varchar](50) NULL,
	[Tname] [varchar](50) NULL,
	[Attendance] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Attendance] ([Sid], [Sname], [Tid], [Tname], [Attendance], [Date], [Time]) VALUES (N'1001', N'Hardik Barve', N'101', N'Amish Vora', N'P', N'2016/03/28', N'16:59')
INSERT [dbo].[Attendance] ([Sid], [Sname], [Tid], [Tname], [Attendance], [Date], [Time]) VALUES (N'1003', N'Poona Yadav', N'101', N'Amish Vora', N'A', N'2016/03/28', N'16:59')
