USE [master]
GO
/****** Object:  Database [deep_up]    Script Date: 3/16/2022 10:01:09 AM ******/
CREATE DATABASE [deep_up]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'deep_up', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\deep_up.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'deep_up_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\deep_up_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [deep_up] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [deep_up].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [deep_up] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [deep_up] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [deep_up] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [deep_up] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [deep_up] SET ARITHABORT OFF 
GO
ALTER DATABASE [deep_up] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [deep_up] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [deep_up] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [deep_up] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [deep_up] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [deep_up] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [deep_up] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [deep_up] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [deep_up] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [deep_up] SET  ENABLE_BROKER 
GO
ALTER DATABASE [deep_up] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [deep_up] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [deep_up] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [deep_up] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [deep_up] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [deep_up] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [deep_up] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [deep_up] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [deep_up] SET  MULTI_USER 
GO
ALTER DATABASE [deep_up] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [deep_up] SET DB_CHAINING OFF 
GO
ALTER DATABASE [deep_up] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [deep_up] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [deep_up] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [deep_up] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [deep_up] SET QUERY_STORE = OFF
GO
USE [deep_up]
GO
/****** Object:  Table [dbo].[tbl_comment]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_comment](
	[comment_id] [int] IDENTITY(0,1) NOT NULL,
	[comment_content] [nvarchar](max) NOT NULL,
	[comment_creation_date] [datetime] NOT NULL,
	[comment_username] [varchar](100) NOT NULL,
	[comment_parent_id] [int] NULL,
	[comment_post_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_post]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_post](
	[post_id] [int] IDENTITY(0,1) NOT NULL,
	[post_title] [nvarchar](100) NOT NULL,
	[post_subtitle] [nvarchar](500) NOT NULL,
	[post_content] [ntext] NOT NULL,
	[post_image] [nvarchar](50) NOT NULL,
	[post_views] [int] NOT NULL,
	[post_topic_id] [int] NOT NULL,
	[post_username] [varchar](100) NOT NULL,
	[post_creation_date] [datetime] NOT NULL,
	[post_edit_date] [datetime] NULL,
	[post_hidden] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_role]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_topic]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_topic](
	[topic_id] [int] NOT NULL,
	[topic_name] [nvarchar](50) NOT NULL,
	[topic_image] [nvarchar](50) NOT NULL,
	[topic_quote] [nvarchar](50) NOT NULL,
	[topic_url] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[user_username] [varchar](100) NOT NULL,
	[user_hash_password] [varchar](max) NOT NULL,
	[user_account_type] [varchar](15) NOT NULL,
	[user_full_name] [nvarchar](50) NOT NULL,
	[user_email] [varchar](50) NULL,
	[user_avatar] [varchar](100) NULL,
	[user_role_id] [int] NOT NULL,
	[user_nick] [varchar](16) NULL,
	[user_wallpaper] [varchar](100) NULL,
	[user_facebook] [varchar](500) NULL,
	[user_github] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_comment_vote]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_comment_vote](
	[username] [varchar](100) NOT NULL,
	[comment_id] [int] NOT NULL,
	[is_upvote] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_follow]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_follow](
	[follower_username] [varchar](100) NOT NULL,
	[followed_username] [varchar](100) NOT NULL,
	[follow_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[follower_username] ASC,
	[followed_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_post_mark]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_post_mark](
	[username] [varchar](100) NOT NULL,
	[post_id] [int] NOT NULL,
	[mark_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_vote]    Script Date: 3/16/2022 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_vote](
	[username] [varchar](100) NOT NULL,
	[post_id] [int] NOT NULL,
	[is_upvote] [bit] NOT NULL,
 CONSTRAINT [PK_pk] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_post] ADD  DEFAULT ((0)) FOR [post_views]
GO
ALTER TABLE [dbo].[tbl_post] ADD  DEFAULT ('FALSE') FOR [post_hidden]
GO
ALTER TABLE [dbo].[tbl_user_follow] ADD  DEFAULT (getdate()) FOR [follow_date]
GO
ALTER TABLE [dbo].[tbl_user_post_mark] ADD  DEFAULT (getdate()) FOR [mark_date]
GO
USE [master]
GO
ALTER DATABASE [deep_up] SET  READ_WRITE 
GO
