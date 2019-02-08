DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7


INSERT INTO documentos_lin ( sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin, tipo_bonificacion, numero_bonificacion, costo_unitario_niif)

SELECT     DL.sw, DL.tipo, DL.numero, CI.codigo_impuesto, DL.seq+100, DL.fec, DL.nit, DL.cantidad, DL.porcentaje_iva, DL2.valor_unitario, DL.porcentaje_descuento, DL2.valor_unitario, DL.adicional, DL.vendedor, DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, 
                      'N', DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, 
                      DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, DL2.valor_unitario
FROM documentos D 
INNER JOIN documentos_traslados DT ON (D.documento=DT.id AND sw_doc=11)
INNER JOIN documentos_lin DL2 ON (DT.tipo=DL2.tipo AND DT.numero=DL2.numero)
INNER JOIN referencias R2 ON (DL2.codigo=R2.codigo)
INNER JOIN documentos_lin		DL ON (D.tipo=DL.tipo AND D.numero=DL.numero )
LEFT JOIN control_inventarios_impuesto CI ON (DL.codigo=CI.codigo_producto)
LEFT JOIN referencias R ON (CI.codigo_impuesto=R.codigo)
WHERE YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES AND D.bodega<>1000 AND D.sw=12 AND D.concepto=7 AND DL.adicional LIKE '%BODO:1000%' AND R2.subgrupo2 IN (13,20,21)
