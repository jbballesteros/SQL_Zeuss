
------ VALIDA LA CANTIDAD
DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7
DECLARE @CONSE AS INTEGER=0
DECLARE @CANTIDAD AS REAL=0
DECLARE @TranName VARCHAR(20)='INGRESAEPA'
DECLARE @ERROR AS INTEGER =0
DECLARE @CODIGO AS INTEGER=900204
DECLARE @TIPO AS VARCHAR(10)='EPAB'
DECLARE @BODEGA AS INTEGER=5
DECLARE @SALDO_STO AS REAL=0

SELECT @SALDO_STO=can_ini FROM referencias_sto	WHERE ano=@AÑO AND mes=@MES AND codigo=@CODIGO AND bodega=@BODEGA


SELECT @CANTIDAD= ROUND(SUM(CASE WHEN DL.sw IN (3,12,2) THEN DL.cantidad ELSE DL.cantidad*-1 END),2)
FROM documentos_lin DL
WHERE codigo=@CODIGO AND YEAR(fec)=@AÑO AND MONTH(fec)=@MES AND bodega=@BODEGA AND sw IN (1,2,3,4,11,12)


SET @CANTIDAD=@CANTIDAD+@SALDO_STO-0.01

IF (@CANTIDAD) <0
BEGIN
	----- REALIZA INGRESO
	BEGIN TRANSACTION @TranName
		
			 SELECT @CONSE=ISNULL(MAX(NUMERO)+1,1) FROM documentos WHERE tipo=@TIPO
			 				
			 INSERT INTO documentos (sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, 
						  costo, vendedor, valor_aplicado, anulado, modelo, documento, notas, usuario, pc, fecha_hora,bodega,prefijo,concepto) VALUES
		(12,@TIPO,@CONSE,811043174,DATEADD(MONTH,@MES-1 ,DATEADD(YEAR,@AÑO-2000,'1/1/0')),0,DATEADD(MONTH,@MES-1 ,DATEADD(YEAR,@AÑO-2000,'1/1/0')),0,0,0,0,0,0,0,0,0,0,0,0,0,25,99999,'DIFERENCIA ENTRE NETOS VS BRUTOS DE BIOCOMBUSTIBLES','AUTOMATICO','AUTOMATICO',DATEADD(MONTH,@MES-1 ,DATEADD(YEAR,@AÑO-2000,'1/1/0'))	,@BODEGA,'INV',3)
		

		
		INSERT INTO documentos_lin (sw, tipo, numero, codigo, fec, nit, seq,cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega,und,cantidad_und,cantidad_pedida,maneja_inventario)
		 VALUES
		(12,@TIPO,@CONSE,@CODIGO,DATEADD(MONTH,@MES-1 ,DATEADD(YEAR,@AÑO-2000,'1/1/0')),811043174,1,ROUND(@CANTIDAD*-1,2),0,0,0,0,'DIFERENCIA ENTRE NETOS VS BRUTOS DE BIOCOMBUSTIBLES',0,@BODEGA,'UND',1,0,'S')
		
		
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

















