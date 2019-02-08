INSERT INTO documentos (D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.date_ins, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo)

SELECT     D.sw, 'SCTM', ROW_NUMBER() OVER (ORDER BY D.NUMERO  ASC), D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.date_ins, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo
FROM         documentos AS D LEFT OUTER JOIN
                      documentos_lin AS DL ON D.tipo = DL.tipo AND D.numero = DL.numero
WHERE     (D.tipo = 'SCP') AND (DL.adicional LIKE '%marcac%')
GROUP BY D.sw, D.tipo, D.numero, D.nit, D.fecha, D.condicion, D.vencimiento, D.valor_total, D.iva, D.retencion, D.retencion_causada, D.retencion_iva, D.retencion_ica, D.descuento_pie, D.fletes, D.iva_fletes, 
                      D.costo, D.vendedor, D.valor_aplicado, D.anulado, D.modelo, D.documento, D.notas, D.usuario, D.pc, D.fecha_hora, D.retencion2, D.retencion3, D.bodega, D.impoconsumo, D.descuento2, 
                      D.duracion, D.concepto, D.vencimiento_presup, D.exportado, D.impuesto_deporte, D.prefijo, D.moneda, D.tasa, D.centro_doc, D.valor_mercancia, D.numero_cuotas, D.codigo_direccion, 
                      D.descuento_1, D.descuento_2, D.descuento_3, D.abono, D.fecha_consignacion, D.clase_tra, D.concepto_Retencion, D.porc_RteFuente, D.porc_RteIva, D.porc_RteIvaSimpl, D.porc_RteIca, 
                      D.porc_RteA, D.porc_RteB, D.ajuste, D.bodega_ot, D.numero_ot, D.porc_RteCree, D.retencion_cree, D.codigo_retencion_cree, D.cree_causado, D.numincapacidad, D.idincapacidad, D.nota1, 
                      D.nota2, D.placa, D.conductor, D.date_ins, D.sicom, D.cupo_frontera, D.ObligacionFinanciera, D.provision, D.Base_dcto_RC, D.remolque, D.Iva_Costo
                      
                      
                      UPDATE documentos
                      SET nota1=CAST(D.numero AS VARCHAR(15))
                      FROM         documentos AS D LEFT OUTER JOIN
                      documentos_lin AS DL ON D.tipo = DL.tipo AND D.numero = DL.numero
WHERE     (D.tipo = 'SCP') AND (DL.adicional LIKE '%marcac%')