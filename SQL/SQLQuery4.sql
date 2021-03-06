create database MunicipalidadVL
GO
use MunicipalidadVL
/****** Object:  Table [dbo].[tblRE_DeclaracionesJuradas]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_DeclaracionesJuradas](
	[Usuario] [int] NULL,
	[Temperatura] [varchar](10) NULL,
	[Fecha] [datetime] NULL,
	[Dolor_De_Garganta] [char](1) NULL,
	[Dificultad_Respiratoria] [char](1) NULL,
	[Dolor_De_Cabeza] [char](1) NULL,
	[Diarrea] [char](1) NULL,
	[Vomitos] [char](1) NULL,
	[Dolor_Muscular] [char](1) NULL,
	[Perdida_De_Olfato] [char](1) NULL,
	[Perdida_De_Gusto] [char](1) NULL,
	[Tos] [char](1) NULL,
	[Contacto_Estrecho] [char](1) NULL,
	[Contacto_Cercano] [char](1) NULL,
	[Cancer] [char](1) NULL,
	[Diabetes] [char](1) NULL,
	[Enfermedad_Hepatica] [char](1) NULL,
	[Enfermedad_Renal] [char](1) NULL,
	[Enfermedad_Respiratoria] [char](1) NULL,
	[Enfermedad_Cardiologica] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_Lugares]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_Lugares](
	[id] [int] NULL,
	[Nombre] [varchar](10) NULL,
	[Numero] [int] NULL,
	[idEstado] [tinyint] NULL,
	[idTipo] [tinyint] NULL,
	[Orden] [int] NULL,
	[CoordenadaX] [int] NULL,
	[CoordenadaY] [int] NULL,
	[idGrupo] [int] NULL,
	[Foto] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_LugaresBKP]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_LugaresBKP](
	[id] [int] NULL,
	[Nombre] [varchar](10) NULL,
	[Numero] [int] NULL,
	[idEstado] [tinyint] NULL,
	[idTipo] [tinyint] NULL,
	[Orden] [int] NULL,
	[CoordenadaX] [int] NULL,
	[CoordenadaY] [int] NULL,
	[idGrupo] [int] NULL,
	[Foto] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_LugaresEstados]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_LugaresEstados](
	[id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_LugaresGrupos]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE TABLE [dbo].[tblRE_LugaresGrupos](
--	[id] [int] NOT NULL,
--	[Nombre] [varchar](100) NULL,
--	[CoordenadaX] [int] NULL,
--	[CoordenadaY] [int] NULL
--) ON [PRIMARY]
--GO
/****** Object:  Table [dbo].[tblRE_LugaresTipos]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_LugaresTipos](
	[id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_Reservas]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_Reservas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idLugar] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaHoraDesde] [datetime] NULL,
	[fechaHoraHasta] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_Reservas_DEL]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_Reservas_DEL](
	[id] [int] NOT NULL,
	[idLugar] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaHoraDesde] [datetime] NULL,
	[fechaHoraHasta] [datetime] NULL,
	[Fecha_DEL] [datetime] NOT NULL,
	[Usuario_DEL] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_Usuarios]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_Usuarios](
	[id] [int] NOT NULL,
	[Usuario] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[idPerfil] [int] NULL,
	[Contraseña] [varchar](50) NULL,
	[Mail] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRE_UsuariosPerfiles]    Script Date: 12/05/2021 07:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRE_UsuariosPerfiles](
	[id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblRE_DeclaracionesJuradas] ([Usuario], [Temperatura], [Fecha], [Dolor_De_Garganta], [Dificultad_Respiratoria], [Dolor_De_Cabeza], [Diarrea], [Vomitos], [Dolor_Muscular], [Perdida_De_Olfato], [Perdida_De_Gusto], [Tos], [Contacto_Estrecho], [Contacto_Cercano], [Cancer], [Diabetes], [Enfermedad_Hepatica], [Enfermedad_Renal], [Enfermedad_Respiratoria], [Enfermedad_Cardiologica]) VALUES (1, N'37.1', CAST(N'2021-05-04T10:09:56.997' AS DateTime), N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'1', N'0', N'0', N'0', N'0', N'0', N'0', N'1')
GO
INSERT [dbo].[tblRE_DeclaracionesJuradas] ([Usuario], [Temperatura], [Fecha], [Dolor_De_Garganta], [Dificultad_Respiratoria], [Dolor_De_Cabeza], [Diarrea], [Vomitos], [Dolor_Muscular], [Perdida_De_Olfato], [Perdida_De_Gusto], [Tos], [Contacto_Estrecho], [Contacto_Cercano], [Cancer], [Diabetes], [Enfermedad_Hepatica], [Enfermedad_Renal], [Enfermedad_Respiratoria], [Enfermedad_Cardiologica]) VALUES (1, N'37.1', CAST(N'2021-05-07T10:16:14.993' AS DateTime), N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
GO
INSERT [dbo].[tblRE_DeclaracionesJuradas] ([Usuario], [Temperatura], [Fecha], [Dolor_De_Garganta], [Dificultad_Respiratoria], [Dolor_De_Cabeza], [Diarrea], [Vomitos], [Dolor_Muscular], [Perdida_De_Olfato], [Perdida_De_Gusto], [Tos], [Contacto_Estrecho], [Contacto_Cercano], [Cancer], [Diabetes], [Enfermedad_Hepatica], [Enfermedad_Renal], [Enfermedad_Respiratoria], [Enfermedad_Cardiologica]) VALUES (1, N'37.2', CAST(N'2021-05-11T12:21:14.027' AS DateTime), N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'N', N'0', N'0', N'0', N'0', N'0', N'0', N'0', N'0')
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (1, N'A', 1, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (2, N'A', 2, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (3, N'A', 3, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (4, N'A', 4, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (5, N'A', 5, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (6, N'A', 6, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (7, N'A', 7, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (8, N'A', 8, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (9, N'A', 9, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (10, N'A', 10, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (11, N'A', 11, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (12, N'A', 12, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (13, N'A', 13, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (14, N'A', 14, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (15, N'A', 15, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (16, N'A', 16, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (17, N'A', 17, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (18, N'A', 18, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (19, N'A', 19, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (20, N'A', 20, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (21, N'A', 21, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (22, N'A', 22, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (23, N'A', 23, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (24, N'A', 24, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (25, N'A', 25, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (26, N'A', 26, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (27, N'A', 27, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (28, N'A', 28, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (29, N'A', 29, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (30, N'A', 30, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (31, N'A', 31, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (32, N'A', 32, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (33, N'A', 33, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_Lugares] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (34, N'A', 34, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (1, NULL, 1, 1, 1, 1, 336, 712, 1, N'9')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (2, NULL, 2, 1, 1, 2, 313, 673, 1, N'9')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (3, NULL, 3, 1, 1, 3, 369, 631, 1, N'9')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (4, NULL, 4, 1, 1, 4, 394, 672, 1, N'9')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (5, NULL, 5, 1, 1, 5, 444, 616, NULL, N'10')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (6, NULL, 6, 1, 1, 6, 294, 559, 2, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (7, NULL, 7, 1, 1, 7, 271, 520, 2, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (8, NULL, 8, 1, 1, 8, 313, 493, 2, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (9, NULL, 9, 1, 1, 9, 340, 532, 2, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (10, NULL, 10, 1, 1, 10, 394, 502, 5, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (11, NULL, 11, 1, 1, 11, 367, 463, 5, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (12, NULL, 12, 1, 1, 12, 409, 432, 5, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (13, NULL, 13, 1, 1, 13, 438, 471, 5, N'8')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (14, NULL, 14, 1, 2, 14, 502, 361, NULL, N'7')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (15, NULL, 15, 1, 2, 15, 592, 316, NULL, N'7')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (16, NULL, 16, 1, 2, 16, 745, 313, NULL, N'6')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (17, NULL, 17, 1, 2, 17, 825, 355, NULL, N'6')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (18, NULL, 18, 1, 2, 18, 907, 477, NULL, N'5')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (19, NULL, 19, 1, 1, 19, 793, 579, 4, N'4')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (20, NULL, 20, 1, 1, 20, 744, 579, 4, N'4')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (21, NULL, 21, 1, 1, 21, 745, 637, 4, N'4')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (22, NULL, 22, 1, 1, 22, 795, 637, 4, N'4')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (23, NULL, 23, 1, 1, 23, 874, 558, 3, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (24, NULL, 24, 1, 1, 24, 922, 558, 3, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (25, NULL, 25, 1, 1, 25, 867, 658, 6, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (26, NULL, 26, 1, 1, 26, 916, 657, 6, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (27, NULL, 27, 1, 1, 27, 916, 715, 6, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (28, NULL, 28, 1, 1, 28, 868, 715, 6, N'3')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (29, NULL, 29, 1, 1, 29, 747, 730, 7, N'2')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (30, NULL, 30, 1, 1, 30, 796, 730, 7, N'2')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (31, NULL, 31, 1, 1, 31, 796, 786, 7, N'2')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (32, NULL, 32, 1, 1, 32, 747, 786, 7, N'2')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (33, NULL, 33, 1, 1, 33, 870, 810, 8, N'1')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (34, NULL, 34, 1, 1, 34, 921, 810, 8, N'1')
GO
INSERT [dbo].[tblRE_LugaresBKP] ([id], [Nombre], [Numero], [idEstado], [idTipo], [Orden], [CoordenadaX], [CoordenadaY], [idGrupo], [Foto]) VALUES (35, NULL, 35, 1, 1, 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tblRE_LugaresEstados] ([id], [Nombre]) VALUES (1, N'En funcionamiento')
GO
INSERT [dbo].[tblRE_LugaresEstados] ([id], [Nombre]) VALUES (2, N'En reparación')
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (1, N'Grupo 1', 339, 646)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (2, N'Grupo 2', 280, 502)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (3, N'Grupo 3', 384, 435)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (4, N'Grupo 4', 742, 574)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (5, N'Grupo 5', 874, 538)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (6, N'Grupo 6', 864, 648)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (7, N'Grupo 7', 744, 721)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (8, N'Grupo 8', 870, 784)
GO
INSERT [dbo].[tblRE_LugaresGrupos] ([id], [Nombre], [CoordenadaX], [CoordenadaY]) VALUES (9, N'Grupo 9 ', 607, 799)
GO
INSERT [dbo].[tblRE_LugaresTipos] ([id], [Nombre]) VALUES (1, N'Lugar común')
GO
INSERT [dbo].[tblRE_LugaresTipos] ([id], [Nombre]) VALUES (2, N'Despacho')
GO
INSERT [dbo].[tblRE_LugaresTipos] ([id], [Nombre]) VALUES (3, N'En grupo')
GO
SET IDENTITY_INSERT [dbo].[tblRE_Reservas] ON 
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (43, 10, 1, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (44, 11, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (45, 13, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (59, 30, 2, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (57, 20, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (58, 22, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (60, 29, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (61, 31, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (62, 12, 1, CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (63, 11, 0, CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (64, 13, 0, CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (68, 30, 1, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (69, 29, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (70, 31, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (71, 19, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (72, 20, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (73, 22, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (74, 24, 3, CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (75, 23, 0, CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (76, 16, 2, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (46, 12, 1, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (47, 8, 1, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (48, 7, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (49, 9, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (65, 10, 1, CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (51, 19, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (52, 21, 0, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (66, 11, 0, CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (54, 10, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (55, 12, 0, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (67, 13, 0, CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (77, 12, 1, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (78, 11, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (79, 13, 0, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (80, 2, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (81, 17, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (82, 38, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (83, 7, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (84, 39, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (85, 10, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (86, 6, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (87, 5, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (88, 4, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (89, 34, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (90, 51, 3, CAST(N'2021-05-11T08:30:00.000' AS DateTime), CAST(N'2021-05-12T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (91, 129, 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (1080, 17, 3, CAST(N'2021-05-12T08:30:00.000' AS DateTime), CAST(N'2021-05-13T08:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (1081, 16, 3, CAST(N'2021-05-11T09:30:00.000' AS DateTime), CAST(N'2021-05-12T09:30:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (1082, 128, 3, CAST(N'2021-05-11T09:00:00.000' AS DateTime), CAST(N'2021-05-12T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblRE_Reservas] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta]) VALUES (1083, 17, 3, CAST(N'2021-05-15T08:30:00.000' AS DateTime), CAST(N'2021-05-16T08:30:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblRE_Reservas] OFF
GO
INSERT [dbo].[tblRE_Reservas_DEL] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta], [Fecha_DEL], [Usuario_DEL]) VALUES (41, 33, 1, CAST(N'2021-04-28T00:00:00.000' AS DateTime), CAST(N'2021-04-29T00:00:00.000' AS DateTime), CAST(N'2021-04-28T12:30:10.157' AS DateTime), N'1')
GO
INSERT [dbo].[tblRE_Reservas_DEL] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta], [Fecha_DEL], [Usuario_DEL]) VALUES (42, 3, 1, CAST(N'2021-05-03T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-03T12:26:03.647' AS DateTime), N'1')
GO
INSERT [dbo].[tblRE_Reservas_DEL] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta], [Fecha_DEL], [Usuario_DEL]) VALUES (53, 13, 1, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-05T09:19:51.970' AS DateTime), N'1')
GO
INSERT [dbo].[tblRE_Reservas_DEL] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta], [Fecha_DEL], [Usuario_DEL]) VALUES (56, 21, 1, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-05T12:55:35.847' AS DateTime), N'1')
GO
INSERT [dbo].[tblRE_Reservas_DEL] ([id], [idLugar], [idUsuario], [fechaHoraDesde], [fechaHoraHasta], [Fecha_DEL], [Usuario_DEL]) VALUES (50, 20, 1, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-07T09:43:26.890' AS DateTime), N'1')
GO
INSERT [dbo].[tblRE_Usuarios] ([id], [Usuario], [Nombre], [idPerfil], [Contraseña], [Mail], [Telefono]) VALUES (1, N'Admin', N'Juan', 1, N'1234', N'mjotero@hotmail.com', N'1562352060')
GO
INSERT [dbo].[tblRE_Usuarios] ([id], [Usuario], [Nombre], [idPerfil], [Contraseña], [Mail], [Telefono]) VALUES (2, N'Director', N'Director', 2, N'666', N'guido@gmail.com', N'1559439189')
GO
INSERT [dbo].[tblRE_Usuarios] ([id], [Usuario], [Nombre], [idPerfil], [Contraseña], [Mail], [Telefono]) VALUES (3, N'Empleado', N'Guido', 3, N'1234', N'guido@gmail.com', N'1559439188')
GO
INSERT [dbo].[tblRE_UsuariosPerfiles] ([id], [Nombre]) VALUES (1, N'Desarrollador')
GO
INSERT [dbo].[tblRE_UsuariosPerfiles] ([id], [Nombre]) VALUES (2, N'Director')
GO
INSERT [dbo].[tblRE_UsuariosPerfiles] ([id], [Nombre]) VALUES (3, N'Empleado')
GO
/****** Object:  StoredProcedure [dbo].[SP_MATAMOROS]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE proc  [dbo].[SP_MATAMOROS]
--as

--truncate table   tblRE_Lugares

--declare @ii int
--declare @Filas int
--declare @j int
--declare @Max int
--declare @DeltaY int=0
--declare @DeltaX int=0
--set @Filas=65
--set @ii=1
--print char(@Filas) 
--while @Filas<85
--begin

--if char(@Filas) in ('A','B','C','D','L','M','N')
--	set @Max=30
--else
--	if char(@Filas) in ('T')
--		set @Max=30
--	else
--		set @Max=24
--set  @j=1
--if   char(@Filas) in ('E'  ) set  @DeltaY=@DeltaY +60
--if   char(@Filas) in ( 'P' ) set  @DeltaY=@DeltaY +40
--if   char(@Filas) between  'E' and  'K'  or   char(@Filas) between  'O' and  'S'
--	set  @Deltax=100
--	else
--	set  @Deltax=0
--while @j<@Max
--	begin
	
--	insert into tblRE_Escritorios
--			(id,Nombre, Numero,idEstado, idTipo,CoordenadaX, CoordenadaY)
--	values
--	(@ii, char(@Filas), @j,1,1,143+(@j-1)*40 + @DeltaX ,270 + @DeltaY  + (@Filas-66)  *53)
--		set @j=@j+1
--	set @ii=@ii+1
	
--	end 
	
--	set @Filas=@Filas+1
--end
 
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_DeclaracionJurada_Guardar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RE_DeclaracionJurada_Guardar]
@Usuario int,
@Temperatura varchar(10),
@Fecha datetime ,
@Dolor_De_Garganta char,
@Dificultad_Respiratoria char,
@Dolor_De_Cabeza char,
@Diarrea char,
@Vomitos char,
@Dolor_Muscular char,
@Perdida_De_Olfato char,
@Perdida_De_Gusto char,
@Tos char,
@Contacto_Estrecho char,
@Contacto_Cercano char,
@Cancer char,
@Diabetes char,
@Enfermedad_Hepatica char,
@Enfermedad_Renal char,
@Enfermedad_Respiratoria char,
@Enfermedad_Cardiologica char 
as

declare @Error varchar(200) set @Error=''

insert into tblRE_DeclaracionesJuradas (
Usuario, Temperatura, Fecha, Dolor_De_Garganta, Dificultad_Respiratoria, Dolor_De_Cabeza, Diarrea,
Vomitos, Dolor_Muscular, Perdida_De_Olfato, Perdida_De_Gusto, Tos, Contacto_Estrecho, Contacto_Cercano,
Cancer, Diabetes, Enfermedad_Hepatica, Enfermedad_Renal, Enfermedad_Respiratoria, Enfermedad_Cardiologica)
values (@Usuario, @Temperatura, @Fecha , @Dolor_De_Garganta, @Dificultad_Respiratoria, 
@Dolor_De_Cabeza, @Diarrea, @Vomitos, @Dolor_Muscular, @Perdida_De_Olfato, @Perdida_De_Gusto, @Tos,
@Contacto_Estrecho, @Contacto_Cercano, @Cancer, @Diabetes, @Enfermedad_Hepatica, @Enfermedad_Renal,
@Enfermedad_Respiratoria, @Enfermedad_Cardiologica)

if exists( select Usuario, Fecha from tblRE_DeclaracionesJuradas where Usuario = @Usuario and Fecha = @Fecha)
	BEGIN
		SELECT 'OK'
	END
ELSE
	BEGIN
		SET @Error='No se guardo la declaracion'
		SELECT 'ERROR',@Error AS MensajeResultado,2 AS ErrorTipo
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Escritorios]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
CREATE proc [dbo].[SP_RE_Lugares]
@Usuario int=1,
@Fecha datetime=null

 AS
declare @Perfil int
select  @Perfil=idPerfil from tblRE_Usuarios where id=@Usuario

if @Fecha is null set @Fecha=convert(date, getdate())
SELECT p.[id], p.[CoordenadaX], p.[CoordenadaY], b.FechaHoraDesde, p.Numero,
CASE WHEN p.idEstado = 2 THEN 'Roto'  else
case WHEN b.idUsuario= @Usuario THEN 'OcupadoPorUsuario'   else
case WHEN   b.idUsuario = 0   THEN 'AnuladoPorCercania'    else
case WHEN not b.idUsuario is null THEN 'OcupadoPorOtro'    else
'Libre'  end end end  
END AS Estado, 
CASE WHEN p.idEstado = 2 THEN 'Lugar deshabilitado por reparacion'  else
case WHEN b.idUsuario= @Usuario THEN 'Ya realizó esta reserva'   else
case WHEN   b.idUsuario = 0   THEN 'Lugar anulado por cercania'    else
case WHEN not b.idUsuario is null THEN 'Lugar reservado por otro usuario'    else
'Libre'  end end end  
END AS EstadoDesc,
c.Nombre AS TipoDesc, 
isnull(p.Foto,'1') Foto,
idTipo,p.Nombre

FROM tblRE_Lugares p 
LEFT JOIN 
(select * from tblRE_Reservas where  fechaHoraDesde  =@Fecha)
  b ON b.idLugar= p.id
INNER JOIN tblRE_LugaresTipos c ON c.id = p.idTipo
WHERE NOT [CoordenadaX] IS NULL
and (@Perfil<3 or (@Perfil=3 and  p.idTipo=1 )) 


 
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_EscritoriosFecha]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_RE_LugaresFecha]
 @fecha date
 AS

SELECT p.[id], p.[CoordenadaX], p.[CoordenadaY], b.FechaHoraDesde, p.Numero,
CASE 
	WHEN b.FechaHoraDesde = convert(DATETIME, @fecha, 120) THEN 'danger'
	WHEN p.idEstado = 1 THEN 'primary'
	ELSE 'danger' 
END AS Estado
FROM tblRE_Lugares p 
LEFT JOIN tblRE_Reservas b ON b.idLugar= p.Numero
WHERE NOT [CoordenadaX] IS NULL
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_EscritoriosGrupos]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SP_RE_LugaresGrupos]
 AS

SELECT [id], [CoordenadaX], [CoordenadaY] 
 
FROM [tblRE_LugaresGrupos]
WHERE NOT [CoordenadaX] IS NULL
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Login]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RE_Login]
@User varchar(100), 
@Pass varchar(100)
as
set nocount on
declare @Error varchar(200) set @Error=''
set @User=ltrim(rtrim(@User))

begin
	IF EXISTS ( SELECT Usuario, Contraseña FROM tblRE_Usuarios WHERE Usuario = @User AND Contraseña = @Pass )
	 begin
		SELECT 'OK' AS Mensaje, p.id, p.Usuario, p.Contraseña, p.Nombre, idPerfil, b.Nombre AS Perfil, ISNULL(Mail, '') AS Mail, ISNULL(Telefono, '') AS Telefono
		FROM tblRE_Usuarios p
		INNER JOIN tblRE_UsuariosPerfiles b ON b.id = p.idPerfil
		WHERE Usuario = @User and Contraseña = @Pass
	 end
	 else
	 begin
		set @Error='Error de credenciales!'
		select 'ERROR_LOGIN',@Error as MensajeResultado,2 as ErrorTipo
	 end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Mis_Reservas]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RE_Mis_Reservas]
@User varchar(100), 
@id varchar(100)
as
set nocount on
declare @Error varchar(200) set @Error=''
set @User=ltrim(rtrim(@User))

begin
		SELECT 
		p.id as idReserva, 
		p.idLugar,
		CONVERT(varchar, p.FechaHoraDesde, 105) + ' ' + CONVERT(varchar, p.FechaHoraDesde, 108) as FechaHoraDesde,
		CONVERT(varchar, p.FechaHoraHasta, 105) + ' ' + CONVERT(varchar, p.FechaHoraHasta, 108) as FechaHoraHasta
		,isnull(c.Foto,'1') Foto
		FROM tblRE_Reservas p 
		INNER JOIN tblRE_Usuarios b ON b.id = p.idUsuario 
		inner join  tblRE_Lugares c on c.id=p.idLugar 
		WHERE  p.idUsuario = @id
end
 
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Mis_ReservasAsignar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  procedure [dbo].[SP_RE_Mis_ReservasAsignar]
 as
set nocount on
 
 
SELECT [id], [CoordenadaX], [CoordenadaY], numero,
case when idEstado=1 then 'primary' else 'danger'end as Estado
FROM tblRE_Lugares
WHERE NOT [CoordenadaX] IS NULL
 
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Reserva_Eliminar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE PROCEDURE [dbo].[SP_RE_Reserva_Eliminar] 
@idReserva int,
@Usuario varchar(20)

AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
	IF EXISTS( SELECT b.Usuario, p.idLugar, FechaHoraDesde 
	FROM tblRE_Reservas p INNER JOIN tblRE_Usuarios b ON b.id =p.idUsuario 
	WHERE p.id = @idReserva )
		BEGIN
	        declare @fecha datetime
		    declare @Grupo int
			declare @Lugar int  
			select @Lugar=idLugar , @fecha =convert(date,FechaHoraDesde )  from tblRE_Reservas where id=@idReserva
			
			select @Grupo=idgrupo  from tblRE_Lugares where id=@Lugar
		
			if 	not @Grupo is null
				if not exists(select * from tblRE_Reservas a inner join tblRE_Lugares b on a.idLugar=b.id where idgrupo=@Grupo and not idUsuario=0 and convert(date,FechaHoraDesde )=@fecha) --Veo que si hay otra reserva en el grupo
					begin
					  
					select a.id  into #Reservas0 from tblRE_Reservas a inner join tblRE_Lugares b on a.idLugar=b.id where idgrupo=@Grupo and   idUsuario=0 and convert(date,FechaHoraDesde )=@fecha 
					insert into  tblRE_Reservas_DEL 
					select * , getdate(), @Usuario FROM tblRE_Reservas WHERE id in (Select * from #Reservas0)
					DELETE FROM tblRE_Reservas WHERE   id in (Select * from #Reservas0)
				
					end
				
				
			 

			insert into  tblRE_Reservas_DEL 
			select * , getdate(), @Usuario FROM tblRE_Reservas WHERE id = @idReserva
			DELETE FROM tblRE_Reservas WHERE id = @idReserva


				 
			
		
		
			SELECT 'OK'
		
		
		
		END
	ELSE
		BEGIN
			SET @Error='La reserva no existe'
			SELECT 'ERROR_RESERVA',@Error AS MensajeResultado,2 AS ErrorTipo
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Reserva_Generar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from tblRE_Usuarios
 
 --delete from tblRE_Reservas
--select * from tblRE_Reservas
 
--[SP_RE_Reserva_Generar] 10,'test','20210504','20210504'
CREATE PROCEDURE [dbo].[SP_RE_Reserva_Generar] 
@Lugar int, 
@User varchar(100),
@FechaDesde datetime,
@FechaHasta datetime

AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
declare @idUSer int
select @idUSer=id from tblRE_Usuarios where Usuario = @User 
declare @idREserva varchar(100)

	IF EXISTS( SELECT b.Usuario, p.idLugar, FechaHoraDesde 
	FROM tblRE_Reservas p INNER JOIN tblRE_Usuarios b ON b.id =p.idUsuario 
	WHERE p.idLugar = @Lugar AND p.FechaHoraDesde = @FechaDesde )
		BEGIN
			SET @Error='El escritorio ya esta reservado'
			SELECT 'ERROR_RESERVA',@Error AS MensajeResultado,2 AS ErrorTipo
			return
		END
			declare @Grupo int
			declare @Par int
		
			select @Grupo=idgrupo, @Par=id % 2 from tblRE_Lugares where id=@Lugar
			 	print '@Grupo'
			print @Grupo
			print '@@Par'
			print @Par
			INSERT INTO tblRE_Reservas (idLugar, idUsuario, FechaHoraDesde, FechaHoraHasta) VALUES(@Lugar, @idUser, @FechaDesde, @FechaHasta )
			set @idREserva=@@IDENTITY
			if not  @Grupo is null --Si pertenece a un grupo
				if not exists(select * from tblRE_Reservas a inner join tblRE_Lugares b on a.idLugar=b.id where idgrupo=@Grupo and idUsuario=0 and convert(date,@FechaDesde )=convert(date, fechaHoraDesde)) --Veo que no existan esxritorios anulados en el grupo
					begin
						INSERT INTO tblRE_Reservas (idLugar, idUsuario, FechaHoraDesde, FechaHoraHasta)  
						Select id ,0,@FechaDesde, @FechaHasta
							from tblRE_Lugares where @Grupo=idgrupo and not id % 2 =@Par --Anulo los escritorios Par o  Impar segun corresponda
						print 'Se anularon escritorios par impar'
					end
			SELECT 'OK', 'Su reserva se realizó con éxito. Nro:' + @idREserva
		 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Reserva_Listar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[SP_RE_Reserva_Listar] 
@Usuario int=1,
@Fecha datetime=null

AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
	select '08:30' hora, '08:30 ' Descripcion union all
	select '09:00' hora, '09:00 ' Descripcion union all
	select '09:30' hora, '09:30 ' Descripcion 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Reserva_Obtener]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RE_Reserva_Obtener] 
@idReserva int

AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
	IF EXISTS( SELECT p.id ,b.Usuario, p.idLugar, FechaHoraDesde 
	FROM tblRE_Reservas p INNER JOIN tblRE_Usuarios b ON b.id =p.idUsuario 
	WHERE p.id = @idReserva )
		BEGIN
			SELECT 'OK', p.id, p.idLugar, CONVERT(varchar, p.fechaHoraDesde, 105) as FechaDesde 
			FROM tblRE_Reservas p
			WHERE P.id = @idReserva
		END
	ELSE
		BEGIN
			SET @Error='La reserva no existe'
			SELECT 'ERROR_RESERVA',@Error AS MensajeResultado,2 AS ErrorTipo
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Usuario_Modificar]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RE_Usuario_Modificar]
@idUsuario int,
@Nombre varchar(100)=null, 
@Mail varchar(100)=null, 
@Telefono varchar(50)=null,
@Clave varchar(20)=null
AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
	IF EXISTS (SELECT * from tblRE_Usuarios WHERE id = @idUsuario) 
		BEGIN
			UPDATE tblRE_Usuarios
				SET Nombre = @Nombre, Mail = @Mail, Telefono = @Telefono
				WHERE id = @idUsuario
			IF not (@Clave ='')
				BEGIN
				UPDATE tblRE_Usuarios
					SET Contraseña = @Clave
					WHERE id = @idUsuario
				END
			SELECT 'OK'as Mensaje
		END
	ELSE
		BEGIN
			SET @Error='No se encontro al Usuario'
			SELECT 'ERROR_USUARIO',@Error AS MensajeResultado,2 AS ErrorTipo
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RE_Usuario_Obtener]    Script Date: 12/05/2021 07:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RE_Usuario_Obtener]
@idUsuario int
AS
SET NOCOUNT ON
DECLARE @Error varchar(200) SET @Error=''

BEGIN
	IF EXISTS (SELECT * from tblRE_Usuarios WHERE id = @idUsuario) 
		BEGIN
			SELECT 'OK'as Mensaje, id, Usuario, Contraseña, ISNULL(Nombre, '') AS Nombre, ISNULL(Mail, '') AS Mail, ISNULL(Telefono, '') AS Telefono FROM tblRE_Usuarios WHERE id= @idUsuario
		END
	ELSE
		BEGIN
			SET @Error='El usuario no existe'
			SELECT 'ERROR_USUARIO',@Error AS MensajeResultado,2 AS ErrorTipo
		END
END
GO
