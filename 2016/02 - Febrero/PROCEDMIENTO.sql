USE [estinsapruebas]
GO
/****** Object:  StoredProcedure [dbo].[sp_cuadre_pagos_vc1]    Script Date: 03/11/2015 12:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_cuadre_pagos_vc1] as
	
		DECLARE @TIPO AS VARCHAR(10)
		DECLARE @NUMERO AS INTEGER
		SELECT TOP(1) @TIPO=tipo, @NUMERO=numero  FROM documentos ORDER BY date_ins DESC

		IF @TIPO NOT LIKE 'VC%'
		BEGIN
			RETURN
		END
		
		IF @TIPO LIKE 'VC%'
		BEGIN
			IF (SELECT COUNT(NUMERO) FROM tabla_control WHERE tipo=@TIPO AND numero=@NUMERO)<>0
			BEGIN
				RETURN				
			END
			ELSE
			BEGIN
				DELETE movimiento WHERE  cuenta='11050501' AND tipo=@TIPO AND numero=@NUMERO
				
				INSERT INTO movimiento 
				
				select tipo,numero,  ROW_NUMBER ()
				over (ORDER BY numero )+500 as seq,
				case when forma_pago=0 then '11050501' 
				when forma_pago=1 then '11050501'
				when forma_pago=5 then '11100601' 
				when forma_pago=4  and documento = (4)   then '11100603' 
				when forma_pago=4 and documento = (5)   then '11100602' 
				when forma_pago=4  and documento = (8)   then '530535'
				when forma_pago=4  and documento = (9)   then '11051003'
				when forma_pago=4  and documento = (10)   then '11050501'
				when forma_pago=4  and documento = (11)   then '11050501'
				when forma_pago=4  and a.documento not in (6,99,4,5,7,8,9,10,11)   then '130511' 
				else '11050501' end  ,case when tipo='VC1' then 90 when tipo='VC2' then 190
				when  tipo='VC3' then 290 when tipo='VC4' then 390 WHEN tipo='VC5' THEN 490
				WHEN tipo='VC6' THEN 590
				WHEN TIPO='VC7' THEN 690 ELSE 0 END ,case when a.documento=1 THEN  800219876 when a.documento=2 then 800112214 when a.documento=3 then 811046580 when a.documento=4 then 800219876 when 
				 a.documento=5 then 800112214 else 0 end,
				fecha as fec,valor,null as base,null as documento,null as explicacion,null as concilio,null as concepto_mov, null as concilio_ano,
				null as cuenta_documento
				from documentos_che AS A where tipo=@TIPO and numero=@NUMERO 
				
				INSERT INTO  tabla_control VALUES (@TIPO,@NUMERO)
								
			END
			
		END


