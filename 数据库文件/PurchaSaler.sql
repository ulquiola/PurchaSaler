USE [master]
GO
/****** Object:  Database [PurchaSaler]    Script Date: 2019/6/11 18:54:47 ******/
CREATE DATABASE [PurchaSaler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PurchaSaler', FILENAME = N'D:\SqlServer2017\MSSQL14.MYSQLSERVER\MSSQL\DATA\PurchaSaler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PurchaSaler_log', FILENAME = N'D:\SqlServer2017\MSSQL14.MYSQLSERVER\MSSQL\DATA\PurchaSaler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PurchaSaler] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PurchaSaler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PurchaSaler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PurchaSaler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PurchaSaler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PurchaSaler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PurchaSaler] SET ARITHABORT OFF 
GO
ALTER DATABASE [PurchaSaler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PurchaSaler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PurchaSaler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PurchaSaler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PurchaSaler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PurchaSaler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PurchaSaler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PurchaSaler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PurchaSaler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PurchaSaler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PurchaSaler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PurchaSaler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PurchaSaler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PurchaSaler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PurchaSaler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PurchaSaler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PurchaSaler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PurchaSaler] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PurchaSaler] SET  MULTI_USER 
GO
ALTER DATABASE [PurchaSaler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PurchaSaler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PurchaSaler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PurchaSaler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PurchaSaler] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PurchaSaler] SET QUERY_STORE = OFF
GO
USE [PurchaSaler]
GO
/****** Object:  Table [dbo].[AdressInfo]    Script Date: 2019/6/11 18:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdressInfo](
	[AdressID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Adress] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_AdressInfo] PRIMARY KEY CLUSTERED 
(
	[AdressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodComment]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodComment](
	[GoodCommentID] [int] NOT NULL,
	[UserID] [int] NULL,
	[GoodID] [int] NULL,
	[Comment] [varchar](50) NULL,
	[PublishTime] [datetime] NULL,
 CONSTRAINT [PK_GoodComment] PRIMARY KEY CLUSTERED 
(
	[GoodCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodID] [int] IDENTITY(1,1) NOT NULL,
	[ShopID] [int] NULL,
	[CategoryID] [int] NULL,
	[GoodTitle] [varchar](256) NULL,
	[GoodPhoto] [varchar](256) NULL,
	[GoodDescribe] [varchar](256) NULL,
	[Amount] [int] NULL,
	[Quality] [varchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[GoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[GoodID] [int] NULL,
	[Price] [money] NULL,
	[Amount] [int] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[OrderTime] [datetime] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyComment]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComment](
	[ReplyGoodID] [int] NOT NULL,
	[UserID] [int] NULL,
	[GoodCommentID] [int] NULL,
	[ReplyContent] [varchar](50) NULL,
	[ReplyTime] [datetime] NULL,
 CONSTRAINT [PK_ReplyComment] PRIMARY KEY CLUSTERED 
(
	[ReplyGoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCarts]    Script Date: 2019/6/11 18:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCarts](
	[UserID] [int] NOT NULL,
	[GoodID] [int] NULL,
	[Price] [money] NULL,
	[Amount] [int] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_ShopCarts] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 2019/6/11 18:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShopName] [varchar](50) NULL,
 CONSTRAINT [PK_Shops_1] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/6/11 18:54:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Avatar] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'生活百货')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'手机数码')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'书籍')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'男装')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'女装')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'服饰配件')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'电器')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'美妆')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'游戏装备')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'游戏交易')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'水果零食')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (1, 1, 1, N'创意家居生活用品实用韩国厨房收纳置物小百货居家家庭日常日用品', N'/Content/img/imageGood/1.jpg', N'创意家居生活用品实用韩国厨房收纳置物小百货居家家庭日常日用品', 1, N'全新', 6.6900)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (2, 1, 1, N'家居创意生活实用小东西防油做饭神器厨房日用品用具小百货店家用', N'/Content/img/imageGood/2.jpg', N'家居创意生活实用小东西防油做饭神器厨房日用品用具小百货店家用', 1, N'全新', 8.5000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (3, 1, 1, N'水槽沥水篮厨房用品用具小百货省空间收纳挂架生活小东西日用品', N'/Content/img/imageGood/3.jpg', N'水槽沥水篮厨房用品用具小百货省空间收纳挂架生活小东西日用品', 1, N'全新', 7.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (4, 1, 1, N'家用厨房用品用具创意厨房小用品防水工具懒人神器生活小百货实用', N'/Content/img/imageGood/4.jpg', N'家用厨房用品用具创意厨房小用品防水工具懒人神器生活小百货实用', 1, N'全新', 18.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (5, 1, 1, N'创意厨房用品用具小百货家居生活小神器实用饭酒店做饭懒人小工具', N'/Content/img/imageGood/5.jpg', N'创意厨房用品用具小百货家居生活小神器实用饭酒店做饭懒人小工具', 1, N'全新', 16.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (6, 1, 1, N'创意家居厨房用品用具小百货生活实用小工具神器家用韩国厨具套装', N'/Content/img/imageGood/6.jpg', N'创意家居厨房用品用具小百货生活实用小工具神器家用韩国厨具套装', 1, N'全新', 16.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (7, 1, 1, N'家居厨房用品家用大全生活小百货用具厨房神器洗碗池水槽垃圾袋', N'/Content/img/imageGood/7.jpg', N'家居厨房用品家用大全生活小百货用具厨房神器洗碗池水槽垃圾袋', 1, N'全新', 7.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (8, 1, 1, N'创意厨房用品用具浴室用品防水小工具卫生间防污神器生活百货家用', N'/Content/img/imageGood/8.jpg', N'创意厨房用品用具浴室用品防水小工具卫生间防污神器生活百货家用', 1, N'全新', 15.1000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (9, 1, 1, N'创意家居厨房用品用具生活小百货家用厨具神器大全实用做饭小工具', N'/Content/img/imageGood/9.jpg', N'创意家居厨房用品用具生活小百货家用厨具神器大全实用做饭小工具', 1, N'全新', 19.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (10, 1, 1, N'创意家居厨房用品用具小百货生活实用工具神器家用厨具大全套装', N'/Content/img/imageGood/10.jpg', N'创意家居厨房用品用具小百货生活实用工具神器家用厨具大全套装', 1, N'全新', 15.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (11, 1, 1, N'创意懒人卧室收纳家居用品家实用生活韩国日常小百货商品抖音神器', N'/Content/img/imageGood/11.jpg', N'创意懒人卧室收纳家居用品家实用生活韩国日常小百货商品抖音神器', 1, N'全新', 27.5000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (12, 1, 1, N'创意懒人家居家实用生活日用品韩国卫生间宿舍收纳小百货商品神器', N'/Content/img/imageGood/12.jpg', N'创意懒人家居家实用生活日用品韩国卫生间宿舍收纳小百货商品神器', 1, N'全新', 15.8500)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (13, 1, 1, N'创意实用家居生活厨房用品用具百货收纳神器家用小东西大全置物架', N'/Content/img/imageGood/13.jpg', N'创意实用家居生活厨房用品用具百货收纳神器家用小东西大全置物架', 1, N'全新', 14.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (14, 1, 1, N'实用家居厨房用品用具大全懒人神器居家生活小百货家用日用小玩意', N'/Content/img/imageGood/14.jpg', N'实用家居厨房用品用具大全懒人神器居家生活小百货家用日用小玩意', 1, N'全新', 12.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (15, 1, 1, N'家居厨房用品用具生活家用小工具小件实用小百货厨具家居套装大全', N'/Content/img/imageGood/15.jpg', N'家居厨房用品用具生活家用小工具小件实用小百货厨具家居套装大全', 1, N'全新', 15.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (16, 1, 1, N'家居生活厨房用品用具小百货筷架创意厨具收纳神器置物架家用大全', N'/Content/img/imageGood/16.jpg', N'家居生活厨房用品用具小百货筷架创意厨具收纳神器置物架家用大全', 1, N'全新', 18.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (17, 2, 2, N'三星 Galaxy A8s SM-G8870', N'/Content/img/imageGood/a1 (1).jpg', N'直降300元/免息当天发/Samsung/三星 Galaxy A8s SM-G8870 官方正品学生手机 ', 1, N'全新', 2499.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (18, 2, 2, N'荣耀 畅玩8C 全网通4G智能', N'/Content/img/imageGood/a1 (2).jpg', N'荣耀 畅玩8C 全网通4G智能手机全新正品学生新品 ', 1, N'全新', 899.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (19, 2, 2, N'美图 T9 全网通4G智能', N'/Content/img/imageGood/a1 (3).jpg', N'Meitu/美图 T9 全网通4G智能手机美颜双卡双待拍照手机t9 ', 1, N'全新', 1799.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (20, 2, 2, N'三星 GALAXY Note9 SM-N9600 全网通正品', N'/Content/img/imageGood/a1 (4).jpg', N'价格已降/6期免息 送9重礼 Samsung/三星 GALAXY Note9 SM-N9600 全网通正品手机', 1, N'全新', 5989.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (21, 2, 2, N'一加 GM1910 骁龙855 一加', N'/Content/img/imageGood/a1 (5).jpg', N'OnePlus/一加 GM1910 骁龙855 一加手机七 1+7 一加7pro ', 1, N'全新', 4230.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (22, 2, 2, N'Meitu/美图 MP1801 美图V7 x托尼洛·兰博基尼限量版', N'/Content/img/imageGood/a1 (6).jpg', N'Meitu/美图 MP1801 美图V7 x托尼洛·兰博基尼限量版手机', 1, N'全新', 3969.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (23, 2, 2, N'荣耀 荣耀20i 3200万AI自拍照渐变色珍珠游戏', N'/Content/img/imageGood/a1 (7).jpg', N'honor/荣耀 荣耀20i 3200万AI自拍照渐变色珍珠游戏手机', 1, N'全新', 1450.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (24, 2, 2, N'美图 V6 自拍美颜 主播神器 全网通4G', N'/Content/img/imageGood/a1 (8).jpg', N'Meitu/美图 V6 自拍美颜 主播神器 全网通4G手机女神专属 ', 1, N'全新', 1440.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (25, 2, 2, N'荣耀8X MAX全新正品智能拍照商务大屏', N'/Content/img/imageGood/a1 (9).jpg', N'honor/荣耀 荣耀8X MAX全新正品智能拍照商务大屏手机8x', 1, N'全新', 1340.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (26, 2, 2, N'荣耀8X全面屏智能', N'/Content/img/imageGood/a1 (10).jpg', N'honor/荣耀 荣耀8X全面屏智能手机全网通4G学生全新正品', 1, N'全新', 1270.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (27, 2, 2, N'荣耀10青春版渐变色全面屏双卡双待学生', N'/Content/img/imageGood/a1 (11).jpg', N'honor/荣耀 荣耀10青春版渐变色全面屏双卡双待学生手机', 1, N'全新', 1249.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (28, 2, 2, N'美图 M8 美少女战士 Kitty 特别版 美颜自拍', N'/Content/img/imageGood/a1 (12).jpg', N'Meitu/美图 M8 美少女战士 Kitty 特别版 美颜自拍手机', 1, N'全新', 940.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (29, 2, 2, N'荣耀 荣耀畅玩8A 珍珠全面屏新品学生4G智能', N'/Content/img/imageGood/a1 (13).jpg', N'honor/荣耀 荣耀畅玩8A 珍珠全面屏新品学生4G智能手机', 1, N'全新', 779.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (30, 2, 2, N'荣耀 畅玩7 智能学生', N'/Content/img/imageGood/a1 (14).jpg', N'honor/荣耀 畅玩7 智能学生手机 老人机 4G全 网通 双4核', 1, N'全新', 550.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (31, 2, 2, N'卡通短挂绳硅胶指环扣iPhoneX苹果X', N'/Content/img/imageGood/a1 (15).jpg', N'卡通短挂绳硅胶指环扣iPhoneX苹果X手机7P/8plus防摔数码配件6s女', 1, N'全新', 9.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (32, 2, 2, N'日本花虎数码整理收纳包', N'/Content/img/imageGood/a1 (16).jpg', N'日本花虎数码整理收纳包手机护照斜挎包证件包多功能便携旅行袋女', 1, N'全新', 53.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (33, 2, 2, N'维修显微镜 数码显微镜 电子显微镜 工业显微镜', N'/Content/img/imageGood/a1 (17).jpg', N'高清手机维修显微镜 数码显微镜 电子显微镜 工业显微镜', 1, N'全新', 178.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (34, 2, 2, N'壳16thPlus新款超薄空气壳四角防摔硅胶套万能', N'/Content/img/imageGood/a1 (18).jpg', N'魅族16s手机壳16thPlus新款超薄空气壳四角防摔硅胶套万能', 1, N'全新', 7.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (35, 2, 2, N'挂绳可拆卸指环扣挂饰苹果长短配件挂脖吊绳数码防摔女款', N'/Content/img/imageGood/a1 (19).jpg', N'卡通手机挂绳可拆卸指环扣挂饰苹果长短配件挂脖吊绳数码防摔女款', 1, N'全新', 8.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (36, 2, 2, N'小米9保护壳超薄阿丽塔街头风', N'/Content/img/imageGood/a1 (20).jpg', N'小米9手机保护壳超薄阿丽塔街头风手机保护套ins男女情侣', 1, N'全新', 16.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (37, 2, 2, N'高清带显示屏数码显微镜', N'/Content/img/imageGood/a1 (21).jpg', N'高清带显示屏数码显微镜手机主板维修工业显微镜1000倍电子放大镜', 1, N'全新', 298.8600)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (38, 2, 2, N'SD内存卡盒数码收纳包TF', N'/Content/img/imageGood/a1 (22).jpg', N'SD内存卡盒数码收纳包TF手机SIM整理包CF数码存储卡盒PSV游戏卡包1000倍电子放大镜', 1, N'全新', 11.2000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (39, 2, 2, N'小米9壳米9se新款超薄空气壳四角防摔', N'/Content/img/imageGood/a1 (23).jpg', N'小米9手机壳米9se新款超薄空气壳四角防摔手机硅胶套万能M', 1, N'全新', 7.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (40, 2, 2, N'电子显微镜数码平板放大镜便携式显微镜昆虫植物放大镜', N'/Content/img/imageGood/a1 (24).jpg', N'高清无线1000倍WiFi手机电子显微镜数码平板放大镜便携式显微镜昆虫植物放大镜', 1, N'全新', 185.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (41, 3, 3, N'少年的你如此美丽', N'/Content/img/imageGood/c (1).jpg', N'少年的你如此美丽 原著正版珍藏版易烊千玺主演电影玖月晞青春言情小说当时年少畅销文学排行榜书籍', 1, N'全新', 19.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (42, 3, 3, N'乌合之众正版', N'/Content/img/imageGood/c (2).jpg', N'乌合之众正版(原版插图/无删减版) [法]古斯塔夫·勒庞著 乌合之众大众心理研究 冯克利推荐阅读心理学书籍 乌合之众书 正版包邮', 1, N'全新', 13.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (43, 3, 3, N'诗词大全诗经楚辞唐诗宋词元曲', N'/Content/img/imageGood/c (3).jpg', N'正版 诗词写作入门 诗词格律简捷入门 诗词大全诗经楚辞唐诗宋词元曲 诗词写作常识 中国古诗词鉴赏书籍 中国诗词大会 三百首', 1, N'全新', 6.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (44, 3, 3, N'三字经注音版小学生千字文弟子规书正版全集全文', N'/Content/img/imageGood/c (4).jpg', N'儿童国学经典书籍全套10册 三字经注音版小学生千字文弟子规书正版全集全文 论语唐诗三百首幼儿早教古诗书300首 声律启蒙笠翁对韵', 1, N'全新', 14.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (45, 3, 3, N'无羁 墨香铜臭新书仙侠玄幻道修真魔架空历史原著小说第 一卷全套', N'/Content/img/imageGood/c (5).jpg', N'正版包邮【赠家训雅正集+抽送召阴旗海报】无羁 墨香铜臭新书仙侠玄幻道修真魔架空历史原著小说第 一卷全套书籍天官赐福', 1, N'全新', 26.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (46, 3, 3, N'四大名著全套小学生版注音版4册 西游记+红楼梦+三国演义+水浒传儿童版', N'/Content/img/imageGood/c (6).jpg', N'四大名著全套小学生版注音版4册 西游记+红楼梦+三国演义+水浒传儿童版 小学生课外阅读书籍 正版一年级课外书必读 故事书 6-12岁', 1, N'全新', 55.2000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (47, 3, 3, N'别让拖延症害了你 正版 成功励志畅销', N'/Content/img/imageGood/c (7).jpg', N'别让拖延症害了你 正版 成功励志畅销书籍心理学与生活读心术行为管理写给年轻人的拖延心理学拖延不是病养成习惯真要命', 1, N'全新', 13.8800)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (48, 3, 3, N'小幽默大气场 提高情商的', N'/Content/img/imageGood/c (8).jpg', N'小幽默大气场 提高情商的书籍 沟通的智慧口才说话技巧书籍一开口就让人喜欢你说话的艺术别输在不会表达上情商修炼情商高就会说话', 1, N'全新', 34.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (49, 3, 3, N'全4册超级记忆术+最强大脑+思维导图+思维风暴教你简单快速有效的提升记忆快速提高左右脑思维和技巧智慧智商训练', N'/Content/img/imageGood/c (9).jpg', N'正版包邮 全4册超级记忆术+最强大脑+思维导图+思维风暴教你简单快速有效的提升记忆快速提高左右脑思维和技巧智慧智商训练书籍', 1, N'全新', 19.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (50, 3, 3, N'全3册正版 拖延症心理学 别让拖延症毁掉你你不该输在情绪上 教你如何控制自己的情绪成功励志入门基础<s人际关系交往畅销情商书', N'/Content/img/imageGood/c (10).jpg', N'全3册正版 拖延症心理学 别让拖延症毁掉你你不该输在情绪上 教你如何控制自己的情绪成功励志入门基础书籍人际关系交往畅销情商书', 1, N'全新', 26.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (51, 3, 3, N'菜谱书家常家用大全厨师书新手', N'/Content/img/imageGood/c (11).jpg', N'菜谱书家常家用大全厨师书新手学家常菜炒菜煲汤川菜湘菜粤菜烹饪书蒸菜名厨图解全套美食的做法做饭做菜的书美食书籍食谱', 1, N'全新', 18.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (52, 3, 3, N'福尔摩斯探案全集正版全8册', N'/Content/img/imageGood/c (12).jpg', N'福尔摩斯探案全集正版全8册 7-9-12-15岁阅读的三四五六年级课外阅读书籍 福尔摩斯探案集小学生版原版原著 少儿侦探悬疑推理小说', 1, N'全新', 128.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (53, 3, 3, N'人间词话 王国维正版', N'/Content/img/imageGood/c (13).jpg', N'人间词话 王国维正版包邮 国学大师的字学批评著作 文学畅读销售书籍 初高中老师推荐读物中国古诗词 人间词话中华书局 人间词话', 1, N'全新', 39.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (54, 3, 3, N'唐诗三百首全集300首宋词三百首幼儿早教书正版彩图注音小学生课外阅读', N'/Content/img/imageGood/c (14).jpg', N'【完整版无删减】唐诗三百首全集300首宋词三百首幼儿早教书正版彩图注音小学生课外阅读书籍古诗一年级课外书二年级3-6-9岁书幼儿', 1, N'全新', 50.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (55, 3, 3, N'四季家常菜 菜谱书家常菜谱大全 食谱', N'/Content/img/imageGood/c (15).jpg', N'正版现货 四季家常菜 菜谱书家常菜谱大全 食谱书籍大全家常菜 烹饪小炒菜美食川菜湘菜谱大全图解家常菜做法教程大众菜谱做饭书籍', 1, N'全新', 39.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (56, 3, 3, N' 墨菲定律 职场谈判人际交往心理学入门基础', N'/Content/img/imageGood/c (16).jpg', N'正版包邮现货 墨菲定律 职场谈判人际交往心理学入门基础书籍 抖音推荐的书籍 心理学与生活 心理学书籍读心术书籍畅销书排行榜', 1, N'全新', 36.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (57, 3, 3, N'活着/余华作品正版包邮精致装版中国现当代文学民国历史长篇小说兄弟许三观卖血记活着为了讲述', N'/Content/img/imageGood/c (17).jpg', N'活着/余华作品正版包邮精致装版中国现当代文学民国历史长篇小说兄弟许三观卖血记活着为了讲述书籍书排行榜新华书店', 1, N'全新', 28.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (58, 3, 3, N'世界上最神奇的24堂课大全集(美)查尔斯哈奈尔著', N'/Content/img/imageGood/c (18).jpg', N'正版包邮 世界上最神奇的24堂课大全集(美)查尔斯哈奈尔著黄晓艳译具有影响力的潜能训练课程安利销售经典励志哲理的畅销书籍', 1, N'全新', 48.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (59, 3, 3, N'全套12册 365夜亲子阅读 童话带拼音的儿童睡前故事书0-3-4-6岁宝宝幼儿园', N'/Content/img/imageGood/c (19).jpg', N'全套12册 365夜亲子阅读 童话带拼音的儿童睡前故事书0-3-4-6岁宝宝幼儿园书籍学前班小孩简短读物婴儿早教绘本益智图书', 1, N'全新', 25.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (60, 3, 3, N'宋词三百首唐诗三百首全集小学版正版注音版一年级课外阅读二年级三年级小学生课外阅读', N'/Content/img/imageGood/c (20).jpg', N'宋词三百首唐诗三百首全集小学版正版注音版一年级课外阅读二年级三年级小学生课外阅读书籍儿童故事书6-12周岁幼儿早教读物8-10岁', 1, N'全新', 12.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (61, 4, 4, N'夏季潮流纯棉白色短袖T恤', N'/Content/img/imageGood/d (1).jpg', N'富贵鸟男士短袖t恤新款圆领宽松衣服夏季潮流纯棉白色短袖T恤男装', 1, N'全新', 59.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (62, 4, 4, N'马克华菲西裤商务绅士裤子', N'/Content/img/imageGood/d (2).jpg', N'马克华菲男装西裤商务绅士裤子', 1, N'全新', 78.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (63, 4, 4, N'夏装男士无袖背心男潮流百搭嘻哈坎肩夏季宽松坎袖背心男', N'/Content/img/imageGood/d (3).jpg', N'男装夏装男士无袖背心男潮流百搭嘻哈坎肩男装夏季宽松坎袖背心男', 1, N'全新', 25.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (64, 4, 4, N'爸爸装秋装中年男长袖T恤薄款中老年春秋款40-60岁爷爷装衣服', N'/Content/img/imageGood/d (4).jpg', N'爸爸装秋装中年男长袖T恤薄款中老年男装春秋款40-60岁爷爷装衣服', 1, N'全新', 49.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (65, 4, 4, N'迪诺豪爸爸夏装中老年纯色男士短袖t恤夏季上衣服有领40-50岁', N'/Content/img/imageGood/d (5).jpg', N'迪诺豪爸爸夏装中老年纯色男士短袖t恤夏季男装上衣服有领40-50岁', 1, N'全新', 49.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (66, 4, 4, N'2019新款夏季男士短袖t恤翻领纯棉体恤薄款polo衫夏装短t', N'/Content/img/imageGood/d (6).jpg', N'2019新款夏季男装男士短袖t恤翻领纯棉体恤薄款polo衫夏装短t', 1, N'全新', 58.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (67, 4, 4, N'欧洲站莫代尔纯棉圆领个性大码短袖潮牌印花男t恤美杜莎t恤夏', N'/Content/img/imageGood/d (7).jpg', N'欧洲站莫代尔纯棉圆领个性大码短袖潮牌印花男t恤美杜莎t恤男装夏', 1, N'全新', 43.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (68, 4, 4, N'南极人2019新款春款男士夹克上衣外套牛仔夹克衫青年情侣衫', N'/Content/img/imageGood/d (8).jpg', N'南极人2019新款男装春款男士夹克上衣外套牛仔夹克衫青年情侣衫', 1, N'全新', 88.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (69, 4, 4, N'男士短袖t恤新款圆领宽松衣服夏季潮流纯棉白半袖丅大码体恤', N'/Content/img/imageGood/d (9).jpg', N'男士短袖t恤新款圆领宽松衣服夏季潮流纯棉白半袖丅大码体恤男装', 1, N'全新', 14.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (70, 4, 4, N'sulee夏季浅色男款牛仔裤春夏款男士直筒修身青年超薄款长裤', N'/Content/img/imageGood/d (10).jpg', N'sulee夏季浅色男款牛仔裤春夏款男士直筒修身青年超薄款男装长裤', 1, N'全新', 69.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (71, 4, 4, N'夏季男士圆领运动t恤潮韩版半袖大码青少年学生宽松纯棉短袖', N'/Content/img/imageGood/d (11).jpg', N'夏季男士圆领运动t恤潮男装韩版半袖大码青少年学生宽松纯棉短袖', 1, N'全新', 22.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (72, 4, 4, N'POLO衫男短袖夏季韩版男士修身半袖保罗衫潮流上衣翻领T恤衫', N'/Content/img/imageGood/d (12).jpg', N'POLO衫男短袖夏季韩版男士修身半袖保罗衫潮流上衣翻领T恤衫男装', 1, N'全新', 68.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (73, 4, 4, N'商场同款马克华菲夏季短袖polo衫男简约时尚', N'/Content/img/imageGood/d (13).jpg', N'商场同款马克华菲男装夏季短袖polo衫男简约时尚', 1, N'全新', 148.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (74, 4, 4, N'男士t恤夏季翻领 宽松黑白纯色纯棉短袖polo衫上衣保罗衫衣服', N'/Content/img/imageGood/d (14).jpg', N'男士t恤夏季翻领 宽松黑白纯色纯棉短袖polo衫上衣保罗衫衣服男装', 1, N'全新', 34.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (75, 4, 4, N'2019夏季新款男士短袖t恤衬衫领半袖polo衫潮流丅恤潮牌衣服', N'/Content/img/imageGood/d (15).jpg', N'2019夏季新款男士短袖t恤衬衫领半袖polo衫潮流丅恤男装潮牌衣服', 1, N'全新', 49.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (76, 4, 4, N'纯棉休闲花夏季之傢官网森馬牛仔裤官方旗舰店A21KM公子海南', N'/Content/img/imageGood/d (16).jpg', N'纯棉休闲花夏季之傢官网森馬男装牛仔裤官方旗舰店A21KM公子海南', 1, N'全新', 40.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (77, 4, 4, N'男士短袖t恤潮流衣服2019新款休闲宽松半袖夏季潮牌情侣套装', N'/Content/img/imageGood/d (17).jpg', N'男士短袖t恤潮流衣服2019新款休闲宽松半袖夏季潮牌男装情侣套装', 1, N'全新', 58.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (78, 4, 4, N'男士短袖t恤2019新款夏季五分袖半袖潮流宽松T体恤潮牌上衣服', N'/Content/img/imageGood/d (18).jpg', N'男士短袖t恤2019新款夏季男装五分袖半袖潮流宽松T体恤潮牌上衣服', 1, N'全新', 39.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (79, 4, 4, N'追击者男士外套2019新款韩版潮流百搭帅气 学生工装春秋 夹克', N'/Content/img/imageGood/d (19).jpg', N'追击者男士外套2019新款韩版潮流百搭帅气 学生工装春秋 夹克男装', 1, N'全新', 69.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (80, 4, 4, N'2019夏季薄款弹力弹性牛仔短裤男七分裤男裤子7分中裤马裤子', N'/Content/img/imageGood/d (20).jpg', N'2019夏季薄款弹力弹性牛仔短裤男七分裤男裤子男装7分中裤马裤子', 1, N'全新', 59.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (81, 4, 4, N'牧西尼男士短袖T恤新款潮牌夏装潮流半袖男上衣体恤衣服小狗', N'/Content/img/imageGood/d (21).jpg', N'牧西尼男士短袖T恤新款潮牌夏装潮流男装半袖男上衣体恤衣服小狗', 1, N'全新', 38.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (82, 4, 4, N'短袖t恤男2019新款半袖纯棉夏季韩版潮流宽松圆领中国风潮牌', N'/Content/img/imageGood/d (22).jpg', N'短袖t恤男2019新款半袖纯棉夏季韩版潮流宽松圆领中国风潮牌男装', 1, N'全新', 36.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (83, 4, 4, N'夏季韩版V领时尚修身纯棉短袖青年男士桃领休闲弹性T恤灰色', N'/Content/img/imageGood/d (23).jpg', N'夏季韩版V领时尚修身男装纯棉短袖青年男士桃领休闲弹性T恤灰色', 1, N'全新', 29.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (84, 4, 4, N'雅鹿男士短袖t恤圆领宽松衣服夏季韩版纯棉大码半袖体恤潮流', N'/Content/img/imageGood/d (24).jpg', N'雅鹿男士短袖t恤圆领宽松衣服夏季韩版纯棉大码半袖体恤男装潮流', 1, N'全新', 19.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (85, 5, 5, N'仙女裙子大码韩版超仙雪纺连衣裙', N'/Content/img/imageGood/e (1).jpg', N'2019夏季新款印花流行妈妈装仙女裙子大码女装韩版超仙雪纺连衣裙', 1, N'全新', 88.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (86, 5, 5, N'2019夏装新款修身中长裙短袖不规则气质名媛黑色雪纺连衣裙女', N'/Content/img/imageGood/e (2).jpg', N'2019夏装新款女装修身中长裙短袖不规则气质名媛黑色雪纺连衣裙女', 1, N'全新', 79.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (87, 5, 5, N'法国小众休闲连体套装女2019夏装新款夏季小黑裙飘逸网纱两件', N'/Content/img/imageGood/e (3).jpg', N'法国小众休闲连体套装女2019夏装新款夏季女装小黑裙飘逸网纱两件', 1, N'全新', 79.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (88, 5, 5, N'2019新款韩版新季字母印花圆领上衣短袖宽松T恤衫', N'/Content/img/imageGood/e (4).jpg', N'2019新款韩版新季字母印花圆领上衣女装短袖宽松T恤衫', 1, N'全新', 29.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (89, 5, 5, N'2019夏季女神新衣红人优品 高腰直筒卷边牛仔短裤', N'/Content/img/imageGood/e (5).jpg', N'2019夏季女神新衣红人优品女装 高腰直筒卷边牛仔短裤', 1, N'全新', 59.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (90, 5, 5, N'2019新款夏季超火cec短袖T恤体恤韩版宽松学生bf百搭半袖上衣', N'/Content/img/imageGood/e (6).jpg', N'2019新款夏季超火cec短袖T恤女装体恤韩版宽松学生bf百搭半袖上衣', 1, N'全新', 18.8000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (91, 5, 5, N'2019款闺蜜装牛油果绿裙子仙女超仙森系夏季雪纺连衣裙小清新', N'/Content/img/imageGood/e (7).jpg', N'女装2019款闺蜜装牛油果绿裙子仙女超仙森系夏季雪纺连衣裙小清新', 1, N'全新', 84.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (92, 5, 5, N'A夏季新款韩版显瘦印花雪纺连衣裙时尚气质A字中长裙F0320548', N'/Content/img/imageGood/e (8).jpg', N'A夏季新款女装韩版显瘦印花雪纺连衣裙时尚气质A字中长裙', 1, N'全新', 79.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (93, 5, 5, N'纯棉中长款t恤短袖宽松2019夏季新款半袖打底衫上衣服连衣裙', N'/Content/img/imageGood/e (9).jpg', N'纯棉中长款t恤女装短袖宽松2019夏季新款半袖打底衫上衣服连衣裙', 1, N'全新', 19.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (94, 5, 5, N'短袖白色T恤女宽松韩版百搭纯棉休闲显瘦纯色半袖夏2019新款', N'/Content/img/imageGood/e (10).jpg', N'短袖白色T恤女宽松韩版百搭纯棉休闲显瘦纯色半袖女装夏2019新款', 1, N'全新', 24.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (95, 5, 5, N'香依雅园86017黑色针织休闲裤大码高腰显瘦百搭2018夏季新款', N'/Content/img/imageGood/e (11).jpg', N'香依雅园86017黑色针织休闲裤大码高腰显瘦百搭女装2018夏季新款', 1, N'全新', 79.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (96, 5, 5, N'2019夏天新款洋气贵夫人春阔太太蕾丝连衣裙中袖大码显瘦裙子', N'/Content/img/imageGood/e (12).jpg', N'2019夏天新款女装洋气贵夫人春阔太太蕾丝连衣裙中袖大码显瘦裙子', 1, N'全新', 98.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (97, 5, 5, N'2019新款上衣T恤百搭韩版小清新雪纺衫修身短款短袖打底衫', N'/Content/img/imageGood/e (13).jpg', N'2019女装新款上衣T恤百搭韩版小清新雪纺衫修身短款短袖打底衫', 1, N'全新', 89.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (98, 5, 5, N'2019夏装新款韩版纯色大码宽显瘦松短袖T恤女士上衣 时尚百搭', N'/Content/img/imageGood/e (14).jpg', N'2019夏装新款韩版纯色大码女装宽显瘦松短袖T恤女士上衣 时尚百搭', 1, N'全新', 59.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (99, 5, 5, N'中老年女裤中年高腰妈妈裤子老人女春季奶奶大码长裤宽松春秋', N'/Content/img/imageGood/e (15).jpg', N'中老年女裤中年高腰妈妈裤子老人女春季奶奶大码长裤宽松春秋女装', 1, N'全新', 59.0000)
GO
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (100, 5, 5, N'ins潮2019夏季新款韩版短袖纯色原宿风百搭中长款卡通印花T恤', N'/Content/img/imageGood/e (16).jpg', N'ins潮2019夏季新款韩版女装短袖纯色原宿风百搭中长款卡通印花T恤', 1, N'全新', 48.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (101, 5, 5, N'花衬衫女短袖宽松海边度假风复古港风印花上衣女夏随性慵懒', N'/Content/img/imageGood/e (17).jpg', N'花衬衫女短袖宽松海边度假风复古港风印花上衣女夏随性慵懒女装', 1, N'全新', 37.7000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (102, 5, 5, N'中老年人夏装雪纺奶奶衬衫607080岁妈妈装老人衣服奶奶装套装', N'/Content/img/imageGood/e (18).jpg', N'中老年人夏装女装雪纺奶奶衬衫607080岁妈妈装老人衣服奶奶装套装', 1, N'全新', 78.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (103, 5, 5, N'2019夏季新款吊带圆波点连衣裙高腰显瘦褶皱中长款小仙女裙子', N'/Content/img/imageGood/e (19).jpg', N'2019夏季新款吊带圆波点连衣裙女装高腰显瘦褶皱中长款小仙女裙子', 1, N'全新', 39.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (104, 5, 5, N'奶奶装夏季衣老太太衣服棉绸套装老年人夏装女60-70-80岁中年', N'/Content/img/imageGood/e (20).jpg', N'奶奶装夏季衣老太太衣服棉绸套装老年人夏装女60-70-80岁中年女装', 1, N'全新', 49.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (105, 5, 5, N'2019夏女神新衣红人优品 无袖连衣裙长款后边', N'/Content/img/imageGood/e (21).jpg', N'2019夏女神新衣红人优品女装 无袖连衣裙长款后边', 1, N'全新', 69.9000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (106, 5, 5, N't恤女短袖2019夏装新款衣服宽松遮肚子ins超火的上衣蝙蝠衫潮', N'/Content/img/imageGood/e (22).jpg', N't恤女短袖2019夏装新款女装衣服宽松遮肚子ins超火的上衣蝙蝠衫潮', 1, N'全新', 49.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (107, 5, 5, N'阔太太套装洋气高贵两件套中年短袖民族风上衣中老年妈妈夏装', N'/Content/img/imageGood/e (23).jpg', N'阔太太套装洋气高贵两件套中年女装短袖民族风上衣中老年妈妈夏装', 1, N'全新', 68.0000)
INSERT [dbo].[Goods] ([GoodID], [ShopID], [CategoryID], [GoodTitle], [GoodPhoto], [GoodDescribe], [Amount], [Quality], [Price]) VALUES (108, 5, 5, N'圆领宽松t恤女短袖纯棉百搭夏装2019新款韩版体恤上衣服纯色', N'/Content/img/imageGood/e (24).jpg', N'圆领宽松t恤女短袖纯棉百搭夏装女装2019新款韩版体恤上衣服纯色', 1, N'全新', 19.9000)
SET IDENTITY_INSERT [dbo].[Goods] OFF
INSERT [dbo].[ShopCarts] ([UserID], [GoodID], [Price], [Amount], [Total]) VALUES (6, 86, 79.0000, 1, 79.0000)
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (1, 6, N'梨花小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (2, 1, N'圭一小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (3, 2, N'礼奈小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (4, 3, N'魅音小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (5, 4, N'诗音小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (6, 5, N'沙都子小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (7, 7, N'入江小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (8, 8, N'富竹小店')
INSERT [dbo].[Shops] ([ShopID], [UserID], [ShopName]) VALUES (9, 9, N'三四小店')
SET IDENTITY_INSERT [dbo].[Shops] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (1, N'圭一', N'15219466201', N'15219466201@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (2, N'礼奈', N'15036222256', N'15036222256@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (3, N'魅音', N'18438888133', N'18438888133@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (4, N'诗音', N'18876941131', N'18876941131@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (5, N'沙都子', N'18876622089', N'18876622089@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (6, N'梨花', N'18889262767', N'18889262767@mail.com', N'123456', N'/Content/img/avatar/lifa.jpg')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (7, N'入江', N'13715150077', N'13715150077@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (8, N'富竹', N'13717033838', N'13717033838@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (9, N'三四', N'18351078990', N'18351078990@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (10, N'李一', N'18351071234', N'18351071234@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
INSERT [dbo].[Users] ([UserID], [UserName], [Tel], [Email], [Password], [Avatar]) VALUES (12, N'一心', N'12414141', N'1241412442@mail.com', N'123456', N'/Content/img/avatar/default_avatar.png')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[AdressInfo]  WITH CHECK ADD  CONSTRAINT [FK_AdressInfo_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdressInfo] CHECK CONSTRAINT [FK_AdressInfo_Users]
GO
ALTER TABLE [dbo].[GoodComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodComment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodComment] CHECK CONSTRAINT [FK_GoodComment_Users]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Users]
GO
ALTER TABLE [dbo].[ShopCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShopCarts_Users1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShopCarts] CHECK CONSTRAINT [FK_ShopCarts_Users1]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Users]
GO
USE [master]
GO
ALTER DATABASE [PurchaSaler] SET  READ_WRITE 
GO
