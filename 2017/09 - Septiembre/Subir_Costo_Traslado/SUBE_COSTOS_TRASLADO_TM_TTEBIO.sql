DECLARE @MAXIMO AS INTEGER=0
DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=9
DECLARE @BODEGA AS INTEGER=6
DECLARE @TIPO AS VARCHAR(10)='SCTM'
SELECT @MAXIMO=MAX(NUMERO) FROM DOCUMENTOS WHERE TIPO=@TIPO

SELECT 14, @TIPO, ROW_NUMBER() OVER (ORDER BY D.NUMERO)+@MAXIMO, 899999068, D.fecha, D.condicion, D.vencimiento,0, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, 0, D.anulado, '*', D.numero, 'SUBIR COSTO TARIFA DE MARCACION: ' + D.tipo + CAST(D.NUMERO AS VARCHAR(10)), D.usuario, D.pc,DATEADD(MINUTE,1, D.fecha_hora), D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, NULL, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.tipo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE YEAR(D.FECHA)=@AÑO AND MONTH(D.FECHA)=@MES   AND D.sw IN (11,12) AND concepto=7 AND DL.adicional LIKE '%BODO:1000%' AND D.bodega=@BODEGA
GROUP BY  D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo




INSERT INTO documentos ( D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo)


SELECT 14, @TIPO, ROW_NUMBER() OVER (ORDER BY D.NUMERO)+@MAXIMO, 899999068, D.fecha, D.condicion, D.vencimiento,0, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, 0, D.anulado, '*', D.numero, 'SUBIR COSTO TARIFA DE MARCACION: ' + D.tipo + CAST(D.NUMERO AS VARCHAR(10)), D.usuario, D.pc,DATEADD(MINUTE,1, D.fecha_hora), D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, NULL, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.tipo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE YEAR(D.FECHA)=@AÑO AND MONTH(D.FECHA)=@MES   AND D.sw IN (11,12) AND concepto=7 AND DL.adicional LIKE '%BODO:1000%' AND D.bodega=@BODEGA
GROUP BY  D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo