USE [master]
GO
/****** Object:  Database [SocialNetwork]    Script Date: 10/7/2018 3:22:14 PM ******/
CREATE DATABASE [SocialNetwork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetworks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\SocialNetworks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialNetworks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\SocialNetworks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SocialNetwork] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetwork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetwork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialNetwork] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialNetwork', N'ON'
GO
ALTER DATABASE [SocialNetwork] SET QUERY_STORE = OFF
GO
USE [SocialNetwork]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SocialNetwork]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/7/2018 3:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersFriends]    Script Date: 10/7/2018 3:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersFriends](
	[UserID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
 CONSTRAINT [PK_UsersFriends] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (1, N'Paul', N'Crowe', 28, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (2, N'Rob', N'Fitz', 23, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (3, N'Ben', N'O''Carolan', NULL, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (4, N'Victor', N'', 28, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (5, N'Peter', N'Mac', 29, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (6, N'John', N'Barry', 18, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (7, N'Sarah', N'Lane', 30, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (8, N'Susan', N'Downe', 28, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (9, N'Jack', N'Stam', 28, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (10, N'Amy', N'Lane', 24, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (11, N'Sandra', N'Phelan', 28, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (12, N'Laura', N'Murphy', 33, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (13, N'Lisa', N'Daly', 28, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (14, N'Mark', N'Johnson', 28, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (15, N'Seamus', N'Crowe', 24, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (16, N'Daren', N'Slater', 28, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (17, N'Dara', N'Zoltan', 48, N'male')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (18, N'Marie', N'D', 28, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (19, N'Catriona', N'Long', 28, N'female')
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Age], [Gender]) VALUES (20, N'Katy', N'Couch', 28, N'female')
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (1, 2)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (2, 1)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (2, 3)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (3, 2)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (3, 4)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (3, 5)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (3, 7)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (4, 3)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (5, 3)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (5, 6)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (5, 7)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (5, 10)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (5, 11)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (6, 5)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (7, 3)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (7, 5)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (7, 8)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (7, 12)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (7, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (8, 7)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (9, 12)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (10, 5)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (10, 11)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (11, 5)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (11, 10)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (11, 19)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (11, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (12, 7)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (12, 9)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (12, 13)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (12, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (13, 12)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (13, 14)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (13, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (14, 13)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (14, 15)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (15, 14)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (16, 18)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (16, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (17, 18)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (17, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (18, 17)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (19, 11)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (19, 20)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 7)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 11)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 12)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 13)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 16)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 17)
INSERT [dbo].[UsersFriends] ([UserID], [FriendID]) VALUES (20, 19)
ALTER TABLE [dbo].[UsersFriends]  WITH CHECK ADD  CONSTRAINT [FK_UsersFriends_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UsersFriends] CHECK CONSTRAINT [FK_UsersFriends_Users]
GO
ALTER TABLE [dbo].[UsersFriends]  WITH CHECK ADD  CONSTRAINT [FK_UsersFriends_Users1] FOREIGN KEY([FriendID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UsersFriends] CHECK CONSTRAINT [FK_UsersFriends_Users1]
GO
/****** Object:  StoredProcedure [dbo].[uspGetDirectFriends]    Script Date: 10/7/2018 3:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspGetDirectFriends]
(
	@UserId int
)

as
begin
	set nocount on;
	
	select u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.UsersFriends uf
		inner join dbo.Users u on uf.[FriendID] = u.[UserID]
	where uf.[UserID] = @UserId;
end

GO
/****** Object:  StoredProcedure [dbo].[uspGetFriendsOfFriends]    Script Date: 10/7/2018 3:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspGetFriendsOfFriends]
(
	@UserId int
)

as
begin
	set nocount on;

	select  u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.UsersFriends uf1
		inner join dbo.UsersFriends uf2 on uf1.[FriendID] = uf2.[UserID]
		inner join dbo.Users u on u.[UserID] = uf2.[FriendID] and u.UserID != @UserId
	where uf1.[UserID] = @UserId
	order by uf1.[FriendID];
end

GO
/****** Object:  StoredProcedure [dbo].[uspGetSuggestedFriends]    Script Date: 10/7/2018 3:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspGetSuggestedFriends]
(
	@UserId int
)

as
begin
	set nocount on;

	select u.[UserID], u.[FirstName], u.[LastName], u.[Age], u.[Gender]
	from dbo.Users u
	inner join
	(
		select uf2.[FriendID]
		from dbo.UsersFriends uf1
			inner join dbo.UsersFriends uf2 on uf1.[FriendID] = uf2.[UserID]
		where uf1.[UserID] = @UserId
		group by uf2.[FriendID]
		having count(*) > 1
	) uf2 on uf2.[FriendID] = u.[UserID] and u.[UserID] != @UserId;
end
GO
USE [master]
GO
ALTER DATABASE [SocialNetwork] SET  READ_WRITE 
GO
