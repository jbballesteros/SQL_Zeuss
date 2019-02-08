DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=6
DECLARE @NUMERO AS INTEGER=0

SELECT @NUMERO=MAX(NUMERO) FROM documentos WHERE tipo='SCP'


--INSERT INTO documentos ( D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
--                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
--                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
--                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
--                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
--                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo)

--SELECT 14, 'SCP', ROW_NUMBER() OVER (ORDER BY D.NUMERO)+@NUMERO, 900531210, D.fecha, D.condicion, D.vencimiento,0, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
--                      D.costo, D.vendedor, 0, D.anulado, '*', D.numero, 'SUBE COSTO TRANSPORTE POLIDUCTO CENIT', D.usuario, D.pc,DATEADD(MINUTE,1, D.fecha_hora), D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
--                      D.duracion, NULL, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.tipo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
--                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, 2, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
--                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
--                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo
--FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
--WHERE YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES AND D.sw IN (12) AND concepto=7 AND DL.adicional LIKE '%BODO:1000%' 
--GROUP BY  D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
--                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
--                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
--                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
--                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
--                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo



INSERT INTO documentos_lin ( DL.sw, DL.tipo, DL.numero, DL.codigo, DL.seq, DL.fec, DL.nit, DL.cantidad, DL.porcentaje_iva, DL.valor_unitario, DL.porcentaje_descuento, DL.costo_unitario, DL.adicional, DL.vendedor, 
                      DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, DL.maneja_inventario, DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, 
                      DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, 
                      DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, DL.costo_unitario_niif)

SELECT  DD.SW, DD.tipo, DD.numero, DL.codigo, ROW_NUMBER () OVER (PARTITION BY DL.NUMERO ORDER BY DL.TIPO,DL.NUMERO), DL.fec, DD.nit, 1, DL.porcentaje_iva, ROUND(DL.cantidad*RS.valor,2), DL.porcentaje_descuento, ROUND(DL.cantidad*RS.valor,2), 

RS2.DESCRIPCION + ': ' + CAST(DL.CANTIDAD AS VARCHAR(10)) + ' GLS *' + CAST(RS.valor AS VARCHAR(10)), DL.vendedor, 
                      DL.bodega, DL.und, DL.cantidad_und, DL.cantidad_pedida, DL.maneja_inventario, DL.costo_unitario_sin, DL.pedido, DL.lote, DL.cantidad_otra_und, DL.telefono, DL.tipo_op, DL.numero_op, 
                      DL.lote_vcmto, DL.cantidad_devuelta, DL.tipo_link, DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, DL.desc_adicional, 
                      DL.otro_impuesto_lin, DL.tipo_bonificacion, DL.numero_bonificacion, ROUND(DL.cantidad*RS.valor,2)
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON DL.codigo=R.codigo
INNER JOIN referencias_SubeBajaCosto RS ON (R.id=RS.id_referencia AND RS.id_clase IN (2))
INNER JOIN referencias_Clase_SubeBajaCosto RS2 ON (RS.id_clase=RS2.id)
INNER JOIN documentos DD ON (D.tipo=DD.prefijo AND CAST(D.NUMERO AS VARCHAR(10))=DD.documento  )
WHERE YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES AND D.sw IN (12) AND D.concepto=7 AND DL.adicional LIKE '%BODO:1000%'  AND DD.clase_tra=2
ORDER BY DL.numero

