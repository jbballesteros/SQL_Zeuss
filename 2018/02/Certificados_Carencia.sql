DECLARE @TSQL AS VARCHAR(100)
DECLARE @RST AS INTEGER
DECLARE @NIT AS DECIMAL(18,0)
DECLARE @NOMBRES AS VARCHAR(60)
DECLARE @MAIL_NIT AS VARCHAR(100)
DECLARE @VENDEDOR AS DECIMAL(18,0)
DECLARE @MAIL_VENDEDOR AS VARCHAR(100)

SET @TSQL='ENVIO_ALERTA_CARENCIA'
SET @RST =0
	
BEGIN TRAN 	@TSQL
	
	BEGIN TRY

		DECLARE EACCURSOR CURSOR  
		
			FOR 

				SELECT ZL.nit ,T.nombres,T.mail mail_nit,TV.nit nit_ven,TV.mail mail_vendedor
				FROM Zeuss_Lin_Ventas ZL 
				INNER JOIN terceros T ON (ZL.nit=T.nit)
				INNER JOIN terceros TV ON (T.vendedor=TV.nit)
				LEFT JOIN terceros_carencia TC ON (T.nit=TC.nit)
				WHERE ZL.subgrupo2 IN (2,3,4) AND ZL.fec>=CAST(DATEADD(MONTH,-6,GETDATE()) AS DATE)
				AND TC.nit IS  NULL AND T.concepto_2='14' AND T.bloqueo=0 AND T.nit<>T.nit_real
				GROUP BY ZL.nit ,T.nombres,T.mail,TV.nit,TV.nombres,TV.mail

		OPEN EACCURSOR

		FETCH NEXT FROM EACCURSOR INTO @NIT,@NOMBRES,@MAIL_NIT,@VENDEDOR,@MAIL_VENDEDOR

		WHILE @@FETCH_STATUS = 0  
		BEGIN

			



			INSERT INTO terceros_carencia_auditoria (nit,vendedor,tipo_alerta,mail_nit,mail_vendedor,fecha_hora,enviado)
			VALUES (@NIT,@VENDEDOR,1,@MAIL_NIT,@MAIL_VENDEDOR,GETDATE(),1)

			FETCH NEXT FROM EACCURSOR INTO @NIT,@NOMBRES,@MAIL_NIT,@VENDEDOR,@MAIL_VENDEDOR
		END
		
		CLOSE EACCURSOR
		DEALLOCATE EACCURSOR
		
		COMMIT TRANSACTION

		END TRY
			
						
		BEGIN CATCH
			
			
			INSERT INTO terceros_carencia_auditoria (nit,vendedor,tipo_alerta,mail_nit,mail_vendedor,fecha_hora,enviado)
			VALUES (@NIT,@VENDEDOR,1,@MAIL_NIT,@MAIL_VENDEDOR,GETDATE(),0)
			 
			CLOSE EACCURSOR
			DEALLOCATE EACCURSOR
			ROLLBACK TRANSACTION @TSQL
			SET @RST=0
			
		END CATCH


