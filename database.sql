USE [master]
GO
/****** Object:  Database [RequestDB]    Script Date: 7/15/2021 10:27:38 AM ******/
CREATE DATABASE [RequestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RequestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RequestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RequestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RequestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RequestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RequestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RequestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RequestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RequestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RequestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RequestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RequestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RequestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RequestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RequestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RequestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RequestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RequestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RequestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RequestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RequestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RequestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RequestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RequestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RequestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RequestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RequestDB] SET  MULTI_USER 
GO
ALTER DATABASE [RequestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RequestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RequestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RequestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RequestDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RequestDB', N'ON'
GO
ALTER DATABASE [RequestDB] SET QUERY_STORE = OFF
GO
USE [RequestDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/15/2021 10:27:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 7/15/2021 10:27:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentID] [int] NOT NULL,
	[studentName] [nvarchar](255) NOT NULL,
	[createdDate] [date] NOT NULL,
	[closeDate] [date] NULL,
	[title] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[attach] [nvarchar](max) NULL,
	[solution] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[solvedBy] [nvarchar](255) NULL,
	[department] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/15/2021 10:27:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'Academic Department')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'Dormitory Department')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (1, 1, N'Trần Văn Khôi', CAST(N'2021-07-15' AS Date), CAST(N'2021-07-20' AS Date), N'Đơn xin điểm danh lại', N'Do em vào muộn nên em bị absent slot 1 môn LAB321 . Em mong có thể được điểm danh lại', N'1.docx', N'Đã giải quyết', N'approved', N'khoitv', N'Academic Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (2, 1, N'Trần Văn Khôi', CAST(N'2021-07-15' AS Date), CAST(N'2021-07-20' AS Date), N'Đơn xin phúc khảo bài thi', N'Em mong muốn được phúc khảo bài thi môn PRJ321 do em tự nhận thấy rằng điểm này không đúng với những gì em đạt được trong bài thi', N'2.docx', N'', N'approved', N'khoitv', N'Academic Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (3, 2, N'Trần Văn A', CAST(N'2021-07-13' AS Date), CAST(N'2021-07-14' AS Date), N'Đơn xin hoãn kỳ học', N'Em chào phòng quản lý đào tạo
em làm đơn này để xin phép phòng đào tạo cho em hoãn 1 kỳ do em có công việc riêng . Em cảm ơn', N'3.docx', N'request này đã đươc khôi trần phê duyệt', N'approved', N'khoitv', N'Academic Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (4, 2, N'Trần Văn A', CAST(N'2021-07-15' AS Date), NULL, N'Đơn xin đổi phòng ký túc xá', N'Em chào phòng quản lý ký túc xá
em làm đơn này để xin phép đổi phòng ký túc xá hiện tại do em không hợp ở với phòng . Em cảm ơn', N'4.docx', N'request với ID là 4 đã được chấp thuận', N'approved', N'khoitv', N'Dormitory Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (5, 3, N'Trần Văn B', CAST(N'2021-07-15' AS Date), NULL, N'Đơn xin đăng ký phòng mới', N'Em chào phòng quản lý ký túc xá
em làm đơn này để xin phép được đăng ký phòng mới ở ktx , cụ thể là phòng F306L . Em cảm ơn', N'5.docx', N'', N'approved', N'khoitv', N'Dormitory Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (6, 3, N'Trần Văn B', CAST(N'2021-07-13' AS Date), CAST(N'2021-07-14' AS Date), N'Đơn xin check out phòng', N'Em chào phòng quản lý ký túc xá
em làm đơn này do muốn hủy việc thuê phòng tại ký túc , em xin cảm ơn.', N'6.docx', N'', N'approved', N'khoitv', N'Dormitory Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (7, 1, N'Trần Văn Khôi', CAST(N'2021-07-13' AS Date), CAST(N'2021-07-14' AS Date), N'Đơn xin check lại điểm danh', N'Do em vào muộn nên em bị absent slot 1 môn LAB321 . Em mong có thể được điểm danh lại', N'1.docx', N'', N'rejected', N'khoitv', N'Academic Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (8, 5, N'Trần Văn Long', CAST(N'2021-07-14' AS Date), NULL, N'Đơn xin hủy phòng ktx', N'Do em chuyển sang trọ nên em muốn hủy phòng ở ktx', N'1.docx', N'', N'approved', N'khoitv', N'Dormitory Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (9, 6, N'Trần Văn C', CAST(N'2021-07-14' AS Date), NULL, N'Đơn xin thôi học', N'Do em chuyển trường nên em muốn nộp đơn xin thôi học', N'1.docx', N'', N'in progress', N'khoitv', N'Academic Department')
INSERT [dbo].[Request] ([id], [studentID], [studentName], [createdDate], [closeDate], [title], [content], [attach], [solution], [status], [solvedBy], [department]) VALUES (10, 4, N'Trần Văn D', CAST(N'2021-07-13' AS Date), NULL, N'Đơn xin chuyển nghành học', N'Do em không học với ngành kinh tế nên em muốn chuyển sang học ngành kỹ thuật phần mềm', N'1.docx', N'', N'in progress', NULL, N'Academic Department')
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password]) VALUES (1, N'khoitv', N'123456')
INSERT [dbo].[User] ([id], [username], [password]) VALUES (2, N'khoitv1', N'123456')
INSERT [dbo].[User] ([id], [username], [password]) VALUES (3, N'khoitv2', N'123456')
INSERT [dbo].[User] ([id], [username], [password]) VALUES (4, N'khoitv3', N'123456')
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [RequestDB] SET  READ_WRITE 
GO
