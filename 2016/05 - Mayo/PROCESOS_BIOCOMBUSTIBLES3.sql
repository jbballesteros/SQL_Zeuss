DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7
DECLARE @CONSE AS INTEGER=0
DECLARE @CANTIDAD AS REAL=0
DECLARE @TranName VARCHAR(20)='INGRESASPA'
DECLARE @ERROR AS INTEGER =0
DECLARE @CODIGO AS INTEGER=900205
DECLARE @TIPO AS VARCHAR(10)='SPAB'
DECLARE @BODEGA AS INTEGER=5


SELECT @CANTIDAD= SUM(CASE WHEN DL.sw IN (3,12) THEN DL.cantidad ELSE DL.cantidad*-1 END)
FROM documentos_lin DL
WHERE codigo=@CODIGO AND YEAR(fec)=@AÑO AND MONTH(fec)=@MES

---- VALIDA LA CANTIDAD
IF (@CANTIDAD) >0
BEGIN
	----- REALIZA LA SALIDA
	BEGIN TRANSACTION @TranName
		
			 SELECT @CONSE=ISNULL(MAX(NUMERO)+1,1) FROM documentos WHERE tipo=@TIPO
			 				
			 INSERT INTO documentos (sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, 
						  costo, vendedor, valor_aplicado, anulado, modelo, documento, notas, usuario, pc, fecha_hora,bodega,prefijo,concepto) VALUES
		(11,@TIPO,@CONSE,811043174,DATEADD(MONTH,@MES -1 ,DATEADD(YEAR,2016-2000,'1/1/0')),0,DATEADD(MONTH,@MES -1 ,DATEADD(YEAR,2016-2000,'1/1/0')),0,0,0,0,0,0,0,0,0,0,0,0,0,25,99999,'SALIDA DE VENTA DE ADITIVO','AUTOMATICO','AUTOMATICO',DATEADD(MINUTE,59-DATEPART(MINUTE,GETDATE()),DATEADD(HOUR,23-DATEPART(HOUR,GETDATE()),GETDATE()))	,@BODEGA,'INV',8)
		

		
		INSERT INTO documentos_lin (sw, tipo, numero, codigo, fec, nit, seq,cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega,und,cantidad_und,cantidad_pedida,maneja_inventario)
		 VALUES
		(11,@TIPO,@CONSE,@CODIGO,DATEADD(MONTH,@MES -1 ,DATEADD(YEAR,2016-2000,'1/1/0')),811043174,1,@CANTIDAD,0,0,0,0,'SALIDA DE VENTA DE ADITIVO',0,@BODEGA,'UND',1,0,'S')
		
		
		IF @@ERROR = 0
		BEGIN
			COMMIT TRANSACTION
			
		    SELECT @CONSE
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			SELECT ERROR_NUMBER() AS ErrorNumber,ERROR_MESSAGE() AS ErrorMessage
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		END
		
		
			
		
		
	
	
	
END


