USE [master]
GO
/****** Object:  Database [wind]    Script Date: 2021/1/17 15:33:54 ******/
CREATE DATABASE [wind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wind', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\wind.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'wind_log', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\wind_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wind] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wind] SET ARITHABORT OFF 
GO
ALTER DATABASE [wind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wind] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [wind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wind] SET RECOVERY FULL 
GO
ALTER DATABASE [wind] SET  MULTI_USER 
GO
ALTER DATABASE [wind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wind] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'wind', N'ON'
GO
USE [wind]
GO
/****** Object:  Table [dbo].[biz_client]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[biz_client](
	[id] [varchar](64) NOT NULL,
	[create_by] [varchar](64) NULL,
	[create_date] [datetime] NULL,
	[update_by] [varchar](64) NULL,
	[update_date] [datetime] NULL,
	[del_flag] [char](1) NULL,
	[remarks] [text] NULL,
	[tenant_id] [varchar](11) NULL,
	[name] [varchar](64) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[age] [int] NULL,
	[sex] [int] NOT NULL,
	[address] [text] NULL,
	[location] [text] NULL,
	[avatar] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[email_send_log]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_send_log](
	[id] [nvarchar](32) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[subject] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[send_data] [nvarchar](255) NULL,
	[send_code] [nvarchar](255) NOT NULL,
	[response_date] [datetime2](0) NULL,
	[try_num] [int] NULL,
	[msg] [nvarchar](250) NULL,
	[status] [nvarchar](4) NULL,
	[del_flag] [nvarchar](1) NOT NULL,
	[remarks] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[email_template]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_template](
	[id] [nvarchar](32) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[template_subject] [nvarchar](20) NOT NULL,
	[template_content] [nvarchar](max) NOT NULL,
	[remarks] [nvarchar](255) NULL,
	[update_by] [nvarchar](32) NULL,
	[create_date] [nvarchar](19) NULL,
	[del_flag] [nvarchar](1) NOT NULL,
	[create_by] [nvarchar](32) NULL,
	[update_date] [nvarchar](19) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oa_notification]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_notification](
	[id] [nvarchar](32) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [nvarchar](4) NOT NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nvarchar](1) NOT NULL,
	[remarks] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oss_attachment]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oss_attachment](
	[id] [nvarchar](32) NOT NULL,
	[file_name] [nvarchar](50) NOT NULL,
	[user_id] [nvarchar](32) NULL,
	[upload_time] [datetime2](0) NOT NULL,
	[upload_ip] [nvarchar](30) NOT NULL,
	[file_extension] [nvarchar](10) NOT NULL,
	[file_path] [nvarchar](200) NOT NULL,
	[file_size] [int] NOT NULL,
	[content_type] [nvarchar](100) NULL,
	[status] [nvarchar](1) NOT NULL,
	[base_path] [nvarchar](250) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sms_send_log]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sms_send_log](
	[id] [nvarchar](32) NOT NULL,
	[phone] [nvarchar](max) NOT NULL,
	[template_name] [nvarchar](50) NULL,
	[send_data] [nvarchar](255) NULL,
	[send_code] [nvarchar](20) NULL,
	[try_num] [int] NULL,
	[status] [nvarchar](4) NOT NULL,
	[smsid] [nvarchar](50) NULL,
	[code] [nvarchar](40) NULL,
	[msg] [nvarchar](600) NULL,
	[del_flag] [nvarchar](1) NOT NULL,
	[response_date] [datetime2](0) NULL,
	[tenant_id] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sms_template]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sms_template](
	[id] [nvarchar](32) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[business_type] [nvarchar](4) NOT NULL,
	[template_content] [nvarchar](255) NOT NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nvarchar](1) NOT NULL,
	[remarks] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_config]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_config](
	[id] [nvarchar](64) NOT NULL,
	[create_by] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[name] [nvarchar](64) NOT NULL,
	[code] [nvarchar](64) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[del_flag] [int] NOT NULL,
	[is_sys] [tinyint] NOT NULL,
	[tenant_id] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_data_rule]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_data_rule](
	[id] [nvarchar](64) NULL,
	[menu_id] [nvarchar](64) NULL,
	[resource_code] [nvarchar](255) NOT NULL,
	[scope_name] [nvarchar](255) NOT NULL,
	[scope_field] [nvarchar](255) NOT NULL,
	[scope_class] [nvarchar](500) NOT NULL,
	[scope_column] [nvarchar](255) NOT NULL,
	[scope_type] [int] NOT NULL,
	[scope_value] [nvarchar](2000) NULL,
	[remarks] [nvarchar](255) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_dept] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_date] [datetime2](0) NULL,
	[status] [int] NULL,
	[del_flag] [int] NULL,
	[table_name] [nvarchar](64) NULL,
	[user_column] [nvarchar](64) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
	[user_entity_field] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_data_source]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_data_source](
	[id] [nvarchar](36) NOT NULL,
	[db_key] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[driver_class] [nvarchar](50) NOT NULL,
	[url] [nvarchar](200) NOT NULL,
	[db_user] [nvarchar](50) NOT NULL,
	[db_password] [nvarchar](50) NULL,
	[db_type] [nvarchar](50) NULL,
	[db_name] [nvarchar](50) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_dict]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dict](
	[id] [nvarchar](32) NOT NULL,
	[gid] [nvarchar](32) NULL,
	[label] [nvarchar](100) NULL,
	[value] [nvarchar](100) NULL,
	[sort] [int] NULL,
	[remarks] [nvarchar](100) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_dict_group]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dict_group](
	[id] [nvarchar](32) NOT NULL,
	[name] [nvarchar](100) NULL,
	[code] [nvarchar](100) NULL,
	[remarks] [nvarchar](100) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_login_log]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_login_log](
	[id] [nvarchar](32) NOT NULL,
	[login_name] [nvarchar](50) NULL,
	[login_ip] [nvarchar](50) NULL,
	[login_location] [nvarchar](255) NULL,
	[browser] [nvarchar](50) NULL,
	[os] [nvarchar](50) NULL,
	[status] [nchar](2) NULL,
	[msg] [nvarchar](255) NULL,
	[login_time] [datetime2](0) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_menu]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_menu](
	[id] [nvarchar](32) NOT NULL,
	[permission] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[type] [nvarchar](50) NULL,
	[path] [nvarchar](200) NULL,
	[url] [nvarchar](200) NULL,
	[parent_id] [nvarchar](32) NULL,
	[parent_ids] [nvarchar](1000) NULL,
	[enabled] [tinyint] NULL,
	[sort] [int] NULL,
	[icon] [nvarchar](255) NULL,
	[redirect] [nvarchar](255) NULL,
	[cacheable] [tinyint] NULL,
	[require_auth] [tinyint] NULL,
	[component] [nvarchar](255) NULL,
	[remarks] [nvarchar](255) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_message]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_message](
	[id] [nvarchar](32) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[is_read] [tinyint] NULL,
	[read_uid] [nvarchar](64) NULL,
	[read_uname] [nvarchar](250) NULL,
	[read_date] [datetime2](0) NULL,
	[send_date] [datetime2](0) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_message_template]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_message_template](
	[id] [nvarchar](32) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[template_title] [nvarchar](255) NOT NULL,
	[template_content] [nvarchar](max) NOT NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_operation_log]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_operation_log](
	[id] [nvarchar](64) NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](1000) NULL,
	[log_type] [nvarchar](10) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[request_uri] [nvarchar](255) NULL,
	[browser] [nvarchar](255) NULL,
	[os] [nvarchar](100) NULL,
	[operation_ip] [nvarchar](255) NULL,
	[operation_name] [nvarchar](255) NULL,
	[method] [nvarchar](255) NULL,
	[params] [nvarchar](max) NULL,
	[msg] [nvarchar](max) NULL,
	[status] [nvarchar](1) NULL,
	[tenant_id] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_organization]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_organization](
	[id] [nvarchar](64) NOT NULL,
	[name] [nvarchar](100) NULL,
	[parent_id] [nvarchar](32) NULL,
	[parent_ids] [nvarchar](1000) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
	[remarks] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[id] [nvarchar](64) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[code] [nvarchar](255) NULL,
	[is_sys] [nvarchar](64) NULL,
	[usable] [nvarchar](64) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NOT NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_role_data_rule]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_data_rule](
	[id] [nvarchar](64) NULL,
	[data_rule_category] [int] NULL,
	[data_rule_id] [nvarchar](64) NULL,
	[role_id] [nvarchar](64) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_role_menu]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_menu](
	[id] [nvarchar](32) NOT NULL,
	[menu_id] [nvarchar](32) NOT NULL,
	[role_id] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_sessions]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_sessions](
	[id] [nvarchar](200) NOT NULL,
	[session] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_tenant]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_tenant](
	[id] [nvarchar](64) NULL,
	[create_by] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](64) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
	[remarks] [nvarchar](max) NULL,
	[tenant_id] [nvarchar](64) NULL,
	[contact] [nvarchar](64) NOT NULL,
	[phone] [nvarchar](64) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[user_id] [nvarchar](64) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user](
	[id] [nvarchar](64) NOT NULL,
	[realname] [nvarchar](255) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[portrait] [nvarchar](250) NULL,
	[password] [nvarchar](100) NULL,
	[salt] [nvarchar](100) NULL,
	[email] [nvarchar](64) NULL,
	[phone] [nvarchar](20) NULL,
	[status] [tinyint] NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](32) NULL,
	[organization_id] [nvarchar](64) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_user_role]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_role](
	[id] [nvarchar](32) NOT NULL,
	[user_id] [nvarchar](32) NOT NULL,
	[role_id] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[task_schedule_job]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_schedule_job](
	[id] [nvarchar](32) NOT NULL,
	[cron_expression] [nvarchar](255) NOT NULL,
	[method_name] [nvarchar](255) NOT NULL,
	[method_params] [nvarchar](255) NULL,
	[misfire_policy] [nvarchar](4) NULL,
	[is_concurrent] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[update_by] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[job_status] [nvarchar](255) NULL,
	[job_group] [nvarchar](255) NULL,
	[update_date] [datetime2](0) NULL,
	[create_by] [nvarchar](64) NULL,
	[execute_class] [nvarchar](255) NULL,
	[job_name] [nvarchar](255) NULL,
	[load_way] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[task_schedule_job_log]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_schedule_job_log](
	[id] [nvarchar](32) NOT NULL,
	[job_name] [nvarchar](64) NOT NULL,
	[job_group] [nvarchar](64) NOT NULL,
	[execute_class] [nvarchar](500) NULL,
	[method_name] [nvarchar](500) NULL,
	[method_params] [nvarchar](200) NULL,
	[job_message] [nvarchar](500) NULL,
	[status] [nchar](2) NULL,
	[exception_info] [nvarchar](max) NULL,
	[create_time] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_car]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_car](
	[id] [nvarchar](32) NOT NULL,
	[name] [nvarchar](100) NULL,
	[code] [nvarchar](100) NULL,
	[remarks] [nvarchar](100) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_car_model]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_car_model](
	[id] [nvarchar](32) NOT NULL,
	[car_id] [nvarchar](32) NULL,
	[name] [nvarchar](100) NULL,
	[value] [nvarchar](100) NULL,
	[sort] [int] NULL,
	[remarks] [nvarchar](100) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_expand_table]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_expand_table](
	[id] [nvarchar](64) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[shop] [nvarchar](100) NOT NULL,
	[category] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[tag] [nvarchar](200) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](32) NULL,
	[organization_id] [nvarchar](64) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_table]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_table](
	[id] [nvarchar](64) NOT NULL,
	[title] [nvarchar](255) NULL,
	[author] [nvarchar](100) NOT NULL,
	[type] [nvarchar](250) NULL,
	[level] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[status] [nvarchar](32) NULL,
	[tag] [nvarchar](200) NULL,
	[readings] [int] NULL,
	[publish_date] [datetime2](0) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](32) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_tree_and_table]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_tree_and_table](
	[id] [nvarchar](64) NOT NULL,
	[name] [nvarchar](255) NULL,
	[type] [nvarchar](250) NULL,
	[tag] [nvarchar](200) NULL,
	[area_id] [nvarchar](64) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[remarks] [nvarchar](255) NULL,
	[del_flag] [nchar](1) NULL,
	[create_by] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test_tree_table]    Script Date: 2021/1/17 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_tree_table](
	[id] [nvarchar](64) NOT NULL,
	[name] [nvarchar](100) NULL,
	[geocoding] [nvarchar](32) NULL,
	[postal_code] [nvarchar](32) NULL,
	[parent_id] [nvarchar](32) NULL,
	[parent_ids] [nvarchar](1000) NULL,
	[create_by] [nvarchar](32) NULL,
	[create_date] [datetime2](0) NULL,
	[update_by] [nvarchar](32) NULL,
	[update_date] [datetime2](0) NULL,
	[del_flag] [nchar](1) NULL,
	[remarks] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_dict_groupid_key]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_dict_groupid_key] ON [dbo].[sys_dict]
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_sys_resource_parent_id]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [idx_sys_resource_parent_id] ON [dbo].[sys_menu]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_sys_resource_parent_ids]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [idx_sys_resource_parent_ids] ON [dbo].[sys_menu]
(
	[parent_ids] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_message_read_uid]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_message_read_uid] ON [dbo].[sys_message]
(
	[read_uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_log_create_by]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_log_create_by] ON [dbo].[sys_operation_log]
(
	[create_by] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [sys_log_create_date]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_log_create_date] ON [dbo].[sys_operation_log]
(
	[create_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_log_request_uri]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_log_request_uri] ON [dbo].[sys_operation_log]
(
	[operation_ip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_sys_organization_parent_id]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [idx_sys_organization_parent_id] ON [dbo].[sys_organization]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_sys_organization_parent_ids]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [idx_sys_organization_parent_ids] ON [dbo].[sys_organization]
(
	[parent_ids] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_role_del_flag]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_role_del_flag] ON [dbo].[sys_role]
(
	[del_flag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_role_enname]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_role_enname] ON [dbo].[sys_role]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_role_menu_menuid]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_role_menu_menuid] ON [dbo].[sys_role_menu]
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_role_menu_roleid]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_role_menu_roleid] ON [dbo].[sys_role_menu]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_user_role_roleid]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_user_role_roleid] ON [dbo].[sys_user_role]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [sys_user_role_userid]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [sys_user_role_userid] ON [dbo].[sys_user_role]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [test_car_model_car_id]    Script Date: 2021/1/17 15:33:54 ******/
CREATE NONCLUSTERED INDEX [test_car_model_car_id] ON [dbo].[test_car_model]
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_test_table_title]    Script Date: 2021/1/17 15:33:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_test_table_title] ON [dbo].[test_table]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[biz_client] ADD  DEFAULT ('00000000') FOR [tenant_id]
GO
ALTER TABLE [dbo].[sys_login_log] ADD  DEFAULT ('00000000') FOR [tenant_id]
GO
ALTER TABLE [dbo].[sys_dict]  WITH CHECK ADD  CONSTRAINT [sys_dict_groupid_key] FOREIGN KEY([gid])
REFERENCES [dbo].[sys_dict_group] ([id])
GO
ALTER TABLE [dbo].[sys_dict] CHECK CONSTRAINT [sys_dict_groupid_key]
GO
ALTER TABLE [dbo].[test_car_model]  WITH CHECK ADD  CONSTRAINT [test_car_model_car_id] FOREIGN KEY([car_id])
REFERENCES [dbo].[test_car] ([id])
GO
ALTER TABLE [dbo].[test_car_model] CHECK CONSTRAINT [test_car_model_car_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'send_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'response_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重发次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'try_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记（0：正常；1：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_send_log', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'template_subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'template_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记（0：正常；1：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件发送模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'email_template'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记（0：正常；1：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_notification', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'upload_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传的ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'upload_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件扩展名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'file_extension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'file_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'file_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'oss的根路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'base_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oss_attachment', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'template_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'send_data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送响应消息ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'smsid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记（0：正常；1：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'response_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_send_log', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'business_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'template_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记（0：正常；1：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sms_template', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是系统配置，如果是，该配置不可以删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'menu_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'resource_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限类名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_column'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限值域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'scope_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建部门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'create_dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'table_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表对应字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'user_column'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'user实体类对应字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule', @level2type=N'COLUMN',@level2name=N'user_entity_field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_rule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'索引关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'db_key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驱动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'driver_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'db_user'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'db_password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'db_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'db_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_data_source', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'gid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'键值键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_group', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_group', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_group', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_group', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dict_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'login_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'login_location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'browser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'os'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录状态（0成功 1失败）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提示消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'login_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统访问记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_login_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'路径编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'访问路由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父编号列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'parent_ids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'enabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'redirect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否缓存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'cacheable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前端资源路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'component'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否阅读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'is_read'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读的用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'read_uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读的人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'read_uname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'read_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送消息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'template_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模版内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'template_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送消息模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_message_template'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'log_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'request_uri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'browser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'os'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'operation_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'operation_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'params'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_operation_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机构名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_organization', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_organization', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_organization', @level2type=N'COLUMN',@level2name=N'parent_ids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_organization', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_organization', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'usable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_data_rule', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限类型(1:数据权限、2:接口权限)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_data_rule', @level2type=N'COLUMN',@level2name=N'data_rule_category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_data_rule', @level2type=N'COLUMN',@level2name=N'data_rule_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_data_rule', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色数据权限关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_data_rule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu', @level2type=N'COLUMN',@level2name=N'menu_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色-菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'contact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'realname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'portrait'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统用户的状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'organization_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户-角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_user_role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cron表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'cron_expression'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务调用的方法名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'method_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'method_params'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行策略' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'misfire_policy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务是否有状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'is_concurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'update_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'create_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'job_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'update_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'create_by'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Spring bean' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'execute_class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加载任务方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job', @level2type=N'COLUMN',@level2name=N'load_way'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务日志ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'job_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务组名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'job_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'method_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'method_params'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'job_message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行状态（0正常 1失败）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'异常信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'exception_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log', @level2type=N'COLUMN',@level2name=N'create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时任务调度日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'task_schedule_job_log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'car_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model', @level2type=N'COLUMN',@level2name=N'remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_car_model'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属店铺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'shop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'店铺地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'organization_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_expand_table', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'readings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'publish_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_table', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_and_table', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_and_table', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_and_table', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_and_table', @level2type=N'COLUMN',@level2name=N'tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机构名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'geocoding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'parent_ids'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'del_flag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'test_tree_table', @level2type=N'COLUMN',@level2name=N'tenant_id'
GO
USE [master]
GO
ALTER DATABASE [wind] SET  READ_WRITE 
GO
