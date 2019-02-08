DECLARE @CONTROL_CARTERA AS BIT
DECLARE @TSQL AS VARCHAR(250)
DECLARE @SIG AS INTEGER
DECLARE @ID AS INTEGER
DECLARE @RST AS BIT
DECLARE @TIPO_APLICA AS VARCHAR(4)
DECLARE @NUMERO_APLICA AS INTEGER
DECLARE @VALOR_APLICADO AS MONEY
DECLARE @ERROR AS VARCHAR(MAX)

SELECT @CONTROL_CARTERA=control_cartera
FROM tablag

IF @CONTROL_CARTERA=1
BEGIN
	RETURN
END

SELECT @TSQL='TSQL_PSE_RC'




DROP TABLE v_PSE_pagosfacturas_tbl
SELECT *
INTO v_PSE_pagosfacturas_tbl
FROM v_PSE_pagosfacturas PF
WHERE PF.contra_val_pago=1 AND se_interfazo IS NULL AND PF.Empresa='Zeuss Petroleum'


DECLARE CS_PSE CURSOR
FOR
	SELECT id_pago
	FROM v_PSE_pagosfacturas_tbl
OPEN CS_PSE

FETCH NEXT FROM CS_PSE INTO @ID

WHILE @@FETCH_STATUS = 0  
	BEGIN
		SELECT @ERROR='Guardado Correctamente'

		DROP TABLE v_PSE_facturas_tbl
		SELECT *
		INTO v_PSE_facturas_tbl
		FROM v_PSE_facturas
		WHERE registro=@ID AND Empresa='Zeuss Petroleum' AND tipo IS NOT NULL
		

		BEGIN TRAN @TSQL
			BEGIN TRY

			SELECT @SIG=MAX(NUMERO)+1		
			FROM  documentos 
			WHERE  tipo='RC'

			INSERT INTO documentos 
			(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,prefijo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup)
			SELECT 5,'RC',@SIG,CAST(id_cliente AS DECIMAL),CAST(fecha_transaccion AS DATE),CAST(fecha_transaccion AS DATE),valor_pagado,0,0,0,0,0,T.vendedor,0,0,'*','PSE',PF.id_pago,'','PSE',UPPER(HOST_NAME()),GETDATE(),0,0,1,100,0,CAST(fecha_transaccion AS DATE)
			FROM v_PSE_pagosfacturas_tbl PF INNER JOIN terceros T ON (CAST(id_cliente AS DECIMAL)=T.nit)
			WHERE PF.id_pago=@ID

			INSERT INTO documentos_che 
			(sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
			SELECT 5,'RC',@SIG,51, CONVERT(varchar,fecha_transaccion ,103),
			7,CAST(fecha_transaccion as date),valor_pagado,51
			FROM v_PSE_pagosfacturas_tbl PF 
			WHERE PF.id_pago=@ID

			INSERT INTO movimiento 
			(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
			SELECT 'RC',@SIG,1,'11100549',0,0 ,CAST(fecha_transaccion AS DATE),valor_pagado,T.nombres,valor_pagado
			FROM v_PSE_pagosfacturas_tbl PF INNER JOIN terceros T ON (CAST(id_cliente AS DECIMAL)=T.nit)
			WHERE PF.id_pago=@ID
			UNION
			SELECT 'RC',@SIG,2,'13050501',0,0 ,CAST(fecha_transaccion AS DATE),valor_pagado*-1,T.nombres,valor_pagado*-1
			FROM v_PSE_pagosfacturas_tbl PF INNER JOIN terceros T ON (CAST(id_cliente AS DECIMAL)=T.nit)
			WHERE PF.id_pago=@ID
			
			IF EXISTS (SELECT * FROM v_PSE_facturas_tbl)
			BEGIN				
				DECLARE CS_PSE_DETALE CURSOR
				FOR
					SELECT tipo,factura
					FROM v_PSE_facturas_tbl
				OPEN CS_PSE_DETALE
				FETCH NEXT FROM CS_PSE_DETALE INTO @TIPO_APLICA,@NUMERO_APLICA

				WHILE @@FETCH_STATUS = 0  
					BEGIN
						SELECT @VALOR_APLICADO=(valor_total-valor_aplicado)-DT.valor_factura
						FROM v_PSE_facturas_tbl DT INNER JOIN documentos D ON (DT.tipo=D.tipo AND DT.factura=D.numero)
						WHERE D.tipo=@TIPO_APLICA AND D.numero=@NUMERO_APLICA

						IF @VALOR_APLICADO<-1000
						BEGIN
							SET @ERROR= @ERROR + ' |Falto aplicar|' + @TIPO_APLICA + '|' + CAST(@NUMERO_APLICA AS VARCHAR)
						END


						IF NOT @VALOR_APLICADO<-1000 
						BEGIN
							INSERT INTO  documentos_cruce
							(tipo, numero, sw, tipo_aplica, numero_aplica, numero_cuota, valor, descuento, retencion, ajuste, retencion_iva, retencion_ica, fecha, retencion2, retencion3,
							fecha_cruce)
							SELECT 'RC',@SIG,D.sw,D.tipo,D.numero,PT.Id,PT.valor_factura,0,0,0,0,0,D.fecha,0,0,cast (getdate() as date)
							FROM documentos D 
							INNER JOIN v_PSE_facturas_tbl PT ON (D.tipo=PT.tipo AND D.numero=PT.factura)
							WHERE D.tipo=@TIPO_APLICA AND D.numero=@NUMERO_APLICA
							
							UPDATE documentos
							SET valor_aplicado=valor_aplicado+PT.valor_factura
							FROM documentos D 
							INNER JOIN v_PSE_facturas_tbl PT ON (D.tipo=PT.tipo AND D.numero=PT.factura)
							WHERE D.tipo=@TIPO_APLICA AND D.numero=@NUMERO_APLICA
						END

						FETCH NEXT FROM CS_PSE_DETALE INTO @TIPO_APLICA,@NUMERO_APLICA
					END	

					CLOSE CS_PSE_DETALE
					DEALLOCATE CS_PSE_DETALE
			END
			
			UPDATE documentos
			SET valor_aplicado=P.valor
			FROM documentos D INNER JOIN (
			SELECT D.tipo,D.numero,SUM(ISNULL(DC.valor,0)) valor
			FROM documentos D LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo AND D.numero=DC.numero)
			WHERE D.tipo='RC' AND D.numero=@SIG
			GROUP BY D.tipo,D.numero) AS P ON (P.tipo=D.tipo AND P.numero=D.numero)

			COMMIT TRANSACTION
			SET @RST=1
		END TRY
			
						
		BEGIN CATCH
			SET @ERROR=ERROR_MESSAGE()
			ROLLBACK TRANSACTION
			SET @RST=0			
		END CATCH

		INSERT INTO [192.168.10.11].[RecordatoriosZER].[dbo].[pse_documentos_insertados] 
		(empresa,idpago,tipo,numero,respuesta,mensaje,fecha_hora,interfazo)
		SELECT 1,@ID,'RC',@SIG,@RST,@ERROR,GETDATE(),0
	
		WAITFOR DELAY '00:01' 
		 
		FETCH NEXT FROM CS_PSE INTO @ID
		
	END

	CLOSE CS_PSE
	DEALLOCATE CS_PSE