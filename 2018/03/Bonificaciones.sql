DECLARE @TSQL AS VARCHAR(100)
DECLARE @RST AS INTEGER
DECLARE @ANO AS INTEGER
DECLARE @MES AS INTEGER
DECLARE @TCONSULTADATE AS VARCHAR(500)
DECLARE @CONSULTA AS VARCHAR(MAX)
DECLARE @USUARIO AS VARCHAR(20)

SET @TSQL='ACTUALIZA_PROCESO_BONIFICACIONES'
SET @RST =0
SET @ANO= YEAR(GETDATE())
SET @MES=MONTH(GETDATE())




BEGIN TRAN 	@TSQL
	
	BEGIN TRY

		SELECT 
		@TCONSULTADATE=
		CASE 
		WHEN @MES=1 THEN
		'WHERE ((ANO=' + CAST(@ANO-1 AS varchar) + ' AND MES IN (11,12)) OR (ANO=' + CAST(@ANO AS varchar) + ' AND MES=1))'
		WHEN @MES=2 THEN
		'WHERE ((ANO=' + CAST(@ANO-1 AS varchar) + ' AND MES =12) OR (ANO=' + CAST(@ANO AS varchar) + ' AND MES IN (1,2)))'
		WHEN @MES IN (3,4,5,6,7,8,9,10,11,12) THEN
		'WHERE (ANO=' + CAST(@ANO AS varchar) + ' AND MES IN (' + CAST(@MES-2 AS varchar) + ','+ CAST(@MES-1 AS varchar)   + ',' + CAST(@MES AS varchar)+ '))'
		ELSE
		'ERROR' END

		---- ELIMINAR TABLA DE IMPUESTOS ----
		
		SET @CONSULTA='DELETE FROM bon_fvimpuesto_tbl ' + @TCONSULTADATE
		
		EXEC (@CONSULTA)
		

		SET @CONSULTA=
		'INSERT INTO bon_fvimpuesto_tbl (ano,mes,tipo,NUMERO,IMPUESTOS,sobretasa,usuario,fecha_hora) '+
		N'SELECT *,''' + @USUARIO + ''',getdate() '+
		N'FROM v_bon_fvimpuesto ' + 
		@TCONSULTADATE

	
	SELECT @CONSULTA
		
		


		--------------------------------------

		



		
		COMMIT TRANSACTION

		END TRY
			
						
		BEGIN CATCH
		
						 
		
			ROLLBACK TRANSACTION @TSQL

			SELECT 'Informe a Sistemas: ' + ERROR_MESSAGE()
			
			
			
			
		END CATCH


