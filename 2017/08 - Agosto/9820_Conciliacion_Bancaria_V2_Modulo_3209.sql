--
--Lea con Atención:
--
--Versión del Script: 1.0
--Creador: Juan Ricardo Cogollo O.
--Fecha de Creación: Junio 08 de 2011
--Descripción: Este Script es indispensable para utilizar el Sistema de Conciliación Bancaría correspondiente
--al modulo 3209 - Conciliación Bancaroa V2


--BASE DE DATOS DONDE SE CORRERÁ EL SCRIPT
--USE NOMBRE_BASE_DE_DATOS


--Iniciar transacción
begin tran
print 'Inició Transacción...'

--Alter necesarios:
--AGREGAR EL CAMPO CONCILIO A LA TABLA EXTRACTO
print 'Alterando campo concilio de la tabla extracto...'
ALTER TABLE EXTRACTO ADD CONCILIO VARCHAR(5) NULL
--CAMBIAR TIPO DE DATO AL CAMPO CONCILIO DE LA TABLA MOVIMIENTO
print 'Alterando campo concilio de la tabla movimiento...'
ALTER TABLE MOVIMIENTO ALTER COLUMN CONCILIO VARCHAR(5) NULL
--AGREGAR CAMPO ID_CRUCE A LAS TABLAS EXTRACTO Y MOVIMIENTO
print 'Agregando campo id_cruce a la tabla extracto...'
ALTER TABLE EXTRACTO ADD ID_CRUCE INT NULL
print 'Agregando campo id_cruce a la tabla movimiento...'
ALTER TABLE MOVIMIENTO ADD ID_CRUCE INT NULL
--AGREGAR CAMPO TIPO_CRUCE A LAS TABLAS EXTRACTO Y MOVIMIENTO
print 'Agregando campo tipo_cruce a la tabla extracto...'
ALTER TABLE EXTRACTO ADD TIPO_CRUCE VARCHAR(5)
print 'Agregando campo tipo_cruce a la tabla movimiento...'
ALTER TABLE MOVIMIENTO ADD TIPO_CRUCE VARCHAR(5)



--Tabla: conciliación:
GO

/****** Object:  Table [dbo].[CONCILIACION]    Script Date: 05/06/2011 12:05:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
print 'Creando tabla conciliacion...'
CREATE TABLE [dbo].[CONCILIACION](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[ESTADO] [varchar](10) NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_cierre] [datetime] NULL,
	[fecha_mod] [datetime] NULL,
	[mes_concilia] [int] NOT NULL,
	[ano_concilia] [int] NOT NULL,
	[saldo_inicial_ext] [money] NULL,
	[saldo_final_ext] [money] NULL,
	[saldo_inicial_mov] [money] NULL,
	[saldo_final_mov] [money] NULL,
	[credito_ext] [money] NULL,
	[debito_ext] [money] NULL,
	[credito_mov] [money] NULL,
	[debito_mov] [money] NULL,
	[usuario_abre] [varchar](20) NOT NULL,
	[usuario_cierra] [varchar](20) NULL,
	[pc_abre] [varchar](20) NOT NULL,
	[pc_cierra] [varchar](20) NULL,
	[reprocesar] [varchar](1) NULL,
 CONSTRAINT [PK_id_conci] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--Tabla: Cruce_Conciliacion
GO

/****** Object:  Table [dbo].[cruce_conciliacion]    Script Date: 05/06/2011 12:05:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

print 'Creando tabla cruce_conciliacion...'

CREATE TABLE [dbo].[cruce_conciliacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_conciliacion] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[pc] [varchar](20) NOT NULL,
	[cuantos_ext] [int] NOT NULL,
	[cuantos_mov] [int] NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[valor_cruzado] [money] NULL,
	[direccion] [bit] NULL,
 CONSTRAINT [PK_id_cruce] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
print 'Agregando integridad referencial a la tabla conciliacíon con la tabla cruce_conciliacion...'
ALTER TABLE [dbo].[cruce_conciliacion]  WITH CHECK ADD  CONSTRAINT [FK_cruce_conci] FOREIGN KEY([id_conciliacion])
REFERENCES [dbo].[CONCILIACION] ([id])
GO

ALTER TABLE [dbo].[cruce_conciliacion] CHECK CONSTRAINT [FK_cruce_conci]
GO


--INTEGRIDADES REFERENCIALES:
--Poner integridad referencial a la tabla movimiento con respecto a la tabla cruce_conciliacion
GO
print 'Agregando integridad referencial a la tabla cruce_conciliacion con la tabla movimiento...'
ALTER TABLE [dbo].[MOVIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_cruce_movi] FOREIGN KEY([id_cruce])
REFERENCES [dbo].[cruce_conciliacion] ([id])
GO

ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_cruce_movi]
GO
--Poner integridad referencial a la tabla extracto con respecto a la tabla cruce_conciliacion
GO
print 'Agregando integridad referencial a la tabla cruce_conciliacion con la tabla extracto...'
ALTER TABLE [dbo].[EXTRACTO]  WITH CHECK ADD  CONSTRAINT [FK_cruce_ext] FOREIGN KEY([id_cruce])
REFERENCES [dbo].[cruce_conciliacion] ([id])
GO

ALTER TABLE [dbo].[EXTRACTO] CHECK CONSTRAINT [FK_cruce_ext]
GO



--Tabla: extractos_pendientes

GO

/****** Object:  Table [dbo].[extractos_pendientes]    Script Date: 05/06/2011 12:05:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
print 'Creando la tabla extractos_pendientes...'
CREATE TABLE [dbo].[extractos_pendientes](
	[ano] [smallint] NOT NULL,
	[mes] [smallint] NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[centro] [int] NOT NULL,
	[nit] [dbo].[Tipo_NIT] NOT NULL,
	[secuencia] [int] NOT NULL,
	[dia] [smallint] NULL,
	[documento] [int] NULL,
	[debito] [money] NULL,
	[credito] [money] NULL,
	[agrupo] [bit] NULL,
	[descripcion] [varchar](80) NULL,
 CONSTRAINT [PK_ext_pen] PRIMARY KEY NONCLUSTERED 
(
	[ano] ASC,
	[mes] ASC,
	[cuenta] ASC,
	[centro] ASC,
	[nit] ASC,
	[secuencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


--Tabla: movimientos_pendientes

GO

/****** Object:  Table [dbo].[movimientos_pendientes]    Script Date: 05/06/2011 12:06:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
print 'Creando la tabla movimientos_pendientes...'
CREATE TABLE [dbo].[movimientos_pendientes](
	[tipo] [varchar](4) NOT NULL,
	[numero] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[centro] [int] NOT NULL,
	[nit] [dbo].[Tipo_NIT] NOT NULL,
	[fec] [datetime] NOT NULL,
	[valor] [money] NOT NULL,
	[documento] [int] NULL,
	[explicacion] [varchar](250) NULL,
 CONSTRAINT [PK_mov_pen] PRIMARY KEY CLUSTERED 
(
	[tipo] ASC,
	[numero] ASC,
	[seq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--Tabla: extractos_pendientes_historia

GO

/****** Object:  Table [dbo].[extractos_pendientes_historia]    Script Date: 05/06/2011 12:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
print 'Creando la tabla extractos_pendientes_historia...'
CREATE TABLE [dbo].[extractos_pendientes_historia](
	[ano] [smallint] NOT NULL,
	[mes] [smallint] NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[centro] [int] NOT NULL,
	[nit] [dbo].[Tipo_NIT] NOT NULL,
	[secuencia] [int] NOT NULL,
	[dia] [smallint] NULL,
	[documento] [int] NULL,
	[debito] [money] NULL,
	[credito] [money] NULL,
	[agrupo] [bit] NULL,
	[descripcion] [varchar](80) NULL,
	[ano_pen] [smallint] NOT NULL,
	[mes_pen] [smallint] NOT NULL,
 CONSTRAINT [PK_ext_pen_his] PRIMARY KEY NONCLUSTERED 
(
	[ano] ASC,
	[mes] ASC,
	[cuenta] ASC,
	[centro] ASC,
	[nit] ASC,
	[secuencia] ASC,
	[ano_pen] ASC,
	[mes_pen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--Tabla: movimientos_pendientes_historia

GO

/****** Object:  Table [dbo].[movimientos_pendientes_historia]    Script Date: 05/06/2011 12:06:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
print 'Creando la tabla movimientos_pendientes_historia...'
CREATE TABLE [dbo].[movimientos_pendientes_historia](
	[tipo] [varchar](4) NOT NULL,
	[numero] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[cuenta] [varchar](20) NOT NULL,
	[centro] [int] NOT NULL,
	[nit] [dbo].[Tipo_NIT] NOT NULL,
	[fec] [datetime] NOT NULL,
	[valor] [money] NOT NULL,
	[documento] [int] NULL,
	[explicacion] [varchar](250) NULL,
	[ano_pen] [smallint] NOT NULL,
	[mes_pen] [smallint] NOT NULL,
 CONSTRAINT [PK_mov_pen_his] PRIMARY KEY CLUSTERED 
(
	[tipo] ASC,
	[numero] ASC,
	[seq] ASC,
	[ano_pen] ASC,
	[mes_pen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--Control de Error
IF @@ERROR<>0 --Si es diferente de cero se presento error
	BEGIN
		print 'Reversando transacción...'
		ROLLBACK TRAN
		print 'La transacción ha sido reversada...'			
	END	
	
	ELSE --Si es igual a cero todo salio bien
	BEGIN
	print 'Guardando la transacción...'
	Commit tran
	END
	
Print 'La transacción ha finalizado satisfactoriamente...'

