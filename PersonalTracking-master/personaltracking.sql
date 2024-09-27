USE [master]
GO
/****** Object:  Database [PERSONELTRACKING]    
CREATE DATABASE [PERSONELTRACKING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PERSONELTRACKING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PERSONELTRACKING.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PERSONELTRACKING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PERSONELTRACKING_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PERSONELTRACKING] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PERSONELTRACKING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PERSONELTRACKING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET ARITHABORT OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PERSONELTRACKING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PERSONELTRACKING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PERSONELTRACKING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PERSONELTRACKING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET RECOVERY FULL 
GO
ALTER DATABASE [PERSONELTRACKING] SET  MULTI_USER 
GO
ALTER DATABASE [PERSONELTRACKING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PERSONELTRACKING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PERSONELTRACKING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PERSONELTRACKING] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PERSONELTRACKING] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PERSONELTRACKING', N'ON'
GO
USE [PERSONELTRACKING]
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[ImagePath] [varchar](max) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Salary] [int] NOT NULL,
	[BirthDay] [date] NULL,
	[Adress] [varchar](max) NULL,
	[Password] [varchar](20) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONTHS]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONTHS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MONTHS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERMISSION]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISSION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PermissionStartDate] [date] NOT NULL,
	[PermissionEndDate] [date] NOT NULL,
	[PermissionState] [int] NOT NULL,
	[PermissionExplanation] [nvarchar](max) NULL,
	[PermissionDay] [int] NOT NULL,
 CONSTRAINT [PK_PERMISSIION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERMISSIONSTATE]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERMISSIONSTATE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PERMISSIONSTATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POSITION]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSITION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [varchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_POSITION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALARY]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALARY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[MonthID] [int] NOT NULL,
 CONSTRAINT [PK_SALARY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TASK]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TASK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TaskTitle] [varchar](50) NOT NULL,
	[TaskContent] [varchar](max) NULL,
	[TaskStartDate] [date] NULL,
	[TaskDeliveryDate] [date] NULL,
	[TaskState] [int] NOT NULL,
 CONSTRAINT [PK_TASK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TASKSTATE]    Script Date: 14.04.2020 10:14:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TASKSTATE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TASKSTATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DEPARTMENT] ON 

INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (1, N'D1')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (2, N'D2')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (3, N'D3')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (4, N'D4')
INSERT [dbo].[DEPARTMENT] ([ID], [DepartmentName]) VALUES (5, N'D5')
SET IDENTITY_INSERT [dbo].[DEPARTMENT] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [BirthDay], [Adress], [Password], [isAdmin]) VALUES (1, 1, N'Charles', N'Dickens', N'3bd92f27-7f2e-4a8f-8f52-b9bf6ed4e90euser6-128x128.jpg.jpg', 3, 3, 1000, CAST(N'2019-11-05' AS Date), N'qwqw', N'1', 1)
INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [BirthDay], [Adress], [Password], [isAdmin]) VALUES (2, 2, N'john', N'Ward', N'27395121-af71-4876-b69d-d07b143fde3fuser2-160x160.jpg', 4, 8, 2000, CAST(N'2019-11-29' AS Date), N'ada', N'2', 1)
INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [BirthDay], [Adress], [Password], [isAdmin]) VALUES (3, 3, N'Lev', N'Tolstoy', N'27395121-af71-4876-b69d-d07b143fde3fuser2-160x160.jpg3bd92f27-7f2e-4a8f-8f52-b9bf6ed4e90euser6-128x128.jpg', 2, 2, 2300, CAST(N'2019-11-27' AS Date), N'sfsf', N'3', 0)
INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [BirthDay], [Adress], [Password], [isAdmin]) VALUES (4, 4, N'Dan', N'Brown', N'27395121-af71-4876-b69d-d07b143fde3fuser2-160x160.jpg3bd92f27-7f2e-4a8f-8f52-b9bf6ed4e90euser6-128x128.jpg6149df08-0b70-4705-b3b4-07eaab58c833user8-128x128.jpg', 3, 3, 5000, CAST(N'2019-11-27' AS Date), N'zcf', N'4', 1)
INSERT [dbo].[EMPLOYEE] ([ID], [UserNo], [Name], [Surname], [ImagePath], [DepartmentID], [PositionID], [Salary], [BirthDay], [Adress], [Password], [isAdmin]) VALUES (5, 5, N'Bernard', N'Lewis', N'27395121-af71-4876-b69d-d07b143fde3fuser2-160x160.jpg3bd92f27-7f2e-4a8f-8f52-b9bf6ed4e90euser6-128x128.jpg6149df08-0b70-4705-b3b4-07eaab58c833user8-128x128.jpga0b7b377-90d0-4547-bc84-fe73ac3b8554user2-160x160.jpg', 4, 5, 5700, CAST(N'2019-11-27' AS Date), N'adad', N'5', 1)
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
SET IDENTITY_INSERT [dbo].[MONTHS] ON 

INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (1, N'January')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (2, N'February')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (3, N'March')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (4, N'April')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (5, N'May')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (6, N'June')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (7, N'July')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (8, N'August')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (9, N'September')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (10, N'October')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (11, N'November')
INSERT [dbo].[MONTHS] ([ID], [MonthName]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[MONTHS] OFF
SET IDENTITY_INSERT [dbo].[PERMISSION] ON 

INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (1, 2, CAST(N'2019-11-01' AS Date), CAST(N'2019-11-15' AS Date), 1, N'permisi', 14)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (2, 2, CAST(N'2019-11-01' AS Date), CAST(N'2019-11-10' AS Date), 1, N'explanation2', 9)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (3, 1, CAST(N'2019-11-28' AS Date), CAST(N'2019-12-28' AS Date), 1, N'wsa', 30)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (4, 1, CAST(N'2019-11-24' AS Date), CAST(N'2020-01-25' AS Date), 1, N'2wd', 62)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (5, 3, CAST(N'2019-09-12' AS Date), CAST(N'2019-11-20' AS Date), 1, N'dsdsd', 69)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (6, 3, CAST(N'2019-11-28' AS Date), CAST(N'2020-04-24' AS Date), 1, N'sdsd', 148)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (7, 5, CAST(N'2019-11-01' AS Date), CAST(N'2019-11-28' AS Date), 1, N'dsdsd', 27)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (8, 5, CAST(N'2019-08-09' AS Date), CAST(N'2019-11-28' AS Date), 1, N'hjhj', 111)
INSERT [dbo].[PERMISSION] ([ID], [EmployeeID], [PermissionStartDate], [PermissionEndDate], [PermissionState], [PermissionExplanation], [PermissionDay]) VALUES (9, 3, CAST(N'2019-11-28' AS Date), CAST(N'2019-11-30' AS Date), 1, N'werfg', 2)
SET IDENTITY_INSERT [dbo].[PERMISSION] OFF
SET IDENTITY_INSERT [dbo].[PERMISSIONSTATE] ON 

INSERT [dbo].[PERMISSIONSTATE] ([ID], [StateName]) VALUES (1, N'On Employee')
INSERT [dbo].[PERMISSIONSTATE] ([ID], [StateName]) VALUES (2, N'Approved')
INSERT [dbo].[PERMISSIONSTATE] ([ID], [StateName]) VALUES (3, N'Disapproved')
SET IDENTITY_INSERT [dbo].[PERMISSIONSTATE] OFF
SET IDENTITY_INSERT [dbo].[POSITION] ON 

INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (1, N'P1', 1)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (2, N'P2', 2)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (3, N'P3', 3)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (4, N'P4', 3)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (5, N'P5', 4)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (6, N'P6', 1)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (7, N'P7', 5)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (8, N'P8', 4)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (9, N'P9', 5)
INSERT [dbo].[POSITION] ([ID], [PositionName], [DepartmentID]) VALUES (10, N'P10', 3)
SET IDENTITY_INSERT [dbo].[POSITION] OFF
SET IDENTITY_INSERT [dbo].[SALARY] ON 

INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (3, 2, 2000, 2000, 4)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (4, 4, 500045, 500045, 6)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (5, 4, 500022, 500022, 6)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (6, 1, 1000, 1000, 7)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (7, 2, 2000, 2000, 3)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (8, 3, 2300, 2300, 5)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (9, 4, 5000, 5000, 11)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (10, 5, 5700, 5700, 11)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (11, 5, 57001212, 57001212, 9)
INSERT [dbo].[SALARY] ([ID], [EmployeeID], [Amount], [Year], [MonthID]) VALUES (12, 2, 200023, 200023, 5)
SET IDENTITY_INSERT [dbo].[SALARY] OFF
SET IDENTITY_INSERT [dbo].[TASK] ON 

INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (1, 2, N'task1', N'task1', CAST(N'2019-11-29' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (2, 1, N'task2', N'task2', CAST(N'2019-11-27' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (3, 3, N't3', N'task3', CAST(N'2019-12-10' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (4, 4, N'tt4', N'task4', CAST(N'2019-11-25' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (5, 5, N'task55', N'task55', CAST(N'2019-11-25' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (6, 3, N'task6', N'task6', CAST(N'2019-11-26' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (7, 1, N'ttt7', N'tt7', CAST(N'2019-11-28' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (8, 5, N'Task10', N'task100', CAST(N'2019-11-30' AS Date), NULL, 1)
INSERT [dbo].[TASK] ([ID], [EmployeeID], [TaskTitle], [TaskContent], [TaskStartDate], [TaskDeliveryDate], [TaskState]) VALUES (9, 4, N'task11', N'task1213', CAST(N'2019-11-30' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[TASK] OFF
SET IDENTITY_INSERT [dbo].[TASKSTATE] ON 

INSERT [dbo].[TASKSTATE] ([ID], [StateName]) VALUES (1, N'On Employee')
INSERT [dbo].[TASKSTATE] ([ID], [StateName]) VALUES (2, N'Delivered')
INSERT [dbo].[TASKSTATE] ([ID], [StateName]) VALUES (3, N'Approved')
SET IDENTITY_INSERT [dbo].[TASKSTATE] OFF
USE [master]
GO
ALTER DATABASE [PERSONELTRACKING] SET  READ_WRITE 
GO
