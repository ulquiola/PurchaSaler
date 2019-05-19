USE [master]
GO
/****** Object:  Database [PurchaSaler]    Script Date: 2019/5/19 20:11:34 ******/
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
/****** Object:  Table [dbo].[AdressInfo]    Script Date: 2019/5/19 20:11:35 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2019/5/19 20:11:36 ******/
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
/****** Object:  Table [dbo].[GoodComment]    Script Date: 2019/5/19 20:11:36 ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 2019/5/19 20:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodID] [int] NOT NULL,
	[ShopID] [int] NULL,
	[CategoryID] [int] NULL,
	[GoodTitle] [varchar](50) NULL,
	[GoodPhoto] [varchar](50) NULL,
	[GoodDescribe] [varchar](50) NULL,
	[Amount] [int] NULL,
	[Quality] [varchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[GoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2019/5/19 20:11:37 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2019/5/19 20:11:37 ******/
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
/****** Object:  Table [dbo].[ReplyComment]    Script Date: 2019/5/19 20:11:37 ******/
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
/****** Object:  Table [dbo].[ShopCarts]    Script Date: 2019/5/19 20:11:37 ******/
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
/****** Object:  Table [dbo].[Shops]    Script Date: 2019/5/19 20:11:37 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2019/5/19 20:11:37 ******/
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
ALTER TABLE [dbo].[GoodComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodComment_Goods] FOREIGN KEY([GoodID])
REFERENCES [dbo].[Goods] ([GoodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodComment] CHECK CONSTRAINT [FK_GoodComment_Goods]
GO
ALTER TABLE [dbo].[GoodComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodComment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodComment] CHECK CONSTRAINT [FK_GoodComment_Users]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Category]
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
ALTER TABLE [dbo].[ShopCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShopCarts_Goods] FOREIGN KEY([GoodID])
REFERENCES [dbo].[Goods] ([GoodID])
GO
ALTER TABLE [dbo].[ShopCarts] CHECK CONSTRAINT [FK_ShopCarts_Goods]
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
