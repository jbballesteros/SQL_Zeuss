USE [ZPRU]
GO
/****** Object:  Trigger [dbo].[TR_Documentos_lin_ped_AI_Servicio_Adicional]    Script Date: 06/07/2017 17:34:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jonathan Ballesteros 
-- Create date: 07/06/2017
-- Description:	Agrega servicios o productos adicionales implicitamente
-- =============================================
ALTER TRIGGER [dbo].[TR_Documentos_lin_ped_AI_Servicio_Adicional]
   ON [dbo].[documentos_lin_ped]
   AFTER INSERT
AS 
BEGIN
	DECLARE @NIT AS DECIMAL(18,0)
	DECLARE @NUMERO AS INTEGER
	DECLARE @CONCEPTO_7 AS VARCHAR(5) ----- CONCEPTO 7 COSTO LOGISTICO EN EL MODULO 0105
	DECLARE @CONCEPTO_2 AS VARCHAR(5) ----- CONCEPTO 2 CLASE DE CLIENTE
	DECLARE @CODIGO AS VARCHAR(20)
	DECLARE @CODIGO_SV AS VARCHAR(20)
	DECLARE @SUBGRUPO_2 AS VARCHAR(10)
	DECLARE @SUBGRUPO_2_SV AS VARCHAR(10)
	DECLARE @BODEGA AS INTEGER
	DECLARE @SEQ AS INTEGER
	DECLARE @CANTIDAD AS REAL
	DECLARE @CANT_SV AS REAL
	DECLARE @SW AS INTEGER
	DECLARE @DOCUMENTO AS VARCHAR(100)
	
	SELECT @SW=SW, @NUMERO=NUMERO, @CODIGO=codigo, @BODEGA=BODEGA, @SEQ=SEQ, @CANTIDAD=cantidad FROM inserted
	SELECT @NIT=NIT,@DOCUMENTO=DOCUMENTO FROM documentos_ped WHERE numero=@NUMERO AND sw=@SW
	SELECT @CONCEPTO_7=CONCEPTO_7,@CONCEPTO_2=CONCEPTO_2 FROM TERCEROS WHERE nit=@NIT
	SELECT @SUBGRUPO_2=SUBGRUPO2 FROM REFERENCIAS WHERE codigo=@CODIGO
	
	
	------ VALIDAR COSTO LOGISTICO
	
	IF @CONCEPTO_7 IS NOT NULL  AND @SUBGRUPO_2 IN (2,3,4)
	BEGIN
		SET @CANT_SV=0
		
		SELECT @SUBGRUPO_2_SV=codigo FROM referencias_adicional WHERE codigo_enlace=@SUBGRUPO_2
		SELECT @CODIGO_SV=CODIGO FROM referencias WHERE generico=@BODEGA AND subgrupo2=@SUBGRUPO_2_SV
		
		SELECT @CANT_SV=COUNT(numero) FROM referencias_adicional_control WHERE numero=@NUMERO  AND CODIGO=@CODIGO_SV AND sw=@SW
		
		IF ISNUMERIC(@DOCUMENTO)=1
		BEGIN
			SELECT @CANT_SV=@CANT_SV+COUNT(numero) FROM referencias_adicional_control WHERE numero=@DOCUMENTO  AND CODIGO=@CODIGO_SV AND sw=2		
		END
		
		
		IF @CANT_SV<>0
		BEGIN
			RETURN
		END	
		
		SET @SEQ=@SEQ+100
		
		
		INSERT INTO DOCUMENTOS_LIN_PED (sw,bodega,numero,codigo,seq,cantidad,cantidad_despachada,valor_unitario,porcentaje_iva,porcentaje_descuento,und,cantidad_und,adicional,despacho_virtual,porc_dcto_2,porc_dcto_3,enlace,consignacion)
		VALUES (@SW,@BODEGA,@NUMERO,@CODIGO_SV,@SEQ,@CANTIDAD,0,@CONCEPTO_7,0,0,'UND',1,NULL,@CANTIDAD,0,0,NULL,NULL)
		
		
		INSERT INTO referencias_adicional_control
		VALUES (@SW,@NUMERO,@CODIGO_SV,@CANTIDAD,@CONCEPTO_7,@DOCUMENTO,1,GETDATE())
		
		
	END		
	------------------------------
	
	
	
	--------- ELIMINA EL SOLDICOM ----
	
	IF @CONCEPTO_2 NOT IN (40,42,43,44) AND @SUBGRUPO_2 IN (1,19)
	BEGIN
		DELETE FROM DOCUMENTOS_LIN_PED 
		WHERE SW=@SW AND NUMERO=@NUMERO AND CODIGO=@CODIGO
	
	END
	
	
	----------------------------------
	
	

END
