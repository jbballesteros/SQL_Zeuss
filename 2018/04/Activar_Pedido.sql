DECLARE @NUMERO AS INTEGER=443993

INSERT INTO documentos_lin_ped ( sw, bodega, numero, codigo, seq, cantidad, cantidad_despachada, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, despacho_virtual, porc_dcto_2, porc_dcto_3, enlace)
SELECT  sw, bodega, numero, codigo, seq, cantidad, 0, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, despacho_virtual, porc_dcto_2, porc_dcto_3,  enlace
FROM documentos_lin_ped_historia
WHERE numero=@NUMERO




DELETE 
FROM documentos_lin_ped_historia
WHERE numero=@NUMERO
