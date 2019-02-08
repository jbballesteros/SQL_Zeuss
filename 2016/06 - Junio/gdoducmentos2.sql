USE [zeuss]
GO
/****** Object:  StoredProcedure [dbo].[spGDDocumentos]    Script Date: 06/23/2016 11:09:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[spGDDocumentos] 
	@SW AS INTEGER=0,
	@USUARIO AS VARCHAR(100)=NULL,
	@USER AS VARCHAR(100)=NULL,
	@ID AS INTEGER=NULL,
	@RUTA AS VARCHAR(200)=NULL,
	@TIPO AS INTEGER=NULL,
	@COPIA AS BIT=NULL,
	@RESPONSABLE AS VARCHAR(100)=NULL,
	@NIT AS DECIMAL(18,0)=NULL,
	@PREFIJO AS VARCHAR(20)=NULL,
	@NUMERO AS INTEGER=NULL,
	@COMENTARIOS AS VARCHAR(MAX)='',
	@CENTRO AS INTEGER=NULL,
	@OC AS INTEGER=NULL,
	@VALOR AS MONEY=NULL,
	@FORMA AS INTEGER=NULL,
	@FOTROS AS VARCHAR(20)=NULL,
	@CORREO AS VARCHAR(MAX)=NULL,
	@TEXTO AS VARCHAR(500)=NULL,
	@CXP AS VARCHAR(200)=NULL,
	@FECHA AS DATE=NULL
AS
BEGIN
	DECLARE  @MD varchar(100)
	DECLARE @wk_no varchar(100)
	DECLARE @ASUNTO VARCHAR(500)
	DECLARE	@TablaHTML  NVARCHAR(MAX)
	
	IF @SW=1 --- CONSECUTIVO DOCUMENTOS
	BEGIN
		SELECT ISNULL(MAX(ID_DOC)+1,19346)
		FROM GD_DOCUMENTOS
	END
	
	IF @SW=2 --- CARGAR RESPONSABLES
	BEGIN
		SELECT udms,CE.usuario
		FROM correos_empresariales CE INNER JOIN gd_perfiles GD ON (CE.udms=GD.usuario)
		WHERE GD.tipo in (2,99)
	END
	
	IF @SW=3 ---- CARGAR PERMISOS DE USUARIO
	BEGIN
		SELECT GT.tipo_gd,CAST(CASE WHEN P.tipo_gd IS NULL THEN 0 ELSE 1 END  AS BIT) ING
		FROM gd_tipos GT LEFT JOIN (
	
	
		SELECT tipo_gd
		FROM gd_tipos GT LEFT JOIN gd_perfiles GD ON (GT.tipo_gd=GD.tipo)
		WHERE (GD.usuario=@USER OR GD.usuario IS NULL)) AS P ON (GT.tipo_gd=P.tipo_gd)		
	END
	
	IF @SW=4 ----CREACION DE DOCUMENTO EN BD
	BEGIN
		IF @TIPO=3
		BEGIN
			SELECT @RESPONSABLE=MAX(udms)
			FROM correos_empresariales
			WHERE tipo_gd=3
			
			SET @COMENTARIOS=('|Recepcion, Creado por ' + @USUARIO + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |')
			INSERT INTO gd_documentos (id_doc,tipo_doc,copia,responsable,nit,prefijo,numero,comentarios,usuario_creacion,estado,estado_doc,valor)
			VALUES (@ID, @TIPO,@COPIA,@RESPONSABLE,@NIT,@PREFIJO,@NUMERO,@COMENTARIOS,@USUARIO,2,97,@VALOR)
		END
		ELSE
		BEGIN
			SET @COMENTARIOS=('|Recepcion, Creado por ' + @USUARIO + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |')
			INSERT INTO gd_documentos (id_doc,tipo_doc,copia,responsable,nit,prefijo,numero,comentarios,usuario_creacion,estado,estado_doc,valor)
			VALUES (@ID, @TIPO,@COPIA,@RESPONSABLE,@NIT,@PREFIJO,@NUMERO,@COMENTARIOS,@USUARIO,1,97,@VALOR)
		END		
			
	
		
		
		SET @RUTA='\\192.168.10.8\usuarios\Gestion_Documental\' + CAST(@ID AS VARCHAR(10))

		set @wk_no = @RUTA
		SET @MD = ' mkdir ' + @wk_no
		EXEC xp_cmdshell @MD, no_output
	END
	
	IF @SW=5 ---- CREACION  DE LA RUTA DEL ARCHIVO
	BEGIN
		UPDATE gd_documentos
		SET ruta_doc=@RUTA
		WHERE id_doc=@ID
	END
	
	IF @SW=6 ---- ELIMINAR DOCUMENTO
	BEGIN
		DELETE FROM gd_documentos
		WHERE id_doc=@ID 
		
		SET @RUTA='\\192.168.10.8\usuarios\Gestion_Documental\' + CAST(@ID AS VARCHAR(10))
	
		set @wk_no = @RUTA
		SET @MD = 'RMDIR /S /Q ' + @wk_no
		EXEC xp_cmdshell @MD, no_output
	END
	
	IF @SW=7 ---- Envio de Correo
	BEGIN
		IF @TIPO IN (0,1,2)
		BEGIN
			SELECT @CORREO=correo FROM correos_empresariales WHERE udms=@RESPONSABLE
			DECLARE @NOMBRES AS VARCHAR(100)
			SELECT @NOMBRES=NOMBRES FROM TERCEROS WHERE NIT=@NIT
			SET @ASUNTO='Gestion Documental: Documento N° ' + CAST(@ID AS VARCHAR(10)) 
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			Se ha cargado una nueva factura en Gestion Documental para su aprobacion. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion de Procesos.exe"><b>Gestion de Procesos</b></a> para aprobar o rechazar la factura. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
		    <b>Documento N°:</b> ' + @PREFIJO  +' - '+ CAST(@NUMERO AS VARCHAR(10)) + '<BR>
		    <b>Nit:</b> '+ CAST(@NIT AS VARCHAR(20)) + '<BR>
		    <b>Proveedor:</b> '  + @NOMBRES + '<BR>
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>
		      
		    
		    '
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
		END
		IF @TIPO=3
		BEGIN
			SET @ASUNTO='Gestion Documental: Documento N° ' + CAST(@ID AS VARCHAR(10)) 
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			Se ha cargado un nuevo documento de mensajeria. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion Zeuss.exe"><b>Gestion Zeuss</b></a> para revisar y redireccionar este mensaje. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
					    
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients='alexandra.palacio@zeuss.com.co',
		   	@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
		END
			
	END
	
	IF @SW=8 --- Cargar los tipos de Estado
	BEGIN
		SELECT id_estado,descripcion
		FROM gd_estados
		Order by id_estado
	
	END
	
	IF @SW=9
	BEGIN
		IF @ID>=97
		BEGIN
			SELECT *
			FROM gd_documentos
			WHERE estado_DOC=@ID		
		END
		IF @ID<97
		BEGIN
			SELECT *
			FROM gd_documentos
			WHERE estado=@ID		
		END
	
	END --- Cargar Los Documentos de acuerdo al criterio
		
	IF @SW=10  ---- Cargar Los Documentos del Responsable
	BEGIN
		SELECT id_doc DOCUMENTO,D.nit NIT,T.nombres PROVEEDOR,prefijo PREFIJO,D.numero NUMERO,D.fecha_recepcion RECEPCION,D.comentarios COMENTARIOS
		FROM gd_documentos D INNER JOIN terceros T ON (D.nit=T.nit)
		WHERE estado=1 and responsable=@USER
		ORDER BY id_doc	
	END
	
	IF @SW=11  -- CARGA EL DOCUMENTO EN PANTALLA
	BEGIN
		SELECT fecha_recepcion,GE.descripcion,GE2.descripcion,ruta_doc,tipo_doc,responsable,nit,prefijo,numero,isnull(centro,''),isnull(oc,''),isnull(causacion,''),isnull(valor,''),isnull(aplicacion,''),isnull(forma_pago,0),comentarios,copia,ISNULL(fotros,'')
		FROM gd_documentos DG 
		INNER JOIN gd_estados GE ON (DG.estado_doc=GE.id_estado)
		INNER JOIN gd_estados GE2 ON (DG.estado=GE2.id_estado)
		WHERE id_doc=@ID		
	END		
	
	IF @SW=12 --- AUTORIZA RESPONSABLE 
	BEGIN
		(SELECT @COMENTARIOS=COMENTARIOS + (' Responsable, Aprobado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
		SELECT @CORREO=CE.correo
		FROM gd_perfiles GD INNER JOIN correos_empresariales CE ON (GD.usuario=CE.udms)
		WHERE GD.tipo=3 AND GD.usuario<>'DMS1'
	
		UPDATE gd_documentos
		SET centro=@CENTRO,oc=@OC,forma_pago=@FORMA,comentarios=@COMENTARIOS,fecha_responsable=GETDATE(),estado=2,estado_doc=99,fotros=@FOTROS
		WHERE id_doc=@ID
		
		SET @ASUNTO='Gestion Documental: Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Aprobado por Responsable'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>

			
			
			Se ha Aprobado una nueva factura en Gestion Documental para su verificacion. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion Zeuss.exe"><b>Gestion de Procesos</b></a> para aprobar o rechazar la factura. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
	
					    
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'

	END
	
	IF @SW=13  --- CENTROS DE COSTO
	BEGIN
		SELECT CG.grupo GrupoId,CG.descripcion Grupo,C.centro CentroId,C.descripcion Centro
		FROM centros C INNER JOIN centros_grupos CG ON (C.grupo=CG.grupo)
		
	END
	
	IF @SW=14  --- GRUPOS DE CENTRO DE COSTO
	BEGIN
		SELECT *
		FROM centros_grupos
	END
	
	IF @SW=15  --- CARGAR ORDENES DE COMPRA DE USUAIROS
	BEGIN
		SELECT CO.numero OC,CO.nit NIT,T.nombres PROVEEDOR,CO.fecha_registro REGISTRO,CO.fecha_cierre CIERRE
		FROM compras_orden_compra CO 
		INNER JOIN terceros T ON (CO.nit=T.nit)
		LEFT JOIN gd_documentos GD ON (CO.numero=GD.oc)
		WHERE CO.usuario=@USER AND CO.estado=2 AND GD.oc IS NULL AND CO.nit=@NIT
	
	END
	
	
	IF @SW=16  ---RECHAZAR RESPONSABLE
	BEGIN

		(SELECT @COMENTARIOS=COMENTARIOS + (' Responsable, Rechazado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	    SELECT @CORREO=CE.correo
     FROM gd_perfiles GD INNER JOIN correos_empresariales CE ON (GD.usuario=CE.udms)
     WHERE GD.tipo=1 AND GD.usuario<>'DMS1'
		
		UPDATE gd_documentos
		SET estado=0,estado_doc=98,comentarios=@COMENTARIOS,fecha_responsable=GETDATE()
		WHERE id_doc=@ID
		
		SET @ASUNTO='Gestion Documental: Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Rechazado por Responsable'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			El documento ha sido rechazado por el aprobador por favor validar la causal de esta. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
					    
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
		
		
		SELECT @COMENTARIOS
	
	END
	
	IF @SW=17  ---- Cargar Las facturas del Admin
	BEGIN
		SELECT id_doc DOCUMENTO,CASE WHEN D.tipo_doc=1 THEN 'FACTURA' ELSE 'CORRESPONDENCIA' END TIPO,D.nit NIT,T.nombres PROVEEDOR,prefijo PREFIJO,D.numero NUMERO,D.fecha_recepcion RECEPCION,D.fecha_responsable RESPONSABLE,D.comentarios COMENTARIOS
		FROM gd_documentos D  LEFT JOIN terceros T ON (D.nit=T.nit)
		WHERE estado=2 and D.tipo_doc<>2
		ORDER BY id_doc	
	END
	
	
	IF @SW=18  ---RECHAZAR ADMINISTRATIVO
	BEGIN

		(SELECT @COMENTARIOS=COMENTARIOS + (' Administrativo, Rechazado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		
		UPDATE gd_documentos
		SET estado=0,estado_doc=98,comentarios=@COMENTARIOS,fecha_admin=GETDATE()
		WHERE id_doc=@ID
		
		SET @ASUNTO='Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Rechazado por Administrativo'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			El documento ha sido rechazado por el administrativo por favor comuniquese con el proveedor para validar. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
					    
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients='jballesteros@zeuss.com.co',
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
		
		
		SELECT @COMENTARIOS
	
	END
	
	IF @SW=19 --- AUTORIZA ADMIN 
	BEGIN
		SELECT @CORREO=CE.correo
		FROM gd_perfiles GD INNER JOIN correos_empresariales CE ON (GD.usuario=CE.udms)
		WHERE GD.tipo=4 AND GD.usuario<>'DMS1'
	
	
		(SELECT @COMENTARIOS=COMENTARIOS + (' Administrativo, Verificado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)

	
		UPDATE gd_documentos
		SET comentarios=@COMENTARIOS,fecha_admin=GETDATE(),estado=4,estado_doc=96
		WHERE id_doc=@ID
		
		SET @ASUNTO='Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Verificado por Administrativo'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>

			
			
			Se ha Verificado una nueva factura en Gestion Documental para su Contabilizacion. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion de Procesos.exe"><b>Gestion Zeuss</b></a> luego de causada verificar esta. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
	
					    
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
				@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'

	END
	
	IF @SW=20 --- MENSAJERIA ADMIN
	BEGIN
		SET @COMENTARIOS=@TEXTO
		(SELECT @COMENTARIOS=COMENTARIOS + (' Administrativo, Enviado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |'),@RUTA=ruta_doc FROM gd_documentos WHERE id_doc=@ID)

	
		UPDATE gd_documentos
		SET comentarios=@COMENTARIOS,fecha_admin=GETDATE(),estado=2,estado_doc=95,CORREO=@CORREO
		WHERE id_doc=@ID
		
		SET @ASUNTO=@TEXTO+' N° ' + CAST(@ID AS VARCHAR(10)) 
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>

			
			
			Hemos recibido una nueva correspondencia para usted, agradecemos su verificación y gestión de ser procedente. <br><br>
			
			
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
	
					    
		    <b>Descripcion:</b> ' +  @TEXTO + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    	    
		    Gestion Documental<br><br>
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'

	END
	
	IF @SW=21
	BEGIN
		SELECT GD.id_doc RADICADO,GE.descripcion ESTADO,GE2.descripcion PASO,
GD.ruta_doc RUTA,'Visualizar' DOCUMENTO,copia COPIA,GD.nit NIT,T.nombres PROVEEDOR,
D.CAUSACION CAUSACION,D.FECHA_CAUSACION FECHA_CAUSACION,D.TOTAL TOTAL, 
D.APLICADO APLICADO,D.SALDO SALDO,D.RETE_FUENTE RETENCION,D.RETE_ICA,D.RETE_IVA,

GD.prefijo PREFIJO,GD.numero NUMERO,GD.centro CENTRO,GD.valor VALOR,
CASE 
WHEN GD.forma_pago=0 THEN 'Consignacion'
WHEN GD.forma_pago=1 THEN 'Cheque'
WHEN GD.forma_pago=2 THEN 'Anticipo'
WHEN GD.forma_pago=3 THEN '50 %'
WHEN GD.forma_pago=4 THEN GD.fotros 
ELSE 'N/A' END FORMA_PAGO,GD.comentarios COMENTARIOS,U.des_usuario USUARIO_RESPONSABLE,GD.fecha_recepcion RECEPCION,GD.fecha_responsable RESPONSABLE,GD.fecha_admin ADMINISTRATIVO,
CAST(0 AS BIT) APROBADO,CAST(0 AS BIT) RECHAZADO,'' DESCRIPCION,'OTROS' ADJUNTOS
FROM gd_documentos GD 
INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
LEFT JOIN terceros T ON (T.nit=GD.nit)
LEFT JOIN documentos_retenciones D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND CAST(GD.numero AS varchar(10))=D.documento  )
LEFT JOIN usuarios U ON (GD.RESPONSABLE=U.USUARIO)
WHERE estado=4
	
	END --- Carga la Planilla Contabilidad
	
	IF @SW=22
	BEGIN
	    (SELECT @COMENTARIOS=COMENTARIOS + (' Contabilidad, Causacion Aprobada por ' + @USER + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
		UPDATE gd_documentos
		SET comentarios=@COMENTARIOS,fecha_contable=GETDATE(),estado=3,estado_doc=94
		WHERE id_doc=@ID
	END --- Autoriza Contabilidad
	
	IF @SW=23
	BEGIN
		SET @ASUNTO='Documentos Causados por Contabilidad'
			SET @TablaHTML=
			N'<style>
			p, th, td, center{
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>

			
			
			Se han contabilizado los siguientes documentos en Gestion Documental. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion Zeuss.exe"><b>Gestion Zeuss</b></a> para ingresar la fecha de programacion de pago. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
			
			<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">
			<thead>
			<TR><TD COLSPAN=10><CENTER><FONT SIZE=3><B>Documentos Pendientes de Programacion</B><CENTER></TD></TR>
            <tr><th><CENTER>Radicado</CENTER></th>	
				<th><CENTER>Causacion</CENTER></th>	
				<th><CENTER>Nit</CENTER></th>
				<th><CENTER>Provedor</CENTER></th>
				<th><CENTER>Forma de Pago</CENTER></th>
				<th><CENTER>Total</CENTER></th>
				<th><CENTER>Aplicado</CENTER></th>
				<th><CENTER>Saldo</CENTER></th>
				<th><CENTER>Retencion</CENTER></th>
				<th><CENTER>Comentarios</CENTER></th>
				</thead>
				<tbody>'+
				
				CAST((SELECT 
				"TD"=GD.id_doc,'',
				"TD"=ISNULL(D.tipo + ' - ' + CAST(D.numero  AS VARCHAR(10)),'') ,'',
				"TD"=ISNULL(CAST(GD.nit AS VARCHAR(10)),'') ,'',
				"TD"=ISNULL(T.nombres,''),'',
				"TD"=ISNULL(
				
				CASE 
WHEN GD.forma_pago=0 THEN 'Consignacion'
WHEN GD.forma_pago=1 THEN 'Cheque'
WHEN GD.forma_pago=2 THEN 'Anticipo'
WHEN GD.forma_pago=3 THEN '50 %'
WHEN GD.forma_pago=4 THEN GD.fotros 
ELSE 'N/A' END,'') ,'', 
"TD"=ISNULL(CAST(CAST(D.valor_total AS INTEGER) AS VARCHAR(10)),'') ,'', 
"TD"=ISNULL(CAST(CAST(D.valor_aplicado AS INTEGER) AS VARCHAR(10)),''),'',
"TD"=ISNULL(CAST(CAST(D.valor_total-D.valor_aplicado AS INTEGER) AS VARCHAR(10)),'') ,'',
"TD"=ISNULL(CAST(D.retencion AS VARCHAR(10)),'') ,'',      
"TD"=ISNULL(GD.comentarios,'') ,''

FROM gd_documentos GD 
INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
LEFT JOIN terceros T ON (T.nit=GD.nit)
LEFT JOIN documentos D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND CAST(GD.numero AS VARCHAR(20))=D.documento)
WHERE estado=3 AND fecha_contable BETWEEN DATEADD(HOUR,-1, GETDATE()) AND GETDATE()
	FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+			
				
	
'</tbody>
</table><BR><BR><BR>
			
	
					    
		  
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients='jballesteros@zeuss.com.co;auxcontable@zeusspetroleum.com',
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
	
	
	END --- Enviar Correo Electronico
	
	IF @SW=25
	BEGIN
	
	SELECT @RESPONSABLE =responsable, @PREFIJO=prefijo, @NUMERO=numero, @NIT=GD.nit, @NOMBRES=nombres, @COMENTARIOS=comentarios FROM gd_documentos GD LEFT JOIN terceros T ON (GD.nit=T.nit) WHERE id_doc=@ID
	
   SELECT @CORREO=correo FROM correos_empresariales WHERE udms=@RESPONSABLE
	
	SET @ASUNTO='Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Gestion Documental: Rechazado por Contabilidad'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			El documento ha sido rechazado por contabilidad por favor comuniquese con el proveedor para validar. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
					    
		    <b>Documento N°:</b> ' + @PREFIJO  +' - '+ CAST(@NUMERO AS VARCHAR(10)) + '<BR>
		    <b>Nit:</b> '+ CAST(@NIT AS VARCHAR(20)) + '<BR>
		    <b>Proveedor:</b> '  + @NOMBRES + '<BR>
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@BLIND_COPY_RECIPIENTS='jballesteros@zeuss.com.co',
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
	
	
	END --- Rechaza Contabilidad
	
	
    IF @SW=26
	BEGIN
		SELECT GD.id_doc RADICADO,GE.descripcion ESTADO,GE2.descripcion PASO,
GD.ruta_doc DOCUMENTO,copia COPIA,GD.nit NIT,T.nombres PROVEEDOR,
D.tipo + ' - ' + CAST(D.numero  AS VARCHAR(10)) CAUSACION,D.date_ins FECHA_CAUSACION,D.valor_total TOTAL, 
D.valor_aplicado APLICADO,D.valor_total-D.valor_aplicado SALDO,D.retencion RETENCION,
D2.tipo + ' - ' + CAST(D2.numero  AS VARCHAR(10)) EGRESO,D2.date_ins FECHA_EGRESO,D2.valor_total TOTAL, 
D2.valor_aplicado APLICADO,D2.valor_total-D2.valor_aplicado SALDO,
GD.prefijo PREFIJO,GD.numero NUMERO,GD.centro CENTRO,GD.valor VALOR,
CASE 
WHEN GD.forma_pago=0 THEN 'Consignacion'
WHEN GD.forma_pago=1 THEN 'Cheque'
WHEN GD.forma_pago=2 THEN 'Anticipo'
WHEN GD.forma_pago=3 THEN '50 %'
WHEN GD.forma_pago=4 THEN GD.fotros 
ELSE 'N/A' END FORMA_PAGO,GD.comentarios COMENTARIOS,GD.responsable RESPONSABLE,GD.fecha_recepcion RECEPCION,GD.fecha_responsable RESPONSABLE,GD.fecha_admin ADMINISTRATIVO,
CAST(0 AS BIT) APROBADO,CAST(0 AS BIT) RECHAZADO,'' DESCRIPCION,CAST(GETDATE() AS DATE),'OTROS' ADJUNTOS
FROM gd_documentos GD 
INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
LEFT JOIN terceros T ON (T.nit=GD.nit)
LEFT JOIN documentos D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND GD.numero=D.documento)
LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo_aplica AND D.numero=DC.numero_aplica)
LEFT JOIN documentos D2 ON (DC.tipo=D2.tipo AND DC.numero=D2.numero)
WHERE estado=4
	
	END --- Carga la Planilla Contabilidad
	
	
	IF @SW=27 --- APRUEBA CONTABILIDAD
	BEGIN
		(SELECT @COMENTARIOS=COMENTARIOS + (' Contabilidad, Causacion Aprobada por ' + @USER + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		UPDATE gd_documentos
		SET estado=3, estado_doc=94,causacion=@CXP,comentarios=@COMENTARIOS,fecha_contable=GETDATE()
		where id_doc=@ID
	
	END
	
	IF @SW=28 --- RECHAZA CONTABILIDAD
	BEGIN
		(SELECT @COMENTARIOS=COMENTARIOS + (' Contabilidad, Rechazado por ' + @USER + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		UPDATE gd_documentos
		SET estado=	1, estado_doc=97,comentarios=@COMENTARIOS,fecha_contable=GETDATE()
		where id_doc=@ID
	
	
		
	END
	
	IF @SW=29 ---- RECHAZADOS 
	BEGIN
		SELECT GD.id_doc RADICADO,GE.descripcion ESTADO,GE2.descripcion PASO,copia COPIA,GD.nit NIT,T.nombres PROVEEDOR,


GD.prefijo PREFIJO,GD.numero NUMERO,GD.valor VALOR,
CASE 
WHEN GD.forma_pago=0 THEN 'Consignacion'
WHEN GD.forma_pago=1 THEN 'Cheque'
WHEN GD.forma_pago=2 THEN 'Anticipo'
WHEN GD.forma_pago=3 THEN '50 %'
WHEN GD.forma_pago=4 THEN GD.fotros 
ELSE 'N/A' END FORMA_PAGO,GD.comentarios COMENTARIOS,U.des_usuario RESPONSABLE,GD.fecha_recepcion RECEPCION,GD.fecha_responsable RESPONSABLE
FROM gd_documentos GD 
INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
LEFT JOIN terceros T ON (T.nit=GD.nit)
LEFT JOIN documentos D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND CAST(GD.numero AS varchar(10))=D.documento AND D.sw=32)
LEFT JOIN usuarios U ON (GD.RESPONSABLE=U.USUARIO)
WHERE estado=0 and estado_doc=98
	
	END
	
	IF @SW=30  --- ANULAR DOCUMENTO
	BEGIN

		(SELECT @COMENTARIOS=COMENTARIOS + (' Recepcion, Anulado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		
		UPDATE gd_documentos
		SET estado=6,estado_doc=90,comentarios=@COMENTARIOS
		WHERE id_doc=@ID		
		
		
		SELECT @COMENTARIOS
	
	END
	
	IF @SW=31  --- REENVIAR DOCUMENTO
	BEGIN

		(SELECT @COMENTARIOS=COMENTARIOS + (' Recepcion, Reenviado por ' + @USUARIO + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		
		UPDATE gd_documentos
		SET estado=1,estado_doc=97,comentarios=@COMENTARIOS,responsable=@RESPONSABLE
		WHERE id_doc=@ID
		SELECT @CORREO=correo	from correos_empresariales where udms=@RESPONSABLE
		SELECT @PREFIJO=prefijo, @NUMERO=numero,@NIT=nit,@COMENTARIOS=comentarios FROM gd_documentos WHERE id_doc=@ID
		SELECT @NOMBRES=NOMBRES FROM TERCEROS WHERE NIT=@NIT
		
		SET @ASUNTO='Gestion Documental: Documento N° ' + CAST(@ID AS VARCHAR(10)) 
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			Se ha cargado una nueva factura en Gestion Documental para su aprobacion. Por Favor dirigirse a la aplicacion <a href="\\192.168.10.8\usuarios\Gestion_Zeuss\Gestion de Procesos.exe"><b>Gestion de Procesos</b></a> para aprobar o rechazar la factura. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
			
		    <b>Documento N°:</b> ' + @PREFIJO  +' - '+ CAST(@NUMERO AS VARCHAR(10)) + '<BR>
		    <b>Nit:</b> '+ CAST(@NIT AS VARCHAR(20)) + '<BR>
		    <b>Proveedor:</b> '  + @NOMBRES + '<BR>
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>
		      
		    
		    '
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
		
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
		
		
		SELECT @COMENTARIOS
	
	END
	
	IF @SW=32
	BEGIN

	
			SELECT 
		    GD.id_doc RADICADO,
			GD.prefijo  +  ' - ' + CAST(GD.numero AS VARCHAR(20)) FACTURA,
			
		
			GD.nit NIT,T.nombres PROVEEDOR,
			D.SALDO SALDO,
			GD.fecha_recepcion RECEPCION,
			CAST(NULL AS DATE) FECHA_PAGO,
		
			CASE 
			WHEN GD.forma_pago=0 THEN 'Consignacion'
			WHEN GD.forma_pago=1 THEN 'Cheque'
			WHEN GD.forma_pago=2 THEN 'Anticipo'
			WHEN GD.forma_pago=3 THEN '50 %'
			WHEN GD.forma_pago=4 THEN GD.fotros 
			ELSE 'N/A' END FORMA_PAGO,
			
			
			GD.ruta_doc RUTA,'Visualizar' DOCUMENTO,copia COPIA,
			D.TOTAL TOTAL, 
			D.APLICADO APLICADO,U.des_usuario USUARIO_RESPONSABLE,D.CAUSACION,
			CAST(0 AS BIT) RECHAZADO,'' DESCRIPCION
			FROM gd_documentos GD 
			INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
			INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
			LEFT JOIN terceros T ON (T.nit=GD.nit)
			LEFT JOIN documentos_retenciones D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND CAST(GD.numero AS varchar(10))=D.documento  )
			LEFT JOIN usuarios U ON (GD.RESPONSABLE=U.USUARIO)
			WHERE estado=3
	
	END --- Carga la Planilla Tesoreria
	
	IF @SW=33 --- APRUEBA TESORERIA PROGRAMACION
	BEGIN
		(SELECT @COMENTARIOS=COMENTARIOS + (' Tesoreria, Documento Programado por ' + @USER + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		UPDATE gd_documentos
		SET estado=5, estado_doc=93,causacion=@CXP,comentarios=@COMENTARIOS,fecha_ppago=@FECHA,fecha_pago=GETDATE()
		where id_doc=@ID
	
	END
	
	
	
	IF @SW=34 --- RECHAZA TESORERIA PROGRAMACION
	BEGIN
		(SELECT @COMENTARIOS=COMENTARIOS + (' Tesoreria, Rechazado por ' + @USER + ' en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	
		UPDATE gd_documentos
		SET estado=	1, estado_doc=97,comentarios=@COMENTARIOS,fecha_pago=GETDATE()
		where id_doc=@ID
		
	END
	
	IF @SW=35
	BEGIN
	
	SELECT @RESPONSABLE =responsable, @PREFIJO=prefijo, @NUMERO=numero, @NIT=GD.nit, @NOMBRES=nombres, @COMENTARIOS=comentarios FROM gd_documentos GD LEFT JOIN terceros T ON (GD.nit=T.nit) WHERE id_doc=@ID
	
   SELECT @CORREO=correo FROM correos_empresariales WHERE udms=@RESPONSABLE
	
	SET @ASUNTO='Documento N° ' + CAST(@ID AS VARCHAR(10)) + ' Gestion Documental: Rechazado por Tesoreria'
			SET @TablaHTML=
			N'<style>
			p {
			font-size: 100%;
			font-family: "Century Gothic";
			}</style>
			<p>Cordial Saludo <br><br>
			El documento ha sido rechazado por Tesoreria por favor validar la causal de esta. <br><br>
			A continuacion se mostraran algunos detalles del documento:<br><br>
			
					    
		    <b>Documento N°:</b> ' + @PREFIJO  +' - '+ CAST(@NUMERO AS VARCHAR(10)) + '<BR>
		    <b>Nit:</b> '+ CAST(@NIT AS VARCHAR(20)) + '<BR>
		    <b>Proveedor:</b> '  + @NOMBRES + '<BR>
		    <b>Comentarios:</b> ' +  @COMENTARIOS + '<BR><BR>
		    
		    Muchas gracias, Feliz Dia.<br><br>
		    
		    
		    </p>'	
		
			EXEC msdb.dbo.sp_send_dbmail 
			@profile_name='AutoEnvio de Correos',
			@recipients=@CORREO,
			@file_attachments=@RUTA,
			@subject=@ASUNTO,
			@body = @TablaHTML,
			@body_format = 'HTML'
	
	
	END ---  Email Rechaza Tesoreria
	
	
	IF @SW=36
	BEGIN
		SELECT usuario,correo
		FROM correos_empresariales
	
	END --- Correos Empresariales
	
	
	IF @SW=37 
	BEGIN
		SELECT id_doc DOCUMENTO,GD.descripcion ESTADO,GD2.descripcion PASO,CASE WHEN D.tipo_doc=1 THEN 'FACTURA' ELSE 'CORRESPONDENCIA' END TIPO,D.fecha_recepcion RECEPCION,D.fecha_admin ADMINISTRATIVA,D.comentarios COMENTARIOS
		FROM gd_documentos D  
		INNER JOIN gd_estados GD ON (D.estado=GD.id_estado)
		INNER JOIN gd_estados GD2 ON (D.estado_doc=GD2.id_estado)
		LEFT JOIN terceros T ON (D.nit=T.nit)
		WHERE D.tipo_doc=2 AND D.estado_doc<>91
		ORDER BY id_doc	DESC
		
	
	END   ---  PLANILLA DE CORRESPONDENCIA
	
	
	IF @SW=38  ---CERRAR DOCUMENTO
	BEGIN

	    (SELECT @COMENTARIOS=COMENTARIOS + (' Responsable, Rechazado por ' + @USER + ' el ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
	    
		
		UPDATE gd_documentos
		SET estado=6,estado_doc=91,comentarios=@COMENTARIOS,FECHA_CIERRE=GETDATE()
		WHERE id_doc=@ID
		
		
		SELECT @COMENTARIOS
	
	END
	
	IF @SW=39
	BEGIN
	    (SELECT @COMENTARIOS=COMENTARIOS + (' El usuario ' + @USER + ' agrego documentos en ' +  CAST(GETDATE() AS nvarchar(30)) +': ' + @COMENTARIOS + ' |') FROM gd_documentos WHERE id_doc=@ID)
		UPDATE gd_documentos
		SET comentarios=@COMENTARIOS
		WHERE id_doc=@ID
	END --- Autoriza Contabilidad
	
	
	IF @SW=40
	BEGIN
		SELECT *
		FROM GP_BLOQUEO
	
	
	END --- bLOQUEO APLICACION GESTION DE PROCESOS
	
	
	IF @SW=41
	BEGIN

	
			SELECT 
		    GD.id_doc RADICADO,
			GD.prefijo  +  ' - ' + CAST(GD.numero AS VARCHAR(20)) FACTURA,
			
		
			GD.nit NIT,T.nombres PROVEEDOR,
			D.SALDO SALDO,
			GD.fecha_recepcion RECEPCION,
			CAST(NULL AS DATE) FECHA_PAGO,
		
			CASE 
			WHEN GD.forma_pago=0 THEN 'Consignacion'
			WHEN GD.forma_pago=1 THEN 'Cheque'
			WHEN GD.forma_pago=2 THEN 'Anticipo'
			WHEN GD.forma_pago=3 THEN '50 %'
			WHEN GD.forma_pago=4 THEN GD.fotros 
			ELSE 'N/A' END FORMA_PAGO,
			
			
			GD.ruta_doc RUTA,'Visualizar' DOCUMENTO,copia COPIA,
			D.TOTAL TOTAL, 
			D.APLICADO APLICADO,U.des_usuario USUARIO_RESPONSABLE,D.CAUSACION,
			CAST(0 AS BIT) CERRAR,
			CAST(0 AS BIT) RECHAZADO,'' DESCRIPCION,'OTROS' ADJUNTOS
			FROM gd_documentos GD 
			INNER JOIN gd_estados GE ON (GD.estado_doc=GE.id_estado)
			INNER JOIN gd_estados GE2 ON (GD.estado=GE2.id_estado)
			LEFT JOIN terceros T ON (T.nit=GD.nit)
			LEFT JOIN documentos_retenciones D ON (GD.nit=D.nit AND GD.prefijo=D.prefijo AND CAST(GD.numero AS varchar(10))=D.documento  )
			LEFT JOIN usuarios U ON (GD.RESPONSABLE=U.USUARIO)
			WHERE estado=5
	
	END --- Carga la Planilla Tesoreria Final
	IF @SW=42 --- CARGAR TIPO DE DOC
	BEGIN
		SELECT *
		FROM gd_tipos_docs
	END
END