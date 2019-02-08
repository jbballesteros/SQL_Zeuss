DECLARE @TSQL AS VARCHAR(100)
DECLARE @TIPO AS VARCHAR(4)='RC'
DECLARE @NUMERO AS INTEGER=321124


SET @TSQL='DESCRUZA_FACTURAS'

	
BEGIN TRAN 	@TSQL
	
	BEGIN TRY

		UPDATE documentos
		SET valor_aplicado=0
		WHERE TIPO=@TIPO AND numero=@NUMERO		
		
		DROP TABLE documentos_recibos_temp

		SELECT DC.tipo_aplica tipo_fv,DC.numero_aplica numero_fv,DC.valor
		INTO documentos_recibos_temp
		FROM documentos_cruce DC
		WHERE DC.tipo=@TIPO AND DC.numero=@NUMERO

		UPDATE documentos
		SET valor_aplicado=valor_aplicado-DC.valor
		FROM documentos D 
		INNER JOIN documentos_recibos_temp DC ON (D.tipo=DC.tipo_fv AND D.numero=DC.numero_fv)
	
		
		DELETE FROM documentos_cruce
		WHERE tipo=@TIPO AND numero=@NUMERO

		IF (
		SELECT SUM(CASE WHEN D.valor_total-D.valor_aplicado<0 THEN 1 ELSE 0 END)
		FROM DOCUMENTOS D 
		INNER JOIN documentos_recibos_temp DT ON (D.tipo=DT.tipo_fv AND D.numero=DT.numero_fv))>0
		BEGIN
			SELECT CAST('ERROR EN DOCUMENTOS VALOR APLICADO NEGATIVO' AS INTEGER )
		END

		SELECT *
		FROM documentos_recibos_temp

		SELECT tipo,numero,valor_total,valor_aplicado,valor_total-valor_aplicado saldo
		FROM documentos
		WHERE tipo=@TIPO AND numero=@NUMERO


		SELECT tipo,numero
		FROM documentos_cruce
		WHERE tipo=@TIPO AND numero=@NUMERO

		SELECT 'Ejecutado'

		COMMIT TRANSACTION

		END TRY
			
						
		BEGIN CATCH
		
			SELECT ERROR_MESSAGE()	 
		
			ROLLBACK TRANSACTION @TSQL
			
			
			
		END CATCH


