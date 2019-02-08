INSERT INTO estinsa.dbo.documentos  (sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      valor_pos_cambio, placa_isla, kilometraje_isla, turno_isla, surtidor_isla, id_ica_new, numincapacidad, idincapacidad, porcentaje_ica_new, nota1, nota2, fecha_emision)
SELECT sw, tipo, numero+35, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      valor_pos_cambio, placa_isla, kilometraje_isla, turno_isla, surtidor_isla, id_ica_new, numincapacidad, idincapacidad, porcentaje_ica_new, nota1, nota2, fecha_emision
FROM documentos
WHERE  usuario='TIENDA4' and fecha='05/03/2015' AND CAST (fecha_hora AS DATE)='05/03/2015' AND tipo='VI'
ORDER BY numero ASC


INSERT INTO estinsa.dbo.documentos_lin ( sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin, tipo_bonificacion, numero_bonificacion)
SELECT  DL.sw, DL.tipo, DL.numero+35, codigo, seq, fec, DL.nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, DL.vendedor, DL.bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin, tipo_bonificacion, numero_bonificacion
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  usuario='TIENDA4' and fecha='05/03/2015' AND CAST (fecha_hora AS DATE)='05/03/2015' AND D.tipo='VI'

INSERT INTO estinsa.dbo.movimiento 
SELECT DL.tipo,  DL.numero+35, seq, cuenta, centro,  DL.nit, fec, valor, base,  DL.documento, explicacion, concilio, concepto_mov, concilio_ano, Cuenta_Documento
FROM documentos D INNER JOIN movimiento DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  usuario='TIENDA4' and fecha='05/03/2015' AND CAST (fecha_hora AS DATE)='05/03/2015' AND D.tipo='VI'

INSERT INTO estinsa.dbo.documentos_che ( sw, tipo, numero, banco, documento, forma_pago, fecha, valor, consignar_en, devuelto, tipo_consignacion, numero_consignacion, fecha_devolucion, cuenta_banco, iva_tarjeta, notas, tipo_devuelto,
                       numero_devuelto, nit_cheque)
SELECT   DL.sw,  DL.tipo,  DL.numero+35, banco,  DL.documento, forma_pago,  DL.fecha, valor, consignar_en, devuelto, tipo_consignacion, numero_consignacion, fecha_devolucion, cuenta_banco, iva_tarjeta,  DL.notas, tipo_devuelto,
                       numero_devuelto, nit_cheque
FROM documentos D INNER JOIN documentos_che DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  usuario='TIENDA4' and D.fecha='05/03/2015' AND CAST (fecha_hora AS DATE)='05/03/2015' AND D.tipo='VI'




