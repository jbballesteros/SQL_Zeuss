DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7

INSERT INTO documentos_lin ( sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin, tipo_bonificacion, numero_bonificacion, costo_unitario_niif)

SELECT     DL.sw, DL.tipo, DL.numero, CI.codigo_impuesto, seq+100, fec, DL.nit, cantidad, DL.porcentaje_iva, R.valor_unitario, porcentaje_descuento, R.costo_unitario, adicional, DL.vendedor, DL.bodega, und, cantidad_und, cantidad_pedida, 
                      'N', costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin, tipo_bonificacion, numero_bonificacion, R.costo_unitario
FROM documentos D 
INNER JOIN documentos_lin		DL ON (D.tipo=DL.tipo AND D.numero=DL.numero )
LEFT JOIN control_inventarios_impuesto CI ON (DL.codigo=CI.codigo_producto)
LEFT JOIN referencias R ON (CI.codigo_impuesto=R.codigo)
WHERE YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES AND D.bodega=1000 AND D.concepto=101


