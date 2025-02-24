USE [master]
GO
/****** Object:  Database [Task]    Script Date: 11/1/2024 9:37:04 AM ******/
CREATE DATABASE [Task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Task] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task] SET RECOVERY FULL 
GO
ALTER DATABASE [Task] SET  MULTI_USER 
GO
ALTER DATABASE [Task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Task] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Task] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Task', N'ON'
GO
ALTER DATABASE [Task] SET QUERY_STORE = OFF
GO
USE [Task]
GO
/****** Object:  Table [dbo].[Assignee]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignee](
	[AssigneeId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssigneeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogHistory]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHistory](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[LogTime] [datetime] NULL,
	[LogType] [int] NULL,
	[TargetTask] [int] NULL,
	[TargetUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogType]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogType](
	[LogType] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](255) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[StatusId] [int] NULL,
	[CreateDate] [date] NULL,
	[FinishDate] [date] NULL,
	[Estimate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RefreshToken] [nchar](255) NULL,
	[RefreshTokenTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddAssignee]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddAssignee] (
	@TaskId int,
	@UserId int
)as
begin 
	insert into Assignee(TaskId,UserId) 
	values  ( @TaskId , @UserId)

	Select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddRole] (
	@RoleName nvarchar(255)
)as
begin
	Insert into Role(RoleName, IsActive) values (@RoleName , 1)
	select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AddStatus]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddStatus] (
	@StatusName nvarchar(255)
)as
begin
	Insert into Status(StatusName, IsActive) values (@StatusName , 1)
	select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AddTask]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddTask] (
	@Title nvarchar(255),
	@StatusId int,
	@CreateDate nvarchar(20),
	@FinishDate nvarchar(20) ,
	@Estimate int
)as
begin 
	insert into Task(Title, StatusId, CreateDate, FinishDate, Estimate) 
	values  ( @Title, @StatusId,
		CAST(@CreateDate AS DATE), 
		CAST(@FinishDate AS DATE),
		@Estimate)

	Select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[AddToken]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddToken] (
	@UserId int,
	@RefreshToken nvarchar(255),
	@RefreshTokenTime Datetime
)as
begin 
	Update Users set RefreshToken = @RefreshToken , RefreshTokenTime = @RefreshTokenTime where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddUser] (
	@Email varchar(255),
	@FirstName nvarchar(255),
	@LastName nvarchar(255),
	@RoleId int,
	@Password varchar(255)
)as
begin 
	Insert into Users (Email, FirstName, LastName , Password, RoleId, IsActive) 
		values ( @Email ,@FirstName, @LastName ,@Password, @RoleId, 1)
	Select SCOPE_IDENTITY()  
end
GO
/****** Object:  StoredProcedure [dbo].[Check_ForgotPass]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Check_ForgotPass](
	@Email nvarchar(255),
	@FirstName nvarchar(255),
	@LastName nvarchar(255)
)as
begin
	Select * from Users u
	where IsActive = 1 and u.FirstName = @FirstName and u.LastName = @LastName and u.Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[Check_Signup]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Check_Signup](
	@Email nvarchar(255)
)as
begin
	Select * from Users u
	where IsActive = 1 and u.Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[CheckAccountRefreshToken]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[CheckAccountRefreshToken] (
	@RefreshToken nvarchar(255),
	@UserId int
)as
begin 
	Select * from Users where UserId = @UserId and RefreshToken = @RefreshToken and RefreshTokenTime >= (Select GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[CheckRoleinUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CheckRoleinUser] 
(@RoleId int)as
begin 
	Select * from Users where RoleId = @RoleId and IsActive = 1
end
GO
/****** Object:  StoredProcedure [dbo].[CheckStatusinTask]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CheckStatusinTask] 
(
	@StatusId int
)as
begin 
	Select * from Task where StatusId = @StatusId
end
GO
/****** Object:  StoredProcedure [dbo].[CheckUpdateAddRole]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CheckUpdateAddRole] (
	@RoleName nvarchar(max),
	@RoleId int
)as
begin 
	Select * from Role where IsActive = 1 and RoleName Like '%' + @RoleName + '%'  and (RoleId != @RoleId or @RoleId is null)
end
GO
/****** Object:  StoredProcedure [dbo].[CheckUpdateAddStatus]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CheckUpdateAddStatus] (
	@StatusName nvarchar(max),
	@StatusId int
)as
begin
	Select * from Status where IsActive = 1 and StatusName Like '%' + @StatusName + '%' and (StatusId != @StatusId or @StatusId is null)
end
GO
/****** Object:  StoredProcedure [dbo].[CheckUpdateAddUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[CheckUpdateAddUser] (
	@Email nvarchar(255),
	@UserId int
)as
begin
	Select * from Users 
	where IsActive = 1 and Email = @Email and (UserId != @UserId or @USERID is null)
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssigneeByTaskId]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[DeleteAssigneeByTaskId](
	@TaskId int
)
as
begin
	Delete from Assignee where TaskId = @TaskId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssigneeByUserId]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteAssigneeByUserId](
	@UserId int
)
as
begin
	Delete from Assignee where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteRole](
	@RoleId int
)as
begin
	Update Role Set IsActive = 0 where RoleId = @RoleId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteStatus]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteStatus](
	@StatusId int
)as
begin
	Update Status Set IsActive = 0 where StatusId = @StatusId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteTask] (
	@TaskId int
)
as
begin 
	Delete from Task where TaskId = @TaskId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteUser]
(
	@UserId int
)as
begin 
	Update Users Set IsActive = 0 where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetAllUser]
(@RoleId int )
as
begin
	Select * from Users where IsActive =1 and RoleId <= @RoleId  
end
GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetRole]
(@PageNumber int,
	@PageSize int,
	@RoleName nvarchar(255),
	@IsActive int,
	@CurrenRole int
)
as
begin	
	IF EXISTS (SELECT * from Role where @CurrenRole < 3)
		begin
			Select ROW_NUMBER() Over(Order by RoleId ASC) as No, RoleId, RoleName , IsActive
			from Role 
			Where (isnull(@RoleName,'') = '' or RoleName Like N'%'+@RoleName+'%') 
			AND (@IsActive is null or IsActive = @IsActive)
			AND RoleId <3
			order by RoleId
			OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
		end
	else
		begin
			Select ROW_NUMBER() Over(Order by RoleId ASC) as No, RoleId, RoleName , IsActive
			from Role 
			Where (isnull(@RoleName,'') = '' or RoleName Like N'%'+@RoleName+'%') 
			AND (@IsActive is null or IsActive = @IsActive)
			order by RoleId
			OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
		end
end
GO
/****** Object:  StoredProcedure [dbo].[GetStatus]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetStatus]
(	@PageNumber int,
	@PageSize int,
	@StatusName nvarchar(255),
	@IsActive int
)
as
begin	
	Select ROW_NUMBER() Over(Order by StatusId ASC) as No, StatusId, StatusName  , IsActive
	from Status 
	Where (isnull(@StatusName,'') = '' or StatusName Like N'%'+@StatusName+'%') 
	AND (@IsActive is null or IsActive = @IsActive)
	order by StatusId
	OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
end
GO
/****** Object:  StoredProcedure [dbo].[GetTask]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTask] (
	@PageNumber int,
	 @PageSize int,
	 @Title nvarchar(255),
	 @StatusId int,
	 @CreateDate nvarchar(255),
	 @FinishDate nvarchar(255),
	 @CurrUserId int
)as
begin
	IF EXISTS (SELECT * from Users where UserId = @CurrUserId AND RoleId > 1)
		begin
			Select ROW_NUMBER() Over(Order by TaskId ASC) as No,t.TaskId, t.Title, t.StatusId, ts.StatusName , t.CreateDate , t.FinishDate , t.Estimate
			from Task t
			left join Status ts on t.StatusId = ts.StatusId
			Where
			(CreateDate = CAST(@CreateDate AS DATETIME) OR @CreateDate IS NULL)
			and (FinishDate <= CAST(@FinishDate AS DATETIME)  OR @FinishDate IS NULL) 
			and (isnull(@Title, '') = '' or t.Title Like N'%' + @Title + '%')
			and (t.StatusId = @StatusId OR @StatusId IS NULL)
			order by TaskId
			OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
		end
	ELSE
		begin
			Select ROW_NUMBER() Over(Order by t.TaskId ASC) as No,t.TaskId, t.Title, t.StatusId, ts.StatusName , t.CreateDate , t.FinishDate , t.Estimate
			from Task t
			left join Status ts on t.StatusId = ts.StatusId
			inner join (SELECT * from Assignee where UserId = @CurrUserId) a on t.TaskId = a.TaskId
			Where
			(CreateDate = CAST(@CreateDate AS DATETIME) OR @CreateDate IS NULL)
			and (FinishDate = CAST(@FinishDate AS DATETIME)  OR @FinishDate IS NULL) 
			and (isnull(@Title, '') = '' or t.Title Like N'%' + @Title + '%')
			and (t.StatusId = @StatusId OR @StatusId IS NULL)
			order by TaskId
			OFFSET ((@PageNumber - 1) * @PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY;
		end
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaskAssignList]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[GetTaskAssignList]
as
begin
	 select TaskId, userId from Assignee group by userId,TaskId 
end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetUser]  
(
	@PageNumber int,
	@PageSize int,
	@Email varchar(255),
	@FirstName nvarchar(255),
	@LastName nvarchar(255),
	@RoleId int,
	@IsActive bit
)
as
	BEGIN
		Select ROW_NUMBER() Over(Order by UserId ASC) AS No, UserId, Email , FirstName , LastName , Password, Role.RoleId, Role.RoleName, Users.IsActive
		from Users inner join Role on Users.RoleId = Role.RoleId
		Where ( ISNULL(@FirstName, '') = '' or FirstName Like '%' + @FirstName + '%')
		AND ( ISNULL(@LastName, '') = '' or LastName Like '%' + @LastName + '%')
		AND ( ISNULL(@Email, '') = '' or Email Like '%' + @Email + '%')
		AND ( @IsActive is null or Users.IsActive = @IsActive)
		AND ( @RoleId is null or Users.RoleId = @RoleId)
		order by UserId
		OFFSET ((@PageNumber - 1) * @PageSize ) ROWS FETCH NEXT @PageSize ROWS ONLY;
	END
GO
/****** Object:  StoredProcedure [dbo].[LogAcc]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[LogAcc] (
	@Email nvarchar(255),
	@Password varchar(255)
)as
begin
	Select UserId, Email, FirstName, LastName, Password, RoleId from Users where Email = @Email AND Password = @Password AND IsActive = 1
end
GO
/****** Object:  StoredProcedure [dbo].[RecordHistory]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RecordHistory]
(
	@Content nvarchar(max),
	@UserId int,
	@Type int,
	@Time datetime,	
	@TargetTask int,
	@TargetUser int 
)as
begin
	Insert into LogHistory (Content, UserId, LogType, LogTime , TargetTask , TargetUser) values ( @Content, @UserId, @Type , @Time  , @TargetTask, @TargetUser)
	Select SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UpdatePassword] (
	@Passsword nvarchar(max),
	@Email varchar(255)
)as
begin 
	Update Users SET Password = @Passsword where Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateRole]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UpdateRole] (
	@RoleName nvarchar(255),
	@RoleId int
)as
begin
	Update Role Set RoleName = @RoleName  where RoleId = @RoleId
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update Status
CREATE Proc [dbo].[UpdateStatus] (
	@StatusName nvarchar(255),
	@StatusId int
)as
begin
	Update Status Set StatusName = @StatusName  where StatusId = @StatusId
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTask]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UpdateTask]  (
	@Title nvarchar(255),
	@StatusId int,
	@CreateDate nvarchar(20),
	@FinishDate nvarchar(20) ,
	@Estimate int,
	@TaskId int
)as
begin
	Update Task Set Title = @Title, 
	StatusId = @StatusId,
	CreateDate = CAST(@CreateDate AS DATE),
	FinishDate = CAST(@FinishDate AS DATE),
	Estimate = @Estimate
	where TaskID = @TaskId
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 11/1/2024 9:37:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UpdateUser] (
	
	@Email varchar(255),
	@FirstName nvarchar(255),
	@Lastname nvarchar(255),
	@RoleId int,
	@UserId int
)as
begin
	Update Users SET Email = @Email, FirstName = @FirstName, LastName = @Lastname, RoleId = @RoleId  where UserId = @UserId
end
GO
USE [master]
GO
ALTER DATABASE [Task] SET  READ_WRITE 
GO
