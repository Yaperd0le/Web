USE [master]
GO
/****** Object:  Database [testDB]    Script Date: 20.03.2025 9:31:34 ******/
CREATE DATABASE [testDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\testDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\testDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [testDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [testDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testDB] SET RECOVERY FULL 
GO
ALTER DATABASE [testDB] SET  MULTI_USER 
GO
ALTER DATABASE [testDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'testDB', N'ON'
GO
ALTER DATABASE [testDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [testDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [testDB]
GO
/****** Object:  User [AdminKseniya]    Script Date: 20.03.2025 9:31:34 ******/
CREATE USER [AdminKseniya] FOR LOGIN [AdminKseniya] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminDima]    Script Date: 20.03.2025 9:31:34 ******/
CREATE USER [AdminDima] FOR LOGIN [AdminDima] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AdminDenis]    Script Date: 20.03.2025 9:31:34 ******/
CREATE USER [AdminDenis] FOR LOGIN [AdminDenis] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdminKseniya]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdminDima]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdminDenis]
GO
/****** Object:  Table [dbo].[AUTH_LOGS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTH_LOGS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[action] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANIES]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANIES](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[location] [varchar](100) NULL,
	[website_url] [varchar](100) NULL,
	[contact_email] [varchar](100) NULL,
	[phone_number] [varchar](100) NULL,
	[login] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISC_CAT]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISC_CAT](
	[discount_id] [bigint] NOT NULL,
	[category_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISCOUNTS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISCOUNTS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[location] [varchar](100) NOT NULL,
	[valid_until] [date] NOT NULL,
	[company_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[company_id] [bigint] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[location] [varchar](100) NOT NULL,
	[event_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTS_CAT]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTS_CAT](
	[event_id] [bigint] NOT NULL,
	[category_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POST_TAGS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POST_TAGS](
	[post_id] [bigint] NOT NULL,
	[tag_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POSTS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POSTS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[content] [text] NOT NULL,
	[media_url] [varchar](100) NOT NULL,
	[created] [datetime2](7) NOT NULL,
	[updated] [datetime2](7) NOT NULL,
	[is_published] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POSTS_CAT]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POSTS_CAT](
	[post_id] [bigint] NOT NULL,
	[category_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAGS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAGS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 20.03.2025 9:31:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[role] [varchar](100) NOT NULL,
	[reg_date] [datetime2](7) NOT NULL,
	[status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AUTH_LOGS] ON 
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (1, 1, N'a')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (2, 1, N's')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (3, 3, N'f')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (4, 5, N'qq')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (5, 4, N'ss')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (6, 6, N'yy')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (7, 9, N'ww')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (8, 1, N'55')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (9, 2, N'xx')
GO
INSERT [dbo].[AUTH_LOGS] ([id], [user_id], [action]) VALUES (10, 8, N'kk')
GO
SET IDENTITY_INSERT [dbo].[AUTH_LOGS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIES] ON 
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (1, N'aa', N'aa')
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (2, N'ss', N'ss')
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (3, N'dd', N'dd')
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (4, N'ff', N'ff')
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (5, N'rr', N'rr')
GO
INSERT [dbo].[CATEGORIES] ([id], [name], [description]) VALUES (6, N'gg', N'gg')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIES] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPANIES] ON 
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (1, N'TESTCOMPANY', N'DESCRIPTIONTEST', N'Р. Ленинский, ул. Героев 3', N'NO', N'@', N'+7...', N'test1')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (2, N'test', N'tuda suda', N'Р. Октябрский, пр. Абобова 4', N'url....', N'@aa', N'+7-8', N'test2')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (3, N'OOO roga i copita', N'to se', N'Р. Кировский, ул. Ф. Лыткина 100', N'da', N'@ad', N'+77', N'test3')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (4, N'nenaebem', N'neobman', N'Р. Центр, ул. Распутина 18', N'da', N'@das', N'+7', N'test4')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (5, N'tam syam', N'das', N'Р. Центр, ул. Распутина 19', N'no', N'no', N'no', N'test5')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (6, N'am nyam', N'da', N'Р. Кировский, ул. Ф. Лыткина 10', N'da', N'da', N'da', N'test6')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (7, N'testovoe', N'gde-to', N'Р. Ленинский, ул. Героев 3', N'no', N'no', N'da', N'test7')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (8, N'Z', N'zzz', N'Р. Ленинский, ул. Москвина 3', N'da', N'da', N'no', N'test8')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (9, N'das', N'das', N'Р. Кировский, ул. Мира 8', N'da', N'da', N'da', N'test9')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (10, N'goev greem', N'dsaa', N'Р. Ленинский, ул. Москвина 31', N'no', N'no', N'no', N'test10')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (11, N'OOO', N'ooo', N'Р. Ленинский, ул. Москвина 2', N'no', N'no', N'no', N'test11')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (12, N'IP', N'ip', N'no', N'da', N'da', N'da', N'test12')
GO
INSERT [dbo].[COMPANIES] ([id], [name], [description], [location], [website_url], [contact_email], [phone_number], [login]) VALUES (13, N'IPZ', N'IPZ', N'YES', N'YSE', N'YSE', N'YSE', N'test13')
GO
SET IDENTITY_INSERT [dbo].[COMPANIES] OFF
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (1, 1)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (2, 1)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (3, 2)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (4, 4)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (5, 3)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (6, 2)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (7, 1)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (8, 5)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (9, 5)
GO
INSERT [dbo].[DISC_CAT] ([discount_id], [category_id]) VALUES (10, 5)
GO
SET IDENTITY_INSERT [dbo].[DISCOUNTS] ON 
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (1, N'skidka', N'500%!!!!!', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-12-11' AS Date), 1)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (2, N'da', N'da', N'Р. Кировский, ул. Ф. лыткина 10', CAST(N'2025-05-30' AS Date), 2)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (3, N'11.11', N'11.11', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-02-22' AS Date), 2)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (4, N'test', N'test', N'Р. Ленинский, пр. Ленина 4', CAST(N'2025-09-14' AS Date), 4)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (5, N'net', N'net', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-06-19' AS Date), 3)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (6, N'title', N'description', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-07-07' AS Date), 5)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (7, N'-', N'-', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-04-26' AS Date), 6)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (8, N'_', N'_', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-06-07' AS Date), 7)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (9, N'discount', N'-', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-03-03' AS Date), 8)
GO
INSERT [dbo].[DISCOUNTS] ([id], [title], [description], [location], [valid_until], [company_id]) VALUES (10, N'--', N'--', N'Р. Октябрский, пр. Абобова 4', CAST(N'2025-04-04' AS Date), 9)
GO
SET IDENTITY_INSERT [dbo].[DISCOUNTS] OFF
GO
SET IDENTITY_INSERT [dbo].[EVENTS] ON 
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (1, 1, N'MEGA SKIDKA!!!!!!!', N'NET IDEY', N'Р. Ленинский, ул. Москвина 31', CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (2, 2, N'SALES', N'vse po 300', N'Р. Октябрский, пр. Абобова 15', CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (3, 2, N'покупаем детей', N'одного ребенка за 1 кг сахара', N'Р. Центр, ул. Распутина 18', CAST(N'2025-02-10T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (4, 3, N'ЛЕОМАКС', N'цепь арго', N'Р. Центр, ул. Куплинова 18', CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (5, 4, N'Цирк', N'выступают карлики и хачи-трюкачи', N'Р. Кировский, ул. Некрасова 15', CAST(N'2025-03-11T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (6, 10, N'концерт Паши Техника', N'оно не нужно', N'Р. Кировский, ул. Ф. Лыткина 10', CAST(N'2025-05-18T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (7, 5, N'концерт Чиф Кифа', N'no', N'Р. Кировский, пр. Романовых 10', CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (8, 6, N'ярмарка Белорусской тушенки', N'БЕЗ ГМО', N'Р. Центр, ул. Центральная 10', CAST(N'2025-08-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (9, 7, N'test', N'test', N'Р. Кировский, ул. Ф. Лыткина 1', CAST(N'2025-02-28T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EVENTS] ([id], [company_id], [title], [description], [location], [event_date]) VALUES (10, 9, N'black friday', N'discounts', N'Р. Кировский, ул. Ф. Лыткина 10', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[EVENTS] OFF
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (1, 1)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (2, 2)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (3, 3)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (4, 3)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (5, 5)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (6, 4)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (7, 4)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (8, 2)
GO
INSERT [dbo].[EVENTS_CAT] ([event_id], [category_id]) VALUES (9, 1)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (6, 1)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (2, 2)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (3, 2)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (2, 3)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (6, 1)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (4, 5)
GO
INSERT [dbo].[POST_TAGS] ([post_id], [tag_id]) VALUES (9, 1)
GO
SET IDENTITY_INSERT [dbo].[POSTS] ON 
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (1, 1, N'-', N'-', N'-', CAST(N'2025-01-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-02T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (2, 2, N'_', N'_', N'_', CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (3, 2, N'qq', N'qq', N'qq', CAST(N'2025-03-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-03-15T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (4, 5, N'ww', N'ww', N'ww', CAST(N'2025-05-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-05T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (5, 4, N'ee', N'ee', N'ee', CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (6, 6, N'rr', N'rr', N'rr', CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-02T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (7, 7, N'aa', N'aa', N'aa', CAST(N'2025-03-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-03-14T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (8, 8, N'ss', N'ss', N'ss', CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (9, 9, N'dd', N'dd', N'dd', CAST(N'2025-04-18T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-18T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[POSTS] ([id], [user_id], [title], [content], [media_url], [created], [updated], [is_published]) VALUES (10, 9, N'zz', N'zz', N'zz', CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[POSTS] OFF
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (1, 1)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (2, 2)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (3, 4)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (4, 3)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (5, 5)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (6, 1)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (7, 2)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (8, 3)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (9, 4)
GO
INSERT [dbo].[POSTS_CAT] ([post_id], [category_id]) VALUES (10, 2)
GO
SET IDENTITY_INSERT [dbo].[TAGS] ON 
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (7, N'a')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (9, N'd')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (3, N'e')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (10, N'f')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (1, N'q')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (4, N'r')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (8, N's')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (5, N't')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (2, N'w')
GO
INSERT [dbo].[TAGS] ([id], [name]) VALUES (6, N'y')
GO
SET IDENTITY_INSERT [dbo].[TAGS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (1, N'Иван', N'@', N'password', N'user', CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (2, N'Николай', N'@н', N'pass', N'admin', CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (3, N'Григорий', N'@f', N'pas', N'user', CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (4, N'Маша', N'@fd', N'1122', N'user', CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (5, N'Данил', N'@DF', N'sas', N'user', CAST(N'2025-05-05T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (6, N'Кирилл', N'@sds', N'dad', N'user', CAST(N'2024-05-05T00:00:00.0000000' AS DateTime2), N'banned')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (7, N'Борис', N'@ghg', N'fsd56', N'user', CAST(N'2024-05-05T00:00:00.0000000' AS DateTime2), N'deleted')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (8, N'Стас', N'@dsaa', N'fsds', N'user', CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (9, N'Роман', N'@fasfa', N'sfsaa', N'user', CAST(N'2025-04-03T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (10, N'Артем', N'@fas', N'ds56', N'user', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (11, N'Игорь', N'@ada', N'789', N'user', CAST(N'2025-05-26T00:00:00.0000000' AS DateTime2), N'active')
GO
INSERT [dbo].[USERS] ([id], [username], [email], [password], [role], [reg_date], [status]) VALUES (12, N'Даша', N'@fdf', N'dff', N'user', CAST(N'2025-03-03T00:00:00.0000000' AS DateTime2), N'active')
GO
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CATEGORI__72E12F1B510E2187]    Script Date: 20.03.2025 9:31:34 ******/
ALTER TABLE [dbo].[CATEGORIES] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__COMPANIE__72E12F1B867B8492]    Script Date: 20.03.2025 9:31:34 ******/
ALTER TABLE [dbo].[COMPANIES] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TAGS__72E12F1BA2EBE4E5]    Script Date: 20.03.2025 9:31:34 ******/
ALTER TABLE [dbo].[TAGS] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USERS__AB6E6164AA82BE6C]    Script Date: 20.03.2025 9:31:34 ******/
ALTER TABLE [dbo].[USERS] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[USERS] ADD  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[USERS] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[AUTH_LOGS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISC_CAT]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORIES] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISC_CAT]  WITH CHECK ADD FOREIGN KEY([discount_id])
REFERENCES [dbo].[DISCOUNTS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISCOUNTS]  WITH CHECK ADD FOREIGN KEY([company_id])
REFERENCES [dbo].[COMPANIES] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENTS]  WITH CHECK ADD FOREIGN KEY([company_id])
REFERENCES [dbo].[COMPANIES] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENTS_CAT]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORIES] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENTS_CAT]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[EVENTS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POST_TAGS]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[POSTS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POST_TAGS]  WITH CHECK ADD FOREIGN KEY([tag_id])
REFERENCES [dbo].[TAGS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POSTS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POSTS_CAT]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORIES] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POSTS_CAT]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[POSTS] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD CHECK  (([role]='user' OR [role]='admin'))
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD CHECK  (([status]='deleted' OR [status]='banned' OR [status]='active'))
GO
USE [master]
GO
ALTER DATABASE [testDB] SET  READ_WRITE 
GO
