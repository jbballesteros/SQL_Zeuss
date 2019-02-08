INSERT INTO ZEUSS.DBO.documentos (  sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      numincapacidad, idincapacidad, nota1, nota2, placa, conductor, date_ins, sicom, cupo_frontera, ObligacionFinanciera, provision, Base_dcto_RC, remolque, Iva_Costo)


SELECT     sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      numincapacidad, idincapacidad, nota1, nota2, placa, conductor, date_ins, sicom, cupo_frontera, ObligacionFinanciera, provision, Base_dcto_RC, remolque, Iva_Costo
FROM         documentos
WHERE     (tipo = 'FV') AND (numero = 144346)