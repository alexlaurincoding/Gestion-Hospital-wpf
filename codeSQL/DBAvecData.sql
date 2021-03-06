USE [master]
GO
/****** Object:  Database [HOSPITAL]    Script Date: 2020-04-02 1:07:46 PM ******/
CREATE DATABASE [HOSPITAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOSPITAL', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HOSPITAL.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HOSPITAL_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HOSPITAL_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HOSPITAL] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOSPITAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOSPITAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOSPITAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOSPITAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOSPITAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOSPITAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOSPITAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOSPITAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOSPITAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOSPITAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOSPITAL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HOSPITAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOSPITAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOSPITAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOSPITAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOSPITAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOSPITAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOSPITAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOSPITAL] SET RECOVERY FULL 
GO
ALTER DATABASE [HOSPITAL] SET  MULTI_USER 
GO
ALTER DATABASE [HOSPITAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOSPITAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOSPITAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOSPITAL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HOSPITAL', N'ON'
GO
USE [HOSPITAL]
GO
/****** Object:  Table [dbo].[COMPAGNIE_ASSURANCE]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPAGNIE_ASSURANCE](
	[ID_ASSURANCE] [int] NOT NULL,
	[NOM_COMPAGNIE] [char](100) NOT NULL,
 CONSTRAINT [PK_ID_ASSURANCE] PRIMARY KEY CLUSTERED 
(
	[ID_ASSURANCE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPARTEMENT]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTEMENT](
	[ID_DEPARTEMENT] [int] NOT NULL,
	[NOM_DEPARTEMENT] [char](100) NOT NULL,
 CONSTRAINT [PK_ID_DEPARTEMENT] PRIMARY KEY CLUSTERED 
(
	[ID_DEPARTEMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DOSSIER_ADMISSION]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOSSIER_ADMISSION](
	[ID_ADMISSION] [int] IDENTITY(1000,1) NOT NULL,
	[CHIRURGIE_PROGRAMME] [bit] NULL,
	[DATE_ADMISSION] [date] NOT NULL,
	[DATE_CHIRURGIE] [date] NULL,
	[DATE_CONGE] [date] NULL,
	[NAM] [char](12) NULL,
	[NUMERO_LIT] [int] NULL,
	[ID_MEDECIN] [int] NULL,
 CONSTRAINT [PK_ID_ADMISSION] PRIMARY KEY CLUSTERED 
(
	[ID_ADMISSION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIT]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIT](
	[NUMERO_LIT] [int] NOT NULL,
	[LIT_OCCUPE] [bit] NOT NULL,
	[NUMERO_TYPE] [int] NULL,
	[ID_DEPARTEMENT] [int] NULL,
 CONSTRAINT [PK_NUMERO_LIT] PRIMARY KEY CLUSTERED 
(
	[NUMERO_LIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MEDECIN]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEDECIN](
	[ID_MEDECIN] [int] IDENTITY(600,1) NOT NULL,
	[NOM_MEDECIN] [char](100) NOT NULL,
	[PRENOM_MEDECIN] [char](100) NOT NULL,
	[SPECIALITE] [char](100) NOT NULL,
 CONSTRAINT [PK_ID_MEDECIN] PRIMARY KEY CLUSTERED 
(
	[ID_MEDECIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARENT]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARENT](
	[ref_parent] [int] IDENTITY(700,1) NOT NULL,
	[nom_PARENT] [char](100) NOT NULL,
	[PRENOM_PARENT] [char](100) NOT NULL,
	[ADRESSE_PARENT] [char](100) NOT NULL,
	[VILLE_PARENT] [char](100) NOT NULL,
	[PROVINCE_PARENT] [char](100) NOT NULL,
	[CODE_POSTAL_PARENT] [char](10) NOT NULL,
	[TELEPHONE_PARENT] [char](13) NOT NULL,
 CONSTRAINT [PK_PARENT] PRIMARY KEY CLUSTERED 
(
	[ref_parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PATIENT]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PATIENT](
	[NAM] [char](12) NOT NULL,
	[DATE_NAISSANCE_PATIENT] [date] NOT NULL,
	[NOM_PATIENT] [char](100) NOT NULL,
	[PRENOM_PATIENT] [char](100) NOT NULL,
	[ADRESSE_PATIENT] [char](100) NOT NULL,
	[VILLE_PATIENT] [char](100) NOT NULL,
	[PROVINCE_PATIENT] [char](100) NOT NULL,
	[CODE_POSTAL_PATIENT] [char](10) NOT NULL,
	[TELEPHONE_PATIENT] [char](13) NOT NULL,
	[ID_ASSURANCE] [int] NULL,
	[REF_PARENT] [int] NULL,
 CONSTRAINT [PK_PATIENT] PRIMARY KEY CLUSTERED 
(
	[NAM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TYPE_LIT]    Script Date: 2020-04-02 1:07:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TYPE_LIT](
	[NUMERO_TYPE] [int] NOT NULL,
	[DESCRIPTION_LIT] [char](100) NOT NULL,
 CONSTRAINT [PK_TYPE_LIT] PRIMARY KEY CLUSTERED 
(
	[NUMERO_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE], [NOM_COMPAGNIE]) VALUES (900, N'Desjardins Assurance                                                                                ')
INSERT [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE], [NOM_COMPAGNIE]) VALUES (901, N'Intact Assurance                                                                                    ')
INSERT [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE], [NOM_COMPAGNIE]) VALUES (902, N'CSN                                                                                                 ')
INSERT [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE], [NOM_COMPAGNIE]) VALUES (903, N'Assurance banque Nationale                                                                          ')
INSERT [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE], [NOM_COMPAGNIE]) VALUES (904, N'Hells Angels Assurances                                                                             ')
INSERT [dbo].[DEPARTEMENT] ([ID_DEPARTEMENT], [NOM_DEPARTEMENT]) VALUES (101, N'Chirurgie                                                                                           ')
INSERT [dbo].[DEPARTEMENT] ([ID_DEPARTEMENT], [NOM_DEPARTEMENT]) VALUES (102, N'Pédiatrie                                                                                           ')
INSERT [dbo].[DEPARTEMENT] ([ID_DEPARTEMENT], [NOM_DEPARTEMENT]) VALUES (103, N'Aide medical a mourrir                                                                              ')
SET IDENTITY_INSERT [dbo].[DOSSIER_ADMISSION] ON 

INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1038, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-04-02' AS Date), N'belt25485698', 211, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1039, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), NULL, N'dyhr25415255', 212, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1040, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-03-30' AS Date), N'gilf87876768', 213, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1041, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), N'laug12345667', 214, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1042, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), NULL, N'laua34132345', 215, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1043, 0, CAST(N'2020-03-11' AS Date), NULL, NULL, N'tare29089105', 231, 616)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1044, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-03-12' AS Date), N'hury38383837', 216, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1045, 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-11' AS Date), NULL, N'laug12345667', 214, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1046, 1, CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), N'gilf87876768', 213, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1047, 1, CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), N'hury38383837', 216, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1048, 1, CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), CAST(N'2020-04-02' AS Date), N'gilf87876768', 213, 617)
INSERT [dbo].[DOSSIER_ADMISSION] ([ID_ADMISSION], [CHIRURGIE_PROGRAMME], [DATE_ADMISSION], [DATE_CHIRURGIE], [DATE_CONGE], [NAM], [NUMERO_LIT], [ID_MEDECIN]) VALUES (1049, 0, CAST(N'2020-04-02' AS Date), NULL, NULL, N'hury38383837', 221, 620)
SET IDENTITY_INSERT [dbo].[DOSSIER_ADMISSION] OFF
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (211, 0, 1, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (212, 1, 1, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (213, 0, 1, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (214, 0, 2, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (215, 0, 2, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (216, 0, 3, 101)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (221, 1, 1, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (222, 0, 1, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (223, 0, 1, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (224, 0, 2, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (225, 0, 2, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (226, 0, 3, 102)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (231, 1, 1, 103)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (232, 0, 1, 103)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (233, 0, 1, 103)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (234, 0, 2, 103)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (235, 0, 2, 103)
INSERT [dbo].[LIT] ([NUMERO_LIT], [LIT_OCCUPE], [NUMERO_TYPE], [ID_DEPARTEMENT]) VALUES (236, 0, 3, 103)
SET IDENTITY_INSERT [dbo].[MEDECIN] ON 

INSERT [dbo].[MEDECIN] ([ID_MEDECIN], [NOM_MEDECIN], [PRENOM_MEDECIN], [SPECIALITE]) VALUES (616, N'Barette                                                                                             ', N'Gaetan 22                                                                                           ', N'Aide a Mourrir                                                                                      ')
INSERT [dbo].[MEDECIN] ([ID_MEDECIN], [NOM_MEDECIN], [PRENOM_MEDECIN], [SPECIALITE]) VALUES (617, N'girouard                                                                                            ', N'paul                                                                                                ', N'Chirurgie                                                                                           ')
INSERT [dbo].[MEDECIN] ([ID_MEDECIN], [NOM_MEDECIN], [PRENOM_MEDECIN], [SPECIALITE]) VALUES (620, N'boutlamine                                                                                          ', N'tata                                                                                                ', N'Pédiatrie                                                                                           ')
INSERT [dbo].[MEDECIN] ([ID_MEDECIN], [NOM_MEDECIN], [PRENOM_MEDECIN], [SPECIALITE]) VALUES (621, N'lamarche                                                                                            ', N'jeannne                                                                                             ', N'Aide a Mourrir                                                                                      ')
INSERT [dbo].[MEDECIN] ([ID_MEDECIN], [NOM_MEDECIN], [PRENOM_MEDECIN], [SPECIALITE]) VALUES (622, N'Arruda                                                                                              ', N'Horacio                                                                                             ', N'Chirurgie                                                                                           ')
SET IDENTITY_INSERT [dbo].[MEDECIN] OFF
SET IDENTITY_INSERT [dbo].[PARENT] ON 

INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (700, N'laurin                                                                                              ', N'denis                                                                                               ', N'34 sallaberry                                                                                       ', N'chateauguay                                                                                         ', N'Québec                                                                                              ', N'j6j4j3    ', N'4506278521   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (701, N'diane                                                                                               ', N'picard                                                                                              ', N'3643 clark                                                                                          ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'h2x2s1    ', N'5144294591   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (702, N'tardif                                                                                              ', N'gabriel                                                                                             ', N'58 riviere                                                                                          ', N'laval                                                                                               ', N'Québec                                                                                              ', N'h5tg3r    ', N'4505236589   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (703, N'laurin                                                                                              ', N'alexandre                                                                                           ', N'3643 clark                                                                                          ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'f6s5d6    ', N'5146929805   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (705, N'sabourin                                                                                            ', N'jean                                                                                                ', N'25 helloworld                                                                                       ', N'laval                                                                                               ', N'Québec                                                                                              ', N'j4t4t3    ', N'5146985852   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (707, N'dye                                                                                                 ', N'big                                                                                                 ', N'54 6e avenue                                                                                        ', N'verdun                                                                                              ', N'Ontario                                                                                             ', N'h4h3h4    ', N'5148525852   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (708, N'bellal                                                                                              ', N'adelar                                                                                              ', N'584 rue csharp                                                                                      ', N'halifax                                                                                             ', N'Nouveau-Brunswick                                                                                   ', N'5f8s5w    ', N'8198525648   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (709, N'lessard                                                                                             ', N'gille                                                                                               ', N'58 rue francoise                                                                                    ', N'laval                                                                                               ', N'Québec                                                                                              ', N'h4y3yw    ', N'5214525852   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (710, N'hury                                                                                                ', N'jean                                                                                                ', N'98 grosse rue                                                                                       ', N'brossard                                                                                            ', N'Québec                                                                                              ', N'h5t46y    ', N'5241521252   ')
INSERT [dbo].[PARENT] ([ref_parent], [nom_PARENT], [PRENOM_PARENT], [ADRESSE_PARENT], [VILLE_PARENT], [PROVINCE_PARENT], [CODE_POSTAL_PARENT], [TELEPHONE_PARENT]) VALUES (711, N'gilbert                                                                                             ', N'bernard                                                                                             ', N'5854 st-laurent                                                                                     ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'f7d6r5    ', N'5145852568   ')
SET IDENTITY_INSERT [dbo].[PARENT] OFF
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'belt25485698', CAST(N'1979-03-14' AS Date), N'bellal                                                                                              ', N'toufik                                                                                              ', N'521 rue wpf                                                                                         ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'j5r4e3    ', N'5145825648   ', 900, 708)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'dyhr25415255', CAST(N'2020-03-11' AS Date), N'dye                                                                                                 ', N'hard                                                                                                ', N'25 3e avenue                                                                                        ', N'verdun                                                                                              ', N'Ontario                                                                                             ', N'j5t3y5    ', N'5214585256   ', 904, 707)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'gilf87876768', CAST(N'1960-02-09' AS Date), N'gilbert                                                                                             ', N'fernand                                                                                             ', N'876 clark                                                                                           ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'h4r53t    ', N'5145825654   ', 902, 711)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'hury38383837', CAST(N'2020-03-04' AS Date), N'hury                                                                                                ', N'yvon                                                                                                ', N'78 jean-claude                                                                                      ', N'brossard                                                                                            ', N'Québec                                                                                              ', N'h5y3y6    ', N'5145256852   ', NULL, 710)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'laua23108202', CAST(N'1982-10-23' AS Date), N'laurin                                                                                              ', N'alexandre                                                                                           ', N'3643 clark                                                                                          ', N'Montreal                                                                                            ', N'Québec                                                                                              ', N'h2x2s1    ', N'5146929805   ', 904, 701)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'laua34132345', CAST(N'1961-07-20' AS Date), N'sabourin                                                                                            ', N'simon                                                                                               ', N'23 rue bleue                                                                                        ', N'laval                                                                                               ', N'Québec                                                                                              ', N'h4r5r5    ', N'5146589569   ', 901, 705)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'laug12345667', CAST(N'2009-07-21' AS Date), N'laurin                                                                                              ', N'gabriel                                                                                             ', N'45 fausse rue                                                                                       ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'g6j3d5    ', N'5146985236   ', NULL, 703)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'leau45829384', CAST(N'1974-07-19' AS Date), N'lessard                                                                                             ', N'frank                                                                                               ', N'256 rue moche                                                                                       ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'h4y3w6    ', N'5145258569   ', 903, 709)
INSERT [dbo].[PATIENT] ([NAM], [DATE_NAISSANCE_PATIENT], [NOM_PATIENT], [PRENOM_PATIENT], [ADRESSE_PATIENT], [VILLE_PATIENT], [PROVINCE_PATIENT], [CODE_POSTAL_PATIENT], [TELEPHONE_PATIENT], [ID_ASSURANCE], [REF_PARENT]) VALUES (N'tare29089105', CAST(N'1991-08-29' AS Date), N'tadif                                                                                               ', N'emmanuelle                                                                                          ', N'3643 clark                                                                                          ', N'montreal                                                                                            ', N'Québec                                                                                              ', N'h2x2s1    ', N'4385698258   ', NULL, 702)
INSERT [dbo].[TYPE_LIT] ([NUMERO_TYPE], [DESCRIPTION_LIT]) VALUES (1, N'Standard                                                                                            ')
INSERT [dbo].[TYPE_LIT] ([NUMERO_TYPE], [DESCRIPTION_LIT]) VALUES (2, N'Semi-Privé                                                                                          ')
INSERT [dbo].[TYPE_LIT] ([NUMERO_TYPE], [DESCRIPTION_LIT]) VALUES (3, N'Privé                                                                                               ')
ALTER TABLE [dbo].[DOSSIER_ADMISSION]  WITH CHECK ADD  CONSTRAINT [FK_ID_MEDECIN] FOREIGN KEY([ID_MEDECIN])
REFERENCES [dbo].[MEDECIN] ([ID_MEDECIN])
GO
ALTER TABLE [dbo].[DOSSIER_ADMISSION] CHECK CONSTRAINT [FK_ID_MEDECIN]
GO
ALTER TABLE [dbo].[DOSSIER_ADMISSION]  WITH CHECK ADD  CONSTRAINT [FK_NAM] FOREIGN KEY([NAM])
REFERENCES [dbo].[PATIENT] ([NAM])
GO
ALTER TABLE [dbo].[DOSSIER_ADMISSION] CHECK CONSTRAINT [FK_NAM]
GO
ALTER TABLE [dbo].[DOSSIER_ADMISSION]  WITH CHECK ADD  CONSTRAINT [FK_NUMERO_LIT] FOREIGN KEY([NUMERO_LIT])
REFERENCES [dbo].[LIT] ([NUMERO_LIT])
GO
ALTER TABLE [dbo].[DOSSIER_ADMISSION] CHECK CONSTRAINT [FK_NUMERO_LIT]
GO
ALTER TABLE [dbo].[LIT]  WITH CHECK ADD  CONSTRAINT [FK_ID_DEPARTEMENT] FOREIGN KEY([ID_DEPARTEMENT])
REFERENCES [dbo].[DEPARTEMENT] ([ID_DEPARTEMENT])
GO
ALTER TABLE [dbo].[LIT] CHECK CONSTRAINT [FK_ID_DEPARTEMENT]
GO
ALTER TABLE [dbo].[LIT]  WITH CHECK ADD  CONSTRAINT [FK_NUMERO_TYPE] FOREIGN KEY([NUMERO_TYPE])
REFERENCES [dbo].[TYPE_LIT] ([NUMERO_TYPE])
GO
ALTER TABLE [dbo].[LIT] CHECK CONSTRAINT [FK_NUMERO_TYPE]
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD  CONSTRAINT [FK_COMPAGNIE_ASSURANCE] FOREIGN KEY([ID_ASSURANCE])
REFERENCES [dbo].[COMPAGNIE_ASSURANCE] ([ID_ASSURANCE])
GO
ALTER TABLE [dbo].[PATIENT] CHECK CONSTRAINT [FK_COMPAGNIE_ASSURANCE]
GO
ALTER TABLE [dbo].[PATIENT]  WITH CHECK ADD  CONSTRAINT [FK_REF_PARENT] FOREIGN KEY([REF_PARENT])
REFERENCES [dbo].[PARENT] ([ref_parent])
GO
ALTER TABLE [dbo].[PATIENT] CHECK CONSTRAINT [FK_REF_PARENT]
GO
USE [master]
GO
ALTER DATABASE [HOSPITAL] SET  READ_WRITE 
GO
