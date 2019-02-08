DECLARE @TIPO AS VARCHAR(4)='RCV1'
DECLARE @NUMERO AS INTEGER=173

DELETE FROM documentos_solicitudes
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM dupl_impuesto
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM documentos_lin
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM movimiento
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM documentos_entregados
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM documentos 
WHERE tipo=@TIPO AND numero=@NUMERO





INSERT INTO documentos (sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      numincapacidad, idincapacidad, nota1, nota2, placa, conductor, date_ins, sicom, ObligacionFinanciera, provision, remolque, Iva_Costo)
SELECT sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup, exportado, impuesto_deporte, 
                      prefijo, moneda, tasa, centro_doc, valor_mercancia, numero_cuotas, codigo_direccion, descuento_1, descuento_2, descuento_3, abono, fecha_consignacion, clase_tra, concepto_Retencion, 
                      porc_RteFuente, porc_RteIva, porc_RteIvaSimpl, porc_RteIca, porc_RteA, porc_RteB, ajuste, bodega_ot, numero_ot, porc_RteCree, retencion_cree, codigo_retencion_cree, cree_causado, 
                      numincapacidad, idincapacidad, nota1, nota2, placa, conductor, date_ins, sicom, ObligacionFinanciera, provision, remolque, Iva_Costo
FROM estinsapruebas.dbo.documentos
WHERE tipo=@TIPO AND numero=@NUMERO


----------- RECUPERAR DOCUMENTOS_LIN
INSERT INTO documentos_lin (sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  tipo_bonificacion, numero_bonificacion, costo_unitario_niif)

SELECT   sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  tipo_bonificacion, numero_bonificacion, costo_unitario_niif

FROM estinsapruebas.dbo.documentos_lin
WHERE tipo=@TIPO AND numero=@NUMERO
-----------


----------- RECUPERAR MOVIMIENTO
INSERT INTO movimiento
SELECT *
FROM estinsapruebas.dbo.movimiento
WHERE tipo=@TIPO AND numero=@NUMERO
-----------

----------- INSERTAR AUDITORIA
DECLARE @QUE AS VARCHAR(250)
SET @QUE='Restauro documento ' +  @TIPO + ' ' + CAST(@NUMERO AS VARCHAR(10)) + ', error de anulacion.'
insert into auditoria (fecha,pc,usuario,programa,que,forma,nivel)
values (GETDATE(),'SQLSERVER','DMS1','',@QUE,1104,0)
-----------

