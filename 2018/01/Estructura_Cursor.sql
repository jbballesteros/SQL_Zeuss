DECLARE @TSQL AS VARCHAR(100)
DECLARE @RST AS INTEGER
DECLARE @TIPO AS VARCHAR(4)
DECLARE @NUMERO AS INTEGER
DECLARE @FECHA AS DATE
DECLARE @VALOR AS MONEY
DECLARE @SEQ AS INTEGER

SET @TSQL='ACTUALIZA_SALDOS_DOCS'
SET @RST =0
	
BEGIN TRAN 	@TSQL
	
	BEGIN TRY

		DECLARE ASDOC CURSOR  
		
			FOR 
			
			SELECT tipo,numero,fec,SUM(valor) valor,MAX(SEQ) seq
			FROM movimiento
			GROUP BY tipo,numero,fec
			HAVING SUM(valor) between -1000 and 1000 and SUM(valor)<>0 AND NOT(SUM(valor) between -10 and 10)

		OPEN ASDOC

		FETCH NEXT FROM ASDOC INTO @TIPO,@NUMERO,@FECHA,@VALOR,@SEQ

		WHILE @@FETCH_STATUS = 0  
		BEGIN 	 
			
			INSERT INTO movimiento 
			(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
			VALUES (@TIPO,@NUMERO,@SEQ+1,53959501,1000,900625898,@FECHA,@VALOR*-1,'AJUSTE AUTOMATICO AL PESO EJECUTADO DESDE SQL SERVER',@VALOR*-1)
			
			INSERT INTO documentos_ajuste_peso_automatico (tipo,numero,valor,fecha_hora,correcto)
			VALUES (@TIPO,@NUMERO,@VALOR,GETDATE(),1)
				 
			FETCH NEXT FROM ASDOC INTO  @TIPO,@NUMERO,@FECHA,@VALOR,@SEQ
		END
		
		CLOSE ASDOC
		DEALLOCATE ASDOC
		
		COMMIT TRANSACTION

		END TRY
			
						
		BEGIN CATCH
		
			INSERT INTO documentos_ajuste_peso_automatico (tipo,numero,valor,fecha_hora,correcto)
			VALUES (@TIPO,@NUMERO,@VALOR,GETDATE(),0)				 
		
			ROLLBACK TRANSACTION @TSQL
			
			
			SET @RST=0
			
		END CATCH


