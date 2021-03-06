USE [PQRS]
GO
/****** Object:  User [desarrollador]    Script Date: 08/09/2017 15:47:42 ******/

/****** Object:  Table [dbo].[usuariosOffice365]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuariosOffice365](
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	[rol] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'apsistemas@ryrlubricantes.com', N'Sebas123', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'sebas-207@hotmail.com', N'123', 1)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'patricia.gonzalez@ryrlubricantes.com', N'Puqo9946', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'djimenez@ryrlubricantes.com', N'*71363783Jimenez', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'felipe.pineda@ryrlubricantes.com', N'Oriana.posada1..', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'aromero@ryrlubricantes.com', N'4sYRrUIS3', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'maria.salazar@ryrlubricantes.com', N'9cj3Eo4Q7', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'milena.cardona@ryrlubricantes.com', N'blanquitasJ1', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'juan.araque@ryrlubricantes.com', N'OjoRJwuX29', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'mercadeo@ryrlubricantes.com', N'Kuva0970', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'pablo.camacho@ryrlubricantes.com', N'Ryrmobilgv..', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'mmartinez@ryrlubricantes.com', N'9cj3Eo4Q15', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'alejandra.hoyos@ryrlubricantes.com', N'huOLxvTq16', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'diana.trujillo@ryrlubricantes.com', N'Gaco0864', NULL)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'apcalidad@estinsa.com', N'123456', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'administrativo@ryrlubricantes.com', N'OjoRJwuX32', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'juan.rodriguez@zeuss.com.co', N'Jofu5933', 0)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'alejandra.garcia@zeuss.com.co', N'f14mn246ly0', NULL)
INSERT [dbo].[usuariosOffice365] ([usuario], [clave], [rol]) VALUES (N'yurany.lopera@zeuss.com.co', N'Lapicero2012', NULL)
/****** Object:  Table [dbo].[tipo_solicitud]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_solicitud](
	[Tipo_Sol] [varchar](50) NULL,
	[Clasificacion] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Queja', N'Servicio')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Queja', N'Insatisfacción')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Queja', N'Otros')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Despacho Incompleto')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Facturación')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Incumplimiento en fecha de entrega')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Producto en mal estado')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Producto no pedido')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Promoción y publicidad')
INSERT [dbo].[tipo_solicitud] ([Tipo_Sol], [Clasificacion]) VALUES (N'Reclamo', N'Otros')
/****** Object:  Table [dbo].[PoblacionesRyR]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PoblacionesRyR](
	[departamento] [varchar](50) NULL,
	[municipio] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'departamento', N'municipio')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'EL ENCANTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'LA CHORRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'LA PEDRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'LA VICTORIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'LETICIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'MIRITI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'PTO SANTANDER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'PUERTO ALEGRIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'PUERTO ARICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'PUERTO NARINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'AMAZONAS', N'TARAPACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ABEJORRAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ABRIAQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ALEJANDRIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ALTAMIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'AMAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'AMALFI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ANDES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ANGELOPOLIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ANGOSTURA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ANORI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ANZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'APARTADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ARBOLETES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ARGELIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ARMENIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BARBOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BELMIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BETANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BETULIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BOLOMBOLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BRICENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'BURITICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CACERES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAICEDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CALDAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAMPAMENTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAÑASGORDAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CARACOLI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CARAMANTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAREPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CARMEN DE VIBORAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAROLINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CAUCASIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CHIGORODO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CISNEROS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CIUDAD BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'COCORNA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CONCEPCION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'CONCORDIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'COPACABANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'DABEIBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'DON MATIAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'DORADAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'EBEJICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'EL BAGRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'EL PEÑOL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ENTRERRIOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ENVIGADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'FREDONIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'FRONTINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GIRALDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GIRARDOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GOMEZ PLATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GRANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GUADALUPE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GUARNE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'GUATAPE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'HELICONIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'HISPANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ITAGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ITUANGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'JARDIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'JERICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LA CEJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LA ESTRELLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LA PINTADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LA SIERRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LA UNION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'LIBORINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MACEO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MARINILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MEDELLIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MONTEBELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MURINDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'MUTATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'NARINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'NECHI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'NECOCLI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'OLAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PEQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PTO BERRIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PTO NARE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PTO TRIUNFO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PUEBLO RICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'PUERTO SERVIES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'REMEDIOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'RETIRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'RIONEGRO')
GO
print 'Processed 100 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'S JUAN URABA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'S PEDRO URABA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SABANALARGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SABANETA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SALGAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN ANDRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN ANTONIO DE PRADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN CARLOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN CRISTOBAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN FRANCISCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN JERONIMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN JOSE MONTAÑA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN LUIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN PEDRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN RAFAEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN ROQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SAN VICENTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SANTA ROSA DE OSOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SANTAFE DE ANTIOQUIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SANTO DOMINGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SANTUARIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SEGOVIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SONSON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'SOPETRAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'STA BARBARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TAMESIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TARAZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TARSO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TITIRIBI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TOLEDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'TURBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'URAMITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'URRAO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'VALDIVIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'VALPARAISO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'VEGACHI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'VENECIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'VIGIA DL FUERTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'YALI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'YARUMAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'YOLOMBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'YONDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ANTIOQUIA', N'ZARAGOZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'ARAUCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'ARAUQUITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'CRAVO NORTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'FORTUL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'PUERTO RONDON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'SARAVENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ARAUCA', N'TAME')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'BARANOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'BARRANQUILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'CAMPO D CRUZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'CANDELARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'GALAPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'JUAN D ACOSTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'LURUACO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'MALAMBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'MANATI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'PALMAR VARELA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'PIOJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'POLONUEVO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'PONEDERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'PUERTO COLOMBIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'REPELON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SABANAGRANDE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SABANALARGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SANTA LUCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SANTO TOMAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SOLEDAD')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'SUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'TUBARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'ATLANTICO', N'USIACURI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'BOGOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'BOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'ENGATIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'FONTIBON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'SUBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'USAQUEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOGOTA DC', N'USME')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ACHI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ALTOS DE ROSARIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ARENAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ARJONA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ARROYO HONDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'BARRANCO LOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CALAMAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CANTAGALLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CARMEN DE BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CARTAGENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CICUCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CLEMENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'CORDOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'EL GUAMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'EL PENON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'HATILLO DE LOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MAGANGUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MAHATES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MARGARITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MARIA LA BAJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MOMPOS')
GO
print 'Processed 200 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MONTECRISTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'MORALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'PINILLOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'REGIDOR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'RIO VIEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'S JUAN NEPOMU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'S MARTIN LOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN CRISTOBAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN ESTANISLAO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN FERNANDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN JACINTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN JACINTO DEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SAN PABLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SANTA ROSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SIMITI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'SOPLAVIENTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'STA CATALINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'STA ROSA SUR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'TALAIGUA NUEV')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'TIQUISIO(P.RIC)')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'TURBACO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'TURBANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'VILLANUEVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOLIVAR', N'ZAMBRANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'ALMEIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'AQUITANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'ARCABUCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BELEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BELENCITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BERBEO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BETEITIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BOAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BOYACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BRICENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BUENAVISTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'BUSBANZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CALDAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CAMPOHERMOSO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CERINZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHINAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHIQUINQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHIQUIZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHISCAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHITARAQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHIVATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CHIVOR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CIENEGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'COMBITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'COPER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CORRALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'COVARACHIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CUBARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CUCAITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'CUITIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'DUITAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'EL COCUY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'EL ESPINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'FIRAVITOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'FLORESTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GACHANTIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GAMEZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GARAGOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GUACAMAYAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GUATEQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GUAYATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'GUICAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'IZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'JENESANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'JERICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'LA CAPILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'LA UVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'LA VICTORIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'LABRANZAGRAND')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MACANAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MARIPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MIRAFLORES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MONGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MONGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MONIQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MOTAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'MUZO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'NOBSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'NUEVO COLON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'OICATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'OTANCHE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PACHAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAIPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAJARITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PANQUEBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAUNA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PAZ DE RIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PESCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PISBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'PTO BOYACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'QUIPAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'RAMIRIQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'RAQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'RONDON')
GO
print 'Processed 300 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S JOSE D PARE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S JOSE DE LEPUMUSENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S LUIS GACENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S MIGUEL SEMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S PABLO BORBU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'S ROSA VITERB')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SABOYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SACHICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SAMACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SAN EDUARDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SAN MATEO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SANTA MARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SANTA SOFIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SANTANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SATIVANORTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SATIVASUR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SIACHOQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOCHA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOCOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOGAMOSO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOMONDOCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SORA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SORACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SOTAQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SUSACON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SUTAMARCHAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'SUTATENZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TASCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TENZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TIBANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TIBASOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TINJACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TIPACOQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TOCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TOGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TOPAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TUNJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TUNUNGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TURMEQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TUTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'TUTASA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'UMBITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'VENTAQUEMADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'VILLA D LEYVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'VIRACACHA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'BOYACA', N'ZETAQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'AGUADAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'ANSERMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'ARANZAZU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'ARAUCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'ARBOLEDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'BELALCAZAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'BOLIVIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'CHINCHINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'FILADELFIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'FLORENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'LA DORADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'LA MERCED')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MANIZALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MANZANARES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MARMATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MARQUETALIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MARULANDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'MONTEBONITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'NEIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'NORCASIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'NORCASIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'PACORA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'PALESTINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'PENSILVANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'RIOSUCIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'RISARALDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SALAMINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SAMANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SAN FELIX')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SAN JOSE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SAN JOSE DE RIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'SUPIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'VICTORIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'VILLA MARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CALDAS', N'VITERBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'ALBANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'BELEN ANDAQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'CGENA CHAIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'CURILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'EL DONCELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'EL PAUJIL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'FLORENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'GUACAMAYAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'LA MONTANITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'MATICURO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'MILAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'MORELIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'PUERTO RICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'S JOSE FRAGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'S VTE CAGUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'SOLANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'SOLITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'SOLITA')
GO
print 'Processed 400 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAQUETA', N'VALPARAISO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'AGUAZUL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'CHAMEZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'HATO COROZAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'LA SALINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'MANI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'MONTERREY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'NUNCHIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'OROCUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'PAZ D ARIPORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'PORE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'RECETOR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'S LUIS PALENQ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'SABANALARGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'SACAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'TAMARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'TAURAMENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'TRINIDAD')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'VILLA NUEVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CASANARE', N'YOPAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'ALMAGUER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'ARGELIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'BALBOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'BUENOS AIRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'CAJIBIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'CALDONO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'CALOTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'CORINTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'EL TAMBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'FLORENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'GUAPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'INZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'JAMBALO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'LA SIERRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'LA VEGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'LOPEZ DE MICAY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'MERCADERES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'MIRANDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'MORALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'Nulo')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PADILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PAEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PATIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PIAMONTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PIENDAMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'POPAYAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PTO TEJADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'PURACE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'ROSAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SAN SEBASTIAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SANTA ROSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SANTANDER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SANTANDER DE QUILICHAO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SIBERIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SILVIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SOTARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SUAREZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'SUCRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'TIMBIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'TIMBIQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'TORIBIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'TOTORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CAUCA', N'VILLA RICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'AGUACHICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'AGUSTIN CODAZZI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'ASTREA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'BECERRIL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'BOSCONIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'CHIMICHAGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'CHIRIGUANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'CURUMANI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'EL COPEY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'EL PASO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'GAMARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'GONZALEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'LA GLORIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'LA JAGUA IBIRIC')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'LA PAZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'MANAURE B CES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'PAILITAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'PELAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'PUEBLO BELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'PUEBLO BELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'RIO DE ORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'SAN ALBERTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'SAN DIEGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'SAN MARTIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'TAMALAMEQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CESAR', N'VALLEDUPAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'ACANDI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'ALTO  BAUDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'ATRATO (NO USAR)')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'BAGADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'BAHIA SOLANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'BAJO SAN JUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'BELEN DE BAJIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'BELLAVISTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'CANTON DE SAN PABLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'CERTEGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'CONDOTO')
GO
print 'Processed 500 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'EL CARMEN DE ATRATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'EL CARMEN DEL DARIEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'EL LIT SAN JUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'ISTMINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'JURADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'LLORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'MEDIO ATRATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'MEDIO BAUDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'MEDIO SAN JUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'NOVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'NUQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'PIZARRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'QUIBDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'RIO IRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'RIO QUITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'RIOSUCIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'S JOSE PALMAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'SIPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'TADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'UNGUIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CHOCO', N'UNION PANAMERIC')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'AYAPEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'BUENAVISTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CANALETE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CARRILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CERETE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CERROMATOSO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CHIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CHINU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'CIENAGA D ORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'COTORRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'LA APARTADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'LORICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'LOS CEDROS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'LOS CORDOBAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'MOCARI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'MOMIL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'MONITOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'MONTE LIBANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'MONTERIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'PLANETA RICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'POPAYAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'PTO LIBERTADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'PUEBLO NUEVO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'PUERTO ESCONDIDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'PURISIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'S ANDRES SOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'S BERNARDO VT')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'SAHAGUN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'SAN ANTERO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'SAN CARLOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'SAN PELAYO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'TIERRALTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CORDOBA', N'VALENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'AGUA DE DIOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ALBAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ANAPOIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ANOLAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'APULO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ARBELAEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'BELTRAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'BITUIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'BOGOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'BOJACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CABRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CACHIPAY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CAJICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CAPARRAPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CAQUEZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CARMEN D CARUPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CHAGUANI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CHIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CHIPAQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CHOACHI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CHOCONTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'COGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'COTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CUCUNUBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'CUMACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'EL COLEGIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'EL PENON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'EL ROSAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FACATATIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FOMEQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FOSCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FUNZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FUQUENE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'FUSAGASUGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GACHALA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GACHANCIPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GACHETA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GIRARDOT')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GRANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUACHETA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUADUAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUASCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUATAQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUATAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUAYABAL SIQU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUAYABETAL')
GO
print 'Processed 600 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'GUTIERREZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'JERUSALEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'JUNIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LA CALERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LA MESA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LA PALMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LA PENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LA VEGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'LENGUAZAQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'MACHETA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'MADRID')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'MANTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'MEDINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'MOSQUERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'NARINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'NEMOCON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'NILO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'NIMAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'NOCAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PACHO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PAIME')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PANDI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PARATEBUENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PASCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PTO SALGAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'PULI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'QUEBRADANEGRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'QUETAME')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'QUIPILE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'RICAURTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'S ANTONIO TEQ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'S JUAN RIOSEC')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SAN BERNARDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SAN CAYETANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SAN FRANSISCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SASAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SESQUILE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SIBATE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SILVANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SIMIJACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SOACHA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SOPO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SUBACHOQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SUESCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SUPATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SUSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'SUTATAUSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TABIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TAUSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TENJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TIBACUY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TIBIRITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TOCAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TOCANCIPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'TOPAIPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'UBALA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'UBAQUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'UBATE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'UNE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'UTICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VENECIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VERGARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VIANI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VILLA PINZON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VILLAGOMEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VILLETA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'VIOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'YACOPI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ZIPACON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'CUNDINAMARCA', N'ZIPAQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAINIA', N'BARRANCO MINAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAINIA', N'INIRIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAINIA', N'MAPIRIPANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAINIA', N'MIRAFLORES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'ALBANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'BARRANCAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'DIBULLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'DISTRACCION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'EL MOLINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'FONSECA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'HATONUEVO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'LA JAGUA DEL P.')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'MAICAO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'MANAURE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'PTO BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'RIOHACHA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'S JUAN CESAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'URIBIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'URUMITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAJIRA', N'VILLANUEVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAVIARE', N'CALAMAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAVIARE', N'EL RETORNO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAVIARE', N'MIRAFLORES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAVIARE', N'MORICHAL VIEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'GUAVIARE', N'S JOSE GUAVIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'ACEVEDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'AGRADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'AIPE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'ALGECIRAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'ALTAMIRA')
GO
print 'Processed 700 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'BARAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'CAMPOALEGRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'COLOMBIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'ELIAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'GARZON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'GIGANTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'GUADALUPE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'HOBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'IQUIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'ISNOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'LA ARGENTINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'LA PLATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'NATAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'NEIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'OPORAPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'PAICOL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'PALERMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'PALESTINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'PITAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'PITALITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'RIVERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'SALADOBLANCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'SAN AGUSTIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'SANTA MARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'SUAZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'TARQUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'TELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'TERUEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'TESALIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'TIMANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'VEGA LARGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'VILLAVIEJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'HUILA', N'YAGUARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'ALGARROBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'ARACATACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'ARIGUANI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'CERRO S ANTON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'CHIVOLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'CIENAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'CONCORDIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'EL BANCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'EL PINON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'EL RETEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'FUNDACION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'GUAMAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'NUEVA GRANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'PEDRAZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'PIJ.DEL CARMEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'PIVIJAY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'PLATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'PUEBLOVIEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'REMOLINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'S SEBASTIAN B')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SABANAS DE S.MI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SALAMINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SAN ZENON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SANTA ANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SANTA BARBARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SANTA MARTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'SITIONUEVO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'TENERIFE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'ZAPAYAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'MAGDALENA', N'ZONA BANANERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'ACACIAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'B/CA DE UPIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'CABUYARO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'CASTILLA NVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'CUBARRAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'CUMARAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'EL CALVARIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'EL CASTILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'EL DORADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'FUENTE DE ORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'GRANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'GUAMAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'LA MACARENA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'LA URIBE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'LEJANIAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'MAPIRIPAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'MEDELLIN ARIARI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'MEDINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'MESETAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'PTO CONCORDIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'PUERTO GAITAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'PUERTO LLERAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'PUERTO LOPEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'PUERTO RICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'RESTREPO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'S CARLOS GUAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'S JUAN ARAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'SAN JUANITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'SAN MARTIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'VILLAVICENCIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'META', N'VISTA HERMOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'ALDANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'ANCUYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'BARBACOAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'BELEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'BERRUECOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'BUESACO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CARLOSAMA')
GO
print 'Processed 800 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CHACHAGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CONSACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CONTADERO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CORDOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CUMBAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'CUMBITARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'EL CHARCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'EL PENOL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'EL ROSARIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'EL TABLON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'EL TAMBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'FCO PIZARRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'FUNES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'GENOVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'GUACHAVES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'GUACHUCAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'GUAITARILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'GUALMATAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'ILES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'IMUES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'IPIALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'ISCUANDE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LA CRUZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LA FLORIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LA LLANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LA TOLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LA UNION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LEIVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'LINARES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'MOSQUERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'NARINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'OLAYA HERRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'OSPINA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PASTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PAYAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PIEDRANCHA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'POLICARPA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'POTOSI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PROVIDENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PUERRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'PUPIALES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'RICAURTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAMANIEGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAN BERNARDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAN JOSE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAN JOSE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAN LORENZO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAN PABLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SANDONA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SAPUYES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SN PEDRO CARTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'SOTOMAYOR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'TAMINANGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'TANGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'TUMACO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'TUQUERRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NARIÑO', N'YACUANQUER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'ABREGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'ARBOLEDAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'BOCHALEMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'BUCARASICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CACHIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CACOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CHINACOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CHITAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CONVENCION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CUCUTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'CUCUTILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'DURANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'EL CARMEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'EL TARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'EL ZULIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'GIBRALTAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'GRAMALOTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'HACARI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'HERRAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LA ESPERANZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LA GABARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LA PLAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LA VEGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LABATECA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LAS MERCEDES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LOS PATIOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'LOURDES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'MUTISCUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'OCANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'PAMPLONA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'PAMPLONITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'PTO SANTANDER')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'RAGONVALIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SALAZAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SAN CALIXTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SAN CAYETANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SANTIAGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SARDINATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'SILOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'TEORAMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'TIBU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'TOLEDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'VILLA CARO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'NORTE DE SANTANDER', N'VILLA ROSARIO')
GO
print 'Processed 900 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'COLON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'LA HORMIGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'MOCOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'ORITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'PTO LEGUIZAMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'PUERTO ASIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'PUERTO CAICEDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'PUERTO GUZMAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'SAN FRANCISCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'SAN MIGUEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'SANTIAGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'SIBUNDOY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'PUTUMAYO', N'VILLAGARZON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'ARMENIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'BARCELONA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'BUENAVISTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'CALARCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'CIRCASIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'CORDOBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'FILANDIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'GENOVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'LA TEBAIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'MONTENEGRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'PIJAO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'QUIMBAYA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'QUINDIO', N'SALENTO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'APIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'BALBOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'BELEN UMBRIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'DOSQUEBRADAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'GUATICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'LA CELIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'LA VIRGINIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'MARSELLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'MISTRATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'PEREIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'PUEBLO RICO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'QUINCHIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'S ROSA CABAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'RISARALDA', N'SANTUARIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SAN ANDRES', N'PROVIDENCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SAN ANDRES', N'SAN ANDRES(I)')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'AGUADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ALBANIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ARATOCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BARBOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BARICHARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BARRANCABERMEJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BETULIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'BUCARAMANGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CABRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CALIFORNIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CAPITANEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CARCASI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CEPITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CERRITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CHARALA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CHARTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CHIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CHIPATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CIMITARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CONCEPCION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CONFINES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CONTRATACION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'COROMORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'CURITI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'EL CARMEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'EL CENTRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'EL GUACAMAYO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'EL PENON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'EL PLAYON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ENCINO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ENCISO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'FLORIAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'FLORIDABLANCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GALAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GAMBITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GIRON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GUACA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GUADALUPE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GUAPOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GUAVATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'GUEPSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'HATO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'JESUS MARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'JORDAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'LA BELLEZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'LA PAZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'LANDAZURI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'LEBRIJA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'LOS SANTOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'MACARAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'MALAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'MATANZA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'MOGOTES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'MOLAGAVITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'OCAMONTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'OIBA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ONZAGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PALMAR')
GO
print 'Processed 1000 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PALMAS SOCORRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PARAMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PIEDECUESTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PINCHOTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PTE NACIONAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PTO WILCHES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'PUERTO PARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'RIONEGRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'S HELENA OPON')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'S VTE CHUCURY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SABANA TORRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN ANDRES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN BENITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN FRANCISCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN GIL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN JOAQUIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN JOSE DE MIRANDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN JOSE DE S')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SAN MIGUEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SANTA BARBARA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SIMACOTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SOCORRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SUAITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SUCRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'SURATA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'TONA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'VALLE SN JOSE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'VELEZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'VETAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'VILLANUEVA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SANTANDER', N'ZAPATOCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'BUENAVISTA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'CAIMITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'CHALAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'COROZAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'COVENAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'EL ROBLE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'GUARANDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'LA UNION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'LOS PALMITOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'MAJAGUAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'MORROA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'NUEVA GRANADA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'OVEJAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'PALMITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'RICAURTE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'S JUAN BETULI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'S.BENITO ABAD')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SAMPUES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SAN MARCOS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SAN ONOFRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SAN PEDRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SINCE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SINCELEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'SUCRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'TOLU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'SUCRE', N'TOLUVIEJO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ALPUJARRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ALVARADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'AMBALEMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ANZOATEGUI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ATACO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CADIZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CAJAMARCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CARMEN APICALA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CASABIANCA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CHAPARRAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CHICORAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'COELLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'COYAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'CUNDAY')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'DOLORES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ESPINAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'FALAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'FLANDES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'FRESNO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'GAITANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'GUAMO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'GUAYABAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'HERRERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'HERVEO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'HONDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'IBAGUE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ICONONZO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'JUNIN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'LERIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'LIBANO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'MARIQUITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'MELGAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'MURILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'NATAGAIMA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ORTEGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PALO CABILDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PALOCABILDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PIEDRAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PLANADAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PLAYA RICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PRADO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'PURIFICACION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'RIOBLANCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'RONCESVALLES')
GO
print 'Processed 1100 total records'
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'ROVIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SALDANA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SAN ANTONIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SAN LUIS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SANTA ISABEL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SANTA TERESA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SANTIAGO PEREZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'SUAREZ')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'TRES ESQUINAS')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'VALLE S JUAN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'VENADILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'VILLAHERMOSA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'TOLIMA', N'VILLARICA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ALCALA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ANDALUCIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ANSERMANUEVO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ARGELIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'BOLIVAR')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'BUENAVENTURA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'BUGA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'BUGALAGRANDE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'CAICEDONIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'CALI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'CANDELARIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'CARTAGO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'DAGUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'DARIEN')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'EL AGUILA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'EL CAIRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'EL CERRITO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'EL DOVIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'FLORIDA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'GINEBRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'GUACARI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'JAMUNDI')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'LA CUMBRE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'LA UNION')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'LA VICTORIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'OBANDO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'PALMIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'PRADERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'RESTREPO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'RIOFRIO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ROLDANILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'SAN PEDRO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'SEVILLA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'TORO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'TRUJILLO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'TULUA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ULLOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'VERSALLES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'VIJES')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'YOTOCO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'YUMBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VALLE', N'ZARZAL')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VAUPES', N'CARURU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VAUPES', N'MITU')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VAUPES', N'PACOA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VAUPES', N'TARAIRA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VAUPES', N'YAVARATE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'CUMARIBO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'NVA ANTIOQUIA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'PRIMAVERA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'PTO CARRENO')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'S JOSE  OCUNE')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'SANTA RITA')
INSERT [dbo].[PoblacionesRyR] ([departamento], [municipio]) VALUES (N'VICHADA', N'SANTA ROSALIA')
USE [msdb]
GO
/****** Object:  StoredProcedure [dbo].[sp_send_dbmail]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- sp_send_dbmail : Sends a mail from Yukon outbox.
--
CREATE PROCEDURE [dbo].[sp_send_dbmail]
   @profile_name               sysname    = NULL,        
   @recipients                 VARCHAR(MAX)  = NULL, 
   @copy_recipients            VARCHAR(MAX)  = NULL,
   @blind_copy_recipients      VARCHAR(MAX)  = NULL,
   @subject                    NVARCHAR(255) = NULL,
   @body                       NVARCHAR(MAX) = NULL, 
   @body_format                VARCHAR(20)   = NULL, 
   @importance                 VARCHAR(6)    = 'NORMAL',
   @sensitivity                VARCHAR(12)   = 'NORMAL',
   @file_attachments           NVARCHAR(MAX) = NULL,  
   @query                      NVARCHAR(MAX) = NULL,
   @execute_query_database     sysname       = NULL,  
   @attach_query_result_as_file BIT          = 0,
   @query_attachment_filename  NVARCHAR(260) = NULL,  
   @query_result_header        BIT           = 1,
   @query_result_width         INT           = 256,            
   @query_result_separator     CHAR(1)       = ' ',
   @exclude_query_output       BIT           = 0,
   @append_query_error         BIT           = 0,
   @query_no_truncate          BIT           = 0,
   @query_result_no_padding    BIT           = 0,
   @mailitem_id               INT            = NULL OUTPUT,
   @from_address               VARCHAR(max)  = NULL,
   @reply_to                   VARCHAR(max)  = NULL
  WITH EXECUTE AS 'dbo'
AS
BEGIN
    SET NOCOUNT ON

    -- And make sure ARITHABORT is on. This is the default for yukon DB's
    SET ARITHABORT ON

    --Declare variables used by the procedure internally
    DECLARE @profile_id         INT,
            @temp_table_uid     uniqueidentifier,
            @sendmailxml        VARCHAR(max),
            @CR_str             NVARCHAR(2),
            @localmessage       NVARCHAR(255),
            @QueryResultsExist  INT,
            @AttachmentsExist   INT,
            @RetErrorMsg        NVARCHAR(4000), --Impose a limit on the error message length to avoid memory abuse 
            @rc                 INT,
            @procName           sysname,
            @trancountSave      INT,
            @tranStartedBool    INT,
            @is_sysadmin        BIT,
            @send_request_user  sysname,
            @database_user_id   INT,
            @sid                varbinary(85)

    -- Initialize 
    SELECT  @rc                 = 0,
            @QueryResultsExist  = 0,
            @AttachmentsExist   = 0,
            @temp_table_uid     = NEWID(),
            @procName           = OBJECT_NAME(@@PROCID),
            @tranStartedBool    = 0,
            @trancountSave      = @@TRANCOUNT,
            @sid                = NULL

    EXECUTE AS CALLER
       SELECT @is_sysadmin       = IS_SRVROLEMEMBER('sysadmin'),
              @send_request_user = SUSER_SNAME(),
              @database_user_id  = USER_ID()
    REVERT

    --Check if SSB is enabled in this database
    IF (ISNULL(DATABASEPROPERTYEX(DB_NAME(), N'IsBrokerEnabled'), 0) <> 1)
    BEGIN
       RAISERROR(14650, 16, 1)
       RETURN 1
    END

    --Report error if the mail queue has been stopped. 
    --sysmail_stop_sp/sysmail_start_sp changes the receive status of the SSB queue
    IF NOT EXISTS (SELECT * FROM sys.service_queues WHERE name = N'ExternalMailQueue' AND is_receive_enabled = 1)
    BEGIN
       RAISERROR(14641, 16, 1)
       RETURN 1
    END

    -- Get the relevant profile_id 
    --
    IF (@profile_name IS NULL)
    BEGIN
        -- Use the global or users default if profile name is not supplied
        SELECT TOP (1) @profile_id = pp.profile_id
        FROM msdb.dbo.sysmail_principalprofile as pp
        WHERE (pp.is_default = 1) AND
            (dbo.get_principal_id(pp.principal_sid) = @database_user_id OR pp.principal_sid = 0x00)
        ORDER BY dbo.get_principal_id(pp.principal_sid) DESC

        --Was a profile found
        IF(@profile_id IS NULL)
        BEGIN
            -- Try a profile lookup based on Windows Group membership, if any
            EXEC @rc = msdb.dbo.sp_validate_user @send_request_user, @sid OUTPUT
            IF (@rc = 0)
            BEGIN
                SELECT TOP (1) @profile_id = pp.profile_id
                FROM msdb.dbo.sysmail_principalprofile as pp
                WHERE (pp.is_default = 1) AND
                      (pp.principal_sid = @sid)
                ORDER BY dbo.get_principal_id(pp.principal_sid) DESC
            END

            IF(@profile_id IS NULL)
            BEGIN
                RAISERROR(14636, 16, 1)
                RETURN 1
            END
        END
    END
    ELSE
    BEGIN
        --Get primary account if profile name is supplied
        EXEC @rc = msdb.dbo.sysmail_verify_profile_sp @profile_id = NULL, 
                         @profile_name = @profile_name, 
                         @allow_both_nulls = 0, 
                         @allow_id_name_mismatch = 0,
                         @profileid = @profile_id OUTPUT
        IF (@rc <> 0)
            RETURN @rc

        --Make sure this user has access to the specified profile.
        --sysadmins can send on any profiles
        IF ( @is_sysadmin <> 1)
        BEGIN
            --Not a sysadmin so check users access to profile
            iF NOT EXISTS(SELECT * 
                        FROM msdb.dbo.sysmail_principalprofile 
                        WHERE ((profile_id = @profile_id) AND
                                (dbo.get_principal_id(principal_sid) = @database_user_id OR principal_sid = 0x00)))
            BEGIN
                EXEC msdb.dbo.sp_validate_user @send_request_user, @sid OUTPUT
                IF(@sid IS NULL)
                BEGIN
                    RAISERROR(14607, -1, -1, 'profile')
                    RETURN 1
                END
            END
        END
    END

    --Attach results must be specified
    IF @attach_query_result_as_file IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'attach_query_result_as_file')
       RETURN 2
    END

    --No output must be specified
    IF @exclude_query_output IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'exclude_query_output')
       RETURN 3
    END

    --No header must be specified
    IF @query_result_header IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'query_result_header')
       RETURN 4
    END

    -- Check if query_result_separator is specifed
    IF @query_result_separator IS NULL OR DATALENGTH(@query_result_separator) = 0
    BEGIN
       RAISERROR(14618, 16, 1, 'query_result_separator')
       RETURN 5
    END

    --Echo error must be specified
    IF @append_query_error IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'append_query_error')
       RETURN 6
    END

    --@body_format can be TEXT (default) or HTML
    IF (@body_format IS NULL)
    BEGIN
       SET @body_format = 'TEXT'
    END
    ELSE
    BEGIN
       SET @body_format = UPPER(@body_format)

       IF @body_format NOT IN ('TEXT', 'HTML') 
       BEGIN
          RAISERROR(14626, 16, 1, @body_format)
          RETURN 13
       END
    END

    --Importance must be specified
    IF @importance IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'importance')
       RETURN 15
    END

    SET @importance = UPPER(@importance)

    --Importance must be one of the predefined values
    IF @importance NOT IN ('LOW', 'NORMAL', 'HIGH')
    BEGIN
       RAISERROR(14622, 16, 1, @importance)
       RETURN 16
    END

    --Sensitivity must be specified
    IF @sensitivity IS NULL
    BEGIN
       RAISERROR(14618, 16, 1, 'sensitivity')
       RETURN 17
    END

    SET @sensitivity = UPPER(@sensitivity)

    --Sensitivity must be one of predefined values
    IF @sensitivity NOT IN ('NORMAL', 'PERSONAL', 'PRIVATE', 'CONFIDENTIAL')
    BEGIN
       RAISERROR(14623, 16, 1, @sensitivity)
       RETURN 18
    END

    --Message body cannot be null. Atleast one of message, subject, query,
    --attachments must be specified.
    IF( (@body IS NULL AND @query IS NULL AND @file_attachments IS NULL AND @subject IS NULL)
       OR
    ( (LEN(@body) IS NULL OR LEN(@body) <= 0)  
       AND (LEN(@query) IS NULL  OR  LEN(@query) <= 0)
       AND (LEN(@file_attachments) IS NULL OR LEN(@file_attachments) <= 0)
       AND (LEN(@subject) IS NULL OR LEN(@subject) <= 0)
    )
    )
    BEGIN
       RAISERROR(14624, 16, 1, '@body, @query, @file_attachments, @subject')
       RETURN 19
    END   
    ELSE
       IF @subject IS NULL OR LEN(@subject) <= 0
          SET @subject='SQL Server Message'

    --Recipients cannot be empty. Atleast one of the To, Cc, Bcc must be specified
    IF ( (@recipients IS NULL AND @copy_recipients IS NULL AND 
       @blind_copy_recipients IS NULL
        )     
       OR
        ( (LEN(@recipients) IS NULL OR LEN(@recipients) <= 0)
       AND (LEN(@copy_recipients) IS NULL OR LEN(@copy_recipients) <= 0)
       AND (LEN(@blind_copy_recipients) IS NULL OR LEN(@blind_copy_recipients) <= 0)
        )
    )
    BEGIN
       RAISERROR(14624, 16, 1, '@recipients, @copy_recipients, @blind_copy_recipients')
       RETURN 20
    END

    --If query is not specified, attach results and no header cannot be true.
    IF ( (@query IS NULL OR LEN(@query) <= 0) AND @attach_query_result_as_file = 1)
    BEGIN
       RAISERROR(14625, 16, 1)
       RETURN 21
    END

    --
    -- Execute Query if query is specified
    IF ((@query IS NOT NULL) AND (LEN(@query) > 0))
    BEGIN
        EXECUTE AS CALLER
        EXEC @rc = sp_RunMailQuery 
                    @query                     = @query,
               @attach_results            = @attach_query_result_as_file,
                    @query_attachment_filename = @query_attachment_filename,
               @no_output                 = @exclude_query_output,
               @query_result_header       = @query_result_header,
               @separator                 = @query_result_separator,
               @echo_error                = @append_query_error,
               @dbuse                     = @execute_query_database,
               @width                     = @query_result_width,
                @temp_table_uid            = @temp_table_uid,
            @query_no_truncate         = @query_no_truncate,
            @query_result_no_padding           = @query_result_no_padding
      -- This error indicates that query results size was over the configured MaxFileSize.
      -- Note, an error has already beed raised in this case
      IF(@rc = 101)
         GOTO ErrorHandler;
         REVERT
 
         -- Always check the transfer tables for data. They may also contain error messages
         -- Only one of the tables receives data in the call to sp_RunMailQuery
         IF(@attach_query_result_as_file = 1)
         BEGIN
             IF EXISTS(SELECT * FROM sysmail_attachments_transfer WHERE uid = @temp_table_uid)
            SET @AttachmentsExist = 1
         END
         ELSE
         BEGIN
             IF EXISTS(SELECT * FROM sysmail_query_transfer WHERE uid = @temp_table_uid AND uid IS NOT NULL)
            SET @QueryResultsExist = 1
         END

         -- Exit if there was an error and caller doesn't want the error appended to the mail
         IF (@rc <> 0 AND @append_query_error = 0)
         BEGIN
            --Error msg with be in either the attachment table or the query table 
            --depending on the setting of @attach_query_result_as_file
            IF(@attach_query_result_as_file = 1)
            BEGIN
               --Copy query results from the attachments table to mail body
               SELECT @RetErrorMsg = CONVERT(NVARCHAR(4000), attachment)
               FROM sysmail_attachments_transfer 
               WHERE uid = @temp_table_uid
            END
            ELSE
            BEGIN
               --Copy query results from the query table to mail body
               SELECT @RetErrorMsg = text_data 
               FROM sysmail_query_transfer 
               WHERE uid = @temp_table_uid
            END

            GOTO ErrorHandler;
         END
         SET @AttachmentsExist = @attach_query_result_as_file
    END
    ELSE
    BEGIN
        --If query is not specified, attach results cannot be true.
        IF (@attach_query_result_as_file = 1)
        BEGIN
           RAISERROR(14625, 16, 1)
           RETURN 21
        END
    END

    --Get the prohibited extensions for attachments from sysmailconfig.
    IF ((@file_attachments IS NOT NULL) AND (LEN(@file_attachments) > 0)) 
    BEGIN
        EXECUTE AS CALLER
        EXEC @rc = sp_GetAttachmentData 
                        @attachments = @file_attachments, 
                        @temp_table_uid = @temp_table_uid,
                        @exclude_query_output = @exclude_query_output
        REVERT
        IF (@rc <> 0)
            GOTO ErrorHandler;
        
        IF EXISTS(SELECT * FROM sysmail_attachments_transfer WHERE uid = @temp_table_uid)
            SET @AttachmentsExist = 1
    END

    -- Start a transaction if not already in one. 
    -- Note: For rest of proc use GOTO ErrorHandler for falures  
    if (@trancountSave = 0) 
       BEGIN TRAN @procName

    SET @tranStartedBool = 1

    -- Store complete mail message for history/status purposes  
    INSERT sysmail_mailitems
    (
       profile_id,   
       recipients,
       copy_recipients,
       blind_copy_recipients,
       subject,
       body, 
       body_format, 
       importance,
       sensitivity,
       file_attachments,  
       attachment_encoding,
       query,
       execute_query_database,
       attach_query_result_as_file,
       query_result_header,
       query_result_width,          
       query_result_separator,
       exclude_query_output,
       append_query_error,
       send_request_user,
       from_address,
       reply_to
    )
    VALUES
    (
       @profile_id,        
       @recipients, 
       @copy_recipients,
       @blind_copy_recipients,
       @subject,
       @body, 
       @body_format, 
       @importance,
       @sensitivity,
       @file_attachments,  
       'MIME',
       @query,
       @execute_query_database,  
       @attach_query_result_as_file,
       @query_result_header,
       @query_result_width,            
       @query_result_separator,
       @exclude_query_output,
       @append_query_error,
       @send_request_user,
       @from_address,
       @reply_to
    )

    SELECT @rc          = @@ERROR,
           @mailitem_id = SCOPE_IDENTITY()

    IF(@rc <> 0)
        GOTO ErrorHandler;

    --Copy query into the message body
    IF(@QueryResultsExist = 1)
    BEGIN
      -- if the body is null initialize it
        UPDATE sysmail_mailitems
        SET body = N''
        WHERE mailitem_id = @mailitem_id
        AND body is null

        --Add CR, a \r followed by \n, which is 0xd and then 0xa
        SET @CR_str = CHAR(13) + CHAR(10)
        UPDATE sysmail_mailitems
        SET body.WRITE(@CR_str, NULL, NULL)
        WHERE mailitem_id = @mailitem_id

   --Copy query results to mail body
        UPDATE sysmail_mailitems
        SET body.WRITE( (SELECT text_data from sysmail_query_transfer WHERE uid = @temp_table_uid), NULL, NULL )
        WHERE mailitem_id = @mailitem_id

    END

    --Copy into the attachments table
    IF(@AttachmentsExist = 1)
    BEGIN
        --Copy temp attachments to sysmail_attachments      
        INSERT INTO sysmail_attachments(mailitem_id, filename, filesize, attachment)
        SELECT @mailitem_id, filename, filesize, attachment
        FROM sysmail_attachments_transfer
        WHERE uid = @temp_table_uid
    END

    -- Create the primary SSB xml maessage
    SET @sendmailxml = '<requests:SendMail xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.microsoft.com/databasemail/requests RequestTypes.xsd" xmlns:requests="http://schemas.microsoft.com/databasemail/requests"><MailItemId>'
                        + CONVERT(NVARCHAR(20), @mailitem_id) + N'</MailItemId></requests:SendMail>'

    -- Send the send request on queue.
    EXEC @rc = sp_SendMailQueues @sendmailxml
    IF @rc <> 0
    BEGIN
       RAISERROR(14627, 16, 1, @rc, 'send mail')
       GOTO ErrorHandler;
    END

    -- Print success message if required
    IF (@exclude_query_output = 0)
    BEGIN
       SET @localmessage = FORMATMESSAGE(14635)
       PRINT @localmessage
    END  

    --
    -- See if the transaction needs to be commited
    --
    IF (@trancountSave = 0 and @tranStartedBool = 1)
       COMMIT TRAN @procName

    -- All done OK
    goto ExitProc;

    -----------------
    -- Error Handler
    -----------------
ErrorHandler:
    IF (@tranStartedBool = 1) 
       ROLLBACK TRAN @procName

    ------------------
    -- Exit Procedure
    ------------------
ExitProc:
   
    --Always delete query and attactment transfer records. 
   --Note: Query results can also be returned in the sysmail_attachments_transfer table
    DELETE sysmail_attachments_transfer WHERE uid = @temp_table_uid
    DELETE sysmail_query_transfer WHERE uid = @temp_table_uid

   --Raise an error it the query execution fails
   -- This will only be the case when @append_query_error is set to 0 (false)
   IF( (@RetErrorMsg IS NOT NULL) AND (@exclude_query_output=0) )
   BEGIN
      RAISERROR(14661, -1, -1, @RetErrorMsg)
   END

    RETURN (@rc)
END
GO
USE [PQRS]
GO
/****** Object:  Table [dbo].[ResponsablesQyR]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResponsablesQyR](
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[roles] [bit] NULL,
	[nombreGerente] [varchar](50) NULL,
	[gerente] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'GONZALEZ ALVAREZ PATRICIA ELENA', N'patricia.gonzalez@ryrlubricantes.com', 1, N'RAUL SUAREZ', N'ryr@ryrlubricantes.com', N'Antioquia y Choco')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'JUAN MIGUEL RODRIGUEZ', N'juan.rodriguez@zeuss.com.co', 1, N'RAUL SUAREZ', N'ryr@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'PINEDA AGUDELO ANDRES FELIPE', N'felipe.pineda@ryrlubricantes.com', 1, N'RAUL SUAREZ', N'ryr@ryrlubricantes.com', N'Antioquia y Choco')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'ROMERO RODRIGUEZ ADRIAN', N'aromero@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Bogota')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'SALAZAR VELASQUEZ MARIA ALEJANDRA', N'maria.salazar@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Costa')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'CARDONA CORREA CLAUDIA MILENA', N'milena.cardona@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Eje Cafetero y Valle')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'ARAQUE OCHOA JUAN CARLOS', N'gerenciaventas@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'RAMIREZ HINCAPIE JUAN SEBASTIAN', N'administrativo@ryrlubricantes.com', 1, N'JUAN MIGUEL RODRIGUEZ', N'juan.rodriguez@zeuss.com.co', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'HOYOS JUAN', N'juan.hoyos@estinsa.com', 1, N'RAUL SUAREZ', N'ryr@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'TRUJILLO OSORIO DIANA PATRICIA', N'mercadeo@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'CAMACHO PABLO', N'pablo.camacho@ryrlubricantes.com', 1, N'RAUL SUAREZ', N'ryr@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'YURANY LOPERA', N'yurany.lopera@zeuss.com.co', 1, N'JUAN MIGUEL RODRIGUEZ', N'juan.rodriguez@zeuss.com.co', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'MISAEL ORLANDO MARTINEZ URUEÑA', N'mmartinez@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'JOHANA GOMEZ', N' johana.gomez@estinsa.com    ', 1, N'PATRICIA GONZALEZ', N'patricia.gonzalez@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'ALEJANDRA HOYOS', N'alejandra.hoyos@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Antioquia y Chocó')
INSERT [dbo].[ResponsablesQyR] ([nombre], [correo], [roles], [nombreGerente], [gerente], [Departamento]) VALUES (N'DIANA MARCELA', N'diana.arteaga@ryrlubricantes.com', 1, N'PABLO CAMACHO', N'pablo.camacho@ryrlubricantes.com', N'Antioquia y Chocó')
/****** Object:  Table [dbo].[QyR]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QyR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empresa] [varchar](50) NULL,
	[contacto] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[departamento] [varchar](50) NULL,
	[mensaje] [text] NULL,
	[primer_contacto] [varchar](1000) NULL,
	[area_apoyo] [varchar](50) NULL,
	[fecha_primer_contacto] [datetime] NULL,
	[informe_area] [varchar](1000) NULL,
	[fecha_area] [datetime] NULL,
	[solucion] [varchar](1000) NULL,
	[seguimiento] [varchar](1000) NULL,
	[respuesta] [varchar](1000) NULL,
	[fecha_respuesta] [datetime] NULL,
	[adjunto_respuesta] [nvarchar](200) NULL,
	[adjunto_solucion] [nvarchar](200) NULL,
	[fecha] [datetime] NULL,
	[fecha_solucion] [datetime] NULL,
	[estado] [varchar](50) NULL,
	[ciudad] [varchar](50) NULL,
	[responsable] [varchar](50) NULL,
	[tipo_persona] [varchar](50) NULL,
	[tipo_solicitud] [varchar](50) NULL,
	[queja_por] [varchar](50) NULL,
	[responsable_notificado] [varchar](50) NULL,
	[recordatorio] [bit] NULL,
	[envio_resp] [bit] NULL,
	[tipo_cliente] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[QyR] ON
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (3, N'', N'Misael Martinez Urueña ', N'mmartinez@ryrlubricantes.com', N'3176481478', N'3176481478', N'Antioquia y Chocó', N'Cliente Enertem se logra hacer su migración a MD MX ESP en el mes de Octubre se envía al área de operaciones sugeridos de consumos para las diferentes sedes con tiempo suficiente de antelación .Hemos tenido bastante problemas en la migración por falta de producto en la planta de ExxonMobil requerimos tener una pronta solución al caso o en su defecto un plan de contingencia con el cliente que debe venir por parte de operaciones. ', N'Se habla con Misael se solicita un poco mas de explicación de la reclamación se evidencia que hace mas de un mes no se tiene el producto y estamos con la estrategia de migración. ', N'', CAST(0x0000A6C80096DFD3 AS DateTime), N'se realizo la investigación respectiva y se identificaron problemas desde la fuente principal que es ExxonMobil, debido a la demanda tan alta que ha tenido y la restricción de producción por motivos internos del proveedor no pudieron despachar el producto solicitado, el producto ya llego a las bodegas y se lograron estabilizar los stock y enviar el producto al cliente ENERTEM.', CAST(0x0000A6DD00B41C13 AS DateTime), N'', N'Se hablo con el gerente de B2B y en su momento se le soluciono el problema al cliente quedando satisfecho y sin inconvenientes por el mismo tema a la fecha', N'se contacto al cliente y se le informo que el producto ya había llegado a las bodega y los stock se habían estabilizado informando la investigación realizada', CAST(0x0000A6DD00B41C19 AS DateTime), N'', N'', CAST(0x0000A6C100A40DE2 AS DateTime), CAST(0x0000A6DD00B41C20 AS DateTime), N'Cerrado', NULL, N'administrativo@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Despacho incompleto', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (4, N'', N'Milena Cardona C', N'milena.cardona@ryrlubricantes.com', N'3175481541', N'3175481541', N'Eje Cafetero y Valle', N'Llevamos ya dos meses en la zona del Eje Cafetero sin los siguientes productos:


MX ESP GALON Y EN GARRAFA
OUTOBOARD PINTAS Y CUARTOS, MUY POQUITO Y HEMOS PERDIDO VENTAS
MOBIL 1 10W40  EN GALONES.
MOBIL 1 ESP FORMULA 5W30 EN GALONES
MOBIL SPECIAL ALTO KILOMETRAJE EN GALONES

Lo que nos ocasiona perder oportunidades para ventas cruzadas que puedan mejorar la rentabilidad de la zona.
', N'Se hablo con Milena se reviso a fondo la reclamación,  el Mobil 10w40 y 5w30 ya se tiene en inventario pero en este momento sigue pendiente el Mobil MX ESP.', N'', CAST(0x0000A6C800B4F617 AS DateTime), N'se realizo la investigación respectiva sobre los productos que informo el cliente y se identifico problemas de escasez desde la fuente principal que es ExxonMobil  por motivos de los componente bases de los productos, se identificaron demoras en llegada de productos importados, los productos llegaron a la bodega y se estabilizaron los stock de estos productos.', CAST(0x0000A6DD00AF315E AS DateTime), N'', N'Se verifica telefónicamente si el cliente quedo satisfecho con la información obteniendo una respuesta satisfactoria.', N'se contacta al cliente el seguimiento y la investigación sobre los problemas que se han tenido desde la fuente principal y se le informa que los productos ya habían llegado a la bodega ', CAST(0x0000A6DD00AF3164 AS DateTime), N'', N'', CAST(0x0000A6C100FEB7A5 AS DateTime), CAST(0x0000A6C60098E491 AS DateTime), N'Cerrado', NULL, N'administrativo@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Otros', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (5, N'', N'NELSON MIRANDA AMRIN', N'ngmiranda1958@hotmail.com', N'3104616293', N'3104616293', N'Eje Cafetero y Valle', N'Buenas tardes, soy ciudadano chileno  ,residente en ARMENIA   EL QUINDIO, y busco trabajo,como vendedor comisionista, para esta zona ,en espera de novedades, ATTE', N'como solicitud de información se paso al área de gestión humana para la solución. ', N'', CAST(0x0000A7AF00D1A11D AS DateTime), N'', NULL, N'se hablo con la persona y se le informo que en el momento no se tenían vacantes', N'se contacto a esta persona y entendió la pocision de la compañía', N'', NULL, N'', N'', CAST(0x0000A6C2014186DE AS DateTime), CAST(0x0000A6C800C2B51E AS DateTime), N'Cerrado', NULL, N'patricia.gonzalez@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'0', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (8, N'ACTIVA GROUP COMERCIALIZADORA S.A.S', N'DIANA SOLANO', N'talleressupermario@gmail.com', N'6639393', N'3006903888', N'Cundinamarca', N'Buenas Tardes 

Requerimos de un asesor comercial para la empresa, estamos interesados es sus productos para la ventas en nuestros negocios.

Agradezco si se pueden comunicar ocn nosotros la los telefonos de contacto.
', N'Se comunicará uno de nuestros asesores el día de hoy. Saludos  
 
', N'', CAST(0x0000A6E800A0B2A0 AS DateTime), N'', NULL, N'', N'Se hablo con la señora Martha Ortega quien afirma que en este momento esta siendo atendida por la asesora Paula Cortes y se ha sentido satisfecha con el servicio.', N'', NULL, N'', N'', CAST(0x0000A6D500FDC058 AS DateTime), CAST(0x0000A6E800A7909D AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (10, N'Estacion de servicio la tractomula ', N'Marcela Arangon ', N'eslatractomula@hotmail.com ', N'3286422', N'3286422', N'Eje Cafetero y Valle', N'Hoy sostuve una conversación con la señora Marcela la cual me informa que se siente inconforme ,  ya que lleva varias llamadas al asesor  y es imposible comunicarse con ella, necesitan que le recogan el cheque  para cancelar las facturas pendientes ', N'Se habla con la señora Marcela Aragòn se verifica puntualmente la situación, me expresa que básicamente necesitaba que le recogieran el cheque para que no la estuvieran llamando a cobrar, al parecer no se comprendió muy bien el sentido de la circularizacion. El cliente igualmente confirma que esta bien atendido.', N'', CAST(0x0000A6DE00B87447 AS DateTime), N'', NULL, N'', N'Se hablo con la señora afirma que ella ya no paga en cheques que ahora realiza sus pagos por transferencia siendo mucho mejor de esa forma.', N'', NULL, N'', N'', CAST(0x0000A6DE00B1F293 AS DateTime), CAST(0x0000A6DE00B8744B AS DateTime), N'Cerrado', NULL, N'milena.cardona@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (12, N'', N'juan carlos higuita jimenez', N'prancho2@hotmail.com', N'362 39 95', N'321 800 16 76', N'Antioquia y Chocó', N'hola buenos dias hace poco tiempo comense con una distribuidora de repuestos para moto y me gustaria mirar la posibilidad de comprar aceite 4 t', N'Se llamo pero no fue posible comunicación se disecciona al gerente para que este asigne un asesor.', N'', CAST(0x0000A6E500DEA1B4 AS DateTime), N'', NULL, N'', N'El cliente cerro el negocio', N'', NULL, N'', N'', CAST(0x0000A6E400C7A065 AS DateTime), CAST(0x0000A6FE01023D80 AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (13, N'', N'yamid moreno', N'lubrifil.cars.morvel@gmail.com', N'8235229', N'3144624595', N'Cundinamarca', N'Buen día soy comerciante de lubricantes en la sabana de Cundinamarca y estoy buscando buenos precios en lubricantes en las mejores marcas para automotriz e industrial gracias por su atención.', N'Se realiza primer contacto con el asesor para verificar información de ubicación y negocio, este cliente se direcciona con el asesor Milton Morales', N'', CAST(0x0000A6F300B7D1DD AS DateTime), N'', NULL, N'', N'Se habla con el señor Yamid afirma que si fue atendido por Milton pero que no le daban nuestros precios para el trabajar, que le gustaría volver ha revisar precios con nosotros, en el momento le esta comprando a Compañía de Lubricantes', N'', NULL, N'', N'', CAST(0x0000A6F000DAE441 AS DateTime), CAST(0x0000A6F300B7D1DF AS DateTime), N'Solucionado', NULL, N'mercadeo@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (14, N'', N'Almacen y taller chepamotos', N'jgarcia_co@hotmail.com', N'3428890', N'3113603754', N'Antioquia y Chocó', N'BUENOS DIAS...QUISIERA SABER LOS REQUISITOS...PARA LA COMPRA AL POR MAYOR EN SU EMPRESA....MUCHAS GRACIAS...', N'Me comunique con el señor Jorge Garcia, esta interesado en obtener productos de nuestra marca, tiene un almacén  y taller de motos en Belen Rincon. Este cliente se direcciona con la asesora Yessica Escobar', N'', CAST(0x0000A6F300B530EB AS DateTime), N'', NULL, N'', N'Se hablo con el señor Jorge fue contactado y la asesora lo visito según compromiso quedando satisfecho con el servicio, finalmente no se logro hacer negociación ya que el requería hacer compras por varias marcas para poder comprar volumen.', N'', NULL, N'', N'', CAST(0x0000A6F1018AF4C1 AS DateTime), CAST(0x0000A6F300B530EF AS DateTime), N'Cerrado', NULL, N'mercadeo@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (15, N'Distribuidora Express subaru Honda Sas', N'Daniel Shool', N'Danielshool@gmail.com', N'8231609', N'3108020183', N'Cundinamarca', N'Necesito saber si ustedes manejan la referencia Turbo Oil 2380 en Mobil', N'se intento contactar al cliente pero no ha contestado las llamadas, se envía correo a Misael ya que según la información enviada por el señor Daniel están buscando un producto de Industria.', N'', CAST(0x0000A6FF00BB85A3 AS DateTime), N'', NULL, N'', N'Al cliente se le brindo la asesoría verificando cuales eran las necesidades según el equipo y realmente en Mobil no teníamos un producto que cumpliera con lo que el requerimiento.', N'', NULL, N'', N'', CAST(0x0000A6FA014B9BE4 AS DateTime), CAST(0x0000A6FF00BB85A5 AS DateTime), N'Cerrado', NULL, N'mercadeo@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (16, N'', N'Leonardo Vanegas', N'leovan000@hotmail.com', N'3219904633', N'3219904633', N'Cundinamarca', N'Senores RyR: Estoy trabajando en la produccion de un nuevo producto de aceite para motores Diesel. Estoy buscando distribuidores y me gustaria saber si estarian interezados en la distribucion de este. Solo dejeme saber. Muchas Gracias
Mi telefono es 3219904633
', N'se contacta al señor Leonardo y se le informa que la compañia en estos momentos no esta autorizado para comercializar otro tipo de lubricantes diferentes a lo de ExxonMobil de Colombia.', N'', CAST(0x0000A70500919938 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A6FD00E0811A AS DateTime), CAST(0x0000A7050091993A AS DateTime), N'Cerrado', NULL, N'administrativo@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (17, N'', N'fredy Sanchez', N'fredysan1984-@hotmail.com', N'3106738023', N'3106738023', N'Cundinamarca', N'requiero cotizar el valor de los siguientes productos 
Mobi  4t 20w50 1caja de 12 cuart
Motul 3000 4t 1 caja de 12 cuart
Shell Advance 4t 1 caja 12 cuart ', N'Se realizo comunicación con el cliente, el señor requiere comprar menor cantidad a una caja se le explico que somos distribuidores mayoristas y solo de la marca Mobil, 
considero que es un posible cliente y se envía correo a Javier asesor de Bogota con copia al gerente para que este concrete una cita y lo visite y trate de cerrar negocio con el.', N'', CAST(0x0000A70500ADAA21 AS DateTime), N'', NULL, N'', N'El cliente afirma que si lo contactaron y le ofrecieron el producto por cajas pero a el no le sirve comprar bajo esa modalidad aun ya que el negocio esta iniciando  y es pequeño', N'', NULL, N'', N'', CAST(0x0000A6FE00CD3060 AS DateTime), CAST(0x0000A70500ADAA23 AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (19, N'', N'APONTE VARGAS MISAEL', N'servilubricanteskenwoor@gmail.com', N'710 91 58', N'311 270 53 45', N'Cundinamarca', N'El señor Fabian Aponte hijo y administrador de Servilubricantes Kenwoor, llama al centro de servicio al cliente y comenta su inconformidad con la asesora acerca de un cobro que le hizo donde le insinuó que si no le pagaba en ese momento le afectaba su comisión, sintiéndose incomodo con su forma como genero el cobro y aunque la asesora luego se disculpo el ya no quiere seguir teniendo contacto con ella ni con ningún asesor. así que le gustaría mejor seguir utilizando solo medios tecnológicos.', N'', N'', NULL, N'', NULL, N'', N'PQRS repetida, igual al ID 18', N'', NULL, N'', N'', CAST(0x0000A6FF010925A0 AS DateTime), CAST(0x0000A70100B508E1 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Queja y Reclamo', N'Otros', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (20, N'Chic Publicidad', N'Darwin Lugo', N'chicpublicidaco@gmail.com', N'4642217', N'3187736753', N'Cundinamarca', N'Buenos días, un gusto saludarle.
Por medio del presente quisiéramos solicitar el contacto con el departamento de mercadeo y publicidad con el fin de presentarles nuestra agencia. En este principio de año hemos diseñado una estrategia para conectarlo con sus clientes a través de una campaña que incluye la utilización de Radio y una estrategia digital. De esta manera podríamos ayudarles a aumentar sus ventas entre hasta en un 36% además de incrementar su participación en la mente de los consumidores.
Somos una Agencia de Publicidad con una amplia experiencia y sin duda alguna quisiéramos atenderle.
Siempre a su orden.
Saludos Cordiales.

', N'', N'', NULL, N'', NULL, N'', N'Se contacto el proveedor se le recibió la información y ser guarda el contacto pero se aclara que en el momento no tenemos ninguna necesidad.', N'', NULL, N'', N'', CAST(0x0000A70100AFD9F8 AS DateTime), CAST(0x0000A70500D67C31 AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (21, N'ESTACION MOBIL PLANETA RICA', N'SAMIT CONDE', N'estacionmobil@gmail.com', N'7767355', N'3143586800', N'Cordoba', N'SOLICITAMOS LISTADO DE PRECIOS  DE COSTO ACEITES LUBRICANTES ', N'Se realiza primer contacto, se habla con el señor Diego Eslava, este cliente ya es atendido por nosotros y lo que necesita es que el asesor nuestro, Leonardo Angel le lleve la nueva lista de precios.', N'', CAST(0x0000A70500D9687E AS DateTime), N'', NULL, N'', N'El cliente afirma que el asesor le llevo la nueva lista y le explico su negociación.', N'', NULL, N'', N'', CAST(0x0000A70400F8F08A AS DateTime), CAST(0x0000A73000BBBB0C AS DateTime), N'Cerrado', NULL, N'maria.salazar@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (85, N'UNIBAN S.A', N'Camilo Montoya', N'CaMontoyaR@uniban.com.co', N'5115540 ext 286', N'Pendiente por confirmar', N'ANTIOQUIA', N'Ayer después de las 5:30 recibi en mi correo la siguiente informacion por parte del cliente que maneja la asesora Maria Luisa Diaz:

Asunto: Queja servicio
Importancia: Alta

Maria Luisa, Rocío, buenas tardes. 

Desde hace varios años hemos contado con el apoyo y servicio de R y R Lubricantes, logrando abastecer los procesos internos de la compañía de manera efectiva, sin embargo últimamente hemos detectado dificultades con el flujo de información y las entregas para cumplir los pedidos y las necesidades de las áreas de C.I Unibán S.A. 

Últimamente hemos notado demoras preocupantes que dificultan nuestros procesos internos en cuanto a la recepción de cotizaciones, información técnica y cumplimiento en las entregas de productos. 

Partiendo de la confianza y del buen nombre que tenemos de R y R lubricantes, me permito manifestarles respetuosamente esta situación solicitándoles y agradeciéndoles revisar sus procesos internos de manera que podamos contar de nuevo con el buen servicio que siempre hemos obtenido de ustedes. 

Muchas gracias. 

Cordialmente 

Camilo Montoya Restrepo 
Analista Comercial 
C.I. Unibán, S.A. 
(574) 511 55 40 ext. 286 


', N'Se realizo el primer contacto con el señor Camilo Montoya analista Comercial del área de compras, manifiesta que básicamente al interior de la compañía UNIBAN tienen inconvenientes con nuestro servicio, aparte del área de compras las áreas de Almacén de las diferentes direcciones y el área Técnica.
afirma que se realizo hace poco una charla importante la cual agradecen pero no es suficiente ya que la inconformidad esta en otras áreas. 
En este momento tiene una orden por realizarnos.', N'', CAST(0x0000A77E010F4A99 AS DateTime), N'se tomaron las acciones correctiva donde CSC retomará las cotizaciones a Uniban para hacerlas de manera oportuna ya que la asesora Maria Luisa esta en campo y correrías y en ocasiones no tiene acceso a la información para tramitar a tiempo lo solicitado por el cliente. Diana Trujillo tuvo la comunicación con el señor camilo y expresó los cambios que realizaremos para evitar lo sucedido y corregir inmediatamente nuestra oferta de servicio. Maria Luisa esta comprometida a mejorar su atención al cliente y tramitar siempre de manera prioritaria las necesidades Técnicas, Comerciales y demás con la cuenta.', NULL, N'MARIA ALEJANDRA SALAZAR  realizo llamada al señor camilo excusándonos por el mal servicio presentado comunicando las acciones correctivas a tomar. ya el sabe que siempre debe enviar las ordenes de cotizaciones y compras a Rocio y a Maria luisa, rocio cotiza, tramita todo y monta el pedido, maría luisa tiene que estar pendiente de las fechas de entrega a uniban, informarles con tiempo y coordinar con bodega las entregas. se envía correo a CSC y al cliente aclarando la situación e informando las acciones a tomar.', N'Se hablo con el señor camilo el afirma que sostuvo una conversación con Maria Alejandra la gerente de la zona y le aclaro como sera la forma de trabajar y que estaría muy pendiente del proceso, se le informo del contacto directo con el CSC para agilizar los procesos.', N'se envía correo directamente con las personas involucradas en la atención del cliente', CAST(0x0000A77F00AEE2D1 AS DateTime), N'', N'', CAST(0x0000A77D00A77A45 AS DateTime), CAST(0x0000A77F00AC2D65 AS DateTime), N'Cerrado', N'MEDELLIN', N'maria.salazar@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'Directo')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (91, N'Mariluz Briseño Urrego ', N'Mariluz Briseño Urrego ', N'mbricenou@gmail.com', N'3213948352', N'3123166879', N'CUNDINAMARCA', N'La señora Mariluz Briseños, a través de la circularizacion, manifiesta que no se siente conforme con el asesor que le asignaron después de que se fue la asesora Tatiana Suarez que era la que la atendía; ya que, dice la señora, este asesor no la visita constantemente y tampoco pasa a cobrarle. La señora Mariluz dice que hay muchas empresas de Lubricantes que la visitan para hacerle ofertas incluso mas económicas, pero que ella prefiere trabajar con nosotros. Que si por favor se pueden comunicar con ella para verificar como van a ser las visitas y demás.', N'Se realiza el primer contacto con la señora Mariluz Briseño cliente Bogota quien afirma que no la han ido a visitar y de hecho tiene unos pagos por hacer pero no se los han recogido, solicita que un asesor la visite y la atienda en sus requerimientos.', N'', CAST(0x0000A79500B7CB95 AS DateTime), N'', NULL, N'El nuevo asesor se comunico con ella y la visitara el Jueves 12 de Julio en donde se dejaran al dia, temas de cartera y dias de visita', N'', N'', NULL, N'', N'', CAST(0x0000A79300B44A3B AS DateTime), CAST(0x0000A7AE012706A4 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (93, N'Risaralda Energía', N'Hernán Alonso Espinosa Rodríguez', N'hespinosa@risaraldaenergia.com.co', N'+ 57 1 4232960 ext. 5210', N'3112163678', N'CALDAS', N'1.	OBJETO Y ALCANCE DE LA SOLICITUD DE PEDIDO

Evaluación de muestras de los aceites lubricantes de la PCH Morro Azul.


2.	DESCRIPCION ESPECÍFICA DEL TRABAJO A REALIZAR

Se deben realizar las pruebas a los aceites lubricantes de las unidades de potencia hidráulica y lubricación de la PCH Morro azul, son 6 (seis) muestras, a continuación se enumeran las pruebas específicas necesarias por cada Muestra.

Viscosidad a cSt/100 y 40°c ASTM D 445
Índice de viscosidad
TAN, ATSM D 664-11
Agua % Vol, Karl Fisher E1024
Determinación de metales ASTM D 2896-11
Conteo de partículas ISO 4406:99
Espectroscopia Infraroja


3.	DOCUMENTACIÓN E INFORME

El proveedor debe de suministrar informes individuales para cada muestra donde se detalle los valores, Toda esta información se debe presentar en una tabla de Excel 

El proveedor debe hacer un análisis de los resultados y entregar conclusiones y recomendaciones. Este informe se debe suministrar en 1 copia física tamaño carta y 1 copia en medio magnético enviado vía correo electrónico.

Todas las muestras serán externas con equipos en operación.

El contenido del informe debe detallar los siguientes puntos:

•	Objetivo de la evaluación 
•	Antecedentes
•	Inspecciones efectuadas.
•	Documentos de referencia
•	Características generales
•	Equipo utilizado en la pruebas
•	Metodología 
•	Procedimiento 
•	Conclusiones y recomendaciones
				
4.	LOGÍSTICA

Las muestras serán enviadas en frascos de al menos 300ml a lugar que el contratista lo indique.

6    OTRAS CONSIDERACIONES A TENER EN CUENTA

6.1.		SITIO DE EJECUCIÓN DEL TRABAJO

Las muestras serán tomadas en la central por personal de Risaralda Energía y los análisis deberán ser realizados en los laboratorios del contratista.

6.2.	 	ESQUEMAS PARA CONSTRUCCIÓN Y MONTAJE

Se adjuntaran los planos específicos que sean necesarios para ejecutar esta actividad.

6.3.	 	NORMAS Y ESTÁNDARES A APLICAR

Para la ejecución de la obra regirán las especificaciones de los productos a utilizar, así como las siguientes normas:

•	ATSM D 664-11
•	ASTM D 2896-11
•	ISO 4406:99
•	ASTM D 445

7.	COSTOS

7.1.	FORMULARIO DE CANTIDADES DE OBRA Y PRECIO

Ítem	Descripción	Und	Cantidad	Valor Unitario	Valor Total
1	Análisis para aceite industrial	Und	6		
2	Elaboración de informe	Und	6		
VALOR COSTO DIRECTO	
I.V.A.	
COSTO TOTAL DE LA OFERTA	


7.2	CONDICIONES COMERCIALES

-	Los precios deben ser expresados en pesos colombianos.
-	Especificar tiempo de entrega en días contados a partir del recibo de la orden de compra y recepción de las muestras.
-	Especificar en la presentación de la oferta la forma de pago.
-	Especificar el tiempo de validez de la oferta.

8.	DESVIACIONES

El Contratista en la oferta podrá formular desviaciones a las especificaciones, las cuales deben quedar clara y detalladamente justificadas en el formato adjunto. Si el Contratista lo considera conveniente puede adjuntar información adicional por separado.

Punto	Especificación del pliego	Especificación a modificar	Justificación
			
			
			

', N'No ha siso posible comunicación telefónica con el cliente, se envía correo electrónico informándole que ya su solicitud ha sido transferida l gerente de B2B y este a su vez a un asesor para que atienda su requerimiento.', N'', CAST(0x0000A79D00BDD506 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A799010E3DB3 AS DateTime), CAST(0x0000A7A200E3AA4A AS DateTime), N'Solucionado', N'ANSERMA', N'mmartinez@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', 0, 1, N'INDUSTRIA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (97, N'', N'3013685728', N'ROJOBAS@GMAIL.COM', N'3013685728', N'3013685728', N'CORDOBA', N'SOY PROPIETARIO DE UN ESTABLECIMIENTO COMERCIAL DEDICADO AL LAVADO Y CUIDADO DE CARROS Y MOTOCICLETAS Y DESEO EXPANDIR EL NEGOCIO AL AGREGAR VENTA DE LUBRICANTES POR LO QUE ESTOY INTERESADO EN SU MARCA, FAVOR ENVIAR RESPUESTA A VUELTA DE CORREO CON UN NUMERO AL CUAL ME PUEDA CONTACTAR ', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A79F018A074B AS DateTime), CAST(0x0000A7AE00D1D2BB AS DateTime), N'Solucionado', N'MONTERIA', N'maria.salazar@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (6, N'AUTO-CLEAN LOGIS CAR S.A.S.', N'Monica Ramirez ', N'marcela.rua@hotmail.com', N'6235064-6354109', N'3157701639', N'Cundinamarca', N'La sra Monica informa que no va a dar información de las facturas para la circularizacion por que hace mas de dos meses no la visita el asesor que ya había colocado la queja y le informaron que iba a ir una niña a visitarla y hasta el momento no ha ido,la sra dice también que ella necesita que la estén visitando  seguidamente y que no  solo la llamen para cobrar ', N'se habló con la señora Mónica Ramirez la cual confirma que hace más de un mes no la visitaba nadie que hasta el día de hoy recibió visita de Luz Elena Sanchez y afirma haber quedado con una percepciôn positiva frente a la nueva asesora también afirma que para ella es importante contar con las visitas del asesor.', N'', CAST(0x0000A6CD01188D79 AS DateTime), N'El asesor asignado a este cliente fue suspendido de sus pavores por decisión de presidencia, se contrato un nuevo asesor comercial, pero lamentablemente no supero el periodo de prueba, en estas condiciones decidí cambiar las estructuras de las zonas, el nuevo asesor visito al cliente y realizare seguimiento del empalme en la semana del 26 al 30 de dic. 

Cabe aclarar que este PQR solo lo pude gestionar hasta esta fecha por problemas del acceso a la plataforma que fueron solucionados hoy.
', CAST(0x0000A6E50107A45C AS DateTime), N'', N'se hablo con el cliente y se confirmo la visita del asesor, manifiesta estar satisfecho.', N'Señores AUTO-CLEAN LOGIS CAR S.A.S. envió una disculpa por los problemas generados a la fecha, en la semana del 26 al 30 de diciembre los visitare para revisar sus inquietudes y garantizar que queden solucionadas. Saludos  
 

Cordialmente,
 
Adrian Romero Rodriguez
Gerente Regional
R&R Lubricantes S.A
Tel: 3754636

Se realizo visita al cliente, se presento a la nueva asesora y se aclararon algunos temas pendientes de mercadeo, el cliente comento estar tranquilo con las respuestas recibidas.', CAST(0x0000A6E50107A468 AS DateTime), N'', N'', CAST(0x0000A6CC0117D577 AS DateTime), CAST(0x0000A6EB00D5C547 AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Otros', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (11, N'', N'camilo sanabria', N'camisan83@hotmail.com', N'3163174526', N'3163174526', N'Cundinamarca', N'Buenas tardes,

Soy Camilo Sanabria, estoy adecuando un lubricentro en la ciudad de Bogota, para el cual quiero solicitar el listado de sus aceites y sus respectivos precios.

Quedo atento a sus comentarios, para futuros negocios.

Cordialmente,

Camilo Andres Sanabria Guarnizo
Celular 316 317 45 26', N'se ha estado llamando pero no contestan en este numero de celular, se direccionara al Gerente correspondiente con el fin de que se asigne un asesor e insista en este numero de telefono. ', N'', CAST(0x0000A6E500D8DCCC AS DateTime), N'', NULL, N'', N'El cliente dejo este proyecto en Stand by', N'', NULL, N'', N'', CAST(0x0000A6E301196841 AS DateTime), CAST(0x0000A6E900793E6C AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (18, N'', N'APONTE VARGAS MISAEL', N'servilubricanteskenwoor@gmail.com', N'710 91 58', N'311 270 53 45', N'Cundinamarca', N'El señor Fabian Aponte hijo y administrador de Servilubricantes Kenwoor, llama al centro de servicio al cliente y comenta su inconformidad con la asesora acerca de un cobro que le hizo donde le insinuó que si no le pagaba en ese momento le afectaba su comisión, sintiéndose incomodo con su forma como genero el cobro y aunque la asesora luego se disculpo el ya no quiere seguir teniendo contacto con ella ni con ningún asesor. así que le gustaría mejor seguir utilizando solo medios tecnológicos.', N'La queja fue tomada telefónicamente y montada en plataforma por Rocio Holguin. Es importante que el gerente también haga un contacto con el cliente. ', N'', CAST(0x0000A6FF00FCAD2C AS DateTime), N'Hable con el señor  aponte y en esta conversación me aclara que son muchos los asesores que lo atienden y prefiere seguir haciendo sus pedidos por medios electrónicos, acepte este tipo de atención y le comunique que tendrá una visita de mi parte en un mes para hacer seguimiento a sus necesidades. 

Aclaro que es un cliente muy orientado a precio y poco fiel a pesar de los esfuerzos de mercadeo y atención .   
', CAST(0x0000A70200935B2C AS DateTime), N'', N' Continúa en su interés de seguir sin asesor, se atiende telefónicamente.', N'', NULL, N'', N'', CAST(0x0000A6FF00F9D0F2 AS DateTime), CAST(0x0000A752006D9428 AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Otros', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (22, N'', N'Angela Arias', N'angela.arias@satrack.com', N'6045454', N'3206950531', N'Antioquia y Chocó', N'Buenos días, 
Soy Angela Arias Directora de Mercadeo de Satrack, empresa de monitoreo satelital para el transporte. Estoy interesada en hacer una alianza con ustedes para que juntos tengamos más visibilidad y lleguemos a nuevos clientes, y ofrezcamos beneficios adicionales a nuestros clientes actuales. 
Espero sea de su interés. 
Quedo muy atenta,
Saludos,', N'Se realiza el primer contacto con la señora Angela Arias nos cuenta un poco su idea de formar alianza con nosotros y teniendo esto en cuenta se direcciona a Juan Carlos Araque Gerente de Mercadeo con el fin de que establezca contacto con la señora Angela y evalué el tema de la alianza.', N'', CAST(0x0000A70500DC72F0 AS DateTime), N'', NULL, N'', N'Se contacto el proveedor se tomo su información pero se aclaro que a la fecha no se tenia esa necesidad.', N'', NULL, N'', N'', CAST(0x0000A7050082D838 AS DateTime), CAST(0x0000A70B014F5AFB AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (23, N'', N'FABIO HERNAN VALENCIA BERMUDEZ', N'fabiovalenciabermudez@gmail.com', N'3155708105', N'3155708105', N'Antioquia y Chocó', N'Cordial saludo.

En dónde puedo consultar sus ofertas laborales ?', N'se realiza contacto con esta persona y se informa correo de selección de personal para que se comunique con el àrea.', N'', CAST(0x0000A70500FB687B AS DateTime), N'', NULL, N'', N'la persona afirma que recibió una llamada donde le explicaron que a la fecha no había vacantes.', N'', NULL, N'', N'', CAST(0x0000A70500EF52B6 AS DateTime), CAST(0x0000A70500FB687D AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (24, N'IBS MOTOS ', N'Edgar Díaz Acevedo ', N'edgardiaz736@hotmail.com', N'+34669567816', N'', N'Antioquia y Chocó', N'Cordial saludo
Me gustaría recibir información sobre el precio del aceite super mobil 4T 20W-50. Sería para empezar con compras superiores a 100 cuartos y según el precio aumentar el número. Quedo atento a una pronta respuesta. 
Gracias
', N'se realizan llamadas al numero ingresado en la plataforma para realizar primer contacto pero el numero esta errado, se envía correo al cliente solicitando un numero de teléfono  para poder establecer el contacto.', N'', CAST(0x0000A70B00E71404 AS DateTime), N'', NULL, N'', N'No fue posible tener comunicación con el cliente', N'', NULL, N'', N'', CAST(0x0000A708012B4E8B AS DateTime), CAST(0x0000A70B00E7DF45 AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (25, N'', N'Melina Restrepo', N'dh.melinarestrepo@gmail.com', N'3229101', N'3206654076', N'Antioquia y Chocó', N'Buenos dias
 
Soy Melina Restrepo, Directora Comercial de Dh Visual, empresa especializada en la comunicación de marca a través de los espacios comerciales con un alto valor agregado; tenemos una amplia experiencia en nuestro quehacer y es gracias a esto que podemos trabajar con algunas de las marcas y empresas más importantes del país como lo son Agua Bendita, Gef, Americanino, Gobernación de Antioquia, Grupo Nutresa, Inexmoda, entre otros.
 
Me gustaria hacerle llegar nuestro portafolio de servicios donde podrá encontrar varios de los proyectos más representativos que hemos realizado para nuestros clientes, en especial diseño y montaje de stands, vitrinismo, arquitectura comercial y visual merchandising.
 
Contamos con una planta de producción integrada por más de 50 carpinteros y profesionales en diferentes áreas como diseño, arquitectura, modeladores 3D y gráficos, y así, suplir y superar las expectativas de nuestros clientes.
 
Quedamos atentos a cualquier necesidad que tenga y sobre las cuales les podamos apoyar.
 
¡Gracias por su tiempo!', N'Se realiza primer contacto y se comunica a la señora Melina que la persona encargada es el gerente de mercadeo Juan Carlos Araque y que este se estará comunicando con ella para mas detalles del ofrecimiento.', N'', CAST(0x0000A70B00ED4231 AS DateTime), N'', NULL, N'', N'La persona afirma que se contactaron con ella y dejaron sus datos para otra ocasión.', N'', NULL, N'', N'', CAST(0x0000A70B00A6370D AS DateTime), CAST(0x0000A70B0150162B AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (26, N'REDMOTOS DE COLOMBIa SAS', N'NIDIA CELIS', N'redmotostallerla80@gmail.com', N'3099096', N'3112973023', N'Cundinamarca', N'buenas tardes

necesito cotizar aceite mobil 20w50, 10w30 y 10w40
urgente
gracias', N'Se realiza el primer contacto el cliente sera atendido por la asesora Johana ', N'', CAST(0x0000A70D00F53E17 AS DateTime), N'', NULL, N'', N'El cliente quedo satisfecho con la atención brindada por ala asesora.', N'', NULL, N'', N'', CAST(0x0000A70B011D72C9 AS DateTime), CAST(0x0000A70D00F53E1A AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (27, N'REDMOTOS DE COLOMBIa SAS', N'NIDIA CELIS', N'redmotostallerla80@gmail.com', N'3099096', N'3112973023', N'Cundinamarca', N'buenas tardes

necesito cotizar aceite mobil 20w50, 10w30 y 10w40
urgente
gracias', N'se realiza primer contacto el cliente sera atendido por la asesora Jhonana', N'', CAST(0x0000A70D00F57070 AS DateTime), N'', NULL, N'', N'El cliente quedo satisfecho con la atencion de la asesora', N'', NULL, N'', N'', CAST(0x0000A70B011DB7AD AS DateTime), CAST(0x0000A70D00F57077 AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (32, N'', N'Yamal Mustafá Iza', N'yamal@utp.edu.co', N'63137197', N'3162975912', N'Eje Cafetero y Valle', N'Cordial saludo. Tenemos un compresor de tornillo y deseamos saber cuál sería el lubricante más recomendado para éste. Desafortunadamente no tenemos la información del fabricante del equipo.

Datos complementarios: Velocidad de rotación 3000 rpm
                                     Presión máxima: 14 bar.

Hemos consultado el catálogo de Mobil y sugieren lubricantes de la línea Mobil Rarus SHC 1020. Ustedes nos podrían aclarar,por favor, si este es el lubricante más adecuado para esta aplicación y cuál sería la viscosidad recomendada?

Muchas gracias por la atención.


Atentamente

Yamal Mustafá Iza', N'Se realiza el primer contacto con el cliente y se direcciona con Misael Martinez para una respuesta técnica acertada.', N'', CAST(0x0000A70F011C6CD7 AS DateTime), N'', NULL, N'', N'el señor que requería el producto es el señor Alfonso Carvajal el señor Yamal afirma que efectivamente se le suministro el producto que requerian', N'', NULL, N'', N'', CAST(0x0000A70F00E94815 AS DateTime), CAST(0x0000A70F011C6CD9 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (33, N'', N'Diana Torres', N'motoslasamericas@gmail.com', N'6610757', N'3183850662', N'Cundinamarca', N'Quisiera saber si el asesor Jaime David Gómez aun trabaja la zona Occidente de Bogotá ya que trató de contactarnos a los numeros dé Bogotá y no tengo respuesta. Por favor contactarme con urgencia. Muchas Gracias ', N'Se realizo el contacto con la señora Diana la cual afirma que después de colocar este requerimiento se comunico con la linea 018000 y la atendieron le tomaron el pedido, afirma que su necesidad fue atendida.', N'', CAST(0x0000A71300FFAC93 AS DateTime), N'', NULL, N'', N'Cliente satisfecho', N'', NULL, N'', N'', CAST(0x0000A71200BAB126 AS DateTime), CAST(0x0000A71300FFBC82 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (35, N'', N'GERMAN ANDRES MENESES DUQUE', N'MRCAT02@HOTMAIL.COM', N'3115292079', N'3115292079', N'Antioquia y Chocó', N'Buenas tardes es que el dia de hoy tenia una cita pendiente laboral con ustedes, y por motivos personales no puedo asistir, de antemano mil gracias por su comprension.', N'Se transmite información a Johana Gómez analista de personal.', N'', CAST(0x0000A71600BA3829 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A71400D20F1A AS DateTime), CAST(0x0000A71600BAC0EE AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (36, N'', N'Brayan Rodriguez', N'barodriguez2010@hotmail.com', N'6341599', N'3175390415', N'Antioquia y Chocó', N'Buenos días. Tengo interés en que conozcan mi perfil profesional y experiencia para hacer parte de su equipo de trabajo, ¿cuál es el contacto o correo donde puedo hacer llegar mi hoja de vida? Muchas Gracias.

CORDIALMENTE,


Brayan Alexis Rodriguez Grimaldos
Ingeniero Electromecánico', N'Se envía correo con información a Johana de selección de personal.', N'', CAST(0x0000A71A00B67FE2 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A71700A8525D AS DateTime), CAST(0x0000A71A00B67FE4 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (40, N'SINGULART DISEÑO S.A.S', N'Sandra Peña', N'sandrapena.singulart@gmail.com', N'3167387678', N'3167387678', N'Cundinamarca', N'
NUESTRA EMPRESA
Nuestra Organización SingulART DISEÑO S.A.S es una empresa orientada a diseñar, producir y satisfacer las necesidades de nuestros clientes, generando nuevos conceptos que cumplan con las expectativas visuales. Brindando un servicio de calidad, cumplimiento responsabilidad y vigencia profesional en la elaboracion de stands, escenografías, vitrinas, exhibidores, espacios comerciales, show rooms, imagen corporativa, entre otros. 
Para la realización de todos nuestros proyectos, contamos con un excelente Equipo Humano e Infraestructura Técnica, disponiendo consecuentemente del conocimiento, talento y capacidad para prestar una Asesoría Integral en el desarrollo e implementación de Estrategias y Elementos de Exhibición, apoyado funcionalmente desde las áreas de Diseño, Presupuesto, Producción y Comercialización.
SingulART DISEÑO S.A.S el aliado estratégico que usted necesita. Recuerde que estamos dispuestos a cotizar cualquier tipo de proyecto que tengan en marcha.
PRODUCTOS
DISEÑO Y MONTAJE DE EVENTOS
•	Montaje de stands.
•	Espacios comerciales
•	Exhibidores
•	Escenografia
•	Vitrinas
•	Displays
•	Show rooms
•	Imagen corporativa e impresion en general
SERVICIOS
•	Diseño
•	Producción
•	Montaje
•	Desmontaje
•	Mantenimiento
•	Transporte
•	Señalización
Agradecemos la oportunidad que nos brindan para presentar a SingulART DISEÑO S.A.S. 
Estamos atentos a cualquier inquietud
..........................................................
 
Cordialmente,
SingulART DISEÑO S.A.S
NIT: 900600818-7
SANDRA PEÑA.
Directora Comercial
Diag.77B #116B-42
sandrapena.singulart@gmail.com
sandra.pete27@hotmail.es 
Web:http://www.nstand.com/empresas/singulart-diseno-s-a-s/
Skype: singulart2012
Twitter:@SingulartSP
', N'Se envía in formacion al área encargada', N'', CAST(0x0000A72000C20E9A AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A71D00B93318 AS DateTime), CAST(0x0000A72000C20E9C AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Sugerencia', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (41, N'', N'CRISTO ALFONSO BERRIO ARCIA', N'CRISTOBERRIOARCIA78@GMAIL.COM', N'3217423441   -  3205500290', N'3217423441    -   3205500290', N'Cordoba', N'Respetuosamente me dirijo a ustedes, con el fin de solicitarles información sobre algunos tipos de aceites que ustedes comercializan, tal información es para ver las marcas y precios, para un negocio familiar que estamos colocando, necesito saber sobre la marca mas económica que manejen, gracias', N'Se realiza el primer contacto con el cliente se le informa que la marca que manejamos es la marca Mobil y q2ue uno de nuestros asesores se estará contactando con el.', N'', CAST(0x0000A72F010B26A8 AS DateTime), N'', NULL, N'', N'El cliente recibió la información pero tiene el proyecto en Stand By', N'', NULL, N'', N'', CAST(0x0000A72C012C4AD8 AS DateTime), CAST(0x0000A73000BF8A2A AS DateTime), N'Cerrado', NULL, N'maria.salazar@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (119, N'', N'EDY BURAK', N'edybur@edybur.net', N'9549932909', N'9542415107', N'BOGOTA DC', N'Buen dia sr 
 
Somos  la  RSC  de  los  EE UU

 
Estas son nuestras paginas web
 
www.rscbrands.com

www.gunk.com

www.liquidwrench.com

www.motormedic.com

www.tinkernation.com

Son ustedes importadores ?', N'Se envía correo informando que no es posible atender su solicitud ya que no somos importadores', N'', CAST(0x0000A7C50091E704 AS DateTime), N'', NULL, N'', N'', N'Buenos días agradecemos el contactarnos y lamentamos no poder atender su solicitud ya que no somos importadores somos distribuidores de la marca Mobil a nivel nacional del país de Colombia.', NULL, N'', N'', CAST(0x0000A7C300C26868 AS DateTime), NULL, N'Cerrado', N'BOGOTA', N'', N'Persona Natural', N'NO SE HA ASIGNADO EL TIPO DE SOLICITUD', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (124, N'G-TRADE AUTOPARTS S.A.S', N'Roniet Neira', N'ventasgtradeautoparts@gmail.com', N'7446410', N'3107658032', N'CUNDINAMARCA', N'Buen día,

Desde el día 27 de julio que me comunique con la asesora comercial para solicitar el cambio de factura # 47656 para que la mercancía se facturara a nombre de PARTS & PARTS SAS, y la factura 47656  de Gtrade se anulara. y esta es la hora que aun no he recibido dicha respuesta.
Ya que esta factura es del mes de JULIO tengo hasta el día de hoy 4 DE AGOSTO para recibirla con fecha de mes de JULIO de lo contrario deberá estar con fecha de AGOSTO ya que se pagaran impuestos, el día martes;

Atenta a sugerencias, y en espera de un apronta respuesta

Este fue un correo enviado por el clientes.
', N'', N'', NULL, N'', NULL, N'Se cambio facrura, ', N'', N'', NULL, N'', N'', CAST(0x0000A7C5009C6448 AS DateTime), CAST(0x0000A7C801656C96 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'', N'0', NULL, 0, N'SUBDISTRIBUIDOR')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (7, N'', N'MOTOMAR MARINILLA', N'motomar1990@gmail.com', N'3163483249', N'3163483249', N'Antioquia y Chocó', N'Muy buenas tardes.
Tengo un taller y almacén de motos, necesito saber como hago para comunicarme con un asesor ya que quiero información al respecto de sus aceites y como hacer para comprarles. 
Muchas gracias ', N'Se contacto al sr. Gustavo Gomez, el necesita que lo llame o lo visite el asesor asignado para zona Oriente ya que necesita producto, aun no es cliente nuestro pero nos va a comprar, se direcciono con Jovanny Urrego.', N'', CAST(0x0000A6FF00B78F52 AS DateTime), N'', NULL, N'Se contacto el cliente el asesor lo visito,pero con el tema del alza no se logro venderle ya que el cliente consiguió el producto mas económico.', N'El cliente afirma que hablo con el asesor que lo atendió muy bien pero que los precios no le sirven. ', N'', NULL, N'', N'', CAST(0x0000A6D300D21596 AS DateTime), CAST(0x0000A6FF00B78F56 AS DateTime), N'Cerrado', NULL, N'mercadeo@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (9, N'', N'3164118351', N'nigo0665@gmail.com', N'3164118351', N'3164118351', N'Cundinamarca', N'buenas noches me interesa hacer compra de lubricantes la por mayor para mi local gracias por la atencion quedo atento a su pronta respuesta gracias ', N'Cliente ya se atendió y creo en la base de datos
 
', N'', CAST(0x0000A6E800AD8708 AS DateTime), N'', NULL, N'Se entrego cotizacion y esta validando precios con otros provehedores', N'', N'', NULL, N'', N'', CAST(0x0000A6D7013FA3E5 AS DateTime), CAST(0x0000A6E800AD870A AS DateTime), N'Solucionado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (28, N'UNIVERSIDAD DE ANTIOQUIA', N'Felix Echeverria ', N'felix.echeverria@udea.edu.co', N'2196615', N'3005690516', N'Antioquia y Chocó', N'El día de hoy recibí este correo de parte del cliente:

Buenas tardes Rocío:

Te escribo para agradecer la colaboración particularmente tuya y de Sara en la compra del lubricante, aunque en general todos allá en RyR muy amables y serviciales.

Atte,

Félix Echeverría E., Ing., MSc, PhD.
Centro de Investigación, Innovación
y Desarrollo de Materiales - CIDEMAT
Sede de Investigación Universitaria - SIU
Universidad de Antioquia
Calle 62 N° 52-59, Torre 2, lab 330-331
Medellín - Colombia
Tel:  (+574) 2196615
Fax: (+574) 2191051
 

', N'Se realizo el contacto con el cliente para profundizar un poco en el servicio que se le presto y con el cual quedo satisfecho, se le reitero nuestro interés en dar soluciones a sus inquietudes y el estar prestos a servirle. se realizo reconocimiento ante el equipo a los asesores del CSC por el servicio suministrado.', N'', CAST(0x0000A70D00F84F42 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A70C00F952C7 AS DateTime), CAST(0x0000A70D010F3927 AS DateTime), N'Cerrado', NULL, N'pablo.camacho@ryrlubricantes.com', N'Persona Juridica', N'Felicitación', N'', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (34, N'', N'Manuela', N'comercial1@plasmanodo.com', N'4440174', N'3185171602', N'Antioquia y Chocó', N'Buenos días!

Soy Manuela Saldarriaga de Plasma Nodo. Somos una compañía de diseño gráfico, diseño de espacios y producción integral. Nos dedicamos a generar proyectos de vanguardia desde la idea hasta el producto terminado a través de un diseño estratégico y un manejo integral de la marcas. 

Nos encantaría poder ofrecerles nuestros servicios de diseño, producción y montaje de Stand para la próxima Feria de ñas 2 ruedas a realizarse el mes de mayo de 2017. De igual forma ofrecemos servicio de diseño y producción de locales comerciales, oficinas, restaurantes, sistemas de exhibición, vitrinas, y diseño gráfico. 

Podrian darme un email donde les pueda hacer llegar nuestro portafolio?

Espero podamos ponernos en contacto, 

Saludos!', N'Se realizo el primer contacto con este proveedor, se le informo que su solicitud seria direccionada al gerente de Mercadeo Juan Carlos Arque.', N'', CAST(0x0000A71301026C35 AS DateTime), N'', NULL, N'Se recibió la información como posible proveedor', N'El proveedor afirmo que le fue recibida la información y  entiende que en el momento no tengamos la necesidad de este servicio', N'', NULL, N'', N'', CAST(0x0000A71300C491B7 AS DateTime), CAST(0x0000A79300AD2A47 AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (37, N'', N'ROSA CHACON', N'direccioncomercial@carpaszeko.com', N'8053429', N'3133552831', N'Cundinamarca', N'Con la presente nos permitimos manifestar nuestro interes de darles a conocer nuestro portafolio en variedad de carpas e inflables y material P.O.P,por lo anterior agradecemos e nos sea suministrado un correo electronico para enviar información correspondiente.', N'se envía correo al proveedor con correo electrónico de la asistente de mercadeo Daniela Trejos y se puedan comunicar con ella, también se envía este pantallazo a el gerente de mercadeo y a la asistente.', N'', CAST(0x0000A71A00F9D03A AS DateTime), N'', NULL, N'', N'El proveedor agradece el envío de la información', N'', NULL, N'', N'', CAST(0x0000A71A00C99859 AS DateTime), CAST(0x0000A71A00F9D03C AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (38, N'Pa Muebles Sas', N'Laura Perez', N'comercial@pamuebles.com', N'2987628', N'3144054890', N'Cundinamarca', N'Buenas tardes
PA Muebles Somos una empresa dedicada al Diseño, fabricación y mantenimiento de mobiliario para hogares y oficinas, Stands, exhibidores, material P.O.P y locales comerciales, con más 15 años de experiencia en el mercado. Estamos interesados en enviar nuestro portafolio de servicios, me podrían colaborar con un correo donde pueda enviar la información empresarial?', N'Se envía correo al proveedor con los correos de las personas de Marketing encargadas y se envía pantallazo a la gerencia de mercadeo para si gestión.', N'', CAST(0x0000A72000C0DCE4 AS DateTime), N'', NULL, N'', N'El proveedor confirma el recibido de la información y se encuentra satisfecho con la información brindada', N'', NULL, N'', N'', CAST(0x0000A71A00E927F7 AS DateTime), CAST(0x0000A72000C0DCEC AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (42, N'', N'Jhon correa', N'salescorrea@hotmail.com ', N'3204946978', N'3204946978', N'Cundinamarca', N'Buen dia,  estoy interesado en vender productos lubricantes 
Nesecito asesoría

Gracias ', N'Se trato de hacer un acercamiento utilizando el numero celular que aparece aquí pero no fue posible, se envío un correo al cliente con esta observación, se destinara como Responsable a Adrian para que trate de comunicarse por correo electrónico con el cliente', NULL, CAST(0x0000A73200A4B585 AS DateTime), N'', NULL, N'', N'', N'', NULL, NULL, N'', CAST(0x0000A72F00C979BD AS DateTime), NULL, N'Solucion no conforme', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', NULL, NULL, NULL)
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (43, N'', N'Juan Felipe Piedrahita Alvarez', N'pipepiedrahita_33@hotmail.com', N'317 372 99 15', N'317 372 99 15', N'Antioquia y Chocó', N'Buenas noches Sres. R & R lubricantes

Quisiera saber si tienen vacantes disponibles en el area de mercadeo o afines, agradezco su respuesta. Feliz noche.', N'se envía correo a Johana Gomez de selección de personal', N'', CAST(0x0000A7320099C02B AS DateTime), N'', NULL, N'', N'El señor quedo satisfecho con la respuesta y entendió que no existieran vacantes en el momento.', N'', NULL, N'', N'', CAST(0x0000A731015E76F5 AS DateTime), CAST(0x0000A7320099C02D AS DateTime), N'Cerrado', NULL, N'patricia.gonzalez@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (45, N'Compañía colombiana de Cerámica ', N'Laura Palacio ', N'lpalaciou@corona.com.co', N' 454 77 00 ext. 64838', N'3117364145', N'Antioquia y Chocó', N'La Señora Laura Palacio Se comunica Con el CSC, Preguntando  Por un pedido que aun no le han hecho entrega, ella me manifiesta que se siente inconforme porque no cumplen con  la entrega de los  pedidos  solicitado a tiempo, la comunicación con el asesor no es tan buena ya que ella  requiere de el para que le brinde  información pero el nunca le contesta las llamadas, y no esta enterada de las facturas vencidas ni próximas  a vencerse  ella pide que por favor  le ayuden con el cambio de asesor ya que no se siente conforme del asesor asignado  por la atención que este le brinda ', N'Se han efectuado varias llamadas con el fin de realizar el primer contacto pero no ha sido posible comunicarme, se envía correo al gerente de B2B Misael Martinez para solucionar el inconveniente.', N'', CAST(0x0000A73901199720 AS DateTime), N'', NULL, N'Me comunique personalmente con la srta Laura Palacio compradora del Colceramica se explica el porque de la demora de la gestión de pedidos . Cliente con producto en consignación y problemas en la radicacion de facturas , se demuestra q es un problema interno del cliente en la radicacion y pagos de facturas . El cliente actualmente se encuentra al día en sus pagos se sigue atendiendo a traves de Jose Fernando Laverde me comprometi con el cliente que en el caso de que el asesor no conteste me llamen para darle tramite a sus necesidades ', N'Se habla con la señora Laura y nos dice que ya no trabaja en corona, pero hasta hace 20 días que salio las cosas estaban funcionando bien', N'Se realizo llamada telefonica y posteriormente correos electronicos revisando el estado de cartera.', CAST(0x0000A78D00F01846 AS DateTime), N'', N'', CAST(0x0000A7370092D840 AS DateTime), CAST(0x0000A78D00F01848 AS DateTime), N'Cerrado', NULL, N'mmartinez@ryrlubricantes.com', N'Persona Juridica', N'Queja', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (46, N'', N'Luis Fernando Caro Herrera', N'luiferk91@gmail.com', N'3043735841', N'3043735841', N'Antioquia y Chocó', N' Buen dia

 Estimado 

 Mi nombre es Luis Fernando caro Herrera, ingeniero ambiental de profesión, accedo a usted con el objetivo de que mi currículo sea tenido en cuenta para la vacante de Coordinador ambiental en su organización.

Cuento con tres años   de experiencia general, que incluyen auditorías internas en  HSEQ- BPM-HACCP y RSPO Normas ISO 9001:2008, 14001:2004, OHSAS18001:2007 bajo los lineamientos de la ISO 19011:2001,manejo de ERP SAP,en empresa manufactureras de alimentos del Grupo empresarial Oleoflores a base de aceite de palma africana  Margarinas, Aceite refinado de palma y  Shotering como  responsable de la gestión ambiental, la seguridad y salud en el trabajo , y con Geofuturo para gestión integral de residuos donde destaco manejo de RESPEL aceites y otros en   "Yara Cartagena" )

Resido en la ciudad de Medellin; poseo disponibilidad inmediata.

 Agradezco la atención.


Cordialmente,
 
Luis Fernando Caro Herrera
Ingeniero Ambiental
Matricula Profesional COPNIA : 13238-306310 BLV
Mobile: +(57) 3043735841
Email: luiferk91@gmail.com', N'', N'', NULL, N'', NULL, N'', N'La persona afirma que fue contactado y se le explico que en el momento no teníamos la vacante.', N'', NULL, N'', N'', CAST(0x0000A73801235E36 AS DateTime), CAST(0x0000A739011C6480 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (47, N'TECNOACEITES SAS', N'LEIDY GARCIA', N'tecnoaceites@hotmail.com', N'3285263', N'3007876448', N'Eje Cafetero y Valle', N'Buen día.
Amablemente solicitamos nos informen cómo ingresamos a la plataforma de pagos, pues estamos tratando de ingresar y no ha sido posible.
Esperamos su colaboración.
Muchas gracias.', N'Se realizó el primer contacto con la señora Leidy Garcia afirma que al cambiar la clave el botón de ingreso no aparece habilitado, Alejandra Hoyos se comprometió a que Walter estaría visitando la clienta el día Martes 21 de Marzo para realizar el ejercicio y en su defecto comunicarse con nuestra área de soporte para solucionar la situación.', N'', CAST(0x0000A73901200321 AS DateTime), N'', NULL, N'', N'se habla con la señora nos dice que el mismo día la llamo el señor Sebastian y todo quedo resuelto.', N'', NULL, N'', N'', CAST(0x0000A739008EB5B0 AS DateTime), CAST(0x0000A740007A0223 AS DateTime), N'Cerrado', NULL, N'leidy.barrientos@zeuss.com.co', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (50, N'AGENCIA SIGMA SAS', N'MARCIA ORTIZ', N'agenciasigmamedellin@gmail.com', N'3310521', N'3218023389', N'Antioquia y Chocó', N'Buenas tardes,

Somos Agencia Sigma S.A.S. una agencia de la ciudad de Medellín, proveemos servicios de Diseño gráfico, Modelos, Logísticos y nos gustaría enviar nuestro portafolio a su empresa.  Por favor indicarnos a que persona y dirección electrónica lo remitimos.

Cordial Saludos,

Marcia Ortiz
Gerencia Ejecutiva
Cel 3218023389
', N'Se realizo el primer contacto con la señora MARCIA  se le informo que el área de mercadeo se encargaría de contactarla  y contarle sus requerimientos.', N'', CAST(0x0000A747011E89B0 AS DateTime), N'', NULL, N'', N'El proveedor afirma que se le recibió la información pero que ya habíamos contratado estos servicios con otro proveedor.', N'', NULL, N'', N'', CAST(0x0000A746012F775B AS DateTime), CAST(0x0000A747011E89B2 AS DateTime), N'Cerrado', NULL, N'gerenciaventas@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (52, N'gestion integral del riesgo ocupacional', N'gineth rubio', N'administrativo@giro.com.co', N'3000629', N'3168231979', N'Cundinamarca', N'Buenos días,
solicito muy cordialmente la cotizacion de unos lubricantes industriales y automotrices , donde refleje cantidad, precio, y tiempo de entrega.

Muchas gracias.', N'Se realizo el primer contacto con la señora Gineth Rubio quien me confirma estar ubicada en la ciudad de Bogota sector galerías, quieren distribuir la marca, nos comprometimos en asignar un asesor para que la contacte y poder prestarle una asesoría según sus necesidades.', N'', CAST(0x0000A7470121BB92 AS DateTime), N'', NULL, N'', N'Nos comunicamos con la señora Gineth y efectivamente la asesora la visito pero finalmente no se llego a negociación ya que ellos realmente no requerían lubricantes hubo un error en la solicitud, agradeció nuestra atención.', N'', NULL, N'', N'', CAST(0x0000A74700C2F11C AS DateTime), CAST(0x0000A74900D70375 AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (53, N'GRUPO EMOTION SAS', N'CAMILA CASTAÑEDA', N'camilacastaneda@grupoemotion.com', N'7589627', N'3158426746', N'Antioquia y Chocó', N'Buenas tardes, 

Nosotros somos Grupo Emotion, agencia de publicidad BTL especializada en la creación de conceptos creativos, montajes y desmontajes de eventos,  stands y activaciones de marca a nivel nacional e internacional. Queremos manifestar nuestro interés en sostener una relación comercial con ustedes aprovechando su posible participación en FERIA DE LAS 2 RUEDAS 2017  por ello les remito por este medio nuestro portafolio de servicios para stands. 

Adicionalmente quisiera saber si les interesaría programar una cita para revisar más a fondo nuestros portafolios de servicios. 

Puede conocer más de nuestro trabajo visítenos en:  www.grupoemotion.com

Saludos. 
', N'se realiza contacto con el proveedor se suministra información sobre los correos de mercadeo y se informa que su ofrecimiento sera enviado por correo al gerente de Mercadeo.', N'', CAST(0x0000A7510108E861 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A75100BAB1A9 AS DateTime), CAST(0x0000A7510108E863 AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Sugerencia', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (55, N'SPACE GROUP DESIGN SAS', N'SANDRA OLARTE', N'marketingspacegroup@gmail.com', N' 5209607', N'311 2283934', N'Cundinamarca', N'Señores.
 
Es un gusto presentarnos somos SPACE GROUP DESIGN   somos una Compañía  especializada en el diseño y montaje  de stands, exhibiciones   comerciales,  diseño  e    instalación  locales  y oficinas, diseño y producción de mobiliario, escenografías, show room y señalización entre otros.
 
Nuestra  pasión  y profesionalismo hace de cada proyecto un  éxito.
 
Nos gustaría  que nos dejara elaborar  una propuesta de diseño para usted que cumplan con sus necesidades específicas. Le agradeceríamos  que nos suministrara  información como   planos, dimensiones, medidas, sugerencias y presupuesto para realizar una propuesta para su proyecto sin ningún tipo de compromiso.
 Esperamos contar con su respuesta para hacer de su proyecto un éxito, Cualquier información adicional comuníquese con nosotros.
 	
Agradezco su Atención

SANDRA OLARTE
SPACE GROUP DESIGN SAS', N'se realiza el primer contacto con el señor Hugo Mantilla, se le informa que esta propuesta sera enviada al gerente de mercadeo y este a su vez se estará comunicando con ellos.', N'', CAST(0x0000A75900979E25 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7580138D0A9 AS DateTime), CAST(0x0000A75900979E27 AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Sugerencia', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (125, N'', N'Yuris Eliana Montiel Avalos', N'rujegmotos@hotmail.com', N'3014853221', N'3215029579', N'ANTIOQUIA', N'La cliente solicita cambio asesor ya que la atendía el asesor Edgar y hace mas de un año que el no esta y ninguna otra persona la ha visitado. Se le informo a la cliente que la asesora que tenia a cargo en estos momentos era Maria Luisa Diaz pero ella solicito el cambio ya que ella nunca la ha hido a visitar ni la ha llamado. Gracias', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7C500D45C60 AS DateTime), NULL, N'Pendiente', N'CAREPA', N'milena.cardona@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (86, N'', N'fernando carvajal', N'comercializadoracalfer@gmail.com', N'3102664123', N'3102664123', N'BOGOTA DC', N'Cordial saludo,
Solicito por favor me envíen a mi correo electrónico una cotización de los productos que manejan para motocicletas...gracias
', N'Se realiza primer contacto con el señor Fernando Carvajal quien cuenta con un CDA para Motocicletas ubicado al Sur de Bogota, en la actualidad compra los productos de Marca Mobil en la sesta.
se le dijo que se le asignaría un asesor el cual le estaría contactando para acordara una cita de hoy a mañana.', N'', CAST(0x0000A77E01207749 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A77E00D41C0A AS DateTime), CAST(0x0000A79900BC3CEF AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (87, N'', N'Francisco Herrera ', N'fjalmacen@gmail.com ', N'8785986', N'3194302529', N'BOGOTA DC', N' Buenos días, 
El cliente Francisco Herrera se comunicó el día lunes 22 de mayo con CSC para solicitar un pedido debido a que informa que nunca  los volvieron a visitar, Se realiza el proceso de activación del cliente   “TOVAR CRUZ JULIETH  con 112810 “debido a que envió de nuevo  la documentación, se tomó el pedido en el DMS y  adicional se le envió la información a el asesor (Didier Otálora ) para que se pusiera en  contacto con el cliente para información de precios ya que un producto solicitado no contaba con descuentos autorizados, pero de este nunca recibimos la confirmación debido a que tampoco respondió llamadas. 
El cliente informa que el asesor se comunicó con él  y le indico que el día martes lo visitaría y le brindaría la información en cuanto a precios.  Pero aun el día de hoy NO ha recibido ni la visita ni la llamada.
Al verificar en el sistema registra que para el día de hoy 26/05/2017 se facturo apenas el pedido y los descuentos fueron autorizados también el día de hoy,
Cliente inconforme por la tardanza en la entrega del producto y la poca información de los precios debido a que lo que se facturo el día de hoy el señor francisco no conoce los valores, lo que hace probable que realce devolución de dichos productos.
Cliente actualmente requiere el portafolio de los descuentos ya que indica que está interesado en seguir comparando con nuestra compañía. 
', N'No se realiza llamada al cliente nuevamente por que ya la asesora del CSC tuvo ese contacto y no se pretende acosar al cliente, es importante desde mi punto de vista revisar muy bien el tema pues el cliente nos contacta dándonos la oportunidad de brindarle un buen servicio pero hicimos lo contrario acordamos cosas que no cumplimos y creando inconformidad en el cliente.', N'', CAST(0x0000A77F01004D52 AS DateTime), N'', NULL, N'Realice llamada al Señor Francisco, quien comunicó que todo a la fecha esta corregido que el asesor esta pasando de forma regular', N'', N'', NULL, N'', N'', CAST(0x0000A77F00BC3337 AS DateTime), CAST(0x0000A79900C89EE4 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (29, N'', N'Tatiana Martinez', N'tatiuptc.12@hotmail.com', N'3124567543', N'3124567543', N'Cundinamarca', N'Estoy interesada en la venta de los productos de Mobil
Agradezco ponerme en contacto con ustedes, gracias', N'se realiza contacto con la señora Tatiana Martinez indagando su ubicación y nos dice que esta ubicada en Casanare, se realiza contacto con Ludesa quien es el distribuidor que atiende esta zona para que realice contacto con el cliente, se llama nuevamente al cliente y se le suministra numero telefónico de la gerente de zona de Ludesa Flor Paez.', N'', CAST(0x0000A70E01011275 AS DateTime), N'', NULL, N'', N'El cliente queda satisfecho con nuestro servicio ', N'', NULL, N'', N'', CAST(0x0000A70D00F8BDF1 AS DateTime), CAST(0x0000A70E01011276 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (31, N'', N'FABIO REINA', N'freina@profactor.com.co', N'3186514932', N'3186514932', N'Eje Cafetero y Valle', N'Buenas Tardes,

Me gustaría presentarle la empresa PROFACTOR SAS, dedicada entre otras actividades a la compra de facturas (Factoring), la idea es que R Y R LUBRICANTES S.A. realice las operaciones de factoring ( tanto para clientes como para proveedores).

Como funciona:

FACTORING PARA CLIENTES

En Profactor S.A.S  manejamos una tasa entre el 1.5% N.M.V. y el 2.2%N.M.V. , este porcentaje depende de tres factores: pagador, plazo y monto de la factura. 

Después de estudiar la empresa pagadora y R Y R LUBRICANTES S.A. como codeudora les haremos saber a qué tasa podemos negociar la factura en caso que haya sido aprobada por el comité de crédito.

FACTORING PARA PROVEEDORES

Se maneja de la misma forma que el factoring para clientes, en este caso  R Y R LUBRICANTES S.A. podra ofrecerle a sus proveedores que necesiten liquidez inmediata realizar el factoring con PROFACTOR S.A.S; como R Y R LUBRICANTES S.A. cuenta con unos excelentes estados financieros, la aprobación por parte de PROFACTOR S.A.S a sus proveedores no tendría ningún inconveniente.

NOTA DE INTERES: cuando una compañía compra y/o vende su facturación, esta operación no afecta su endeudamiento pues es la compra y/o venta de un activo al descuento.



Quedo atento a cualquier inquietud
', N'Se realizo el primer contacto con el señor Fabio Reina quien en resumen me dice que ellos compran la factura, se le informo que esto se remitiría a la persona encargada del tema en nuestra compañía y este a su vez se comunicaría  con  el.', N'', CAST(0x0000A70F011934B4 AS DateTime), N'', NULL, N'El proveedor entiende que no estamos interesados en este tipo e ofrecimiento', N'', N'', NULL, N'', N'', CAST(0x0000A70E01023FD0 AS DateTime), CAST(0x0000A7120096438B AS DateTime), N'Cerrado', NULL, N'juan.hoyos@estinsa.com', N'Persona Natural', N'Solicitud de Información', N'', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (49, N'', N'jenniffer', N'azulejo_jcm@hotmail.com', N'3158132844', N'3158132844', N'Cundinamarca', N'buenas tardes, quiero saber si distribuyen mobil 4T para motocicletas en la ciudad de villavicencio.', N'Se realizo el primer contacto con la señora Jennifer y se le explico que no era nuestra zona de mejor esfuerzo por lo tanto no era posible atenderla, que el distribuidor para esa zona era Ludesa. ', N'', CAST(0x0000A7430137C42B AS DateTime), N'', NULL, N'', N'El cliente queda satisfecho con la respuesta y entiende la situación.', N'', NULL, N'', N'', CAST(0x0000A74300F84F1A AS DateTime), CAST(0x0000A7430137D5D8 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (56, N'', N'Javier Leyva ', N'javierleyva@sunoilespana.com', N'0034684048039', N'0034684048039', N'Antioquia y Chocó', N'Buenos días,

Mi nombre es Javier Leyva y soy la nueva incorporación a la firma Sun Oil (www.sunoilespana.com) que distribuye los aceite lubricantes y grasas de la marca americana Sunoco Lubes (https://www.sunocolubes.com/).  

Debido al rápido crecimiento de la compañía en Europa y África, Sun Oil está buscando nuevos distribuidores en América Latina (por ahora hemos conseguido distribuidores en Uruguay y Ecuador). Actualmente en Colombia no tenemos distribuidor de ningún tipo, un punto a tener muy en cuenta.

En caso de que le interesase formar parte del equipo Sunoco, por favor no dude en contactar conmigo para más detalles o bien facilíteme un teléfono de contacto y nos pondremos en contacto con usted. En caso contrario, le pido disculpas por este email. 
', N'se envía correo electrónico agradeciendo el ofrecimiento y explicando nuestra distribución exclusiva de la marca Mobil', N'', CAST(0x0000A759009EE78F AS DateTime), N'', NULL, N'', N'El cliente agradece nuestra respuesta y entiende nuestra posición.', N'', NULL, N'', N'', CAST(0x0000A75900365D34 AS DateTime), CAST(0x0000A759009EE791 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (57, N'LYP auto parts', N'Andreina Gonzalez', N'sales3@autolyp.us', N'1-818-6191688', N'1-949-2077126', N'Antioquia y Chocó', N'Buenas Tardes,

	Aprovecho esta oportunidad para presentarles nuestra compañía ¨LYP¨ la cual esta ubicada en Irvine, California, USA, como una de las empresas mas exitosas en el area automotríz, fábricamos todo tipo de repuestos y accesorios para autos en China, y de la misma manera distribuimos nuestros productos a nivel mundial.  Nuestros productos son fabricados con la más alta calidad del mercado, y el mejor precio competitivo. Nuestro nombre ¨LYP¨ es reconocido como simbolo de éxito y satisfacción entre nuestros clientes.

	Nuestro producto principal son repuestos y accesorios de automoviles y carga, nos especializamos en motores, transmisiones, chasis, frenos, 4x4 rústicos repuestos, etc. Entre los productos tenemos motores, cabezal de cilindro, cigueñal, biela, sensores del cigueñal, bomba de gasolina, bomba de agua, cargador turbo, arranque, alternador, equipo del pedal de embrague o croche, caja de cambios, ejes, diferencial, cubos de rueda libre o cubos de bloqueo, discos, ballestas, y muchos otros repuestos y partes eléctricas que necesiten. Además, cubrimos la necesidad del cliente a su medida, nos especializamos en fabricar nuevos productos según el diseño específico del cliente.

	Esta es una breve introducción de nuestros productos y catálogos, para mas información, lo invitamos a visitar nuestra pagina web: www.autolyp.us para mas detalle de nuestros produtos. 

 Somos la empresa lider en fabricación y distribución del mercado automotríz, por eso ofrecemos los mejores precios y productos de excelente calidad. Despues de recibir el primer pedido estoy segura que quedará satisfecho con nuestra calidad y servicio. Estamos seguros que podemos proveerles todas sus futuras ordenes.

	Cualquier pregunta sobre nuestros productos, no dude en contáctarme en cualquier momento del dia, con mucho gusto le respondere.

	Gracias, y estamos para servirles.

	Saludos cordiales,


	Mrs. Andreina Gonzalez
            Internet & Marketing Manager
	
       LIAONING AUTOMOTIVE ZONE MFG. GROUP USA INC.
	Address: 8 Whatney, Irvine  CA 92618  USA
	Tel: +1 949 207 7126   /+1 818 629 1688
	EMAIL: SALES3@AUTOLYP.US
                     HTTP://WWW.AUTOLYP.US




', N'se envía correo electrónico explicando nuestra actividad comercial y distribución autorizada de ExxonMobil de Colombia', N'', CAST(0x0000A75A00F9E0B7 AS DateTime), N'', NULL, N'', N'Agradecen nuestra respuesta y entienden nuestra posición.', N'', NULL, N'', N'', CAST(0x0000A75A00DAE5C3 AS DateTime), CAST(0x0000A75A00F9E0BB AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (61, N'', N'Maycol Naranjo', N'Maycolnaranjo_10@hotmail.com', N'3164044241', N'3164044241', N'Antioquia y Chocó', N'Informacion comercial, cotizacion para negocio nuevo de libricantes para autos.', N'Se realizo el primer contacto con el señor Maycol Naranjo, se identifico que el negocio es un centro de lubricación de vehículos livianos ubicado en el sector de Niquia Bello, se quedo en el compromiso de asignarle un asesor en este caso Marlly Gallego quien atiende esa linea en ese sector.', N'', CAST(0x0000A76200EF54F2 AS DateTime), N'', NULL, N'', N'El señor afirma que fue contactado pero el proyecto lo tiene en Stand-by', N'', NULL, N'', N'', CAST(0x0000A7610002E67C AS DateTime), CAST(0x0000A76200EF54F4 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (62, N'', N'Mario Coma', N'margie_mcl@hotmail.com', N'3142233876', N'3142233876', N'Cundinamarca', N'el señor Mario Coma de CORREA LOPEZ MARGOT/ MARIO MOTOS informa que los productos solicitados a la empresa le llegan sumamente costos, que no se le esta brindando descuentos,  ni ninguna promoción  ya que realiza compras hasta de 30 productos pero estos le están llegando $ 5000 y $ 6000 pesos mas costosos que antes, ha consultado en varias partes y los encuentra mas económicos. Ha hablado con la asesora Johana Leon para que le brinde descuentos pero lleva una semana  en la cual no le da ninguna respuesta ni ve que haga nada.
anteriormente cuando tenia de Asesor al señor Mauricio no se le presentaba este inconveniente ya que el revisaba en el sistema y gestionaba para brindarle descuentos y le llegaba los pedidos a buen precio. Continuo a su negocio hay un almacén en el cual compran los productos mas baratos y los venden muy favorables. En el día de hoy tendrá visita de un nuevo proveedor para brindarle información de los productos ya que nos encontramos muy costosos y nadie le brinda información y no sabe con quien tiene que hablar para que le brinde descuentos ya que los precios son muy costosos. ', N'Se hablo con el señor Mario se encuentra muy inconforme con el servicio afirma que lleva mas de 10 días esperando una respuesta de su asesora Johana Leon sobre un descuento que solicito y no le han dicho nada y que ya se quedo sin aceite, que el no puede trabajar a nuestro ritmo, que si no le podemos dar mas descuento que simplemente le informemos pero que no lo dejemos esperando. 
se realiza llamada Adrian para impulsar la solución de esta inconformidad', NULL, CAST(0x0000A7630092623E AS DateTime), N'El Gerente nacional de ventas considera que los margenes son muy bajos para el negocio, ', CAST(0x0000A76900693FD5 AS DateTime), N'', N'', N'No es posible que RYR le mejore sus precios', CAST(0x0000A76900693FEB AS DateTime), NULL, N'', CAST(0x0000A76200C288D2 AS DateTime), NULL, N'Solucion no conforme', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja', N'Servicio', N'1', NULL, NULL, NULL)
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (63, N'Tecniussautos 115603', N'Edwin ussa ', N'Tecniussautos@gmail.com', N'5380277 ', N'3177167528 ', N'Cundinamarca', N'Buenos días,

El día  de hoy sostuve una conversación con el señor EDWIN USSA , este cliente pertenecía a Jessica , el cliente me dice que nadie va a visitarlo. 
Se le informo sobre la cartera que tiene pendiente,  el me manifiesta que requiere  que le recojan un cheque para poder cancelar  las  facturas pendientes. 

Contacto : Edwin ussa 
Teléfono: 5380277 

El cliente solicita que le den una respuesta  para poder hacer pedido.

', N'Se realizo el primer contacto el señor afirma que hace aproximadamente un mes no lo visitan y requiere que se le recojan un cheque.', N'', CAST(0x0000A76400824BCB AS DateTime), N'El nuevo asesor se comunico para acordar fecha', CAST(0x0000A7680103FD56 AS DateTime), N'', N'El señor Edwin Ussa afirma que el tema fue solucionado y lo ha estado visitando la asesora Paula, se ha sentido bien atendido hasta el momento.', N'', NULL, N'', N'', CAST(0x0000A76300C9A9F2 AS DateTime), CAST(0x0000A76801046932 AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Queja', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (64, N'Combustibles Unigas', N'Hernan Camargo', N'hernan.camargo@grupounigas.co', N'3175142001', N'3175142001', N'Cundinamarca', N'Buenos dias

Combustibles uniga tiene 7 EDS y quisiera ver la posibilidad de adquirir los productos de ExxonMobil a través de ustedes, mi contacto 317 514 2001,Hernan Camargo Director EDS.', N'se realiza el primer contacto con el señor Hernán quien cuenta con EDS en Bogotá, Yopal y Santander, en Bogotá cuenta con 6 EDS y un mas pendiente por terminar construcción.
era cliente de Ludesa pero por la situación de Ludesa quiere cambiar de Proveedor.', NULL, CAST(0x0000A769011FF0D0 AS DateTime), N'', NULL, N'', N'', N'', NULL, NULL, N'', CAST(0x0000A76800C23EE6 AS DateTime), CAST(0x0000A77701131851 AS DateTime), N'Solucionado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, NULL, NULL)
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (65, N'', N'Adriana Milena Cordoba Pereria', N'adrianacordobapereira@hotmail.com', N'3186335610', N'3186335610', N'Antioquia y Chocó', N'Cordial  saludo,

Quiero ofrecer mi portafolio como proveedora de servicios ambientales independiente, por favor me indica un email de contacto donde enviarlo.

Gracias,
', N'se realizo primer contacto con la señora Adriana Milena y se enviaron datos de correos de las personas a las cuales les puede enviar la información.', N'', CAST(0x0000A769011C0A7D AS DateTime), N'', NULL, N'', N'La señora Adriana afirma que ella envío la información a estos correos analistasst@estinsa.com
analistasst@zeuss.com. y nunca obtuvo una respuesta. esta queda de nuevo montada como PQRS pendiente de solución.', N'', NULL, N'', N'', CAST(0x0000A76801031ED9 AS DateTime), CAST(0x0000A769011C0A7F AS DateTime), N'Pendiente', NULL, N'patricia.gonzalez@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (68, N'xtreme biker', N'oscar gomez', N'oscargomez0715@gmail.com', N'6946042', N'3209468223', N'Cundinamarca', N'como estan.
estoy interesado en la compra de lubricantes mobil para motocicleta. me podrian enviar informacion de productos y costos, cantidades. los productos ya los conosco, lo que mas necesito es precios para la venta en mi almacen.

de antemano gracias por su respuesta.', N'No ha sido posible realizar el primer contacto con el cliente, en el numero celular no me contestan y en fijo esta errado.
se envía correo con datos de contacto nuestros y se copia al gerente de la zona Adrian Romero. ', N'', CAST(0x0000A77000B81F9D AS DateTime), N'', NULL, N'', N'No fue posible realizar contacto con el cliente se llamo por varios dias', N'', NULL, N'', N'', CAST(0x0000A76C01341F27 AS DateTime), CAST(0x0000A77000B81F9F AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (69, N'', N'erica galeano', N'ericamgq@hotmail.com', N'6067318', N'3007455941', N'Antioquia y Chocó', N'hola buenos días, desearía saber si hay algún departamento de bienestar social, que apoyen a pequeños empresarios, como yo, cuando están en estado de posible quiebra y quieran adquirir un apoyo de otros empresarios como RyR; que puedo o tengo que hacer para adquirir esa ayuda. ya sea de productos en consignacion, o un plazo de 60 dias para pago de productos o donacion de productos y a cambio tener una especie de pequeña bodega en la zona de aranjuez   
gracias', N'Se realizo contacto con la señora Erika Galeano se identifico que nos compraba en el 2016 contra entrega en efectivo con el código 114337, esta buscando básicamente apoyo de los distribuidores para no tener que cerrar el negocio.', N'', CAST(0x0000A77000BB68BB AS DateTime), N'', NULL, N'La señora se llamó pero no es posible apoyarla con el auxilio que requiere.', N'', N'', NULL, N'', N'', CAST(0x0000A76F00B42031 AS DateTime), NULL, N'Cerrado', NULL, N'milena.cardona@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (70, N'', N'JIMENA GARNICA', N'FRANCYGARNICA@YAHOO.ES', N'3123909993', N'3112855438', N'Cundinamarca', N'Tenemos almacen de lubriantes y deseo comparles  no volvimos a resivir la visita de sus acesores', N'se realizo primer contacto con la señora Francy Garnica quien afirma que desde que la atendía Edgar Valero no volvieron a recibir visitas de nuestros asesores y están interesados en comprarnos, cliente ubicado en Zipaquirá con código 208138.
comunicarse con  la señora Francy o Jimena ', N'', CAST(0x0000A77000BDEEE6 AS DateTime), N'', NULL, N'Fue visitado, te le vendimos.', N'Se creo en el sistema y el cliernes 4 de agosto llega su promer pedido. ', N'', NULL, N'', N'', CAST(0x0000A76F0165B3D1 AS DateTime), CAST(0x0000A79900C48B62 AS DateTime), N'Solucionado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, 1, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (71, N'GARNICA FRANCISCO', N'Francy Garnica', N'francygarnica@yahoo.es', N'3112855438', N'3112855438', N'Cundinamarca', N'El cliente envía correo electrónico solicitando listado de precios de los productos Mobil.', N'PQRS repetida', N'', CAST(0x0000A77000BE075C AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A77000B4BB1C AS DateTime), CAST(0x0000A77000BE075E AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Queja', N'Servicio', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (74, N'CORPORACIÓN DIA MUNDIAL DE LA PEREZA', N'YOVIS MANUEL ALVAREZ GARCIA', N'perezaitagui@hotmail.com', N'2771379', N'3207307134', N'Antioquia y Chocó', N'Nos complace ponernos a su disposición  y articular esfuerzos, en bien de nuestros objetivos comunes  y  el desarrollo cultural de  nuestro municipio de Itagüí.
Hacemos contacto con ustedes, con el propósito de ponerlos al tanto de las proyecciones que adelantamos para la realización de la XXXIII versión del día mundial de la pereza 2017, en procura de hacerlos participes sobre los avances y objetivos que perseguimos para este año, de manera que ustedes puedan estudiar la viabilidad de hacerse parte vincularse, y brindarnos su apoyo.
En esta XXXIII versión 2017, proyectamos iniciar actividades de organización y gestión a partir del mes de marzo, hasta  el día domingo 20 de agosto cuando se lleva a cabo el gran día. En esta ocasión nos adelantamos  en el tiempo, en aras de conseguir los aliados que no ayuden en esta tarea de procurar una fiesta como  los Itagüiseños nos merecemos.  
El día mundial de la pereza, se ha venido realizando con recursos mixtos, provenientes del municipio de Itagüí y el apoyo de algunas empresas del sector privado, que además, de aportar al fortalecimiento cultural del municipio y nuestra organización, han encontrado una oportunidad importante para promocionarse. Respetados Amigos, la vinculación de su empresa, se constituye en apoyo vital  para nuestra organización y en  una oportunidad para el fortalecimiento de iniciativas conjuntas que potencien la interacción entre los que hacemos de Itagüí el  lugar para la vida, el trabajo y el descanso. 
Para sus respuestas y observaciones  no duden en  ponerse contacto con nosotros.
Cordialmente, 

Yovis manuel alvarez

Promotor
3207307134', N'se envía correo a Mercadeo para efectos de alguna vinculación.', N'', CAST(0x0000A77B0113D9A6 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7780116F7A8 AS DateTime), NULL, N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'Directo')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (30, N'', N'PABLO PEREZ', N'VENTASRUL6@RULHERMAQ.COM', N'+5932597133', N'+593997167257', N'Cundinamarca', N'BUENOS DIAS
NECESITO LA GRASA LUBRICANTE VAL-TEX 2000 LIGHT LUBE PARA QUITO ECUADOR', N'Es una solicitud para Ecuador, se envía correo electrónico al cliente explicando que somos Distribuidores de la Marca Mobil para algunas regiones de Colombia pero que puede contactar a Distribuidores de Mobil en ecuador', N'', CAST(0x0000A70E01162471 AS DateTime), N'', NULL, N'', N'El cliente agradece nuestra aclarcion', N'', NULL, N'', N'', CAST(0x0000A70E0096951F AS DateTime), CAST(0x0000A70E01162491 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (73, N'JMC Medellin', N'Duvan Velasquez', N'jefetaller@jmc.com.co', N'3222562', N'3195790976', N'Antioquia y Chocó', N'buenos días.

me dirijo a ustedes para solicitar una propuesta comercial, JMC Medellin es un punto directo de fabrica, el cual hace poco fue inaugurado en la ciudad de Medellin, pero tiene presencia en el país hace mas de 12 años. por lo cual estamos en el montaje del taller y necesitamos un proveedor de lubricantes Mobil para esta ciudad.

agradezco que se pongan en contacto conmigo al menor tiempo posible para coordinar una cita', N'Se realizo el primer contacto con el Señor Duvan Velasquez el Jefe de Taller y Almacén el señor me dice que son puntos de fabrica de los camiones JMC inicialmente estaban ubicados en Bogota ahora van a abrir una cede en Medellin y están interesados en trabajar con nosotros, están ubicados en Cll 27 # 41-140 Itagui cerca ala bodega.
Esto lo necestitan urgente', NULL, CAST(0x0000A7740122170D AS DateTime), N'', NULL, N'', N'', N'', NULL, NULL, N'', CAST(0x0000A77200C370A4 AS DateTime), CAST(0x0000A7750081B1CF AS DateTime), N'Solucionado', NULL, N'milena.cardona@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, NULL, NULL)
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (116, N'', N'julian monsalve', N'julianmonsalve05@gmail.com', N'3192682258', N'3193269944', N'ANTIOQUIA', N'Cordial saludo

El Club deportivo Guadalupe es una entidad sin ánimo de lucro que viene trabajando y apoyando el crecimiento deportivo y social en el área futbolístico desde hace 5 años de aproximadamente 40 niños entre 9 y 12 años la gran mayoría pertenecientes a los estratos socioeconómico 1 y 2 de las comunas 1 y 3 de Medellín. De acuerdo con lo anterior y con el fin de que no deserten y el club pueda tener más cobertura nos hemos venido organizando mejor deportiva y administrativamente.
Para continuar con nuestra labor, incrementar el nivel deportivo y la participación de los deportistas en diferentes competencias de la ciudad, nos vimos en la necesidad de generar una estrategia de gestión de recursos tanto económicos como materiales, la cual consiste en tocar las puertas  de aquellas entidades cercanas y que deseen apoyar este proyecto a través de su corresponsabilidad social; es por lo anterior que extendemos a ustedes la invitación a ser parte de este.
Hemos hecho grandes esfuerzos por inscribir nuestros deportistas para participar en la liga Antioqueña de Futbol, un reto grande para los deportistas, las familias y el club. Dado que las familias de nuestros deportistas y nosotros como directivos no contamos con un nivel económico alto con el cual podamos cubrir muchos de los aspectos de la formación y competencias de los deportistas, les solicitamos a ustedes hacer un aporte de acuerdo a las capacidades de la entidad y las necesidades sentidas del club para lograr los fines propuestos.

Estos aportes los pueden hacer en uno o varios de los siguientes aspectos:
1.	Implementación Deportiva: Dotación de uniformes de juego y/o presentación para los deportistas y entrenadores ( este aspecto será de gran ayuda y beneficio para ambos, para ustedes dado q la Liga Antioqueña es una vitrina comercial importante en todo el departamento de Antioquia, ya que estos uniformes tendrían la publicidad y resaltaría la marca de su empresa, además les servirá para el descuento en responsabilidades tributarias; y para nosotros para la buena presentación en dicha competencia y ayuda económica a las familias de los deportistas y entrenadores, en este caso estamos compitiendo con uniformes con casi dos años que ya los tenemos en mal estado.

2.	Implementación Deportiva: Elementos para entrenamientos y competencias tales como pitos, conos, cronómetros, tablas de apoyo, escaleras de entrenamiento, Petos, y lo más importante que consta de baloneria numero 4 y 5, ya que los balones que tenemos en su mayoría son prestados por los mismos deportistas y el club no cuenta con balones propios.

3.	Apoyo Económico: El cual se utiliza para transporte, dado que debemos desplazarnos por distintos municipios dentro y fuera del valle de aburra que es donde se realizan las diferentes competencias de la liga Antioqueña

La ayuda o patrocinio seria de gran valor para nosotros para seguir formando a estos pequeños deportistas que están creciendo con un sueño, y es de gran beneficio como pauta publicitaria en la ciudad y demás municipios de Antioquia.
El club cuenta con todos sus documentos al día tales como reconocimiento deportivo ante el INDER, y Rut actualizado para fines tributarios
De antemano agradecemos la atención y apoyo; quedamos a espera de una respuesta ojala positiva para que nuestros deportistas sigan avanzando en el proceso formativo y competitivo.
Atentamente:

JULIAN ESTEBAN MONSALVE			LISSED CATAÑO
PRESIDENTE							TESORERA
Cel: 3193269944					Cel.: 3005973101
Lugar de Entrenamientos: unidad deportiva de Sam Blas
Lunes y viernes: de 5 pm a 7 pm y martes y jueves de 6 pm a 8 pm
Julianmonsalve05@gmail.com
Clubdeportivoguadalupe2017@gmail.com
   CLUB DEPORTIVO GUADALUPE Resolución INDER 405
      
', N'se realizo el primer contacto con el señor Julian es presidente de un equipo de futbol de niños entre los 9 y los 13 años del sector de Manrique, están participando en el torneo de la Ponifutbol y de la liga Antioqueña,  Teleantioquia y Telemedellin están dando información constante sobre la Ponyfutbol y por la emisora la Mega, el torneo de la liga Antioqueña es comentado básicamente por emisoras de deportes.
lo que estas buscando un Patrocinio el cual puede ser en uniformes y tiene todos los espacios disponibles.', N'', CAST(0x0000A7BD00AC9D13 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7BB01657FBF AS DateTime), NULL, N'Cerrado', N'MEDELLIN', N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'OTROS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (39, N'', N'Giovani Ríos Hernandez', N'comercialmed@cdmequipos.com', N'4484144', N'3133526475', N'Antioquia y Chocó', N'Buenas Tardes, nos gustaria presentar nuestro portafolio de equipos para el conteo de billetes, monedas y otras alternativas para la gestion del efectivo a la empresa, por lo cual les agradecemos el dato de contacto de la persona encargada de evaluar estas propuestas para enviarle nuestro portafolio, muchas gracias', N'se envía correo explicando que nuestra compañía no recibe efectivo y por lo tanto no nos aplica el producto.', N'', CAST(0x0000A72000C2D91A AS DateTime), N'', NULL, N'', N'El proveedor quedo satisfecho con la explicación.', N'', NULL, N'', N'', CAST(0x0000A71D00AF6738 AS DateTime), CAST(0x0000A72000C2D91D AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (72, N'LUBRISERVICIOS LA 130', N'ROSA MORA', N'lubricantesla130@gmail.com', N'7920205', N'3114639149', N'Cundinamarca', N'Buenas tardes, quisiera por favor visitar nuestro punto de venta ubicado en prado veraniego calle 130 # 45-14', N'se realizo el primer contacto con la señora Rosa Mora quien tiene un CDA en prado veraniego Cll 130 # 45-14 atienden vehículo liviano y pesado y algo de MCO, quieren trabajar con nosotros.
nos comprometimos a una segunda comunicación por parte del gerente o uno de nuestros asesores para atender sus necesidades.

', N'', CAST(0x0000A774011A618B AS DateTime), N'', NULL, N'Se entrego oferta comercial, Compañia de Lubricantes tanbien cotizo. al parecer con mejor precio.', N'', N'', NULL, N'', N'', CAST(0x0000A77001193943 AS DateTime), CAST(0x0000A79900BC019C AS DateTime), N'Solucionado', NULL, N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'Despacho incompleto', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (75, N'', N'MARTHA GAVIRIA DE OCAMPO', N'ZEUSSDABEIBA@YAHOO.ES', N'8590055', N'3116029313', N'Antioquia y Chocó', N'MUY BUENAS TARDES, SOY CLIENTE DE USTEDES PERO VEO QUE TIENEN UN PROBLEMA DE LOGÍSTICA PARA ENTREGAR LA MERCANCÍA, COMO ES POSIBLE QUE YO TENGO EN CARTERA UNA FACTURA DEL 16 MAYO FACTURADA Y LOS DIAS CORRIENDO Y AL DIA DE HOY NO ME LLEGA LA MERCANCIA, PERO PARA UNO HACER UN PEDIDO EL SISTEMA SI LO BLOQUEA PORQUE TIENE UNOS DIAS VENCIDOS  ', N'Se ha tratado todo el día de realizar el primer contacto con el cliente y ha sido imposible, este cliente es de Maria Luisa. GESTION MARIA ALEJANDRA SALAZAR: hable con el señor Oscar Ocampo, el es el administrador de la EDS y fue quien realizó la queja en la pagina de R&R. el se queja porque le estamos cobrando las facturas y  entregando hasta 10 días después. tiene 2 facturas asi: la #80261 que tiene fecha del 10 de Mayo y fue entregada el dia 16 y la factura #80331 con fecha del 16 de Mayo y entregada el 23 de Mayo. se enviara correo a cartera para que tengan en cuenta estos días adicionales al momento del pago, y se tomaran acciones correctivas para que las correrías de Urabá sean facturadas el mismo día que sale el carro y no este la factura hecha con anterioridad porque se ve perjudicado el cliente.
  ', N'sebas-207@hotmail.com', CAST(0x0000A77B0117A033 AS DateTime), N'', NULL, N'se enviara correo a cartera para que en las 2 facturas realizadas y entregadas en fechas posteriores se le de esos días adicionales de plazo al cliente. se tomaran las acciones correctivas con Maria Luisa Diaz para que no haga facturar los pedidos con anticipación si la correría aun no esta definida para salir, de ser cancelada una correría se deben anular las facturas o cambiar la fecha al dia de salida para que el cliente no pierda esos días de plazo', N'Se hablo con el señor Oscar Ocampo hijo de la señora Martha el cual afirma que lo contactaron y le explicaron que se iba a notificar en cartera el tema para organizarles lo del plazo, en términos generales el cliente quedo satisfecho.', N'Buenos días Señor Oscar, según nuestra conversación será enviada a cartera la información de sus dos facturas entregadas en fechas posteriores para que su plazo de pago no se vea afectado y se tomaran las acciones correctivas para que sus facturas le lleguen en le fecha correcta del dia de entrega. esperando no causarle ningún inconveniente. muchas gracias por su atenta comunicación con nosotros!', CAST(0x0000A77F00A04038 AS DateTime), N'', N'', CAST(0x0000A77A011806B9 AS DateTime), CAST(0x0000A77F00A0403A AS DateTime), N'Cerrado', NULL, N'maria.salazar@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Incumplimiento en fecha de entrega', N'1', NULL, 0, N'Directo')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (44, N'', N'Carlos felipe vela calle', N'Carlosfelipevela28@hotmail.com', N'3138905900', N'3138905900', N'Eje Cafetero y Valle', N'Buen día estoy interesado en saber el precio al por mayor de Mobil Super 4t 20w50 y Mobil Mx 15 w40 en balde y Tambor', N'Hemos tratado de comunicarnos con el cliente pero no ha sido posible, se envía correo al cliente y a la gerente de la zona correspondiente', N'', CAST(0x0000A73700B5CFCB AS DateTime), N'', NULL, N'', N'no fue posible comunicación con este cliente se llamo por varios días', N'', NULL, N'', N'', CAST(0x0000A732016AF6A1 AS DateTime), CAST(0x0000A73700B5CFCE AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (48, N'Enertem S.A.S', N'jenny Gomez - Analista de compras', N'jenny.gomez@bristol.la', N'3117705896', N'3117705896', N'Antioquia y Chocó', N'Los primeros días del mes de Marzo se realizo un despacho para Enertem, este se hizo desde la bodega de Itagui hacia la ciudad de Barranquilla, en total se enviaron por la empresa Transportes Rápido Ochoa un total de 40 garrafas de Mobil Delvac MX ESP 15W40 identificada con numero de lote C720351.

Como novedad el cliente reporto el Jueves 16 de marzo que le llego una unidad adulterada, argumenta que la garrafa fue abierta, le sacaron el aceite bueno y la llenaron de aceite quemado, luego volvieron a pegar el recipiente con pega loca para que pasara desapercibido en el momento de la entrega.

Nota: de esta queja se envió al correo del director administrativo Sebastian Ramirez, el viernes 17 con todo el registro fotográfico y la queja oficial del cliente.

Cordialmente

Jader Uribe E.
Asesor Comercial B2B
', N'se realizo el primer contacto con la señora Jenny Gomez de compras, efectivamente nos confirma su comentario, afirma que necesita que le repongan ese producto alterado ya que lo están necesitando.
se le informo sobre los cambios a CSC y se envío por correo  información de contacto directo al CSC.
Manifestó haber tenido inconvenientes de retrasos en las entregas nuestras(transportadora)', N'', CAST(0x0000A740009A7954 AS DateTime), N'se realizo segundo contacto con el cliente, se le informo que se envió la reclamación a la transportadora, que iban a realizar la investigación y para la próxima semana entre el 3 y el 7 de Abril nos daban una respuesta a la misma vez la señora Jenny me ratifico que este caso no pudo haber sucedido en el proceso interno de ellos.', CAST(0x0000A74600BD84C0 AS DateTime), N'la transportadora dio la respuesta formal donde informaba que dentro del proceso interno de ellos no se había efectuado el cambio del balde, se tomo la decisión de realizar nota crédito y dar respuesta formal al cliente informando toda la investigación realizada  y las recomendaciones para casos futuros.', N'', N'Se contacta la señora Jenny Gomez se verifico si habían quedado satisfechos con la solución a esta PQRS, la señora afirma que están tranquilos con la respuesta que igualmente nos pide que esta situación no se vuelva a presentar y afirma que ellos también tomaron medidas con los almacenistas para que revisaran muy bien el producto que reciben.', CAST(0x0000A793009D6650 AS DateTime), N'', N'', CAST(0x0000A73F0152447E AS DateTime), CAST(0x0000A788012E4EBE AS DateTime), N'Cerrado', NULL, N'administrativo@ryrlubricantes.com', N'Persona Juridica', N'Queja', N'Producto en mal estado', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (51, N'CEPSA', N'Gonzalo Antolín', N'gantolin@cepsa.com', N'0034606523718', N'0034606523718', N'Antioquia y Chocó', N'Estimado Responsable del Área de Lubricantes,

Le informamos que CEPSA acudirá a la próxima Feria Moto 2 Ruedas 2017, que se celebrará en Medellín del del 4 al 7 de Mayo.

Les rogamos nos envíen sus datos de contacto para enviarles el comunicado oficial y fijar una reunión comercial para explorar la distribución de lubricantes CEPSA en Colombia de una manera coordinada y a largo plazo.

Atentamente,

Gonzalo Antolín Sánchez
Lubricants – International Business Development
 _ 
Cepsa Comercial Petróleo S.A.U.
Torre Cepsa
Paseo de la Castellana, 259 A
28046 Madrid (Spain)
 
T +34 913 37 71 07
M +34 606 52 37 18
 
cepsa.com', N'Se envía correo al señor Gonzalo explicándole nuestra distribución exclusiva con ExxonMobil de Colombia', N'', CAST(0x0000A747011BB5CB AS DateTime), N'', NULL, N'', N'El señor queda satisfecho y entiende nuestra posición ', N'', NULL, N'', N'', CAST(0x0000A7470049E21F AS DateTime), CAST(0x0000A747011BB5CC AS DateTime), N'Cerrado', NULL, N'', N'Persona Juridica', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (60, N'', N'Prototipo models', N'prototipomodels@gmail.com', N'5061822', N'3225043778', N'Antioquia y Chocó', N'Hola cordial saludo, la presente es para preguntar si ya se relizaron los castings para las modelos que apoyaran su estancia en la feria de las dos ruedas este mayo 2017. 
de no ser asi o de necesitar modelos, ofrezco mis servicios para presentarles un portafolio de las modelos que sean de su conveniencia. 
quedo atento y este es mi numero de contacto 
3225043778
', N'Se realizo primer contacto con el señor Luis Jaramillo, se le explico que ya teníamos contratadas las Modelos y agradecimos su ofrecimiento y tener en cuenta nuestra compañía.', N'', CAST(0x0000A7600091B968 AS DateTime), N'', NULL, N'', N'El proveedor agradeció nuestra respuesta y entiende que ya hallamos contratado estos servicios.', N'', NULL, N'', N'', CAST(0x0000A75F01683E9B AS DateTime), CAST(0x0000A7600091B969 AS DateTime), N'Cerrado', NULL, N'', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'0', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (54, N'', N'karen paola hernandez rendon', N'paolitahernandez896@gmail.com', N'3176703677', N'3176703677', N'Cundinamarca', N'buenas tardes
el motivo de mi mensaje es por que necesito comunicarme con la área de cartera y necesito hacerles llegar un correo electrónico pero me ha sido imposible comunicarme con ustedes y obtener esta información pues me urge hacerles llegar un correo de suma importancia. estaré atenta a una pronta respuesta de parte de ustedes o se me comunique a mi numero celular. mil gracias', N'se realiza el primer contacto con la señora Karen, ella nos explica que cedió el negocio, necesita que no despachemos mas a su código 114986 y que enviemos un estado de cuenta para poder cancelar lo que tiene pendiente,.
se enviara estado de cuenta por correo paolitahernandez896@gmail.com  y ella nos realizara la solicitud formal de cancelación del código.', NULL, CAST(0x0000A75300EE36A7 AS DateTime), N'', NULL, N'', N'', N'', NULL, NULL, N'', CAST(0x0000A751018162A6 AS DateTime), CAST(0x0000A75800A504BD AS DateTime), N'Solucionado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, NULL, NULL)
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (67, N'', N'Ernesto Chaven', N'ernestochaven@gmail.com', N'320 9424314', N'320 9424314', N'Cundinamarca', N'Buen día, estoy interesado en la compra de sus productos para comercializar en venta de repuestos y taller mecánico, de ser posible espero pronta repuesta, muchas gracias ', N'se realizo el primer contacto con el señor Ernesto tiene un taller para vehículo liviano, esta interesado en manejar la marca Mobil en su taller, actualmente no trabaja con esta marca, esta ubicado al norte de Bogota en la 183 con la décima.
nos comprometimos a contactarnos con el y asignar una persona que le brinde la asesoría que el cliente necesita mas que un precio.', N'', CAST(0x0000A76F00FFEC17 AS DateTime), N'', NULL, N'', N'El señor Ernesto afirma que fue contactado por Paula Cortes quien le suministro la información y los requerimientos para vincularlo como cliente, el señor tiene pendiente recopilar los documentos y terminar el negocio para poder iniciar la relacion comercial con nosotros.', N'', NULL, N'', N'', CAST(0x0000A76C00D97973 AS DateTime), CAST(0x0000A7790066C31E AS DateTime), N'Cerrado', NULL, N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de Información', N'Despacho incompleto', N'1', 1, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (83, N'', N'sebastian ramirez arboleda', N'sebas-207@hotmail.com', N'2779841', N'3226207050', N'ARAUCA', N'Prueba', N'', N'', NULL, N'Prueba', CAST(0x0000A77B00F705B0 AS DateTime), N'Prueba', N'', N'Prueba', CAST(0x0000A77B01179D34 AS DateTime), N'notIscheck.zip', N'notIscheck.zip', CAST(0x0000A77B00B85FE0 AS DateTime), NULL, N'Cerrado', N'ARAUCA', N'apsistemas@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Incumplimiento en fecha de entrega', N'1', NULL, 0, N'Directo')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (96, N'', N'Maria Camila Muñoz', N'mmunozp2@eafit.edu.co', N'2394533', N'3217873815', N'ANTIOQUIA', N'Buenos días,

Estoy interesada en saber si dentro de su oferta manejan filtros?

Muchas gracias, espero pronta respuesta', N'Se realiza primer contacto con la señora Maria Camila se le explica que tenemos algunos filtros para la venta los cuales le pueden salir económicos por tema de liquidación de esa linea de negocio y se ofrecen lubricantes enviando correo a la gerente de la zona para asignar un asesor.', N'', CAST(0x0000A79F012E960B AS DateTime), N'', NULL, N'', N'', N'se contacto a la señora Maria Camila Muñoz, le explique el inventario de filtros que teníamos y que era una linea que ya no comercializábamos por lo tanto no podemos dar soporte ni garantía en caso de querernos comprar ya que es inventario que estamos agotando, me solicito que le enviara el listado de los filtros que teníamos.', CAST(0x0000A7AE00C6A851 AS DateTime), N'', N'', CAST(0x0000A79F008A4282 AS DateTime), CAST(0x0000A7AE00C6A853 AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (99, N'', N'Yaneth Ortiz Carrillo', N'yyoc0522@yahoo.es', N'3007199544', N'3002946302', N'BOGOTA DC', N'Haciendo la circularización la cliente informa que desde el mes de diciembre del 2016 no llega asesor a cobrar a la cliente ni a tomar pedidos. Favor mandar asesor todos los viernes a recoger cartera.', N'Se realiza primer contacto con la señora Yaneth Ortiz quien afirma que incluso cree que desde antes de Diciembre de 2016 no la visitan ni le cobran la cartera pendiente, que en alguna oportunidad la llamo una niña Paula y quedo de ir a visitarla pero tampoco fue, ella durante este tiempo ha comprado el lubricante en Compañía y en Partes y Partes, que no ha podido vender el Mobil Racing y el 4T MX por que los otros distribuidores no lo tienen.
Se le informo que se escalaría esta inquietud al gerente de la zona para atender su requerimiento.
Adri sera posible que solicitemos algún regalito o algo para ofrecer disculpas por el tema.', N'', CAST(0x0000A7A100FE7F08 AS DateTime), N'', NULL, N'El nuevo asesor se comunico con ella y la visitara el Jueves 12 de Julio en donde se dejaran al dia, temas de cartera y dias de visita', N'', N'', NULL, N'', N'', CAST(0x0000A7A0011BB840 AS DateTime), CAST(0x0000A7AE0126A550 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (88, N'Spectrum Brands Colombia', N'Andrés Moncada Velásquez', N'andres.moncada@la.spectrumbrands.com', N'(034) 5082055', N'3124599625', N'ANTIOQUIA', N'Estamos buscando un distribuidor de lubricantes que tenga la infraestructura para abarcar los diferentes canales de venta en el tema de aditivos para gasolina, aceite y productos del cuidado al vehículo y que desarrolle las marcas de la compañía en el canal tradicional.', N'hable con el señor Andres Moncada me explico que lo que ellos necesitan es quien les ayude a  comercializar las marcas de ellos, se le explico que nosotros somos distribuidores autorizados de XOM y solo distribuimos la marca Mobil.', N'', CAST(0x0000A783011A238D AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A77F01270F62 AS DateTime), NULL, N'Cerrado', N'MEDELLIN', N'mercadeo@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'0', NULL, 0, N'Directo')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (89, N'', N'Aidee guzman rodriguez', N'aideeguzman35@hotmail.com', N'8809633', N'3143764390', N'CUNDINAMARCA', N'Quiero empezar a trabajar con uds para empezar una caja de aceite mobil 20w 50 por galon y una por cuartos me gustaria saber el precio y de pronto saber q mas productos ofrecen quedo a la espera  gracias', N'Se realizo primer contacto con la señora Aidee el negocio es un taller de vehículo liviano ubicado en Cr 15 # 38 Zipaquira, en el momento la marca Mobil se la compra a Ludesa, nos comprometimos que uno de nuestros asesores se encargaría de visitarlo.', N'', CAST(0x0000A78901110B0D AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A787014D1CC8 AS DateTime), CAST(0x0000A79900C4C363 AS DateTime), N'Solucionado', N'ZIPAQUIRA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (90, N'', N'JAVIER PANQUEVA', N'jhoanpanqueva@hotmail.com', N'5624347', N'3134046409', N'BOGOTA DC', N'En el día de hoy miercoles 7 de junio se comunico el señor PANQUEVA MONTOYA PATRICIO JAVIER de la ciudad de bogota el cual se encuentra molesta ya que  le ofrecieron la promoción de pintarle el negocio por la compra de los productos Mobil, el asesor comercial Javier Herreño le informo  que el señor Juan Araque ya había  aprobado la solicitud de  pintar el negocio y que a partir del día miercoles  iniciarian con las labores de pintura, el señor llamo al asesor en el dia de hoy para consultar a cerca del horario para iniciar esta labor y el asesor Javier le informo que habia renunciado a la empresa  y que estaba en la entrega de su cargo que por favor se comunicara la señora Danna para brindarle informacion pero ella le informo que esta solicitud no estaba aprobada que no hay gestion alguna.el señor le compraba a  RYR y a otras empresas, siendo RYR Lubricantes la que mas pedidos le solicitaba y en las demas empresas también le habían ofrecido este paquete e inclusive rechazo la propuesta ya que el señor Juan Araque habia aprobado la de RYR. Lo estamos perjudicando ya que el señor se cambiaría de local y se encuentra pagando el arriendo de dos locales ya que no le van a realizar el trabajo de pintura al local el cual se pasaría. Le parece una falta de respeto, la falta de seriedad que se maneja en la empresa y dejo pasar la oferta con otra empresa por quedarse con nosotros. No nos debemos de ponernos a ofrecer  algo que no podemos cumplir. lo envolataron con este ofrecimiento ya que la señora Danna le dijo que había que esperar hasta el día Viernes y no sabe para que debe de esperar. es un in respeto ya que se acercaron al negocio tomaron fotos y midieron pero en el día de hoy le salen con todo esto. Quiere hablar con el señor Juan Araque a cerca de lo inconforme que se encuentra. ', N'se hablo con el señor Javier Panqueva y dice que efectivamente el asesor le dijo que estaba aprobado el tema de pintura exterior e interior del negocio y traslado del aviso que esta en buenas condiciones pero ahora le dicen que no existe dicha aprobación, nos comprometimos a que la persona encargada del tema se estaría comunicando con el para aclarar la situación.', N'', CAST(0x0000A78C00E70253 AS DateTime), N'', NULL, N'Fue aprobada la señalización para el cliente', N'', N'', NULL, N'', N'', CAST(0x0000A78B00A5D3B3 AS DateTime), CAST(0x0000A79300ACE335 AS DateTime), N'Solucionado', N'BOGOTA', N'gerenciaventas@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (105, N'LUBRITODO EL SITIO CORRECTO ', N'Martha Arango', N'lubritodoadmon@une.net.co', N'5762400 ext:301', N'3128688764', N'ANTIOQUIA', N'Se encuentra inconforme con el  incumplimiento en la entrega, ya que el pedido se encuentra realizado desde el día viernes a las 11:30 de la mañana se realizo con tiempo. siempre es lo mismo les llevan el pedido de ultimo, no sabe si lo hacen a propósito. Le parece que hay mucha negligencia en la entrega de los pedidos. ', N'Se realizo contacto con la señora Marta Arango quien confirma la situación y el estado de inconformidad.', N'', CAST(0x0000A7A800F61857 AS DateTime), N'', NULL, N'se contacto a la señora Martha Arango, expuso sus puntos de vista de acuerdo a lo que había sucedido, le informe que realizamos los llamados de atención verbales y que realizaremos las acciones correctivas y preventivas para que una situación de este tipo no vuelva a ocurrir, le manifesté que en caso de que volviera a ocurrir me podría contactar e informar lo sucedido. la señora Martha quedo satisfecha con la llamada realizada.', N'', N'', NULL, N'', N'', CAST(0x0000A7A7011E2174 AS DateTime), CAST(0x0000A7AE011BA89C AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'ALMACENES')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (106, N'', N'Bibiana Totelo ', N'chaletmotos0959@hotmail.com ', N'5708928', N'3213116538', N'BOGOTA DC', N'La cliente manifiesta por medio de llamada telefónica, que tiene una factura pendiente por pagar pero hace tiempo ningún asesor la visita ya que no puede realizar los por consignación. También dice que necesita productos pero como la han tenido tan descuidada no a realizado pedidos. Hablo con Danna Sanchez pero tampoco tuvo respuesta oportuna.', N'', N'', NULL, N'', NULL, N'El nuevo asesor se comunico con ella y la visitara el proximo 14 de Julio, en esta visita se acordara  temas de cartera y dias de visita proximos. ', N'', N'', NULL, N'', N'', CAST(0x0000A7AC00AF5001 AS DateTime), CAST(0x0000A7AE01284F39 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (107, N'tecnicos en combustion y tratamiento de aguas SAS', N'Jenniifer Murcia Rodriguez ', N'asistente.compras@tecca.com.co', N'745 6600 EXT:. 20322', N'745 6600 EXT..20322', N'CUNDINAMARCA', N'Solicito Cotizar los Siguientes Aceites 
ACEITE MOBIL NUTO H46                                           CANTI:.. 1
ACEITE LUBRICANTE LUBRAX 15W40                        CANT:..110
ACEITE MOBILGEAR 600 XP ISO320                            CANT:.15
Favor en la cotizacion indicar presentacion, valor unitario, tiempo de entrega y condicion de pago

Me podria indicar a que correo podria enviar la solicitud de cotizacion 
Quedo atento.

Cordialmente', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7AE00F9A438 AS DateTime), CAST(0x0000A7AE012D03CA AS DateTime), N'Solucionado', N'TOCANCIPA', N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', NULL, 1, N'FLOTAS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (92, N'MARIA CLAUDIA DAZA LOPEZ', N'Fabian Beltran', N'lubribelmar@gmail.com', N'4012839', N'3174371041', N'CUNDINAMARCA', N'Realizando la circularizacion, el señor Fabian Beltran me dice que hace aproximadamente 2 meses que la asesora Paula Andrea no lo visita, por ende no tiene a quien abonarle a las facturas pendientes. Pero verificando en el DMS dice que el asesor asignado para este cliente es Edison Herreño.', N'Se realiza el primer contacto con el cliente quien habla de que la asesora Paula no lo ha ido a visitar y que de hecho tiene pagos por realizar, el dice que no conoce al señor Javier Herreño parece que nunca se le informo al cliente si existió cambio de asesor.', N'', CAST(0x0000A79500B8A296 AS DateTime), N'', NULL, N'Nos comunicamos con el cliente,acordamos realizar recaudo el viernes de la próxima semana (30 de junio) 

', N'', N'', NULL, N'', N'', CAST(0x0000A79300B9E795 AS DateTime), CAST(0x0000A79900C968F7 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (94, N'', N'Wilman Hernandez', N'motohernandez7@hotmail.com', N'6923915', N'3124431298', N'BOGOTA DC', N'En llamada realizada en circularización, se hablo con el señor Wilman Hernandez y manisfesto el por que no le habían vuelto a enviar asesor.', N'Se realiza primer contacto con el señor Wilman Hernandez quien afirma que hace aproximadamente dos meses no lo visita un asesor para poder negociar precio con el, que le toco negociar con Compañía de Lubricantes al ver que nosotros no lo visitábamos.', N'', CAST(0x0000A79F0128377C AS DateTime), N'', NULL, N'En nuevo asesor comercial acordó una visita para el próximo viernes 12 de julio, en ella se entregará la información solicitada', N'', N'', NULL, N'', N'', CAST(0x0000A79B012CA71F AS DateTime), CAST(0x0000A7AE012AB8A1 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (95, N'tvr', N'HERNAN VIVEROS', N'hervizam@gmail.com', N'3146804318', N'3146804318', N'QUINDIO', N'buen dia a que email puedo enviarles una propuesta comercial', N'Se realizo contacto con el proveedor se detecto que necesitaba enviar una propuesta de mercadeo y se le envio correo con datos de Juan Araque gerente de mercadeo.', N'', CAST(0x0000A79F012C47E4 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A79C00D54267 AS DateTime), CAST(0x0000A79F012C47E5 AS DateTime), N'Solucionado', N'ARMENIA', N'gerenciaventas@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'0', NULL, 0, N'OTROS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (98, N'', N'Leonel Mora', N'fercho.5632@hotmail.com', N'7652715', N'3134947282', N'BOGOTA DC', N'Por medio de la circularización, el cliente manifiesta que si es posible que un asesor pase a recoger un cheque para cancelar factura que tiene pendiente.', N'Se realizo el primer contacto con el señor Leonel el cual afirma que no lo visitan hace un poco mas de 20 días y tienen  un pago en cheque para nosotros el cual no han ido a recoger, se le informo que esto seria escalado al gerente de la zona para atender su solicitud.', N'', CAST(0x0000A7A100FAA4B2 AS DateTime), N'', NULL, N'El nuevo asesor se comunico con el y la visitara el Jueves 12 de Julio en donde se dejaran al dia, temas de cartera y dias de visita, tambien se dara solucion a la solicitud de entragas para el GPNT', N'', N'', NULL, N'', N'', CAST(0x0000A7A0008F45C2 AS DateTime), CAST(0x0000A7AE01275C3D AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (108, N'', N'Yeferson Florez Henao ', N'checho2507@hotmail.com', N'2723231', N'3192987239', N'ANTIOQUIA', N'Necesita le sea recogido un  aceite quemado, ya que tiene conocimiento de por ser distribuidores estamos en la obligación de realizar la gestión para recogerlo tanto como de distribuirlo ya que en la actividad económica de los distribuidores también esta establecida que somos los encargados de  la disposición final. es nuestra obligacion ', N'no ha sido posible comunicarnos con el señor Jeferson, se envía correo electrónico informando que su inquietud sera escalad al área de operaciones al señor Sebastian Ramires', N'', CAST(0x0000A7AF008CAB3A AS DateTime), N'', NULL, N'se contacto al cliente el martes 18 de Julio para escuchar la inquietud que tenia sobre la recogida del aceite usado, se le informo que se realizaría la investigación del caso y averiguaríamos como seria el proceso y los responsables ya que nosotros como Distribuidores no podíamos realizar  la recogida de este lubricante usado, el día de hoy 26 de Julio se contacta de nuevo al cliente se le informa que de acuerdo a las consultas no podemos recoger el lubricante usado y el procedimiento lo debe de realizar el cliente, le recomendamos a las empresas - Asotransa - - Ecocrudos  y el nombre del señor Jose Luis Ramirez con celular  3153579560 quien lo puede asesorar en el tema.', N'', N'', NULL, N'', N'', CAST(0x0000A7AE0116FAAA AS DateTime), CAST(0x0000A7BC0121D88E AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (110, N'', N'Leonardo niño', N'info.lanq@gmail.com', N'3112044412', N'3112044412', N'ANTIOQUIA', N'Buenas tardes para solcitar los valores y suministro de los siguientes materiales:

Aceite 1540
Gracera
Grasa

para una retroexcavadora 314

Gracias por su atencion a esta solicitud quedo atento a su respuesta', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7B000BFA91E AS DateTime), CAST(0x0000A7BA00B3FA61 AS DateTime), N'Solucionado', N'SABANETA', N'juan.rodriguez@zeuss.com.co', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (100, N'', N'Fabio Vargas Morales', N'favamos11@yahoo.es', N'3108166793', N'3118476930', N'BOGOTA DC', N'Realizando la circularización, el cliente manifiesta que desde hace mucho tiempo ningún asesor lo visita ni para tomar pedidos, ni para recoger cartera, por eso se ha retrasado en los pagos. También dice que sigue interesado en seguir comprando nuestros productos, pero que por favor le envíen un asesor. ', N'Se realizo el primer contacto con el señor Fabio afirma que nadie lo volvió a visitar desde que se fue David, que hace como 6 meses, tampoco han ido a recogerle los pagos durante este tiempo le ha estado comprando a Compañía y a Ludesa.
Se le informo que se escalaría la solicitud al gerente de ventas con el fin de solucionar su requerimiento.
', N'', CAST(0x0000A7A101070200 AS DateTime), N'', NULL, N'La nueva asesora comercial se comunicó con el cliente para acordar fecha de visita 12 de julio, en ella se establecerá acuerdos de pago y nuevos días de visita.', N'', N'', NULL, N'', N'', CAST(0x0000A7A100B048EA AS DateTime), CAST(0x0000A7AE0129E1E1 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (109, N'FUREL S.A', N'ALEJANDRO ARBOLEDA', N'ALEJANDRO.ARBOLEDA@FUREL.COM.CO', N'4031440   EXT 1303', N'3006773390', N'ANTIOQUIA', N'Buenas tardes tan amable y me colaboran con la siguiente cotiuzacion

- Lubricante 15w40 diesel x caneca de 55 galones.............02

Mil gracias', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7AF00E2F3A5 AS DateTime), CAST(0x0000A7BB00EA419A AS DateTime), N'Solucionado', N'MEDELLIN', N'milena.cardona@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', 0, 1, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (111, N'Transportes Unilogic S.A.S.', N'Daniel Tobon ', N'despachos.unilogic@gmail.com', N'2115291', N'3116496770', N'ANTIOQUIA', N'Por medio de la presente me dirijo a usted, en primer lugar para saludarla y en segundo lugar para presentarle mi empresa TRANSPORTES UNILOGIC S.A.S., como su nombre lo sugiere nos dedicamos al transporte de carga por carretera a nivel nacional y urbano, nuestro funcionamiento ha mostrado excelentes resultados.

Nuestras rutas:

- Uraba
- Bogota
- Villavicencio (Directo)
- Barranquilla
- Cartagena
- Santa Marta
- Cali

Le agradezco por su amable atención y quedo a la espera de su comunicación si desea más detalles o tiene alguna duda.', N'Se le informa al proveedor que su ofrecimiento sera escalado al área responsable en este caso operaciones.', N'', CAST(0x0000A7B400A9357C AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7B300C159D5 AS DateTime), CAST(0x0000A7BD01158CE6 AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', 0, 0, N'FLOTAS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (112, N'CUEROS VELEZ -  PLANTA AMAGA', N'WILSON DE JESUS SALGAR VALENCIA', N'wsalgar@cuerovelez.com', N'3172907397', N'3172907397', N'ANTIOQUIA', N'El cliente informa que el asesor Alejandro Florez le tomo un pedido hace 10 días, le informo que el producto le llegaba en la ruta, le hablo de un tema de cartera que verificando el caso fue una factura que extravió RYR que no es culpa de él como cliente, le toco solicitar el producto a TOTAL al ver que no le llegaba el pedido, adicional estuvo llamando a Alejandro desde la semana pasada y nunca le contesto, tuvo que buscar el telefono de RYR en internet. ', N'El cliente confirma la situación y adiciona que no entiende por que su asesor no le contesta el teléfono.', N'', CAST(0x0000A7B3011D43B9 AS DateTime), N'', NULL, N'Se establece comunicacion con el Ing Wilson de Jesus Salazar el dia 24 de Julio se le explica lo sucedido y se le ofrece disculpas . El cliente se queja de la falta de comunicacion con Alejandro Florez quien en varias ocasiones fue llamado a su telefono celular para dar tramite a la solicitud del cliente . Alejandro No habia radicado una factura lo que ocasiono que el cliente se bloqueara en el sistema se solicito autorizacion para repetir la factura y asi el cliente queda al dia con la compañia. ', N'Se solicita información el dia viernes 21 de Julio a Alejandro y el 24 en la tarde me comunico con el Ing Wilson quien me comenta que el 24 de Julio es visitado por Alejandro quien le comenta lo sucedido y pide unas disculpas ', N'Estimado Ingeniero 
De acuerdo a nuestra conversacion del dia 24 de Julio . Nuevamente y en nombre de la compañia le ofrecemos disculpas por lo sucedido ya hemos tomado los correctivos del caso internamente esperamos que esto no vuelva a ocurrir . Envio mis numero y direccion de contacto en el caso de que la comunicacion sea deficiente agradezco por favor se comunique con nosotros para darle solucion a sus inquietudes. 
Cordialmente 
Misael Martinez U
Gerente de Industria B2B
Cel 317.6481478 ', CAST(0x0000A7BB00868D3D AS DateTime), N'', N'', CAST(0x0000A7B3011B743C AS DateTime), CAST(0x0000A7BB00868D3F AS DateTime), N'Solucionado', N'MEDELLIN', N'mmartinez@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Servicio', N'1', 0, 1, N'INDUSTRIA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (113, N'Arquielectric', N'Frank Duran', N'almacenciudadb@arquitecturayconcreto.com', N'3015417', N'3003736359', N'ANTIOQUIA', N'Buenos dias Sres. RYR LUBRICANTES ustedes nos venden dos productos, Grasa EP0 Y Grasa EP2 de los cuales requiero la ficha técnica, muchas gracias por su colaboración.', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7B500ABB2E9 AS DateTime), CAST(0x0000A7B800A1BA07 AS DateTime), N'Solucionado', N'SABANETA', N'mercadeo@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', NULL, 0, N'CDA')
GO
print 'Processed 100 total records'
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (115, N'', N'Jesus Alejandro Moreno ', N'jesus.moreno@upb.edu.co', N'3122425394', N'4488388', N'ANTIOQUIA', N'saludos, aceite cualquiera de estas tres opciones y necesito cotizarlas todas 3 

·         HVI type hydraulic mineral oil (Shell Tellus, Mobil DTE 10)
·         Transformer type oil (Mobilect 39)
·         Enviromental/HEES oil (Panolin HLP Synth. Panolin Atlantis)

espero pronta respuesta.', N'se hablo con el señor Jesús Alejandro el cual necesita solo un galón para un cable eléctrico que estará sumergido en el Mar, parece ser que el señor hablo con Jose Laverde ', N'', CAST(0x0000A7BB00A38624 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7BA00FF956B AS DateTime), CAST(0x0000A7BB00B9AA12 AS DateTime), N'Solucionado', N'MEDELLIN', N'mmartinez@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', NULL, 1, N'OTROS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (123, N'HELLER INTERNATIONAL S.A.', N'Sergio Andres Ocampo ', N'Sergio-andres.ocampo@mustad.com', N'5622244 ext 5114', N' 3186812636', N'ANTIOQUIA', N'Se comunico el señor Sergio, el cual me indica que los conductores están cogiendo de costumbre llevarle el pedido con una fotocopia de de la factura  de la cual no se observa correctamente el numero de la factura y el valor del pedido. Indica que por favor le envíen la factura original ya que a el le hacen seguimiento  y no puede mostrar Fotocopias  re quiere que la ultima factura que fue entregada el dia 2 de agosto le lleven la original y se la radiquen. 
Pide que por favor le den una solución pronta y que ojala no se vuelva a presentar este inconveniente ', N'Se habla con el señor Sergio Ocampo el contador de la compañía quien afirma que el almacenista le entrego una factura que recibieron ayer en copia y que esto 
se ha repetido en varias ovaciones, el cliente no entiende por que no se le entrega la factura original de hecho esto en un inconveniente para el ya que el tema de la documentación en Zona Franca Rionegro es muy delicado.', N'', CAST(0x0000A7C500AA10EB AS DateTime), N'', NULL, N'Se contacta al señor Sergio Andres Ocampo, se le informa los motivos del porque se les estaba entregando la factura en copia y que ya se habían tomado los correctivos para que no volviera a suceder.', N'', N'', NULL, N'', N'', CAST(0x0000A7C5008E53FF AS DateTime), CAST(0x0000A7C900C4EC02 AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'', N'1', NULL, 0, N'INDUSTRIA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (101, N'MyL lubricantes', N'Lucy Quiñonez', N'no maneja', N'3124910315', N'3202508050', N'BOGOTA DC', N'Realizando la circularización, el cliente manifiesta que hace rato no la visita un asesor para que por favor le asignen uno. ', N'se realizo contacto con la señora la cual corrobora esta anotación sin dar mas información adicional ', N'', CAST(0x0000A7A2010D96F1 AS DateTime), N'', NULL, N'Este cliente se visitara  el próximo viernes 12 de julio, telefónicamente no fue posible contactar', N'', N'', NULL, N'', N'', CAST(0x0000A7A100B3A7B5 AS DateTime), CAST(0x0000A7AE012BFC2D AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (118, N'CASTRELLON GOMEZ Y CIA SAS', N'YOJANA CANO', N'comercial. Castrellonhomezycia@gmail.com', N'8708975', N'3124473986', N'HUILA', N'Nos interesa comercializar lubricantes mobil. Necesitamos saber como lograr que nos codifiquen como clientes', N'Se realiza el primer contacto con la señora Jojana Cano quien afirma que tiene un lubricentro y comercializa lubricantes anteriormente le compraba a Ludesa pero ellos no tienen mercancía, agradecería que le pudiéramos despachas esta ubicada en Neiva.', N'', CAST(0x0000A7C20097D8DC AS DateTime), N'', NULL, N'se habla de nuevo con la señora Yojana Cano se le explica que no esta ubicada en nuestra zona de mayor esfuerzo, por lo tanto no es posible atender su necesidad, esta zona es de Ludesa.', N'la señora Johana queda satisfecha con la explicación y entiende nuestra posición al tiempo que agradece la atención que le hemos brindado', N'', NULL, N'', N'', CAST(0x0000A7C000770BD8 AS DateTime), CAST(0x0000A7C30088EF02 AS DateTime), N'Cerrado', N'NEIVA', N'mercadeo@ryrlubricantes.com', N'Persona Juridica', N'NO SE HA ASIGNADO EL TIPO DE SOLICITUD', N'', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (120, N'Ingeniería Vial de Colombia SAS', N'Diego Orlando Bayona', N'ingevialcol@hotmail.com', N'4653180', N'3133950232', N'BOGOTA DC', N'Buenos días, por medio del presente me permito solicitar cotización de caneca de 55 galones de aceite Mobil 15W40. Quedo pendiente a su respuesta. Gracias.

Cordialmente,

Diego Orlando Bayona
Ingeniero Civil
Representante Legal
Ingeniería Vial de Colombia SAS', N'', N'', NULL, N'', NULL, N'Se asigno este posible negocio a Pavel Ramirez, ', N'', N'', NULL, N'', N'', CAST(0x0000A7C300C28653 AS DateTime), NULL, N'Pendiente', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', NULL, 0, N'INDUSTRIA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (117, N'', N'yvo pereira', N'ing.ind.yvopereira@gmail.com', N'+574144373673', N'3205134853', N'ANTIOQUIA', N'Soy Ing Industrial con experiencia en ventas y logistica en empresas de lubricantes, en Venezuela. Estoy a sus ordenes, solo tengo 20 dias en Medellin. Mucho agradeceria obtener una entrevista si requieren un profesional con experiencia, con inclinaciòn a la reduccion de costos.
Yvo Pereira
Calle 56 Nro 78a-11 Piso 7 Edif Calipso. Medellin', N'Se hablo con el señor Yvo el esta solicitando empleo como ingeniero y tiene experiencia en lubricantes.', N'', CAST(0x0000A7BE011B5D05 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7BE00A0803A AS DateTime), CAST(0x0000A7C900B0E63D AS DateTime), N'Solucionado', N'MEDELLIN', N'mmartinez@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 1, N'OTROS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (121, N'', N'Monia Valero', N'monicapvalero@gmail.com', N'574 2603066', N'3012241688', N'ANTIOQUIA', N'Estimados,
He visto la Oferta Laboral publicada en ?Computrabajo y la misma me resultó de gran interés. Por este motivo, les hago llegar mi Hoja de Vida, a fin de ser tenido en cuenta como candidato.
https://drive.google.com/open?id=0B03oPau_BYttM0Z4eEtfSEI3R0k 
Quedo a su disposición para ampliar cualquier información necesaria.
Cordialmente,
Monica Valero', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7C4013294CA AS DateTime), NULL, N'Pendiente', N'MEDELLIN', N' johana.gomez@estinsa.com    ', N'Persona Natural', N'Solicitud de información', N'', N'1', NULL, 0, N'OTROS')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (122, N'', N'Mery Nelcy Velandia', N'mailto:merynelcyvelandia@gmail.com', N'3204573794', N'3204573794', N'CUNDINAMARCA', N'Señores  RYR
 
Saludo cordial, envío cotización correspondiente enviada por la Asesora Luz Elena Sanchez el día 21 de Junio del presente año de la zona de Bogota.
Donde se realizo un pedido teniendo en cuenta la cotización envida a mi esposo; el día 23 de Junio se llamo para confirmar el monto a consignar ya que nosotros cancelamos por anticipado, en el momento de darnos el valor de la mercancía surge la respuesta por parte de la Asesora que el Gerente comercial se había equivocado de cotización.
 
Agradezco su colaboración en este tema ya que nosotros trabajamos con cooperativas y de acuerdo a esa cotización que nos enviaron   habíamos  realizado una negociación con uno de nuestros clientes mas representativos, debido al error cometido por parte de ustedes quedamos mal ante nuestro cliente.
 
Desde el día 23 de Junio la asesora quedo de enviarnos una nueva cotización y a la fecha no hemos recibido respuesta, por lo cual no hemos podido trabajar de la mano con ustedes, nuestro promedio de galonaje esta entre 900  a 1.200 galones mensuales.
 
Att: Mery Nelcy Velandia
 
', N'se realiza el contacto con la señora Mery Nelcy ella afirma que ha tratado de comprarnos, su consumo es aproximadamente de 1.200 galones, pero que Adrian inicialmente no les presto mucha atención, finalmente le enviaron la cotización de 800 galones que iba a comprar pero el precio era diferente al pactado y ellos ya habían negociado con sus clientes, la asesora Luz Elena le dijo que iba a hablar con Adrian,  que el era el que se había equivocado, pero a la fecha no había recibido nueva cotización.
Ella afirma que le compra a compañía pero que le interesa trabajar con nosotros por que había recibido buenos comentarios frente a nuestra seriedad y honestidad pero que ya lo estaba dudando, que le parecía muy raro por que ella sabia que los paisas eran muy atentos.', N'', CAST(0x0000A7C5009761E8 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7C50083255F AS DateTime), NULL, N'Pendiente', N'BOGOTA', N'pablo.camacho@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (102, N'', N'Angela Martinez', N'anpimaga@hotmail.com', N'3017588753', N'3017588753', N'BOGOTA DC', N'El cliente informa que desde hace mas de mes y medio, el asesor comercial no le realiza visitas.
Necesitan urgentemente información de la persona que los atenderá y que les hagan las visitas...', N'Se realizo contacto con la señora Angela Martinez y realmente esta muy inquieta por que no la volvieron a visitar ella afirma necesitar producto me dijo que si de aqui a el martes en la mañana no la ha contactado el asesor ella me llamaría nuevamente.', N'', CAST(0x0000A7A2011024EA AS DateTime), N'', NULL, N'El nuevo asesor comercial se comunicó con el cliente en donde le manifestó como resolvió algunos temas de cartera, se acordó días de visita y recibirá una visita el próximo viernes 12 de Julio', N'', N'', NULL, N'', N'', CAST(0x0000A7A200B27161 AS DateTime), CAST(0x0000A7AE0128F993 AS DateTime), N'Solucionado', N'BOGOTA', N'aromero@ryrlubricantes.com', N'Persona Natural', N'Queja y Reclamo', N'Servicio', N'1', NULL, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (104, N'SAN-AI OIL CO,.LTD. (stocks are listed in Japan)', N'Email', N'khattori@san-ai-oil.co.jp', N'03-5479-3281', N'090 8961 4034', N'AMAZONAS', N'Inquiries about MOBIL TEMP 1 (Mobil industrial lubricants)

To whom it may concern,

Hello.

We are Exxonmobil''s indurtrial lubricants dealer in Japan.
We want to buy “Mobil temp 1” for at least 1Pail ( 3600kg Maximum in any packages).
This product was discontinued last year, and we can not find “Mobil temp 1” in Japan
Do you have some  in stock?

Would you tell me how much “Mobil temp 1”  you can supply ?
Please do not care about shipping.
We can  arrange deliveries.(We can go to get at your depot.)

I''m looking forward to hearing from you.
 
Best Regards,
 
Kenya HATTORI

SAN-AI OIL Co., LTD. (stocks are listed in Tokyo Japan) ', N'', N'', NULL, N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7A40185E7FF AS DateTime), NULL, N'Cerrado', N'EL ENCANTO', N'mercadeo@ryrlubricantes.com', N'Persona Juridica', N'Solicitud de información', N'', N'1', NULL, 0, N'SUBDISTRIBUIDOR')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (103, N'', N'henry alberto zabala gonzalez ', N'heymar1701@yahoo.es', N'3115205283', N'3115205283', N'ANTIOQUIA', N'buenas tardes, RYR el inconveniente que tengo es que no puedo ingresar ala plataforma por que se me olvido la contraseña y el usuario. muchas gracias ', N'Se realizo el contacto con el señor Henry, afirma que se le olvido la contraseña y no ha podido ingresar a la pagina de los pagos PSE y necesita cancelar una factura.', N'', CAST(0x0000A7A201122482 AS DateTime), N'', NULL, N'', N'', N'', NULL, N'', N'', CAST(0x0000A7A200F0B5F1 AS DateTime), NULL, N'Pendiente', N'TURBO', N'felipe.pineda@ryrlubricantes.com', N'Persona Natural', N'Solicitud de información', N'', N'1', 0, 0, N'CDA')
INSERT [dbo].[QyR] ([id], [empresa], [contacto], [correo], [telefono], [celular], [departamento], [mensaje], [primer_contacto], [area_apoyo], [fecha_primer_contacto], [informe_area], [fecha_area], [solucion], [seguimiento], [respuesta], [fecha_respuesta], [adjunto_respuesta], [adjunto_solucion], [fecha], [fecha_solucion], [estado], [ciudad], [responsable], [tipo_persona], [tipo_solicitud], [queja_por], [responsable_notificado], [recordatorio], [envio_resp], [tipo_cliente]) VALUES (114, N'GRUPO EDS AUTOGAS S.A.S. ESSO BELLO', N'Sandra Jimenez ', N'asisedsbello@autogas.com.co ', N'6049109', N'6049109', N'ANTIOQUIA', N'La Señora Sandra Jimenez se comunico  con el CSC , la cual me indico que lleva mucho tiempo con 3 agua de batería que le salieron reventados, Me dice que cada que realiza contacto con las Personas de CSC a realizar pedido, pone esta  Queja  la cual aun no le han solucionado nada, La asesora comercial tiene conocimiento del tema. ', N'', N'', NULL, N'', NULL, N'Se contacto a la señora Sandra Jimenez, se le informo que se le responderá por las 3 pintas de agua de batería. ofreci excusas por la demora en dar respuesta ', N'', N'', NULL, N'', N'', CAST(0x0000A7B500BAC71A AS DateTime), CAST(0x0000A7BD01139693 AS DateTime), N'Solucionado', N'MEDELLIN', N'administrativo@ryrlubricantes.com', N'Persona Juridica', N'Queja y Reclamo', N'Producto en mal estado', N'1', 0, 0, N'EDS')
SET IDENTITY_INSERT [dbo].[QyR] OFF
/****** Object:  View [dbo].[v_HABEAS_PQRS]    Script Date: 08/09/2017 15:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_HABEAS_PQRS] AS 
select empresa,contacto, correo, telefono, celular, departamento from QyR
GO
/****** Object:  Trigger [NotificarQyRResponsable]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[NotificarQyRResponsable]
ON [dbo].[QyR]
FOR INSERT


AS
begin
declare @id int
declare @mail NVARCHAR(MAX)=''
declare @correo NVARCHAR(50)='felipe.pineda@ryrlubricantes.com'
--declare @correo NVARCHAR(50)='administrativo@ryrlubricantes.com;ventas@ryrlubricantes.com;'
declare @tipo_sol NVARCHAR(50)
declare @departamento NVARCHAR(50)

select @tipo_sol=tipo_solicitud,@id=id,@departamento=departamento from inserted

--if(@departamento='Antioquia y Choco')
--	begin
--		set @correo = @correo +'gerenciaventas@ryrlubricantes.com' 
--	end

--	if(@departamento='Cordoba')
--	begin
--		set @correo = @correo +'maria.salazar@ryrlubricantes.com' 
--	end

--	if(@departamento='Eje Cafetero y Valle')
--	begin
--		set @correo = @correo +'milena.cardona@ryrlubricantes.com' 
--	end

--	if(@departamento='Cundinamarca')
--	begin
--		set @correo = @correo +'aromero@ryrlubricantes.com' 
--	end

 set @mail='
 <style>
           table
           {
           	font-family: verdana;
           	width: 850px;
			background-image: url("https://farm8.staticflickr.com/7190/27516536250_2fea12a2f2_z.jpg");
           	background-repeat: no-repeat;
           	background-size: 100% auto;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: left;
           }
           .altotr
           {
           	height: 150px;
           }
		    
		</style>
		<table>
			
			<tr><td rowspan="9" id="Espacio"></td></tr>
			
			<tr class="altotr">
				<td>
					<div class="textAzul ">
					Se&ntildeor(a)<br/>
					Usuario<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					El día ' + convert(varchar,GETDATE(),103) + ', se ha generado una nueva solicitud.
					El código de la solicitud es '+CAST(@id AS varchar(50))+', Diríjase al siguiente link, para ver el detalle 
                    <a href="http://192.168.1.2/PQRS/GestionarQyR.aspx">Pendiente de solución</a>
				</td>
			</tr>			
			
			<tr class="altotr">
				<td>
				    <div class="textAzul ">
				    Cordialmente;<br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>
			<tr>
			
			</tr>
		</table>'
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients=@correo,
--@blind_copy_recipients='llopez@ryrlubricantes.com',
@subject='Nuevo PQRS - RyR Lubricantes S.A',
@body = @mail,
@body_format = 'HTML'
end
GO
/****** Object:  StoredProcedure [dbo].[spModificarQueja]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spModificarQueja]
@id Nvarchar(50),
@estado Nvarchar(50),
@pcontacto Nvarchar(1000),
@seguimiento Nvarchar(1000),
@solucion Nvarchar(1000),
@responsable Nvarchar(50),
@tipo_sol Nvarchar(50),
@queja Nvarchar (50),
@tipocliente Nvarchar(50),
@informe_area Nvarchar(1000),
@respuesta nvarchar(1000),
@adjunto_respuesta nvarchar(200),
@area_apoyo Nvarchar(100),
@envio_rep  bit,
@adjunto_solucion Nvarchar(200)
as
declare @Resp Nvarchar (1000)
declare @Resp_ad Nvarchar (100)
select  @Resp=respuesta from QyR where id = @id
select  @Resp_ad=adjunto_respuesta from QyR where id = @id
update QyR set estado=@estado,seguimiento=@seguimiento,solucion=@solucion,responsable=@responsable,primer_contacto=@pcontacto,
tipo_cliente=@tipocliente,informe_area=@informe_area,respuesta=@respuesta,adjunto_respuesta=@adjunto_respuesta,area_apoyo=@area_apoyo,envio_resp=@envio_rep,
adjunto_solucion=@adjunto_solucion where id=@id


if (len(@tipo_sol)<>0)
begin
update QyR set tipo_solicitud = @tipo_sol where id=@id
	if (len(@queja)<>0)
	begin
	update QyR set queja_por = @queja where id=@id
	end
end

declare @mail NVARCHAR(MAX)=''
declare @cliente Nvarchar(50)
declare @contacto Nvarchar(50)

--fecha de primer contacto

if(len(@pcontacto)<>0)
  begin
	  if((select fecha_primer_contacto from QyR where id=@id) IS NULL) 
		begin
			update QyR set fecha_primer_contacto=GETDATE() where id=@id
		end
  end
-- fecha y envio de respuesta al cliente
   if (@respuesta<>@Resp or @adjunto_respuesta <> @Resp_ad)
  begin
			update QyR set fecha_respuesta=GETDATE() where id=@id
	end
--envio a leidy cuando la solicitud se a solucionado
if  (@estado='Solucionado')
begin
  if((select fecha_solucion from QyR where id=@id) IS Null)
    begin
		update QyR set fecha_solucion=GETDATE() where id=@id
	end
		  set @mail='
		 <style>
		 body {
			background-color: #fff;
		}
		  table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		  	 img{
            margin-top: -10%;
           	width:50%;
           }	
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					Señor(a)<br/>
					Usuario<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
		La solicitud con código <b>'+cast(@id as varchar(10))+'</b> ha sido resuelta, por favor comuníquese con el cliente para realizar el seguimiento de la solución. 
				</td>
			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>	
		</table>
	'
        declare @asunto_ Nvarchar(100)
		set @asunto_='El requerimiento N°'+@id+ ' ha sido solucionado'
		EXEC msdb.dbo.sp_send_dbmail 
		@profile_name='envio_correo',
		@recipients='ventas@ryrlubricantes.com',
	    --@blind_copy_recipients='leidy.barrientos@zeusspetroleum.com;mercadeo@zeusspetroleum.com',
		@subject=@asunto_,
		@body = @mail,
		@body_format = 'HTML'
		end		
--envio cuando se asigna un responsable
if (@estado='Pendiente')
begin
declare @responsable_notificado Nvarchar(50)
declare @nombreR Nvarchar(50)
select @responsable_notificado=responsable_notificado from QyR where id=@id
select @nombreR=nombre from ResponsablesQyR where correo=@responsable
if(@responsable_notificado=0)
begin
set @mail= '
<style>
body {
			background-color: #fff;
		}
		   table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	

		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					Señor(a)<br/>
					'+@nombreR+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					Usted ha sido asignado como responsable de dar solución a un requerimiento de un cliente.<br/>
					El <b>ID</b> de la solicitud es <b>'+cast(@id as varchar(10))+'</b>. <br/>Dirijase al siguiente link, para ver el detalle y proceder con su respectiva gestión. 
					<a href="https://ryrzeuss.sharepoint.com/sites/ryr/calidad/SitePages/GestionQyR.aspx"> Solicitudes pendientes de solución</a>
				</td>
			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>	
		</table>
		 '
	 if(len(@responsable)<>0)
	 begin
		update QyR set responsable_notificado=1 where id=@id
		 EXEC msdb.dbo.sp_send_dbmail 
		@profile_name='envio_correo',
		@recipients=@responsable,
		--@blind_copy_recipients='dbedoya@zeuss.com.co',
		@subject='Nueva solicitud - RyR Lubricantes S.A',
		@body = @mail,
		@body_format = 'HTML'
	  end
   end
	 declare @nombreA Nvarchar(50)
	 select @nombreA=nombre from ResponsablesQyR where correo=@area_apoyo
	 set @mail= '
	<style>
	body {
			background-color: #fff;
		}
		  table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		  img{
            margin-top: -10%;
           	width:50%;
           }	
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					 Señor(a)<br/>
					'+@nombreA+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
				Usted ha sido asignado como responsable de dar apoyo a la solución de un requerimiento generado por un cliente.
				El <b>ID</b> de la PQRS es <b>'+cast(@id as varchar(10))+'</b> diríjase al siguiente link para ver el detalle y proceder con su respectiva gestión.<a href="https://ryrzeuss.sharepoint.com/sites/ryr/calidad/SitePages/GestionQyR.aspx"> Solicitudes pendientes de solución.</a>
				</td>
			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>
		</table>
		 '
		  --envio  de area de apoyo 
  declare @area nvarchar(100)
  select  @area=area_apoyo from qyr where id = @id
  if(len(@area)<>0)
	 begin
		 EXEC msdb.dbo.sp_send_dbmail 
		@profile_name='envio_correo',
		@recipients=@area,--@area
		--@blind_copy_recipients='dbedoya@zeuss.com.co',
		@subject='Solicitud De Apoyo - RyR Lubricantes S.A',
		@body = @mail,
		@body_format = 'HTML'
 end
  declare @nombreZ Nvarchar(50)
  select @nombreZ=nombre from ResponsablesQyR where correo=@responsable
		 set @mail='
	 <style>
	 body {
			background-color: #fff;
		}
		  table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		  img{
            margin-top: -10%;
           	width:50%;
           }	
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					'+@nombreZ+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
		La solicitud con código <b>'+cast(@id as varchar(10))+'</b> tuvo un avance. Diríjase al siguiente link, para ver el detalle y proceder con su respectiva gestión.<a href="https://ryrzeuss.sharepoint.com/sites/ryr/calidad/SitePages/GestionQyR.aspx"> Solicitudes pendientes de solución.</a>
				</td>
			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>
		</table>
		 '
		  --envio de avanze de area de apoyo y actualizacion de fecha
	     declare @informe nvarchar(1000)
		 select  @informe=informe_area from qyr where id = @id
		 if (len(@informe)<>0) 
		 begin
		EXEC msdb.dbo.sp_send_dbmail 
		@profile_name='envio_correo',
		@recipients=@responsable,
		--@blind_copy_recipients='dbedoya@zeuss.com.co',
		@subject='Avanze de la solicitud - RyR Lubricantes S.A',
		@body = @mail,
		@body_format = 'HTML'
		if((select fecha_area from QyR where id=@id)IS Null) 
				begin
					update QyR set fecha_area=GETDATE() where id=@id
		 
		end
   end
end

 --envio de responsable de apoyo
GO
/****** Object:  StoredProcedure [dbo].[spAgregarQueja]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spAgregarQueja]
@empresa Nvarchar(50),
@nombre Nvarchar(50),
@correo Nvarchar(50),
@telefono Nvarchar(50),
@celular Nvarchar(50),
@queja Nvarchar(50),
@departamento Nvarchar(50),
@mensaje text,
@ciudad Nvarchar(50),
@tipo_sol Nvarchar(50),
@tipo_persona Nvarchar(50),
@notificado Nvarchar(50)


as
Insert into QyR(empresa,contacto,correo,telefono,celular,queja_por,departamento,ciudad,mensaje,fecha,estado,tipo_persona,tipo_solicitud,responsable_notificado) 
values(@empresa,@nombre,@correo,@telefono,@celular,@queja,@departamento,@ciudad,@mensaje,GETDATE(),'Pendiente',@tipo_persona,@tipo_sol,@notificado)

declare @id int
declare @mail NVARCHAR(MAX)=''
declare @empresaAuxiliar NVARCHAR (60)=''
 select @id= max(id) from QyR

 --correo para persona juridica
 if(@tipo_persona='Persona Juridica')
 begin
 set @mail=
 '
 <style>
 body {
			background-color: #fff;
		}
           table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	
		</style>
		<table>
			<tr><td rowspan="9" id="BarraAzul"></td></tr>
			<tr><td rowspan="9" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 					<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td>
					<div class="textAzul ">
					Señor(a)<br/>
					'+@nombre+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					Su solicitud ha sido recibida satisfactoriamente el día <b>' + CAST(GETDATE() AS varchar(50)) +'</b>
				</td>
			</tr>
			<br/>
			<tr>
				<td colspan="2">
					 La información del PQRS es la siguiente:<br/><br/>	 
			         <b>Número de PQRS: </b>'+cast(@id as varchar(10))+' <br/> 
					 <b>Cliente : </b>'+ @empresa+'<br/>
					 <b>Contacto: </b>'+@nombre+'<br/>					
    				 <b>Correo: </b>'+@correo+ ' <br/>
					 <b>Telefono: </b>' +@telefono+'<br/>   
				</td>
			</tr>
			<br/>
			<tr>
				<td colspan="2">
					Uno de nuestros colaboradores  se estará contactando con usted en poco tiempo.
					</td>
			</tr>
			<tr class="altotr">
				<td>
				    <div class="textAzul ">
				    Cordialmente,<br/>
					SERVICIO AL CLIENTE
					</div>
				</td>
			</tr>
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients=@correo,
--@blind_copy_recipients='leidy.barrientos@zeusspetroleum.com',
--@blind_copy_recipients=@correo,
@subject='Registro de QyR - RyR Lubricantes S.A',
@body = @mail,
@body_format = 'HTML'
--correo leidy al crear una PQRS juridica
 set @mail=
 '
<style>
		body {
			background-color: #fff;
		}
		   table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	 
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					Señor(a)<br/>
					Usuario<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					El día <b>'+ CAST(GETDATE() AS varchar(50)) +'</b>, se ha generado una nueva solicitud. El código de la solicitud es <b>'+cast(@id as varchar(10))+'</b>, Dirijase al siguiente link, para ver el detalle y asignar un responsable. <a href="https://ryrzeuss.sharepoint.com/sites/ryr/calidad/SitePages/GestionQyR.aspx">Pediente de solución</a>
				</td>

			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
				
			</tr>		
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients='ventas@ryrlubricantes.com',
--@blind_copy_recipients=@correo,
@subject='Registro de QyR - RyR Lubricantes S.A',
@body = @mail,
@body_format = 'HTML'
end
--correo para persona natural
 if(@tipo_persona='Persona Natural')
 begin
 set @mail=
 '
 <style>
 body {
			background-color: #fff;
		}
           table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		  img{
            margin-top: -10%;
           	width:50%;
           }	 
		</style>
		<table>
			<tr><td rowspan="9" id="BarraAzul"></td></tr>
			<tr><td rowspan="9" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 					<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td>
					<div class="textAzul ">
					Señor(a)<br/>
					'+@nombre+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					Su solicitud ha sido recibida satisfactoriamente el día <b>' + CAST(GETDATE() AS varchar(50)) +'</b>
				</td>
			</tr>
			<br/>
			<tr>
				<td colspan="2">
					 La información del PQRS es la siguiente:<br/><br/>	 
			         <b>Número de PQRS: </b>'+cast(@id as varchar(10))+' <br/> 
					 <b>Contacto: </b>'+@nombre+'<br/>					
    				 <b>Correo: </b>'+@correo+ ' <br/>
					 <b>Telefono: </b>' +@telefono+'<br/>   
				</td>
				
			</tr>
			<br/>
			<tr>
				<td colspan="2">
					Uno de nuestros colaboradores se estará contactando con usted en poco tiempo.
					</td>
			</tr>
			<tr class="altotr">
				<td>
				    <div class="textAzul ">
				    Cordialmente,<br/>
					SERVICIO AL CLIENTE
					</div>
				</td>
			</tr>
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients=@correo,
--@blind_copy_recipients='leidy.barrientos@zeusspetroleum.com',
--@blind_copy_recipients=@correo,
@subject='Registro de QyR - RyR Lubricantes S.A',
@body = @mail,
@body_format = 'HTML'
--correo leidy al crear una PQRS natural
 set @mail=
 '
<style>
		body {
			background-color: #fff;
		}
		   table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	 
		  
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					Señor(a)<br/>
					Usuario<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					El día <b>'+ CAST(GETDATE() AS varchar(50)) +'</b>, se ha generado una nueva solicitud. El código de la solicitud es <b>'+cast(@id as varchar(10))+'</b>, Dirijase al siguiente link, para ver el detalle y asignar un responsable. <a href="https://ryrzeuss.sharepoint.com/sites/ryr/calidad/SitePages/GestionQyR.aspx">Pediente de solución</a>
				</td>

			</tr>			
			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
				
			</tr>		
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients='ventas@ryrlubricantes.com',
--@blind_copy_recipients=@correo,
@subject='Registro de QyR - RyR Lubricantes S.A',
@body = @mail,
@body_format = 'HTML'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_recordatioQuince]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_recordatioQuince] as
DECLARE @idreclamo as int
declare @contacto as varchar(50)
declare @correo as varchar (50)
declare @telefono varchar(50)
declare @celular varchar(50)
declare @tipo_solicitud varchar(50)
declare @queja_por varchar(50)
declare @responsable varchar(50)
declare @jefe varchar(50)
declare @mail NVARCHAR(MAX)
declare @fecha datetime
declare @nombreR varchar(50)

IF (select COUNT(a.id)  
from QyR as a inner join ResponsablesQyR as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-15, GETDATE())as date) and 
estado='pendiente' and recordatorio is null and (tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')
)>0
BEGIN
select @idreclamo=a.id,@contacto=a.contacto,@correo=a.correo,@telefono=a.telefono,@celular=a.celular,@tipo_solicitud=a.tipo_solicitud,@queja_por=a.queja_por,
@responsable=a.responsable,@jefe=b.gerente, @fecha = a.fecha ,@nombreR = b.nombre from QyR as a inner join ResponsablesQyR 
as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-15, GETDATE())as date) and  estado='pendiente' and recordatorio is null and 
(tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')
update QyR set recordatorio=0 where  id=@idreclamo
set @mail=
 '
	<style>
	    table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		img{
            margin-top: -10%;
           	width:50%;
           }	
		  
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					 Lo siguiente es el resumen de una solicitud a la cual no se le ha dado gestión por la página de PQRS: <br/> 
					 <br/>
					 El requerimiento lleva en trámite desde el '+convert(varchar(MAX), @fecha, 1)+' con un retraso en su gestión de 15 días.
					 <br/><br/>
					 <b>Número de solicitud: </b>'+cast(@idreclamo as varchar(10))+' <br/> 
					 <b>Contacto: </b>'+@contacto+'<br/>	
					 <b>Correo: </b>'+@correo+'   <br/>
					 <b>Teléfono: </b>'+@telefono+'<br/>
					 <b>Celular: </b>'+@celular+'<br/>				
    				 <b>Tipo de solicitud: </b>'+@tipo_solicitud+ ' <br/>
					 <b>Clasificación: </b>' +@queja_por+'  <br/> 
					 <b>Primer Responsable : </b>' +@nombreR +' <br/> 
				</td>

			</tr>			
			
			<tr class="altotr">
				<td>
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SERVICIO AL CLIENTE
					</div>
					</td>
			</tr>
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients=@responsable,
@blind_copy_recipients='pablo.camacho@ryrlubricantes.com;juan.rodriguez@zeuss.com.co;ryr@ryrlubricantes.com',
@subject='Alerta PQRS- RYR',
@body = @mail,
@body_format = 'HTML'

if (select COUNT(a.id)  
from QyR as a inner join ResponsablesQyR as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-15, GETDATE())as date) and 
estado='pendiente' and recordatorio is null and (tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')) > 0
begin
exec sp_recordatioQuince
end 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_recordatioocho]    Script Date: 08/09/2017 15:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_recordatioocho] as
DECLARE @idreclamo as int
declare @contacto as varchar(50)
declare @correo as varchar (50)
declare @telefono varchar(50)
declare @celular varchar(50)
declare @tipo_solicitud varchar(50)
declare @queja_por varchar(50)
declare @responsable varchar(50)
declare @jefe varchar(50)
declare @mail NVARCHAR(MAX)
declare @fecha datetime
declare @nombreR varchar(50)

if(select count(id) from QyR where cast(fecha as date ) = cast(DATEADD(day,-2, GETDATE())as date) and responsable is null )>0
begin
select @idreclamo=a.id,@contacto=a.contacto,@correo=a.correo,@telefono=a.telefono,@celular=a.celular,@tipo_solicitud=a.tipo_solicitud,@queja_por=a.queja_por,
@responsable=a.responsable,@jefe=b.gerente, @fecha = a.fecha ,@nombreR = b.nombre from QyR as a inner join ResponsablesQyR 
as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-2, GETDATE())as date) and  estado='pendiente'
set @mail=
 '
	<style>
	    table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	
		  
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td colspan="2">
					<div class="textAzul ">
					Señor(a)<br/>
					Usuario<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					Lo siguiente es el resumen de una solicitud a la cual no se le ha asignado responsable por la página de PQRS: <br/>
					 <br/>					
					 <br/>
					 <b>Número de solicitud:</b>'+cast(@idreclamo as varchar(10))+' <br/> 
					 <b>Contacto:</b>'+@contacto+'<br/>	
					 <b>Correo:</b>'+@correo+'   <br/>
					 <b>Teléfono:</b>'+@telefono+'<br/>
					 <b>Celular:</b>'+@celular+'<br/>				
    				 <b>Tipo de solicitud:</b>'+@tipo_solicitud+ ' <br/>
				</td>
			</tr>			
			<tr class="altotr">
				<td colspan="2">
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SISTEMA DE PQRS
					</div>
				</td>
			</tr>
		</table>
 '
 EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients='ventas@ryrlubricantes.com',
@subject='Alerta PQRS  - RYR ',
@body = @mail,
@body_format = 'HTML'
end
IF (select COUNT(a.id)  
from QyR as a inner join ResponsablesQyR as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-8, GETDATE())as date) and 
estado='pendiente' and recordatorio is null and (tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')
)>0
BEGIN
select @idreclamo=a.id,@contacto=a.contacto,@correo=a.correo,@telefono=a.telefono,@celular=a.celular,@tipo_solicitud=a.tipo_solicitud,@queja_por=a.queja_por,
@responsable=a.responsable,@jefe=b.gerente, @fecha = a.fecha ,@nombreR = b.nombre from QyR as a inner join ResponsablesQyR 
as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-8, GETDATE())as date) and  estado='pendiente' and recordatorio is null and 
(tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')
update QyR set recordatorio=0 where  id=@idreclamo
set @mail=
 '
	<style>
	   table
           {
           	font-family: verdana;
           	width: 850px;
           }

           #BarraAzul
           {
           	background-color:#0056B8;
           	width: 30px;
           }
           #Espacio
           {
           	width: 60px;
           }
           .textAzul
           {
           	color:#0056B8;
           }
           #Pie
           {
           	text-align: center;
           }
		   #Pie_
           {
           	text-align: right;
			padding-right: 160px;
           }
           .altotr
           {
           	height: 150px;
           }
		   img{
            margin-top: -10%;
           	width:50%;
           }	
		  
		</style>
		<table >
			<tr><td rowspan="7" id="BarraAzul"></td></tr>
			<tr><td rowspan="7" id="Espacio"></td></tr>
			<tr class="altotr">
				<td>
 				<h1 class="textAzul">Medellín</h1>
				</td>
				<td>
					<img src="https://ryrzeuss-my.sharepoint.com/personal/sebastian_arboleda_ryrlubricantes_com/_layouts/15/guestaccess.aspx?docid=163a0e30ceed74104a8bc4ad7644fbcb0&authkey=AWm1hm13YeJe1kqgIIwNV04"/>
				</td>
			</tr>
			<tr class="altotr">
				<td>
					<div class="textAzul ">
					Señor(a)<br/>
					'+@jefe+'<br/>
					</div>				   
				</td>
			</tr>
			<tr>
				<td colspan="2">
					 Lo siguiente es el resumen de una solicitud a la cual no se le ha dado gestión por la página de PQRS: <br/> 
					 <br/>
					 El requerimiento lleva en trámite desde el '+convert(varchar(MAX), @fecha, 1)+' con un retraso en su gestión de 8 días.
					 <br/>
					 <b>Número de solicitud:</b>'+cast(@idreclamo as varchar(10))+' <br/> 
					 <b>Contacto:</b>'+@contacto+'<br/>	
					 <b>Correo:</b>'+@correo+'   <br/>
					 <b>Teléfono:</b>'+@telefono+'<br/>
					 <b>Celular:</b>'+@celular+'<br/>				
    				 <b>Tipo de solicitud:</b>'+@tipo_solicitud+ ' <br/>
					 <b>Clasificación:</b>' +@queja_por+'  <br/> 
					 <b>Primer Responsable : </b>' +@nombreR +' <br/> 
				</td>

			</tr>			
			
			<tr class="altotr">
				<td>
				    <div class="textAzul ">
					<br/>
				    Cordialmente; <br/>
					SERVICIO AL CLIENTE
					</div>
				</td>
			</tr>	
		</table>
 '
EXEC msdb.dbo.sp_send_dbmail 
@profile_name='envio_correo',
@recipients=@responsable,
@blind_copy_recipients=@jefe,
@subject='Alerta PQRS  - RYR',
@body = @mail,
@body_format = 'HTML'

if (select count(id) from QyR where cast(fecha as date ) = cast(DATEADD(day,-2, GETDATE())as date) and responsable is null )>0
begin
exec [sp_recordatioocho]
end 
if (select COUNT(a.id)  
from QyR as a inner join ResponsablesQyR as b on a.responsable=b.correo where CAST(a.fecha as date) = cast(DATEADD(day,-8, GETDATE())as date) and 
estado='pendiente' and recordatorio is null and (tipo_solicitud='Queja y Reclamo' or tipo_solicitud='Solicitud de Información')
 )>0
begin
exec [sp_recordatioocho]
end
end
GO
