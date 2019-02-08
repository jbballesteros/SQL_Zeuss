USE [estinsa]
GO

/****** Object:  Trigger [dbo].[tg_crearproducto]    Script Date: 11/29/2017 08:21:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Trigger [dbo].[tg_crearproducto] 
ON [dbo].[referencias]
FOR INSERT
AS
Declare @codigo varchar(50)
declare @bod varchar(50)
declare @codint int
DECLARE @intFlag INT




SELECT  @codigo = (Select codigo From Inserted )


set @bod=SUBSTRING(@codigo,1,1)


BEGIN

	IF (@bod='1' or @bod='2'  or @bod='3'  or @bod='4'  or @bod='5'  or 
	@bod='6'  or @bod='7'  or @bod='8'  or @bod='9')
	begin
	set @codint= CAST(@bod as int) 
	
	
	SET @intFlag = case when @codint=1 then 2 else 1 end
	
	
	WHILE (@intFlag<=9 )
BEGIN
if NOT EXISTS (select codigo from referencias where codigo=cast(@intFlag as varchar)+ SUBSTRING(@codigo,2,50)) begin
insert into referencias (codigo,descripcion, codigo_oferta, generico, clase, contable, grupo, subgrupo, nit, valor_unitario, porcentaje_iva, costo_unitario, maneja_inventario, und_1,
                       can_1, und_2, can_2, und_3, can_3, und_vta, und_com, impoconsumo, valor_und1, valor_und2, valor_und3, conversion, otro_impuesto, minimo_iva, minimo_iva_c, 
                      precio_marcado, factor_compra, factor_venta_1, factor_venta_2, factor_venta_3, factor_venta_4, factor_venta_5, factor_venta_6, factor_venta_7, factor_venta_8, 
                      factor_venta_9, factor_venta_10, fec_cambio_precio, costo_anterior, fec_ultima_entrada, fec_ultima_salida, impoconsumo_compra, porcentaje_iva_compra, 
                      precio_si_costo_cero, fecha_creacion, maximo_descuento, maneja_lotes, maneja_otra_und, otra_und, tam_alto, tam_largo, tam_ancho, costo_estandar, reposicion, 
                      ref_anulada, vcmto_refer, impodeporte, subgrupo2, subgrupo3, controlado, promocion, maneja_series, codigo_enlace, cantidad_enlace, usar_descto_cliente, 
                      costo_compra_emergencia, codigo_descuento, pedir, usar_dcto_vol, tipo_1, tipo_2, tipo_3, tipo_4, tipo_5, tipo_6, tipo_7, iva_es_costo, grupo_comision, 
                      cantidad_promocion_max, fecha_inicia_promocion, precio_nuevo, costo_nuevo, precio_pos, fecha_actualizacion, no_aplica_retenciones, borrar_promocion, Notas,
                       distribuir, Debajo_Costo)
		SELECT    cast(@intFlag as varchar)+ SUBSTRING(@codigo,2,50),  descripcion, codigo_oferta, generico, clase, contable, grupo, subgrupo, nit, valor_unitario, porcentaje_iva, costo_unitario, maneja_inventario, und_1,
                       can_1, und_2, can_2, und_3, can_3, und_vta, und_com, impoconsumo, valor_und1, valor_und2, valor_und3, conversion, otro_impuesto, minimo_iva, minimo_iva_c, 
                      precio_marcado, factor_compra, factor_venta_1, factor_venta_2, factor_venta_3, factor_venta_4, factor_venta_5, factor_venta_6, factor_venta_7, factor_venta_8, 
                      factor_venta_9, factor_venta_10, fec_cambio_precio, costo_anterior, fec_ultima_entrada, fec_ultima_salida, impoconsumo_compra, porcentaje_iva_compra, 
                      precio_si_costo_cero, fecha_creacion, maximo_descuento, maneja_lotes, maneja_otra_und, otra_und, tam_alto, tam_largo, tam_ancho, costo_estandar, reposicion, 
                      ref_anulada, vcmto_refer, impodeporte, subgrupo2, subgrupo3, controlado, promocion, maneja_series, codigo_enlace, cantidad_enlace, usar_descto_cliente, 
                      costo_compra_emergencia, codigo_descuento, pedir, usar_dcto_vol, tipo_1, @intFlag, tipo_3, tipo_4, tipo_5, tipo_6, tipo_7, iva_es_costo, grupo_comision, 
                      cantidad_promocion_max, fecha_inicia_promocion, precio_nuevo, costo_nuevo, precio_pos, fecha_actualizacion, no_aplica_retenciones, borrar_promocion, Notas,
                       distribuir, Debajo_Costo
		FROM         referencias
		WHERE     codigo=@codigo
set @intFlag=@intFlag+1

SET @intFlag =case when @intFlag=@codint then @intFlag+1 else @intFlag  end

end
END
end end

	
	




GO


