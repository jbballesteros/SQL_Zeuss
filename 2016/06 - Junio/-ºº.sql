
INSERT INTO documentos_lin ( DL.sw, DL.tipo, DL.numero, DL.codigo, DL.seq, DL.fec, DL.nit, DL.cantidad, DL.porcentaje_iva, DL.valor_unitario, DL.porcentaje_descuento, DL.costo_unitario, DL.adicional, DL.vendedor, 
                      DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, DL.maneja_inventario, DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, 
                      DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, 
                      DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, DL.costo_unitario_niif)

SELECT  DD.SW, DD.tipo, DD.numero, DL.codigo, ROW_NUMBER () OVER (PARTITION BY DL.NUMERO ORDER BY DL.TIPO,DL.NUMERO), DL.fec, 899999068, 1, DL.porcentaje_iva, ROUND(DL.cantidad*RS.valor,2), DL.porcentaje_descuento, ROUND(DL.cantidad*RS.valor,2), 

RS2.DESCRIPCION + ': ' + CAST(DL.CANTIDAD AS VARCHAR(10)) + ' GLS *' + CAST(RS.valor AS VARCHAR(10)), DL.vendedor, 
                      DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, DL.maneja_inventario, DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, 
                      DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, 
                      DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, ROUND(DL.cantidad*RS.valor,2)
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON DL.codigo=R.codigo
INNER JOIN referencias_SubeBajaCosto RS ON (R.id=RS.id_referencia AND RS.id_clase IN (10,11))
INNER JOIN referencias_Clase_SubeBajaCosto RS2 ON (RS.id_clase=RS2.id)
INNER JOIN documentos DD ON (D.tipo=DD.prefijo AND CAST(D.NUMERO AS VARCHAR(10))=DD.documento)
WHERE D.fecha BETWEEN '01/05/2016' AND '31/05/2016' AND D.sw IN (11,12) AND D.concepto=7 AND DL.adicional LIKE '%BODO:1000%' AND D.bodega=1
ORDER BY DL.numero


