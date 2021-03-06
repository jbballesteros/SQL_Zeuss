USE [zeuss]
GO
/****** Object:  StoredProcedure [dbo].[spFacturacion]    Script Date: 05/07/2016 09:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spFacturacion]
 @SW AS INTEGER,
 @TIPO AS VARCHAR(5)='',
 @NUMERO AS INTEGER=0,
 @TIPO_SOL AS INTEGER=0,
 @DESCRIPCION AS VARCHAR(250)='',
 @RESPONSABLE AS VARCHAR(100)='',
 @USER AS VARCHAR(20)='',
 @TIPO_ANU AS INTEGER=0,
 @CUPO_FRONTERA AS INTEGER=-1,
 @NIT AS DECIMAL(18,0)=0,
 @CODIGO AS VARCHAR(20)=NULL,
 @FECHA AS DATE=NULL,
 @FECHASUP AS DATE=NULL,
 @SUB2 AS INTEGER=NULL,
 @GEN AS INTEGER=NULL
 
AS
BEGIN
	IF @SW=1 --- RECIBO DE FACTURA
	BEGIN
		IF (SELECT COUNT(numero) FROM dupl_impuesto WHERE tipo=@TIPO and numero=@NUMERO )=0
			BEGIN
				INSERT INTO dupl_impuesto (tipo,numero,codigo,recibido,fecha_recibido)
				VALUES (@TIPO,@NUMERO,2,1,GETDATE())
			END
			ELSE
			BEGIN
				UPDATE dupl_impuesto
				SET recibido=1,fecha_recibido=GETDATE()
				WHERE tipo=@TIPO AND numero=@NUMERO
			END
				
		SELECT tipo TIPO,numero NUMERO,fecha_recibido RECIBIDO
		FROM dupl_impuesto
		WHERE CAST(fecha_recibido AS DATE)=CAST(GETDATE() AS DATE)
	 GROUP BY tipo,numero,fecha_recibido
	END
	IF @SW=2 ----- SOLICITUD DE ANULACION
	BEGIN
	    IF @TIPO_SOL IN (1,2,3,4) AND (@TIPO<>'' AND @NUMERO<>0 AND @DESCRIPCION<>'' AND @RESPONSABLE<>'')
	    BEGIN
			INSERT INTO documentos_solicitudes (tipo,numero,fecha_solicitud,solicitud,concepto,responsable,solicito)
			VALUES (UPPER(@TIPO),@NUMERO,GETDATE(),@TIPO_SOL,@DESCRIPCION,@RESPONSABLE,@USER)
			
			SELECT DS.tipo TIPO,DS.numero NUMERO,DS.fecha_solicitud FECHA_SOLICITUD,D.fecha FECHA,T.nit CODIGO,T.nombres CLIENTE,
			CASE 
			WHEN DS.solicitud=1 THEN 'ANULACION'
			WHEN DS.solicitud=2 THEN 'NC' 
			WHEN DS.solicitud=3 THEN 'MODIFICACION' 
				WHEN DS.solicitud=4 THEN 'DEVOLUCION'ELSE '' END TIPO_SOLICITUD,DS.concepto CONCEPTO,DS.responsable  RESPONSABLE,U.des_usuario SOLICITO
			
			FROM documentos_solicitudes  DS 
			INNER JOIN documentos D ON (DS.tipo=D.tipo AND DS.numero=D.numero) 
			INNER JOIN terceros T ON (D.nit=T.nit)
			LEFT JOIN usuarios U  ON (DS.solicito=U.usuario)
			WHERE DS.tipo=@TIPO AND DS.numero=@NUMERO
			
			
	    END
	    ELSE
	    BEGIN
			Select 'Debe verificar el Tipo de Solicitud 1: Anulacion 2: NC 3: MODIFICACION, al igual que todos los campos' Nota
	    END
	END
	IF @SW=3 ---- AUTORIZACION DE MODIFICACION
	 IF (@TIPO<>'' AND @NUMERO<>0 )
	 BEGIN
		UPDATE documentos_solicitudes
		SET autorizo=@USER,fecha_autorizacion=GETDATE(),OBSERVACION=@DESCRIPCION,tp_concepto=@TIPO_ANU
		WHERE tipo=@TIPO AND numero=@NUMERO
		
		SELECT @TIPO_SOL=solicitud FROM documentos_solicitudes 	WHERE tipo=@TIPO AND numero=@NUMERO
		IF @TIPO_SOL=3
		BEGIN
			INSERT INTO MOVIMIENTO_MODIFICADO
			SELECT *,GETDATE() FECHA_INGRESO	
			FROM movimiento
			WHERE tipo=@TIPO AND numero=@NUMERO 
		END
		
		SELECT DS.tipo TIPO,DS.numero NUMERO,DS.fecha_solicitud FECHA_SOLICITUD,DS.fecha_autorizacion FECHA_AUTORIZACION,DS.fecha_anulacion FECHA_ANULACION,D.fecha FECHA,T.nit CODIGO,T.nombres TERCERO,
			CASE 
			WHEN DS.solicitud=1 THEN 'ANULACION'
			WHEN DS.solicitud=2 THEN 'NC'
			WHEN DS.solicitud=3 THEN 'MODIFICACION'  ELSE '' END TIPO_SOLICITUD,DS.concepto CONCEPTO,ISNULL(DS.OBSERVACION,'') OBSERVACION,D.notas NOTAS,DS.responsable  RESPONSABLE,U.des_usuario SOLICITO,ISNULL(U2.des_usuario,'') AUTORIZO,ISNULL(U3.des_usuario,'') ANULO
			FROM documentos_solicitudes  DS 
			INNER JOIN documentos D ON (DS.tipo=D.tipo AND DS.numero=D.numero) 
			INNER JOIN terceros T ON (D.nit=T.nit)
			LEFT JOIN usuarios U  ON (DS.solicito=U.usuario)
			LEFT JOIN usuarios U2 ON (DS.autorizo=U2.usuario)
			LEFT JOIN usuarios U3 ON (DS.ANULO=U3.usuario)
		WHERE D.tipo=@TIPO AND D.numero=@NUMERO
		
		
	 END	
	 ELSE
	    BEGIN
			Select 'Debe Ingresar Tipo y Numero de Documento' Nota
	    END
	  IF @SW=4 --- ELIMINACION DE SOLICITUDES
	  BEGIN
		IF (@TIPO<>'' AND @NUMERO<>0)
		BEGIN
				IF (SELECT  COUNT(TIPO) FROM documentos_solicitudes WHERE Tipo=@TIPO AND numero=@NUMERO)<>0
				BEGIN
						DELETE FROM documentos_solicitudes WHERE tipo=@TIPO AND numero=@NUMERO
						Select 'Solicitud Eliminada Con Exito' Nota
				END
				ELSE
				BEGIN
					Select 'La solicitud no esta ingresada en el sistema, Verifique Tipo y Numero de Documento' Nota
				END
			
		END
		ELSE
		BEGIN
		Select 'Verifique Tipo y Numero de Documento, todos los campos deben estar llenos' Nota
		END

	  END
	 IF @SW=5 ---- CONSULTA DE APLICACION RECIBOS
	 BEGIN
		select sw=t1.sw,a.tipo ,a.numero,sw_apl=t2.sw,TipApl=a.tipo_aplica,NumApl=a.numero_aplica, CuoApl=a.numero_cuota,D2.fecha,a.valor,a.descuento,a.retencion,a.ajuste,a.retencion_iva,a.retencion_ica,a.retencion2 as Ret_A,a.retencion3 as Ret_B,a.fecha_cruce,isnull(d.documento,'') as docref,isnull(d.prefijo,'') as prefijo  
		FROM documentos_cruce a 
		Join tipo_transacciones t1 on a.tipo=t1.tipo  
		Join tipo_transacciones t2 on a.tipo_aplica=t2.tipo  
		join documentos d on a.tipo_aplica = d.tipo and  a.numero_aplica = d.numero   
		INNER JOIN documentos D2 ON (a.tipo=D2.tipo AND a.numero=D2.numero)
		where (a.tipo_aplica=@TIPO and a.numero_aplica=@NUMERO) OR (a.tipo=@TIPO and a.numero=@NUMERO)
	 END
	 
IF @SW=6
BEGIN
	IF @CUPO_FRONTERA<=0  OR ISNUMERIC(@CUPO_FRONTERA)=0
	BEGIN
			SELECT 'La cantidad no es valida'
			Return
	END
	
	
	SELECT @SUB2=subgrupo2,@GEN=generico FROM referencias WHERE codigo=@CODIGO
	IF @SUB2 NOT IN (2,3,4) OR @GEN<>5
	BEGIN
		SELECT 'La referencia seleccionada no es valida'
		Return	
	END
	
	
	
	IF ( @USER NOT IN ('DMS1','APALACIO'))
	BEGIN
		SELECT 'El usuario no tiene permisos para ejecutar este paso'
		Return	
	END
	
		DELETE FROM terceros_zdf WHERE nit=@NIT and codigo=@CODIGO and desde=@FECHA and hasta=@FECHASUP

        INSERT INTO terceros_zdf (nit,codigo,cupo_frontera,desde,hasta)
		VALUES (@NIT,@CODIGO,@CUPO_FRONTERA,@FECHA,@FECHASUP)
	

 
	SELECT T.nit NIT,T.nombres CLIENTE,R.codigo CODIGO,R.descripcion PRODUCTO,TZ.cupo_frontera CUPO,TZ.DESDE DESDE,TZ.HASTA HASTA
	FROM terceros_zdf TZ 
	INNER JOIN terceros T ON (TZ.nit=T.nit )	
	INNER JOIN referencias R ON (TZ.codigo=R.codigo)
	WHERE TZ.nit=@NIT and TZ.desde=@FECHA and TZ.hasta=@FECHASUP
	
	
END 
	
END

