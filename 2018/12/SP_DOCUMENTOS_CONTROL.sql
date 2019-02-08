DECLARE @TIPO AS VARCHAR(4)
DECLARE @NUMERO AS INTEGER
DECLARE @SOBRETASA AS BIT
DECLARE @SOLDICOM AS BIT
DECLARE @IMP_NACIONAL AS BIT
DECLARE @IVA AS BIT
DECLARE @DESCUENTO AS BIT
DECLARE @DISPONIBLE AS BIT
DECLARE @ERROR AS VARCHAR(MAX)

DECLARE DOC_CONTROL_CUR CURSOR  		
FOR 

SELECT D.tipo,D.numero
FROM zeuss.dbo.documentos D WITH (NOLOCK)
LEFT JOIN zeuss.dbo.v_tipo_transacciones_concep_fe VT ON (VT.concepto=D.concepto AND D.tipo=VT.tipo)
LEFT JOIN Factura_electronica FE WITH (NOLOCK) ON (D.tipo=FE.tipo AND D.numero=FE.numero)
WHERE  (D.sw=1 OR (D.SW IN (2,21,23) AND VT.concepto_dian IS NOT NULL)) AND FE.tipo IS NULL AND D.fecha>='01/09/2018'
ORDER BY  D.date_ins DESC

OPEN DOC_CONTROL_CUR

FETCH NEXT FROM DOC_CONTROL_CUR INTO @TIPO,@NUMERO

		WHILE @@FETCH_STATUS = 0  
		BEGIN 	 
			BEGIN TRY

				IF EXISTS(SELECT * FROM documentos_electronico WHERE tipo=@TIPO AND numero=@NUMERO)		
				BEGIN
					SELECT CAST('DOCUMENTO YA EXISTE' AS INTEGER)
				END
			

				SELECT 
				@IVA=MAX(CASE WHEN ZL.subgrupo2 IN (35) AND ZL.cantidad>0 THEN 1 ELSE 0 END),
				@SOBRETASA=MAX(CASE WHEN ZL.subgrupo2 IN (35) AND ZL.cantidad>0 THEN 1 ELSE 0 END),
				@SOLDICOM=MAX(CASE WHEN ZL.subgrupo2 IN (35) AND ZL.cantidad>0 THEN 1 ELSE 0 END),
				@IMP_NACIONAL=MAX(CASE WHEN ZL.subgrupo2 IN (35) AND ZL.cantidad>0 THEN 1 ELSE 0 END),			
				@DESCUENTO=MAX(CASE WHEN T.descuento_des_iva=1 THEN 1 ELSE 0 END)
				FROM zeuss.dbo.Zeuss_Lin_Ventas ZL WITH (NOLOCK)
				INNER JOIN zeuss.dbo.terceros T ON (ZL.nit=T.nit)
				WHERE tipo=@TIPO AND numero=@NUMERO AND ZL.subgrupo2 IN (35,12,18,17,13,20,21,1,19)			

				INSERT INTO documentos_electronico (seq, sw, tipo, numero, prefijo, idnumeracion, empresa, bodega, IdReporte, Identificacion, fecha_hora_informativa, fechae, IdTipoDocumentoIdentidad, IdTipoPersona, DigitoVerificacion, Nombres, Apellidos, 
							 EmailContacto, EmailEntrega, IdCiudad, Direccion, Telefono, IdTipoRegimen, IdActividadEconomica, GranContribuyente, Autoretenedor, idconceptonota, Consecutivo, cantidad, Ean, Codigo, CodigoExtendido, 
							 NotasExtrasOpcionales, DescripcionItem, und, CostoTotalSinImpuestos, PrecioUnitarioSinImpuestos, UnidadDeMedidaOpcional, Porcentaje, TotalImpuestos, IdConceptoImpuesto, Valor, TotalImporteBruto, TotalBaseImponible, 
							 TotalDescuentos, TotalCargos, TotalAnticipos, TotalPagado, NIT_DIGITO, NIT, CLIENTE_CODIGO, FECHA_VENCIMIENTO1, FECHA_VENCIMIENTO, CONDICION, NOTAS, NOMBRE_VENDEDOR, DOCUMENTO_NUMERO_PEDIDO, 
							 GENERADO_POR, PUNTOSTOTAL, PORCENTAJEIVA, CIUDAD, DEPARTAMENTO, TELBOD, DIRBODEGA, RESOLUCION, DOCUMENTO_SOBRETASA, DOCUMENTO_SOLDICOM, SDOCUMENTO_IMP_NACIONAL, 
							 CODIGO_BARRAS_123, RECIBIDOR_CODIGO, FECHA_DOCUMENTO, RECIBIDOR_NOMBRE_COMPLETO, RECIBIDOR_DIRECCION, RECIBIDOR_TELEFONO, VENDDEPARTAMENTO, RECIBIDOR_ZONA, VALOR_LETRAS, 
							 ESTADO_CUENTA_SUBTOTAL, MEDIDO_SELLADO, SUBTOTAL, contacto, disponible)
				SELECT seq, sw, tipo, numero, prefijo, idnumeracion, empresa, bodega, IdReporte, Identificacion, fecha_hora_informativa, fechae, IdTipoDocumentoIdentidad, IdTipoPersona, DigitoVerificacion, Nombres, Apellidos, 
							 EmailContacto, EmailEntrega, IdCiudad, Direccion, Telefono, IdTipoRegimen, IdActividadEconomica, GranContribuyente, Autoretenedor, idconceptonota, Consecutivo, cantidad, Ean, Codigo, CodigoExtendido, 
							 NotasExtrasOpcionales, DescripcionItem, und, CostoTotalSinImpuestos, PrecioUnitarioSinImpuestos, UnidadDeMedidaOpcional, Porcentaje, TotalImpuestos, IdConceptoImpuesto, Valor, TotalImporteBruto, TotalBaseImponible, 
							 TotalDescuentos, TotalCargos, TotalAnticipos, TotalPagado, NIT_DIGITO, NIT, CLIENTE_CODIGO, FECHA_VENCIMIENTO1, FECHA_VENCIMIENTO, CONDICION, NOTAS, NOMBRE_VENDEDOR, DOCUMENTO_NUMERO_PEDIDO, 
							 GENERADO_POR, PUNTOSTOTAL, PORCENTAJEIVA, CIUDAD, DEPARTAMENTO, TELBOD, DIRBODEGA, RESOLUCION, DOCUMENTO_SOBRETASA, DOCUMENTO_SOLDICOM, SDOCUMENTO_IMP_NACIONAL, 
							 CODIGO_BARRAS_123, RECIBIDOR_CODIGO, FECHA_DOCUMENTO, RECIBIDOR_NOMBRE_COMPLETO, RECIBIDOR_DIRECCION, RECIBIDOR_TELEFONO, VENDDEPARTAMENTO, RECIBIDOR_ZONA, VALOR_LETRAS, 
							 ESTADO_CUENTA_SUBTOTAL, MEDIDO_SELLADO, SUBTOTAL, contacto,0
				FROM v_facturaelectronica WITH (NOLOCK)
				WHERE tipo=@TIPO AND numero=@NUMERO
					

				SELECT 
				@DISPONIBLE=
				CASE WHEN 
				(CASE 
					WHEN @SOBRETASA=0 THEN 1
					WHEN @SOBRETASA=1 AND ISNULL(DOCUMENTO_SOBRETASA,0)<>0 THEN 1
					ELSE 0 END)=1 AND 
					(CASE 
					WHEN @IMP_NACIONAL=0 THEN 1
					WHEN @IMP_NACIONAL=1 AND ISNULL(SDOCUMENTO_IMP_NACIONAL,0)<>0 THEN 1
					ELSE 0 END)=1 AND
					(CASE 
					WHEN @SOLDICOM=0 THEN 1
					WHEN @SOLDICOM=1 AND ISNULL(DOCUMENTO_SOLDICOM,0)<>0 THEN 1
					ELSE 0 END)=1 AND
					(CASE 
					WHEN @DESCUENTO=0 THEN 1
					WHEN @DESCUENTO=1 AND ISNULL(TotalDescuentos,0)<>0 THEN 1
					ELSE 0 END)=1		
			
				THEN 1 ELSE 0 END
				FROM documentos_electronico
				WHERE tipo=@TIPO AND numero=@NUMERO

				IF @DISPONIBLE=1 
				BEGIN
					UPDATE documentos_electronico
					SET disponible=@DISPONIBLE
					WHERE tipo=@TIPO AND numero=@NUMERO	
				END
				ELSE
				BEGIN
					DELETE FROM documentos_electronico
					WHERE tipo=@TIPO AND numero=@NUMERO	
				END
			END TRY
			BEGIN CATCH

				SET @ERROR=@TIPO + ' - ' + CAST(@NUMERO AS VARCHAR) + ' - ' + ERROR_MESSAGE()
				EXEC zeuss.dbo.spEnviarNotificaciones 
				@CORREO='jballesteros@zeuss.com.co',
				@MENSAJE=@ERROR,
				@ASUNTO='ERROR EN FE'
			END CATCH		
				 
			FETCH NEXT FROM DOC_CONTROL_CUR INTO  @TIPO,@NUMERO
		END


		CLOSE DOC_CONTROL_CUR
		DEALLOCATE DOC_CONTROL_CUR

