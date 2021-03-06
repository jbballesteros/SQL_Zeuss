USE [zeusspruebas]
GO
/****** Object:  StoredProcedure [dbo].[spPSE_Insert]    Script Date: 01/16/2018 07:49:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spPSE_Insert]
	@SW AS INTEGER
AS
BEGIN
	
	DECLARE @ERROR AS VARCHAR(250)
	DECLARE @TSQL AS VARCHAR(100)
	DECLARE @RST AS INTEGER
	DECLARE @SIG AS INTEGER	
	
	SET @TSQL='GUARDAR_SPPSE'
	SET @RST =0
	
	BEGIN TRAN 	@TSQL
	
		BEGIN TRY	
		
		---- I CARGAR EL ULTIMO CONSECUTIVO
		SELECT @SIG=MAX(NUMERO)+1		
		FROM  documentos 
		WHERE  tipo='RC'		
		---- F CARGAR EL ULTIMO CONSECUTIVO
				
		
			
		INSERT INTO documentos 
		(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,prefijo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup,centro_doc)
		SELECT sw,tipo,@SIG,nit,fecha,fecha,valor_total,0,0,0,0,0,vendedor,valor_aplicado,0,modelo,prefijo,documento,notas,usuario,pc,GETDATE(),0,0,1,100,0,fecha,centro
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].[pse_documentos_7]
	
		INSERT INTO documentos_che 
		(sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
		SELECT sw,tipo,@SIG,banco,documento,forma_pago,CAST(fecha as date),valor,consignar_en
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_che_7
		
		INSERT INTO movimiento 
		(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
		SELECT tipo,@SIG,seq,cuenta,centro,nit,fecha,valor,explicacion,valor
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_movimiento_7	
		
		
		IF @SW=0
		BEGIN
			insert into documentos_cruce
			(tipo, numero, sw, tipo_aplica, numero_aplica, numero_cuota, valor, descuento, retencion, ajuste, retencion_iva, retencion_ica, fecha, retencion2, retencion3,
					  fecha_cruce)
			SELECT tipo,@SIG,sw,tipo_aplica,numero_aplica,numero_cuota,valor,0,0,0,0,0,fecha,0,0,cast (getdate() as date)
			FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_cruce_7


			update documentos 
			set valor_aplicado= ISNULL(P.valor_aplicado,0)
			from documentos D INNER JOIN  
			[192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_upd_7  P ON (D.tipo=P.TIPO AND D.numero=P.NUMERO)
		END
		
		
		


		SET @ERROR='CORRECTO'
		SET @RST=1
		
		COMMIT TRANSACTION

		END TRY
		
			
						
		BEGIN CATCH
		
			SET @ERROR=ERROR_MESSAGE()
			SET @RST=0
			
			ROLLBACK TRANSACTION @TSQL
			
			
			
			
		END CATCH

		INSERT INTO [192.168.10.11].[RecordatoriosZER].[dbo].[pse_documentos_insertados] (tipo,numero,respuesta,mensaje,fecha_hora)
		SELECT 'RC',@SIG,@RST,@ERROR,GETDATE()
END
