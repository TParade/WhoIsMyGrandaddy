--USE [master]
--GO
--/****** Object:  Database [MyGranddaddy]    Script Date: 2024/04/29 12:57:31 ******/
--CREATE DATABASE [MyGranddaddy]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'MyGranddaddy', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.EXCLR8\MSSQL\DATA\MyGranddaddy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'MyGranddaddy_log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.EXCLR8\MSSQL\DATA\MyGranddaddy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
--GO
--ALTER DATABASE [MyGranddaddy] SET COMPATIBILITY_LEVEL = 150
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [MyGranddaddy].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
ALTER DATABASE [MyGranddaddy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyGranddaddy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyGranddaddy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyGranddaddy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyGranddaddy] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyGranddaddy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyGranddaddy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyGranddaddy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyGranddaddy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyGranddaddy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyGranddaddy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyGranddaddy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyGranddaddy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyGranddaddy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyGranddaddy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyGranddaddy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyGranddaddy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyGranddaddy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyGranddaddy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyGranddaddy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyGranddaddy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyGranddaddy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyGranddaddy] SET RECOVERY FULL 
GO
ALTER DATABASE [MyGranddaddy] SET  MULTI_USER 
GO
ALTER DATABASE [MyGranddaddy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyGranddaddy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyGranddaddy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyGranddaddy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyGranddaddy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyGranddaddy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyGranddaddy', N'ON'
GO
ALTER DATABASE [MyGranddaddy] SET QUERY_STORE = OFF
GO
USE [MyGranddaddy]
GO
/****** Object:  Schema [Site]    Script Date: 2024/04/29 12:57:31 ******/
CREATE SCHEMA [Site]
GO
/****** Object:  Table [Site].[Person]    Script Date: 2024/04/29 12:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Site].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FatherId] [int] NULL,
	[MotherId] [int] NULL,
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[IdentityNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Site].[Person] ON 
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (1, NULL, NULL, N'Adam', N'Smith', CAST(N'1900-01-01' AS Date), N'11B964276A')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (2, NULL, NULL, N'Eve', N'Smith', CAST(N'1905-03-15' AS Date), N'D76A01EBA3')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (3, 1, 2, N'John', N'Smith', CAST(N'1925-06-10' AS Date), N'4F1D717370')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (4, 1, 2, N'Mary', N'Smith', CAST(N'1930-08-20' AS Date), N'1EF70E53C7')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (5, 3, 4, N'Peter', N'Smith', CAST(N'1950-05-12' AS Date), N'45D1EC023F')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (6, 3, 4, N'Anne', N'Smith', CAST(N'1955-12-30' AS Date), N'BC1B4BEDD8')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (7, 5, 6, N'Michael', N'Smith', CAST(N'1975-09-03' AS Date), N'13B795DDF3')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (8, 5, 6, N'Sarah', N'Smith', CAST(N'1978-11-25' AS Date), N'86FA93D3C6')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (9, 7, 8, N'David', N'Smith', CAST(N'2000-03-18' AS Date), N'66CD637453')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (10, 7, 8, N'Emma', N'Smith', CAST(N'2005-08-09' AS Date), N'F26DE79379')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (11, 9, 10, N'James', N'Smith', CAST(N'2025-01-12' AS Date), N'7FB04C76B1')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (12, 9, 10, N'Olivia', N'Smith', CAST(N'2028-04-30' AS Date), N'A90CA50430')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (13, 11, 12, N'Benjamin', N'Smith', CAST(N'2050-07-20' AS Date), N'5B304D9685')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (14, 11, 12, N'Sophia', N'Smith', CAST(N'2055-10-05' AS Date), N'C875410FC0')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (15, 13, 14, N'Daniel', N'Smith', CAST(N'2080-02-15' AS Date), N'8AFACD44C4')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (16, 13, 14, N'Ava', N'Smith', CAST(N'2085-09-10' AS Date), N'914AE43FA4')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (17, 15, 16, N'Matthew', N'Smith', CAST(N'2110-04-18' AS Date), N'65115AE074')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (18, 15, 16, N'Emily', N'Smith', CAST(N'2115-11-20' AS Date), N'2D64E1DDE7')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (19, 17, 18, N'Christopher', N'Smith', CAST(N'2140-08-22' AS Date), N'C4CE8C692A')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (20, 17, 18, N'Grace', N'Smith', CAST(N'2145-12-05' AS Date), N'8F32FD4C93')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (21, NULL, NULL, N'Father.1', N'Jones', CAST(N'1900-01-01' AS Date), N'076F522515')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (22, NULL, NULL, N'Mother.1', N'Jones', CAST(N'1900-01-01' AS Date), N'1BAFD1C1AC')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (23, 21, 22, N'Father.2', N'Jones', CAST(N'1920-01-01' AS Date), N'D527AEFF89')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (24, 21, 22, N'Mother.2', N'Jones', CAST(N'1920-01-01' AS Date), N'7F2CABD6AF')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (25, 23, 24, N'Father.3', N'Jones', CAST(N'1940-01-01' AS Date), N'439835D13E')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (26, 23, 24, N'Mother.3', N'Jones', CAST(N'1940-01-01' AS Date), N'E32AF15779')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (27, NULL, NULL, N'Father.1', N'Gen15', CAST(N'1900-01-01' AS Date), N'1C9C9D8AA8')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (28, NULL, NULL, N'Mother.1', N'Gen15', CAST(N'1900-01-01' AS Date), N'1AA696DA1D')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (29, 27, 28, N'Father.2', N'Gen15', CAST(N'1920-01-01' AS Date), N'A2C11E241E')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (30, 27, 28, N'Mother.2', N'Gen15', CAST(N'1920-01-01' AS Date), N'3CACC7344A')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (31, 29, 30, N'Father.3', N'Gen15', CAST(N'1940-01-01' AS Date), N'7F2E20B573')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (32, 29, 30, N'Mother.3', N'Gen15', CAST(N'1940-01-01' AS Date), N'A6FC565E1C')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (33, 31, 32, N'Father.4', N'Gen15', CAST(N'1960-01-01' AS Date), N'22E7238C98')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (34, 31, 32, N'Mother.4', N'Gen15', CAST(N'1960-01-01' AS Date), N'D9128A1458')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (35, 33, 34, N'Father.5', N'Gen15', CAST(N'1980-01-01' AS Date), N'AC79D59868')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (36, 33, 34, N'Mother.5', N'Gen15', CAST(N'1980-01-01' AS Date), N'E9981C3E9B')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (37, 35, 36, N'Father.6', N'Gen15', CAST(N'2000-01-01' AS Date), N'92CC858ACB')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (38, 35, 36, N'Mother.6', N'Gen15', CAST(N'2000-01-01' AS Date), N'DC9119BAFE')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (39, 37, 38, N'Father.7', N'Gen15', CAST(N'2020-01-01' AS Date), N'52D8A2C6BF')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (40, 37, 38, N'Mother.7', N'Gen15', CAST(N'2020-01-01' AS Date), N'FDE3CEA168')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (41, 39, 40, N'Father.8', N'Gen15', CAST(N'2040-01-01' AS Date), N'E44A95F854')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (42, 39, 40, N'Mother.8', N'Gen15', CAST(N'2040-01-01' AS Date), N'3380C5C34A')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (43, 41, 42, N'Father.9', N'Gen15', CAST(N'2060-01-01' AS Date), N'C4AC0CB11C')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (44, 41, 42, N'Mother.9', N'Gen15', CAST(N'2060-01-01' AS Date), N'2F7132173F')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (45, 43, 44, N'Father.10', N'Gen15', CAST(N'2080-01-01' AS Date), N'70CFA508CC')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (46, 43, 44, N'Mother.10', N'Gen15', CAST(N'2080-01-01' AS Date), N'0AA0B798A8')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (47, 45, 46, N'Father.11', N'Gen15', CAST(N'2100-01-01' AS Date), N'339CB2F341')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (48, 45, 46, N'Mother.11', N'Gen15', CAST(N'2100-01-01' AS Date), N'360E46C334')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (49, 47, 48, N'Father.12', N'Gen15', CAST(N'2120-01-01' AS Date), N'1E9E90559B')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (50, 47, 48, N'Mother.12', N'Gen15', CAST(N'2120-01-01' AS Date), N'786BA1A397')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (51, 49, 50, N'Father.13', N'Gen15', CAST(N'2140-01-01' AS Date), N'6005A96C1F')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (52, 49, 50, N'Mother.13', N'Gen15', CAST(N'2140-01-01' AS Date), N'754AC55BF1')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (53, 51, 52, N'Father.14', N'Gen15', CAST(N'2160-01-01' AS Date), N'A4A298AEC0')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (54, 51, 52, N'Mother.14', N'Gen15', CAST(N'2160-01-01' AS Date), N'0A070FD1FF')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (55, 53, 54, N'Father.15', N'Gen15', CAST(N'2180-01-01' AS Date), N'B76A944AC4')
GO
INSERT [Site].[Person] ([Id], [FatherId], [MotherId], [Name], [Surname], [BirthDate], [IdentityNumber]) VALUES (56, 53, 54, N'Mother.15', N'Gen15', CAST(N'2180-01-01' AS Date), N'7EA9FB377B')
GO
SET IDENTITY_INSERT [Site].[Person] OFF
GO
ALTER TABLE [Site].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_Person_Person_Father] FOREIGN KEY([FatherId])
REFERENCES [Site].[Person] ([Id])
GO
ALTER TABLE [Site].[Person] NOCHECK CONSTRAINT [FK_Person_Person_Father]
GO
ALTER TABLE [Site].[Person]  WITH NOCHECK ADD  CONSTRAINT [FK_Person_Person_Mother] FOREIGN KEY([MotherId])
REFERENCES [Site].[Person] ([Id])
GO
ALTER TABLE [Site].[Person] NOCHECK CONSTRAINT [FK_Person_Person_Mother]
GO
/****** Object:  StoredProcedure [Site].[FamilyTreeGet]    Script Date: 2024/04/29 12:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Site].[FamilyTreeGet] @identityNumber varchar(20), @FatherCount int out
as
    begin
        declare @Id int =
                (   select  [Id]
                    from    [Site].[Person] as [P]
                    where   [P].[IdentityNumber] = @identityNumber)
        set @FatherCount  =
                (select count(1)from    [Site].[Person] as [P] where   [P].[FatherId] = @Id);

        with [RecursiveFamilyTree]
        as
        (
        select  [Id]
              , [FatherId]
              , [MotherId]
              , [Name]
              , [Surname]
              , [BirthDate]
              , [IdentityNumber]
              , 1 as [Generation]
        from    [Site].[Person]
        where   [Id] = @Id
        union all

        select  [child].[Id]
              , [child].[FatherId]
              , [child].[MotherId]
              , [child].[Name]
              , [child].[Surname]
              , [child].[BirthDate]
              , [child].[IdentityNumber]
              , [Generation] + 1
        from    [Site].[Person]              as [child]
            inner join [RecursiveFamilyTree] as [parent]
                on [parent].[Id] = case
                                       when @FatherCount > 0 then [child].[FatherId]
                                       else [child].[MotherId]
                                   end
        )

        select  [Id]
              , [FatherId]
              , [MotherId]
              , [Name]
              , [Surname]
              , [BirthDate]
              , [IdentityNumber]
              , [Generation]
        from    [RecursiveFamilyTree]
        order by [Generation]
               , [Surname]
               , [Name];

    end
GO
/****** Object:  StoredProcedure [Site].[FamilyTreeRootGet]    Script Date: 2024/04/29 12:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Site].[FamilyTreeRootGet] @identityNumber varchar(20)
as
    begin
        with [RecursiveAncestors]
        as
        (
        select  [Id]
              , [FatherId]
              , [MotherId]
              , [Name]
              , [Surname]
              , [BirthDate]
              , [IdentityNumber]
              , 1 as [Generation]
        from    [Site].[Person]
        where   [IdentityNumber] = @identityNumber 

        union all

        select  [parent].[Id]
              , [parent].[FatherId]
              , [parent].[MotherId]
              , [parent].[Name]
              , [parent].[Surname]
              , [parent].[BirthDate]
              , [parent].[IdentityNumber]
              , [Generation] - 1
        from    [Site].[Person]             as [parent]
            inner join [RecursiveAncestors] as [child]
                on [child].[FatherId] = [parent].[Id]
        union all

        select  [parent].[Id]
              , [parent].[FatherId]
              , [parent].[MotherId]
              , [parent].[Name]
              , [parent].[Surname]
              , [parent].[BirthDate]
              , [parent].[IdentityNumber]
              , [Generation] - 1
        from    [Site].[Person]             as [parent]
            inner join [RecursiveAncestors] as [child]
                on [child].[MotherId] = [parent].[Id]
        )

        select  distinct
                [Id]
              , [FatherId]
              , [MotherId]
              , [Name]
              , [Surname]
              , [BirthDate]
              , [IdentityNumber]
              , [Generation]
        from    [RecursiveAncestors]
		where ([RecursiveAncestors].[FatherId] is null and [RecursiveAncestors].[MotherId] is null) 
		or [RecursiveAncestors].[Generation] = 1
    end
GO
USE [master]
GO
ALTER DATABASE [MyGranddaddy] SET  READ_WRITE 
GO
