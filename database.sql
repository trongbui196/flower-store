USE [master]
GO
/****** Object:  Database [qltiemhoa]    Script Date: 1/16/2024 11:44:39 PM ******/
CREATE DATABASE [qltiemhoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qltiemhoa', FILENAME = N'D:\codeing\SQLL\MSSQL16.SQLEXPRESS\MSSQL\DATA\qltiemhoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qltiemhoa_log', FILENAME = N'D:\codeing\SQLL\MSSQL16.SQLEXPRESS\MSSQL\DATA\qltiemhoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [qltiemhoa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qltiemhoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qltiemhoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qltiemhoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qltiemhoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qltiemhoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qltiemhoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [qltiemhoa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [qltiemhoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qltiemhoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qltiemhoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qltiemhoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qltiemhoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qltiemhoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qltiemhoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qltiemhoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qltiemhoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qltiemhoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qltiemhoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qltiemhoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qltiemhoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qltiemhoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qltiemhoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qltiemhoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qltiemhoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [qltiemhoa] SET  MULTI_USER 
GO
ALTER DATABASE [qltiemhoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qltiemhoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qltiemhoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qltiemhoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qltiemhoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [qltiemhoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [qltiemhoa] SET QUERY_STORE = ON
GO
ALTER DATABASE [qltiemhoa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [qltiemhoa]
GO
/****** Object:  Schema [test]    Script Date: 1/16/2024 11:44:39 PM ******/
CREATE SCHEMA [test]
GO
/****** Object:  Table [dbo].[adminn]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminn](
	[admin_id] [int] NOT NULL,
	[admin_username] [nvarchar](100) NULL,
	[admin_password] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[customer_username] [nvarchar](100) NULL,
	[customer_password] [nvarchar](100) NULL,
	[customer_surname] [nvarchar](100) NULL,
	[customer_lastname] [nvarchar](100) NULL,
	[customer_address] [nvarchar](100) NULL,
	[customer_phone] [nvarchar](10) NULL,
	[custome_bday] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flower]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flower](
	[flower_id] [int] IDENTITY(1,1) NOT NULL,
	[kind_id] [int] NULL,
	[fname] [nvarchar](100) NULL,
	[fprice] [int] NULL,
	[fdescribe] [nvarchar](200) NULL,
	[fimg] [nvarchar](100) NULL,
	[fstock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[flower_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kind_flower]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kind_flower](
	[kind_id] [int] NOT NULL,
	[kind_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[kind_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[order_name] [nvarchar](100) NOT NULL,
	[order_id] [int] NULL,
	[order_status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderr]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderr](
	[order_id] [int] NOT NULL,
	[order_date] [date] NULL,
	[deli_address] [nvarchar](100) NULL,
	[customer_id] [int] NULL,
	[receiver_name] [nvarchar](100) NULL,
	[receiver_phone] [nvarchar](100) NULL,
	[totalbill] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 1/16/2024 11:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[idtest] [int] NULL,
	[nametest] [nvarchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[adminn] ([admin_id], [admin_username], [admin_password]) VALUES (1, N'trongbui196', N'12345')
GO
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (1, N'trongbui123', N'123456', N'trong', N'bui', N'123 duong abcd', N'012345565', 2001)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (2, N'Sappheire322', N'123456pass', N'Rey', N'Roth', N'2/37 Cao Thang Street Ward 5, District 3', N'', 2000)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (3, N'arrowchan@gasss.net', N'123456pass', N'Krystal', N'Williamson', N'24 Hong Ha Street,Ward 2', N'0163260897', 1990)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (4, N'spingo@comfortstride.studio', N'123456pass', N'Jeannette', N'Fox', N'148 Ly Chinh Thang Street,Ward 7,District 3', N'0163296235', 2009)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (5, N'sergo191089@airportexpresscab.com', N'123456pass', N'Amanda', N'Fields', N'437/2 Hoang Van ThuSt.,Ward 4', N'0163960836', 2001)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (6, N'o3ik@baocuchuoi.com', N'123456pass', N'Willie', N'Cannon', N'128D Nguyen Dinh Chinh,Ward 8', N'0132960098', 2002)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (7, N'icslmailgurj87@northstardev.me', N'123456pass', N'Stacy', N'Lamb', N'40 Dinh Tien Hoang Street,Ward 1', N'0132960995', 2003)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (8, N'thomasvexille@elevecortesias.tech', N'123456pass', N'Neil', N'Schwartz', N'152 Ly Thuong Kiet,Ward 8', N'0163290450', 2001)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (9, N'lilredchrisdigtal@yazenwesam.website', N'123456pass', N'Ollie', N'Benson', N'213 Phan Van Khoe,Ward 5,Dist.6', N'0289490686', 2000)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (10, N'summerwind@bendnsend.com', N'123456pass', N'Kristopher', N'Walton', N'Highway 14,Tan Hung', N'0289460698', 1999)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (11, N'nik20001@xtensionssalon.com', N'123456pass', N'Dolores', N'Douglas', N'1/16A PHAM HUNG STREET,WARD 4,DISTRICT 8', N'0289460778', 2002)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (12, N'chipchippy@shopzcollections.com', N'123456pass', N'Ida', N'Allison', N'24/2B Str.D3,Ward 25', N'0289496867', 2001)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (13, N'fabiendurda@airportexpresscab.com', N'123456pass', N'Susie', N'Todd', N'1891 lo 768,xa Thanh Phu,Vinh Cuu', N'0289496693', 1998)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (14, N'frolovanatali@yazenwesam.website', N'123456pass', N'Rochelle', N'Turner', N'14/25 Vu Huu St.', N'0284960467', 1980)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (15, N'tazzman1@evolutionitjogja.com', N'123456pass', N'Frankie', N'Hudson', N'8 Le Truc Street', N'065535178', 2001)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (16, N'playinu@himkinet.ru', N'123456pass', N'Alberta', N'Waters', N'28/11 Luong The Vinh St.,Tan Thoi Hoa Ward', N'065453674', 2003)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (17, N'dgd48@alvinneo.com', N'123456pass', N'Gayle', N'Wright', N'30 Nguyen Chi Thanh Street', N'065549346', 2005)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (18, N'stasyasheya@bendnsend.com', N'123456pass', N'Miriam', N'Mcguire', N'20 Nguyen Luong Bang Street,Alley 64', N'0655631265', 2005)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (19, N'pondside@code-gmail.com', N'123456pass', N'Mae', N'Weaver', N'83 Trung Cong Dinh,Ward 13', N'0655284683', 1995)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (20, N'ericw76@googl.win', N'123456pass', N'Johnny', N'Fowler', N'120 Nguyen Luong Bang Street,Alley 64', N'0655389956', 1987)
INSERT [dbo].[customer] ([customer_id], [customer_username], [customer_password], [customer_surname], [customer_lastname], [customer_address], [customer_phone], [custome_bday]) VALUES (33, N'teonguyen', N'p1233455', N'teo', N'gnueyn', N'123 duogn abc', N'aa9090312', 331)
GO
SET IDENTITY_INSERT [dbo].[flower] ON 

INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (2, 1, N'Gặp gỡ', 155000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat1.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (3, 1, N'Ánh dương', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat2.jpg', 21)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (4, 1, N'Take my hand', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat3.jpg', 24)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (5, 1, N'Điều thân thương', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat4.jpg', 24)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (6, 1, N'Tình cờ', 350000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat5.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (7, 1, N'My sun', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat6.jpg', 20)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (8, 1, N'Phút giây tỏa sáng', 175000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat7.jpg', 19)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (9, 1, N'Sinh nhật vui vẻ', 300000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'sinhnhat8.jpg', 13)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (10, 2, N'Sunshine Bliss', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'Khaitruong1.jpg', 21)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (11, 2, N'Rainbow', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong2.jpg', 24)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (12, 2, N'Adore', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong3.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (13, 2, N'Ao ước', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong4.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (14, 2, N'Mãi yêu', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong5.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (15, 2, N'Lucky', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong6.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (16, 2, N'Lucky', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong7.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (17, 2, N'Lucky', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'khaitruong8.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (18, 3, N'Lucky', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon1.jpg', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (19, 3, N'Blushy JHoy', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon2.png', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (20, 3, N'Bình vàng tươi', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon3.jpg	', 22)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (21, 3, N'Vui cười', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon4.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (22, 3, N'Tỏa sáng', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon5.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (23, 3, N'Ấm áp', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon6.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (24, 3, N'Kem hoa', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon7.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (25, 3, N'Tỏa nắng', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'camon8.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (26, 4, N'Năng lượng mới', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu2.png', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (27, 4, N'Sắc cam', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu1.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (28, 4, N'Giản dị', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu3.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (29, 4, N'Yêu em', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu4.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (30, 4, N'Yêu em nhiều', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu5.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (31, 4, N'Tình đầu', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu6.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (32, 4, N'Nhớ em', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu7.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (33, 4, N'Yêu lại', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'tinhyeu8.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (34, 5, N'Thạch thảo', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe1.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (35, 5, N'Rạng rỡ', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe2.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (36, 5, N'Rustic', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe3.png', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (37, 5, N'Mây hồng', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe4.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (38, 5, N'Tana mộc mạc', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe5.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (39, 5, N'Tự do', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe6.png', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (40, 5, N'Tango', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe7.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (41, 5, N'Điệu van mùa xuân', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'suckhoe8.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (42, 6, N'Candy', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon1.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (43, 6, N'Hy vọng', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon2.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (44, 6, N'Niềm tin', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon3.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (45, 6, N'Chia buồn', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon4.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (46, 6, N'Giã biệt', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon5.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (47, 6, N'Hư không', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon6.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (48, 6, N'Lời tạm biệt', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon7.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (49, 6, N'Thành kính', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chiabuon8.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (50, 7, N'Lời tạm biệt', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung1.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (51, 7, N'Tiếc thương', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung2.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (52, 7, N'Kí ức', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung3.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (53, 7, N'Mưa chiều', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung4.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (54, 7, N'Mây gió', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung5.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (55, 7, N'Vui vẻ', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung6.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (56, 7, N'Say nắng', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung7.jpg', 23)
INSERT [dbo].[flower] ([flower_id], [kind_id], [fname], [fprice], [fdescribe], [fimg], [fstock]) VALUES (57, 7, N'Hồng nhạt', 165000, N'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm', N'chucmung8.jpg', 23)
SET IDENTITY_INSERT [dbo].[flower] OFF
GO
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (1, N'Hoa sinh nhật')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (2, N'Hoa khai trương')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (3, N'Hoa cảm ơn')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (4, N'Hoa tình yêu')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (5, N'Hoa sức khỏe')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (6, N'Hoa chia buồn')
INSERT [dbo].[kind_flower] ([kind_id], [kind_name]) VALUES (7, N'Hoa chúc mừng')
GO
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x1a', 2, N'Đang giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x2a', 1, N'Đang giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x3a', 3, N'Đang giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x4a', 4, N'Đang giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x5a', 5, N'Đã giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x6a', 6, N'Đã giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x7a', 7, N'Đã giao')
INSERT [dbo].[order_status] ([order_name], [order_id], [order_status]) VALUES (N'x8a', 8, N'Đã giao')
GO
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (1, CAST(N'2020-12-19' AS Date), N'123 duong dbs', 1, N'nga', N'123122', 2000000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (2, CAST(N'2023-12-22' AS Date), N'280 bui huu nghia', 3, N' Ross Geller', N'090909331', 350000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (3, CAST(N'2023-12-23' AS Date), N'10 Ho Van Hue', 11, N'Monica Geller', N'0123941231', 650000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (4, CAST(N'2023-12-11' AS Date), N'54 Vu Huy Tan', 6, N'Chandle Bing', N'1312333', 650000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (5, CAST(N'2023-10-12' AS Date), N'10 Vo Duy Ninh', 4, N'Rachel Green', N'8888811', 450000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (6, CAST(N'2024-01-01' AS Date), N'100 Dinh Tien Hoang', 2, N'Joey Tribiani', N'1238851', 350000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (7, CAST(N'2023-10-11' AS Date), N'22 Phan Dang Luu', 19, N'Gunther Central Perk', N'99133331', 1200000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (8, CAST(N'2023-10-02' AS Date), N'88 Le Quang Dinh', 15, N'Janice HhaHhah', N'35512311', 750000)
INSERT [dbo].[orderr] ([order_id], [order_date], [deli_address], [customer_id], [receiver_name], [receiver_phone], [totalbill]) VALUES (10, NULL, N'123 duogn abc', NULL, N'333123', N'9090312', 123123123)
GO
ALTER TABLE [dbo].[flower]  WITH CHECK ADD FOREIGN KEY([kind_id])
REFERENCES [dbo].[kind_flower] ([kind_id])
GO
ALTER TABLE [dbo].[order_status]  WITH CHECK ADD  CONSTRAINT [fk_ordersta_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orderr] ([order_id])
GO
ALTER TABLE [dbo].[order_status] CHECK CONSTRAINT [fk_ordersta_order]
GO
ALTER TABLE [dbo].[orderr]  WITH CHECK ADD  CONSTRAINT [fk_order_ordsta] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[orderr] CHECK CONSTRAINT [fk_order_ordsta]
GO
USE [master]
GO
ALTER DATABASE [qltiemhoa] SET  READ_WRITE 
GO
