INSERT INTO documentos_lin (sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, 
                      bodega, und, cantidad_und, cantidad_pedida, maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, 
                      lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, 
                      otro_impuesto_lin, tipo_bonificacion, numero_bonificacion, costo_unitario_niif)


SELECT    DL.sw, DL.tipo, DL.numero, 5002, ROW_NUMBER() OVER(PARTITION BY ZL.TIPO,ZL.NUMERO ORDER BY ZL.TIPO,ZL.NUMERO)+200, DL.fec, DL.nit, DL.cantidad, DL.porcentaje_iva, DL.valor_unitario, DL.porcentaje_descuento, DL.costo_unitario, DL.adicional, DL.vendedor, 
                      DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, 'N', DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, 
                      DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, 
                      DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, DL.costo_unitario_niif
FROM Zeuss_InformeAños ZL 
INNER JOIN documentos_lin		DL ON (ZL.TIPO=DL.tipo AND ZL.NUMERO=DL.numero AND DL.codigo=700100)
WHERE ZL.CEXTRA=ZL.EXTRA AND ZL.EXTRA<>0 AND ZL.GLSCORRBASICA=0
ORDER BY ZL.TIPO,ZL.NUMERO
