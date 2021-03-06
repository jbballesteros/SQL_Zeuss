USE [zeuss]
GO
/****** Object:  StoredProcedure [dbo].[spEnviar_Factura_Montado]    Script Date: 20/04/2018 10:30:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spEnviar_Factura_Montado]

	 @TIPO AS VARCHAR(4),
	 @NUMERO AS INTEGER	

AS


BEGIN
	DECLARE @MODELO AS VARCHAR(5)
	DECLARE @NIT AS DECIMAL (18,0)
	DECLARE @CONCEPTO_24 AS VARCHAR(5)
	DECLARE @CONCEPTO_12 AS VARCHAR(5)
	DECLARE @DESCUENTO_DES_IVA AS MONEY
	DECLARE @MAX AS INTEGER
	DECLARE @CENTRO AS INTEGER
	DECLARE @RESTANTE AS REAL
	DECLARE @TSQL AS VARCHAR(100)
	DECLARE @RST AS INTEGER
	DECLARE @ERROR AS VARCHAR(MAX)
	DECLARE @DOCUMENTO  AS VARCHAR(100)
	DECLARE @SW AS INTEGER
	DECLARE @SEQ AS INTEGER
	DECLARE @FECHA AS DATE
	DECLARE @VENDEDOR AS DECIMAL(18,0)
	DECLARE @BODEGA AS INTEGER
	DECLARE @PEDIDO AS INTEGER
	
	SELECT 	@MODELO=MODELO,@NIT=T.nit,
	@CONCEPTO_24=ISNULL(TC.concepto_24,'0'),
	@DESCUENTO_DES_IVA=T.descuento_des_iva,@DOCUMENTO=D.documento,@SW=D.sw,
	@CONCEPTO_12=ISNULL(T.concepto_12,'0')
	FROM documentos D 
	INNER JOIN terceros T ON (D.nit=T.nit)
	LEFT JOIN terceros_criterios TC ON (T.nit=TC.nit)
	WHERE D.tipo=@TIPO AND D.numero=@NUMERO
	

	
	
	IF @MODELO  NOT IN ('12','13','14','17','11','23','24','25','26','16','18','19','20')
	BEGIN
		EXEC sp_Enviar_Factura_Correo @TIPO=@TIPO,@NUMERO=@NUMERO
	END
	
	IF @DESCUENTO_DES_IVA=1
	BEGIN
		
		SET @TSQL='DESCUENTO_PIE'
		SET @RST =0
	
		BEGIN TRAN 	@TSQL
	
		BEGIN TRY
		
			SELECT @DESCUENTO_DES_IVA=ISNULL(MAX(descuento),0)
			FROM v_facturas_descuento_pie
			WHERE tipo=@TIPO AND numero=@NUMERO
		
			IF @DESCUENTO_DES_IVA<>0
			BEGIN
				SELECT @MAX=MAX(seq),@CENTRO=MAX(centro)
				FROM movimiento
				WHERE  tipo=@TIPO AND numero=@NUMERO AND seq<1000000
				
				UPDATE documentos_lin
				SET tipo_bonificacion=@TIPO , numero_bonificacion=@NUMERO
				WHERE tipo=@TIPO AND numero=@NUMERO	
			
				UPDATE documentos
				SET valor_total=valor_total-@DESCUENTO_DES_IVA, descuento_pie=@DESCUENTO_DES_IVA
				WHERE tipo=@TIPO AND numero=@NUMERO	

				INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
				SELECT @TIPO,@NUMERO,@MAX+1,'13050501',0,D.nit,D.fecha,@DESCUENTO_DES_IVA*-1,'Descuento Factura',@DESCUENTO_DES_IVA*-1
				FROM documentos D
				WHERE tipo=@TIPO AND numero=@NUMERO
				UNION ALL			
				SELECT @TIPO,@NUMERO,@MAX+2,'53053501',@CENTRO,D.nit,D.fecha,@DESCUENTO_DES_IVA,'Descuento Factura',0
				FROM documentos D
				WHERE tipo=@TIPO AND numero=@NUMERO
				UNION ALL			
				SELECT @TIPO,@NUMERO,@MAX+3,'417601',@CENTRO,D.nit,D.fecha,0,'Descuento Factura',@DESCUENTO_DES_IVA
				FROM documentos D
				WHERE tipo=@TIPO AND numero=@NUMERO

			INSERT INTO documentos_descuento_control (tipo,numero,descuento,fecha_hora,respuesta,mensaje)
			VALUES (@TIPO,@NUMERO,@DESCUENTO_DES_IVA,GETDATE(),1,'Correcto')				 

		END

		IF @DESCUENTO_DES_IVA=0
		BEGIN
			EXEC estinsa.dbo.spEnviarNotificaciones 
			@mensaje='No ejecuto descuento, verificar',
			@asunto='No ejecuto descuento, verificar', 
			@CORREO='jballesteros@zeuss.com.co'
			
			INSERT INTO documentos_descuento_control (tipo,numero,descuento,fecha_hora,respuesta,mensaje)
			VALUES (@TIPO,@NUMERO,@DESCUENTO_DES_IVA,GETDATE(),0,'La Factura no tiene descuento')			
		
		END
		
			
		COMMIT TRANSACTION

		END TRY

		BEGIN CATCH
					SET @ERROR=ERROR_MESSAGE()

					 EXEC estinsa.dbo.spEnviarNotificaciones 
					 @mensaje=@ERROR,
					 @asunto='No ejecuto descuento, verificar', 
					 @CORREO='jballesteros@zeuss.com.co'
		
					INSERT INTO documentos_descuento_control (tipo,numero,descuento,fecha_hora,respuesta,mensaje)
					VALUES (@TIPO,@NUMERO,@DESCUENTO_DES_IVA,GETDATE(),0,ERROR_MESSAGE())			
		END CATCH

		
	END
	
	IF @CONCEPTO_12='01'
	BEGIN
		SELECT @SEQ=MAX(seq),@FECHA=MAX(fec),@NIT=MAX(nit),@VENDEDOR=MAX(vendedor),@BODEGA=MAX(bodega)
		FROM documentos_lin
		WHERE TIPO=@TIPO AND numero=@NUMERO

		EXEC add_documentos_lin 
		@SW=1,@TIPO=@TIPO,@NUMERO=@NUMERO,@CODIGO='900109',@SEQ=SEQ,@FEC=@FECHA,
		@NIT=@NIT,@CANTIDAD=1,@PORCENTAJE_DESCUENTO=0,@COSTO_UNITARIO=0, @COSTO_UNITARIO_NIIF=0,
		@ADICIONAL='Interes de Mora',@VENDEDOR=@VENDEDOR,@BODEGA=@BODEGA,@UND='UND',@CANTIDAD_UND=1,
		@CANTIDAD_PEDIDA=1,@MANEJA_INVENTARIO='N',@COSTO_UNITARIO_SIN=0,@PEDIDO=NULL,
	END


	IF @CONCEPTO_24=100 ---- IMPUESTO AL CARBONO
	BEGIN
		
		IF NOT EXISTS (
		SELECT * 
		FROM terceros_cupos_detalle_ped 
		WHERE sw=1 and NUMERO=@NUMERO)
		BEGIN
			RETURN
		END



		INSERT INTO terceros_cupos_detalle (tipo_cupo,tipo,numero,nit,codigo,cantidad)
		SELECT 1,@TIPO,@NUMERO,@NIT,ZL.codigo,ZL.cantidad
		FROM terceros_cupos TC 
		INNER JOIN 
		Zeuss_Lin_Ventas ZL 
		ON (TC.nit=ZL.nit AND TC.ano=ZL.ano AND ZL.mes=TC.mes AND ZL.subgrupo2=TC.subgrupo2)
		WHERE TC.ano=YEAR(GETDATE()) AND TC.mes=MONTH(GETDATE()) AND ZL.tipo=@TIPO AND ZL.numero=@NUMERO	
	
		
		select @RESTANTE=cantidad-CONSUMO
		from v_control_carbono
		where nit=@NIT AND año=YEAR(GETDATE()) AND mes=MONTH(GETDATE())
		
		IF @RESTANTE=0
		BEGIN 
			UPDATE terceros_criterios
			SET concepto_24=101
			WHERE nit=@NIT
		
		END
	
	
	
	END
	
END
