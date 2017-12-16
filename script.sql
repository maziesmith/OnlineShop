USE [master]
GO
/****** Object:  Database [HomeShopee]    Script Date: 16-12-2017 12:44:26 PM ******/
CREATE DATABASE [HomeShopee]
 GO
ALTER DATABASE [HomeShopee] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeShopee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeShopee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeShopee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeShopee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeShopee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeShopee] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeShopee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeShopee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeShopee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeShopee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeShopee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeShopee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeShopee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeShopee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeShopee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeShopee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeShopee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeShopee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeShopee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeShopee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeShopee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeShopee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeShopee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeShopee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeShopee] SET  MULTI_USER 
GO
ALTER DATABASE [HomeShopee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeShopee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeShopee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeShopee] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeShopee', N'ON'
GO
USE [HomeShopee]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Content_Status]  DEFAULT ((1)),
	[ViewCount] [int] NULL CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)),
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](256) NULL,
	[Address] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()),
	[ShipName] [nvarchar](100) NOT NULL,
	[ShipMobile] [varchar](20) NOT NULL,
	[ShipAddress] [nvarchar](200) NOT NULL,
	[ShipEmail] [varchar](256) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[Detail] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)),
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)),
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 16-12-2017 12:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [Description], [Image], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [ViewCount]) VALUES (1, N'tin tức demo', N'424', N'/Data/images/14.PNG', N'42342342', CAST(N'2015-09-20 08:01:57.590' AS DateTime), N'tuannguyen', NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (1, N'43454', N'5345', N'53453', N'354', N'
       345                 ', CAST(N'2015-09-13 21:36:30.167' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (2, N'4234', N'4234', N'634', N'423', N'243    ', CAST(N'2015-09-13 21:37:45.667' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (3, N'r2', N'4234', N'43243', N'423', N'423
                        ', CAST(N'2015-09-13 21:38:27.120' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (4, N'', N'', N'', N'', N'
                        ', CAST(N'2017-12-14 23:14:20.307' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (5, N'nguyễn tuấn tú', N'054832151', N'nguyentuan1105@gmail.com', N'tphcm', N'website tốt
', CAST(N'2017-12-14 23:38:49.097' AS DateTime), 0)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (6, N'Nguyễn Ái Tuấn', N'1648315269', N'nguyenaituan@yahoo.com', N'25/2 đường Tô Ký khu phố 5 phường Tân Chánh Hiệp, Quận 12', N'abc', CAST(N'2017-12-15 18:10:57.513' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2015-09-10 22:51:27.657' AS DateTime), N'toanbn', N'2312412', N'hn', N'ngoctoan89@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2015-09-12 21:45:35.777' AS DateTime), N'toàn', N'0966036626', N'Xuân Đỉnh Từ Liêm Hà Nội', N'toanbn@esvn.com.vn', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2015-09-12 21:46:10.357' AS DateTime), N'toàn', N'0966036626', N'Xuân Đỉnh Từ Liêm Hà Nội', N'toanbn@esvn.com.vn', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(N'2015-09-12 21:47:26.417' AS DateTime), N'toanbn', N'0966036626', N'Xuân Đỉnh Từ Liêm Hà Nội', N'toanbn@esvn.com.vn', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(N'2015-09-12 21:49:37.137' AS DateTime), N'eq', N'eqw', N'Xuân Đỉnh Từ Liêm Hà Nội', N'eqw', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(N'2015-09-12 21:55:54.457' AS DateTime), N'toanbn', N'0966036626', N'23', N'131', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (7, CAST(N'2015-09-12 21:57:49.660' AS DateTime), N'423', N'423', N'423', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (8, CAST(N'2015-09-12 21:58:08.873' AS DateTime), N'423', N'423', N'423', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (9, CAST(N'2015-09-12 21:59:23.833' AS DateTime), N'423', N'424', N'424', N'42', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (10, CAST(N'2015-09-12 22:01:38.170' AS DateTime), N'534', N'53', N'543', N'534', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (11, CAST(N'2015-09-13 06:58:46.767' AS DateTime), N'4', N'423', N'423', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (12, CAST(N'2015-09-13 07:00:01.937' AS DateTime), N'34', N'423', N'432', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, CAST(N'2015-09-13 07:07:01.167' AS DateTime), N'423', N'423', N'423', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (14, CAST(N'2015-09-13 07:18:25.970' AS DateTime), N'toanbn', N'423', N'423', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (15, CAST(N'2015-09-13 07:21:34.320' AS DateTime), N'34', N'342', N'424', N'42', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (16, CAST(N'2015-09-13 07:24:01.707' AS DateTime), N'342', N'432', N'423', N'432', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (17, CAST(N'2015-09-13 07:47:09.587' AS DateTime), N'342', N'234', N'424', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (18, CAST(N'2015-09-13 07:47:30.560' AS DateTime), N'342', N'234', N'424', N'423', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (19, CAST(N'2015-09-13 07:47:42.443' AS DateTime), N'342', N'234', N'424', N'ngoctoan89@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (21, CAST(N'2017-12-16 12:42:38.933' AS DateTime), N'Nguyễn Ái Tuấn', N'1648315269', N'tphcm', N'nguyenaituan@yahoo.com', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (4, 15, 1, CAST(12535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (4, 16, 1, CAST(12535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 1, 3, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 2, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 3, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 4, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 5, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 6, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 11, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 13, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 17, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 18, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (5, 19, 1, CAST(22535000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 7, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 8, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 9, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 10, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 12, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (8, 14, 1, CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10, 21, 1, CAST(8590000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Tivi Sony 21 inch', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/feature-pic1.jpg', CAST(5770000 AS Decimal(18, 0)), 0, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:24:20.953' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Bộ loa 2.0 Microlab', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/feature-pic2.jpg', CAST(435000 AS Decimal(18, 0)), 12, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:30:57.870' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Máy ảnh Nikon', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/feature-pic3.jpg', CAST(2535000 AS Decimal(18, 0)), 12, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:32:06.437' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Tivi plasma siêu phẳng', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/feature-pic4.jpg', CAST(12535000 AS Decimal(18, 0)), 12, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Máy ảnh Sony', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/new-pic1.jpg', CAST(22535000 AS Decimal(18, 0)), 23, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Dàn karaoke 2.0', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/new-pic2.jpg', CAST(12535000 AS Decimal(18, 0)), 44, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Máy giặt Electrolux', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/new-pic2.jpg', CAST(7535000 AS Decimal(18, 0)), 44, 5, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:33:18.800' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Đồng hồ đeo tay thời trang', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'/assets/client/images/new-pic3.jpg', CAST(4300000 AS Decimal(18, 0)), 21, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', CAST(N'2015-08-26 19:37:06.083' AS DateTime), N'vanky', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'MÁY TÍNH ĐỂ BÀN DELL VOSTRO 3668', N'Máy có thiết kế bền bỉ, trọng lượng nhẹ, dễ dàng cất giữ hay di chuyển khi cần thiết. Vỏ ngoài của máy tính Dell Vostro 3668 bằng chất liệu case, độ bền cao chịu được va chạm tốt cũng như hạn chế bụi bẩn, trầy xước trong quá trình sử dụng.', N'/assets/client/images/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh.jpg', CAST(7890000 AS Decimal(18, 0)), 15, 3, N'<div class="productFeature_content">
<div class="featureContent featureContent_2col feature_txt-img">
<div class="featureContent_col-1">
<div class="featureContent_col_wrap">
<h3 class="featureContent_title">Thiết kế chắc chắn</h3>
<article class="featureContent_caption">Máy có thiết kế bền bỉ, trọng lượng nhẹ, dễ dàng cất giữ hay di chuyển khi cần thiết. Vỏ ngoài của máy tính Dell Vostro&nbsp;3668 bằng chất liệu case, độ bền cao chịu được va chạm tốt cũng như hạn chế bụi bẩn, trầy xước trong quá trình sử dụng.</article>
</div>
</div>
<div class="featureContent_col-2">
<div class="featureContent_col_wrap"><img class="img_feature img-small imagelazyload" alt="Máy tính để bàn Dell Vostro&nbsp;3668 (MTG4560) có thiết kê bền b" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt1.jpg" caption="false" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt1.jpg" style="display: inline;"></div>
</div>
</div>
<div class="featureContent featureContent_2col feature_img-txt">
<div class="featureContent_col-1">
<div class="featureContent_col_wrap"><img class="img_feature img-small imagelazyload" alt="Cấu hình ổn định, hoạt động mạnh mẽ" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt2.jpg" caption="false" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt2.jpg" style="display: inline;"></div>
</div>
<div class="featureContent_col-2">
<div class="featureContent_col_wrap">
<h3 class="featureContent_title">Hiệu năng hoạt động mạnh mẽ</h3>
<article class="featureContent_caption"><span>Máy tính để bàn Dell Vostro&nbsp;3668 (MTG4560) được trang bị chip Intel Pentinum G4560, tốc độ 3.50GHz và bộ nhớ đệm 3MB Cache&nbsp;</span><span>mang lại công suất đỉnh cao, hoạt động ổn định, xử lí nhanh với các tác vụ như:&nbsp;</span><span>soạn thảo văn bản, lướt web...</span></article>
</div>
</div>
</div>
<div class="featureContent featureContent_2col feature_txt-img">
<div class="featureContent_col-1">
<div class="featureContent_col_wrap">
<h3 class="featureContent_title">Hỗ trợ đầy đủ các kết nối hiện đại</h3>
<article class="featureContent_caption"><span>Bạn có thể lưu trữ dữ liệu hoặc chia sẻ thông tin dễ dàng qua các cổng kết nối cơ bản: cổng USB, Bluetooth...&nbsp;</span></article>
</div>
</div>
<div class="featureContent_col-2">
<div class="featureContent_col_wrap"><img class="img_feature img-small imagelazyload" alt="Hỗ trợ đầy đủ các kết nối hiện đại" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt3.jpg" caption="false" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt3.jpg" style="display: inline;"></div>
</div>
</div>
<div class="featureContent featureContent_2col feature_img-txt">
<div class="featureContent_col-1">
<div class="featureContent_col_wrap"><img class="img_feature img-small imagelazyload" alt="Trang bị card màn hình Intel có khả năng xử lý đồ họa tốt" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt4.jpg" caption="false" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt4.jpg" style="display: inline;"></div>
</div>
<div class="featureContent_col-2">
<div class="featureContent_col_wrap">
<h3 class="featureContent_title">Card màn hình Intel HD Graphics</h3>
<article class="featureContent_caption">Máy tính để bàn Dell Vostro&nbsp;3668 (MTG4560) được trang bị chip đồ họa Intel HD Graphics. Chíp đồ họa này&nbsp;hỗ trợ tốt cho việc chơi game có đồ họa cao, xử lí tốt trong các công cụ chỉnh sửa hình ảnh...</article>
</div>
</div>
</div>
<div class="featureContent featureContent_2col feature_txt-img">
<div class="featureContent_col-1">
<div class="featureContent_col_wrap">
<h3 class="featureContent_title">Ổ cứng HDD</h3>
<article class="featureContent_caption">Tuy có kích thước nhỏ nhưng máy tính được trang bị&nbsp;ổ cứng HDD dung lượng đĩa cứng lên đến 500GB, RAM 4GB, giúp người sử dụng có thể &nbsp;lưu trữ nhiều chương trình, game hay phim để hoàn thành công việc và giải trí một cách tốt nhất.</article>
</div>
</div>
<div class="featureContent_col-2">
<div class="featureContent_col_wrap"><img class="img_feature img-small imagelazyload" alt="Được trang bị ổ cứng 500GB chứa được nhiều dữ liệu" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt5.jpg" caption="false" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/dell/may-tinh-de-ban-dell-vostro-3668-mtg4560-4g-500-khong-man-hinh-mt5.jpg" style="display: inline;"></div>
</div>
</div>
</div>', CAST(N'2017-12-14 23:50:54.380' AS DateTime), N'tuannguyen', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'MÁY TÍNH ĐỂ BÀN ACER ASPIRE TC-780 ', N'Máy tính dần trở thành một công cụ không thể thiếu giữa thời đại phát triển của công nghệ, nó giúp bạn kết nối với thế giới bên ngoài, xử lí công việc, học tập và giải trí. Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) sở hữu vẻ ngoài vô cùng đơn giản, bình thường nhưng lại chứa đựng tính năng cực kì vượt trội và mang đến cho người dùng sự hài lòng tuyệt đối.', N'/assets/client/images/may-tinh-de-ban-acer-aspire-tc-780.jpg', CAST(8590000 AS Decimal(18, 0)), 15, 3, N'<div class="cm-tabs-content tabs-content clearfix" id="tabs_content" style="margin-top: 0px;"> <div id="content_description" class="wysiwyg-content"> <div><section id="nks-product-description-general-v2" class="nks-product-description-general-v2 nks-column-1 nks-column"> <div class="nks-column-group"> <div class="nks-block-item nks-type-creative-description nks-custom-full-width nks-custom-text-left-image-right"> <div class="nks-title"> <h2><strong>MÁY TÍNH ĐỂ BÀN ACER ASPIRE TC-780 (DT.B89SV.005) - ĐỈNH CAO CỦA SỰ ĐƠN GIẢN</strong></h2> </div> <div class="nks-block-description-wrapper"> <div class="nks-images"> </div> <div class="nks-block-description"> <p><span>Máy tính dần trở thành một công cụ không thể thiếu giữa thời đại phát triển của công nghệ, nó giúp bạn kết nối với thế giới bên ngoài, xử lí công việc, học tập và giải trí. Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) sở hữu vẻ ngoài vô cùng đơn giản, bình thường nhưng lại chứa đựng tính năng cực kì vượt trội và mang đến cho người dùng sự hài lòng tuyệt đối</span>.</p> </div> </div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-key-feature nks-custom-full-width"> <div class="nks-block-title"> <h3>ĐẶC ĐIỂM NỔI BẬT</h3> <span class="sec-line"></span></div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <ul class="nks-general-un-order-list"> <li> <p class="nks-list-description">Trang bị chuột và bàn phím.</p> </li> <li> <p class="nks-list-description">Cấu hình cực kì mạnh mẽ Intel Core i3.</p> </li> <li> <p class="nks-list-description">Kiểu dáng nhỏ gọn mới lạ và cực kì bền bỉ.</p> </li> <li> <p class="nks-list-description">Màu sắc tinh tế, rất được ưa thích.</p> </li> </ul> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) hoàn mĩ trong từng chi tiết" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-1.jpg" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-1.jpg" style="display: block;"> </div> </div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-normal-feature nks-custom-full-width"> <div class="nks-block-title big-title"> <h2>CHI TIẾT TÍNH NĂNG</h2> <span class="sec-line"></span></div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Dòng máy tính cao cấp</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span><a href="https://www.nguyenkim.com/may-tinh-de-ban-acer-aspire-tc-780.html" target="_blank" rel="noopener noreferrer">Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005)</a> là dòng máy tính cao cấp của Acer với cấu hình mạnh mẽ, trang bị bộ xử lí Intel Core i3 tốc độ cao, bộ nhớ Ram lớn và hiệu suất đồ hoạ tối ưu, rất phù hợp với những người làm việc trong lĩnh vực công nghệ thông tin, thiết kế hay văn phòng</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) có cấu hình mạnh mẽ" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-2.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Có cấu hình mạnh mẽ</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3>Kết nối rộng rãi</h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Nhằm đáp ứng nhu cầu kết nối của người dùng, Acer Aspire TC-780 (DT.B89SV.005) kết nối USB 2.0 và 3.0 để thoải mái kết nối ngoại vi. Ngoài ra, máy còn có cổng kết nối D-Sub, HDMI, khe đọc thẻ nhớ và card mạng wifi</span><span> giúp bạn chia sẻ hình ảnh, âm thanh qua các thiết bị ngoại vi như điện thoại, máy tính bảng được nhanh chóng hơn</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) kết nối nhanh chóng" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-3.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Kết nối đa dạng</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Hiệu suất đồ hoạ vượt trội</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>CPU máy tính Acer Aspire TC-780 (DT.B89SV.005) mang lại hiệu quả làm việc cao bởi bộ xử lí Core i3 thế hệ mới cùng với RAM lớn. Ổ cứng của máy sẽ đáp ứng nhu cầu lưu trữ tối đa của người dùng. Bộ xử lý mới cũng mang lại hiệu suất đồ hoạ <em></em>Intel HD Graphics vượt trội những vẫn tiết kiệm điện năng tối ưu, đây thật sự là chiếc <a href="https://www.nguyenkim.com/may-tinh-de-ban/" target="_blank" rel="noopener noreferrer">máy tính bàn</a> lý tưởng</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) cho hiệu quả làm việc tốt" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-4.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Cho hiệu quả làm việc tốt </p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Dung lượng đĩa cứng lớn</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Acer Aspire TC-780 (DT.B89SV.005) sở hữu dung lượng đĩa cứng lên đến 1 TB cho bạn tha hồ lưu trữ mọi thông tin, dữ liệu hằng ngày. <a href="https://www.nguyenkim.com/may-tinh-de-ban-acer/" target="_blank" rel="noopener noreferrer">Máy tính bàn Acer</a> không chỉ là trợ thủ đắc lực trong công việc mà còn thiết bị kết nối bạn với mọi người</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) dung lượng lưu trữ lớn" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-5.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Dung lượng đĩa cứng lớn</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3>Thiết kế sang trọng</h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Bên cạnh cấu hình mạnh mẽ, máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) còn thu hút mọi ánh nhìn nhờ vẻ ngoài sang trọng bắt mắt cùng thiết kế nhỏ gọn mang đến cảm giác đơn giản mà cực kì thanh lịch, góp phần tạo cảm hứng cho bạn trong mọi công việc</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính để bàn Acer Aspire TC-780 (DT.B89SV.005) có thiết kế sang trọng" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/may-tinh-de-ban/Acer/may-tinh-de-ban-acer-aspire-tc-780-6.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Thiết kế sang trọng</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-description-wrapper"> <div class="nks-images"> </div> </div> </div> </div> </section></div> </div> <div id="content_features" class="wysiwyg-content"> <div class="nk-content-features-new"> <div class="nks-block-title"><h3>Thông Số Kỹ Thuật</h3><span class="sec-line"></span></div> <div class="nk-content-digital"> <h2 class="subheader"> Thông tin chung </h2> <div class="control-group"> <label>Model:</label> <div class="feature-value">ACER ASPIRE TC-780/DT.B89SV.005</div> </div> <div class="control-group"> <label>Màu sắc:</label> <div class="feature-value">Đen</div> </div> <div class="control-group"> <label>Nhà sản xuất:</label> <div class="feature-value">ACER</div> </div> <div class="control-group"> <label>Xuất xứ:</label> <div class="feature-value">Trung Quốc</div> </div> <div class="control-group"> <label>Thời gian bảo hành:</label> <div class="feature-value">12 tháng</div> </div> <div class="control-group"> <label>Địa điểm bảo hành:</label> <div class="feature-value">Nguyễn Kim</div> </div> <h2 class="subheader"> Bộ vi xử lý máy tính để bàn </h2> <div class="control-group"> <label>CPU:</label> <div class="feature-value">Intel Core-i3</div> </div> <div class="control-group"> <label>Loại CPU:</label> <div class="feature-value">7100</div> </div> <div class="control-group"> <label>Tốc độ CPU:</label> <div class="feature-value">3.9 GHz</div> </div> <div class="control-group"> <label>Bộ nhớ đệm:</label> <div class="feature-value">3 MB Cache </div> </div> <h2 class="subheader"> Bộ nhớ máy tính để bàn </h2> <div class="control-group"> <label>Loại RAM:</label> <div class="feature-value">SDRAM DDR4</div> </div> <div class="control-group"> <label>Dung lượng RAM:</label> <div class="feature-value">4 GB</div> </div> <h2 class="subheader"> Đĩa cứng máy tính để bàn </h2> <div class="control-group"> <label>Loại ổ đĩa cứng:</label> <div class="feature-value">HDD</div> </div> <div class="control-group"> <label>Dung lượng đĩa cứng:</label> <div class="feature-value">1 TB</div> </div> <h2 class="subheader"> Đĩa quang máy tính để bàn </h2> <div class="control-group"> <label>Tích hợp ổ đĩa quang:</label> <div class="feature-value">Có</div> </div> <div class="control-group"> <label>Loại đĩa quang:</label> <div class="feature-value">DVDRW</div> </div> <h2 class="subheader"> Đồ họa máy tính để bàn </h2> <div class="control-group"> <label>Bộ xử lý đồ họa:</label> <div class="feature-value">Intel HD Graphics</div> </div> <h2 class="subheader"> Kết nối máy tính để bàn </h2> <div class="control-group"> <label>Cổng kết nối màn hình:</label> <div class="feature-value">HDMI</div> </div> <div class="control-group"> <label>Chuẩn WiFi:</label> <div class="feature-value">Có</div> </div> <div class="control-group"> <label>Chuẩn LAN:</label> <div class="feature-value">Có</div> </div> <div class="control-group"> <label>Bluetooth:</label> <div class="feature-value"> Bluetooth 4.0</div> </div> <div class="control-group"> <label>Cổng USB:</label> <div class="feature-value">4x USB 2.0, 3x USB 3.0</div> </div> <div class="control-group"> <label>Cổng HDMI:</label> <div class="feature-value">Có</div> </div> <h2 class="subheader"> Hệ điều hành máy tính để bàn </h2> <div class="control-group"> <label>HĐH kèm theo máy:</label> <div class="feature-value">Free DOS</div> </div> <h2 class="subheader"> Kích thước &amp; Khối lượng </h2> <div class="control-group"> <label>Khối lượng sản phẩm (kg):</label> <div class="feature-value">7.8kg</div> </div> <div class="control-group"> <label>Kích thước sản phẩm:</label> <div class="feature-value">175 x 425.5 x 381.4mm</div> </div> </div> </div> </div> </div>', CAST(N'2017-12-14 23:53:11.443' AS DateTime), N'tuannguyen', NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [Image], [Price], [Quantity], [CategoryID], [Detail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'LENOVO IDEAPAD 110-14ISK', N'Sử dụng máy tính một thời gian dài, sẽ khó tránh khỏi tình trạng máy bị bám bẩn, ố do dấu vân tay, gây mất thẩm mỹ. Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) cấu hình mạnh mẽ, lớp vỏ ngoài bắt mắt chống bám vân tay, mồ hôi cùng thiết kế tinh tế, thời trang, trọng lượng nhẹ giúp bạn dễ dàng mang theo bên người.', N'/assets/client/images/may-tinh-xach-tay-lenovo-ideapad-110-14isk.jpg', CAST(7990000 AS Decimal(18, 0)), 10, 4, N'<div class="cm-tabs-content tabs-content clearfix" id="tabs_content" style="margin-top: 0px;"> <div id="content_product_tab_17" class="wysiwyg-content"> <div class="ty-wysiwyg-content"><div class="wrapper-youtube"> <div class="youtube" data-embed="PbpUiWIXGHI"> <div class="play-button"></div> <img src="https://img.youtube.com/vi/PbpUiWIXGHI/sddefault.jpg"></div> </div></div> </div> <div id="content_description" class="wysiwyg-content"> <div> <section id="nks-product-description-general-v2" class="nks-product-description-general-v2 nks-column-1 nks-column"> <div class="nks-column-group"> <div class="nks-block-item nks-type-creative-description nks-custom-full-width nks-custom-text-left-image-right"> <div class="nks-title"> <h2><strong>MÁY TÍNH XÁCH TAY LENOVO IDEAPAD 110-14ISK (80UC006AVN) - XINH ĐẸP TRONG MỌI KHOẢNH KHẮC</strong></h2> </div> <div class="nks-block-description-wrapper"> <div class="nks-images"> </div> <div class="nks-block-description"> <p><span>Sử dụng máy tính một thời gian dài, sẽ khó tránh khỏi tình trạng máy bị bám bẩn, ố do dấu vân tay, gây mất thẩm mỹ. Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) cấu hình mạnh mẽ, lớp vỏ ngoài bắt mắt chống bám vân tay, mồ hôi cùng thiết kế tinh tế, thời trang, trọng lượng nhẹ giúp bạn dễ dàng mang theo bên người</span>.</p> </div> </div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-key-feature nks-custom-full-width"> <div class="nks-block-title"> <h3>ĐẶC ĐIỂM NỔI BẬT</h3> <span class="sec-line"></span></div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <ul class="nks-general-un-order-list"> <li> <p class="nks-list-description">Dung lượng RAM khá lớn với 4GB</p> </li> <li> <p class="nks-list-description">Màn hình có độ phân giải HD vô cùng sắc nét</p> </li> <li> <p class="nks-list-description">Xử lý đồ hoạ Intel HD Graphics 520</p> </li> <li> <p class="nks-list-description">Kiểu dáng nhỏ gọn, dễ dàng mang theo</p> </li> <li> <p class="nks-list-description">Màu sắc tinh tế, rất được ưa thích</p> </li> </ul> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) hoàn mĩ trong từng chi tiết" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-1.jpg" src="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-1.jpg" style="display: block;"> </div> </div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-normal-feature nks-custom-full-width"> <div class="nks-block-title big-title"> <h2>CHI TIẾT TÍNH NĂNG</h2> <span class="sec-line"></span></div> </div> </div> <div class="nks-column-group"> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Cấu hình mạnh mẽ</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Máy tính xách tay <a href="https://www.nguyenkim.com/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn.html" target="_blank" rel="noopener noreferrer">Lenovo ideapad 110-14ISK (80UC006AVN)</a> trang bị bộ vi xử lý Intel Core i3-6006 U tốc độ 2.00GHz, RAM 4GB, ổ cứng 1TB giúp chạy mượt mà đa tác vụ và ổn định. Card đồ họa Intel HD Graphics 520 hỗ trợ giải trí tốt hơn</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) có cấu hình mạnh mẽ" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-2.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Có cấu hình mạnh mẽ</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3>Kết nối đa dạng</h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><a href="https://www.nguyenkim.com/lenovo-ideapad-320-15ikb-80xl007wvn.html" target="_blank" rel="noopener noreferrer"></a>Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) <span>đa dạng kết nối với cổng USB, LAN, HDMI, jack cắm tay nghe giúp bạn dễ dàng kết nối với các thiết bị khác. </span><span>Khe cắm thẻ nhớ tiện dụng cho việc sao chép dữ liệu một cách dễ dàn</span>g.</p> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) kết nối nhanh chóng" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-3.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Kết nối vô cùng đa dạng</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Bàn phím cực chuẩn</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) thiết kế bàn phím có độ nảy và đàn hồi cao, khoảng cách giữa các phím rộng giúp người dùng dễ dàng thực hiện thao tác đánh máy nhanh, nhạy. Touchpad cảm ứng đa điểm nhạy bén theo từng thao tác chạm, đây thật sự là chiếc <a href="https://www.nguyenkim.com/may-tinh-xach-tay/" target="_blank" rel="noopener noreferrer">máy tính xách tay</a> lý tưởng</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) sở hữu bàn phím cực chuẩn" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-4.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Sở hữu bàn phím cực chuẩn</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3><strong>Pin cực khoẻ, vận hành êm</strong></h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) sử dụng pin chất lượng cao cho thời gian sử dụng tương đối giúp máy có thể hoạt động mát, êm ái và tiết kiệm điện năng nên có thể đáp ứng tốt nhu cầu sử dụng bình thường của bạn</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) pin sử dụng dài lâu" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-5.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Pin sử dụng dài lâu</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-title"> <h3>Màn hình HD sắc nét</h3> </div> <div class="nks-block-description-wrapper"> <div class="nks-block-description"> <p><span>Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) được thiết kế với kiểu dáng đặc biệt dành cho game thủ, với trọng lượng nhẹ nhàng giúp bạn dễ dàng mang theo bên mình để hỗ trợ công việc cũng như phục vụ nhu cầu giải trí của người dùng. Màn hình <a href="https://www.nguyenkim.com/laptop-lenovo/" target="_blank" rel="noopener noreferrer">laptop Lenovo </a>14 inches HD cho hình ảnh rõ ràng, sắc nét</span>.</p> </div> <div class="nks-images"> <img alt="Máy tính xách tay Lenovo ideapad 110-14ISK (80UC006AVN) có tính bảo mật cao" caption="false" class="imagelazyload" data-original="http://cdn.nguyenkimmall.com/images/companies/_1/Content/tin-hoc/laptop/lenovo/may-tinh-xach-tay-lenovo-ideapad-110-14isk-core-i3-80uc006avn-6.jpg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"> <p class="nks-image-description-center">Có tính bảo mật cao</p> </div> </div> </div> <div class="nks-block-item nks-type-normal-feature"> <div class="nks-block-description-wrapper"> <div class="nks-images"> </div> </div> </div> </div> </section> </div> </div> <div id="content_features" class="wysiwyg-content"> <div class="nk-content-features-new"> <div class="nks-block-title"><h3>Thông Số Kỹ Thuật</h3><span class="sec-line"></span></div> <div class="nk-content-digital"> <h2 class="subheader"> Thông tin chung </h2> <div class="control-group"> <label>Model:</label> <div class="feature-value">80UC006AVN</div> </div> <div class="control-group"> <label>Màu sắc:</label> <div class="feature-value">Đen</div> </div> <div class="control-group"> <label>Nhà sản xuất:</label> <div class="feature-value">Lenovo</div> </div> <div class="control-group"> <label>Xuất xứ:</label> <div class="feature-value">Trung Quốc</div> </div> <div class="control-group"> <label>Thời gian bảo hành:</label> <div class="feature-value">12 tháng</div> </div> <div class="control-group"> <label>Địa điểm bảo hành:</label> <div class="feature-value">Nguyễn Kim</div> </div> <h2 class="subheader"> Bộ vi xử lý </h2> <div class="control-group"> <label>CPU:</label> <div class="feature-value">Intel Core i3</div> </div> <div class="control-group"> <label>Loại CPU:</label> <div class="feature-value">6006U</div> </div> <div class="control-group"> <label>Tốc độ CPU:</label> <div class="feature-value">2.00 GHz</div> </div> <div class="control-group"> <label>Bộ nhớ đệm:</label> <div class="feature-value">3 MB Cache</div> </div> <h2 class="subheader"> Bộ nhớ </h2> <div class="control-group"> <label>Loại RAM:</label> <div class="feature-value">SDRAM DDR4</div> </div> <div class="control-group"> <label>Dung lượng RAM:</label> <div class="feature-value">4 GB</div> </div> <div class="control-group"> <label>Tốc độ Bus RAM:</label> <div class="feature-value">2133 MHz</div> </div> <h2 class="subheader"> Đĩa cứng </h2> <div class="control-group"> <label>Loại ổ đĩa cứng:</label> <div class="feature-value">HDD</div> </div> <div class="control-group"> <label>Dung lượng :</label> <div class="feature-value">1TB </div> </div> <h2 class="subheader"> Đĩa quang </h2> <div class="control-group"> <label>Tích hợp đĩa quang:</label> <div class="feature-value">Không</div> </div> <h2 class="subheader"> Đồ họa </h2> <div class="control-group"> <label>Bộ xử lý đồ họa:</label> <div class="feature-value"> Intel HD Graphics 520</div> </div> <h2 class="subheader"> Màn hình </h2> <div class="control-group"> <label>Kích thước màn hình:</label> <div class="feature-value">14.0 inch</div> </div> <div class="control-group"> <label>Độ phân giải màn hình:</label> <div class="feature-value">HD 1366 x 768 Pixels</div> </div> <h2 class="subheader"> Âm thanh </h2> <div class="control-group"> <label>Công nghệ âm thanh:</label> <div class="feature-value">High Definition (HD) Audio</div> </div> <div class="control-group"> <label>Chuẩn âm thanh:</label> <div class="feature-value">2.0</div> </div> <h2 class="subheader"> Kết nối </h2> <div class="control-group"> <label>Chuẩn WiFi:</label> <div class="feature-value">802.11 AC</div> </div> <div class="control-group"> <label>Chuẩn LAN:</label> <div class="feature-value">10 / 100 Mbps</div> </div> <div class="control-group"> <label>Cổng USB:</label> <div class="feature-value">Có</div> </div> <div class="control-group"> <label>Cổng HDMI:</label> <div class="feature-value">Có</div> </div> <div class="control-group"> <label>Khe đọc thẻ nhớ:</label> <div class="feature-value">SD/ SDHC/ SDXC</div> </div> <h2 class="subheader"> Tính năng khác </h2> <div class="control-group"> <label>Camera:</label> <div class="feature-value">VGA 0.3 MP</div> </div> <div class="control-group"> <label>Tính năng mở rộng:</label> <div class="feature-value">Multi TouchPad</div> </div> <h2 class="subheader"> Hệ điều hành </h2> <div class="control-group"> <label>HĐH kèm theo máy:</label> <div class="feature-value">Free DOS</div> </div> <h2 class="subheader"> Pin </h2> <div class="control-group"> <label>Loại Pin Laptop :</label> <div class="feature-value"> 4 cell</div> </div> <h2 class="subheader"> Kích thước &amp; Khối lượng </h2> <div class="control-group"> <label>Khối lượng sản phẩm (kg):</label> <div class="feature-value"> 2.1kg</div> </div> <div class="control-group"> <label>Kích thước sản phẩm:</label> <div class="feature-value">340 x 245 x 22.9mm</div> </div> </div> </div> </div> </div>', CAST(N'2017-12-14 23:57:53.600' AS DateTime), N'tuannguyen', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (1, N'Đồng hồ', 0, CAST(N'2015-08-26 19:00:44.567' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (2, N'Điện thoại', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (3, N'Máy tính để bàn', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (4, N'Máy tính xách tay', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (5, N'Phụ kiện', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (6, N'Phần mềm', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (7, N'Thể thao', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (8, N'Thời trang', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (9, N'Trang sức', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (10, N'Đồ nội thất', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [DisplayOrder], [CreatedDate], [CreatedBy], [Status]) VALUES (11, N'Làm đẹp', 1, CAST(N'2015-08-26 19:20:32.210' AS DateTime), N'vanky', 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/assets/client/images/slide-2-image.jpg', 1, N'/', NULL, CAST(N'2015-08-26 19:21:44.440' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/assets/client/images/slide-1-image.jpg', 2, N'/', NULL, CAST(N'2015-08-26 19:22:01.173' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
INSERT [dbo].[User] ([UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [Status]) VALUES (N'tuannguyen', N'123456', N'Nguyễn Tuấn', N'TPHCM', N'nguyenaituan@yahoo.com', N'394123234', CAST(N'2017-12-16 12:27:03.973' AS DateTime), 1)
INSERT [dbo].[User] ([UserName], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [Status]) VALUES (N'vanky', N'123456', N'Nguyễn Văn Kỳ', N'156 lê văn thọ gò vâp
', N'1311517482@ntt.edu.vn', N'tuannguyen', CAST(N'2017-12-16 12:22:00.000' AS DateTime), 1)
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_User]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserName])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_User1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserName])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User1]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserName])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_User]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_User]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_User1]
GO
USE [master]
GO
ALTER DATABASE [HomeShopee] SET  READ_WRITE 
GO
