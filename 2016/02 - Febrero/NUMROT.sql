SELECT terceros.nit,documentos.vencimiento
 as FechaVencimiento, documentos.Fecha as FechaFactura, 
 terceros.concepto_10, terceros.nombres, terceros.direccion, terceros.ciudad, 
 terceros.telefono_1, terceros.telefono_2,terceros.nit_real, terceros.vendedor,
  terceros.notas,documentos.notas as notasDocumentos,documentos_lin.tipo_link, documentos_lin.numero, 
  documentos_lin.fec,documentos_lin.nit,documentos_lin.codigo,referencias.descripcion,
  documentos_lin.cantidad,documentos_lin.valor_unitario,referencias.impoconsumo_compra,
  referencias.costo_unitario,documentos_lin.porc_dcto_2,documentos_lin.pedido,
   documentos.retencion, documentos.prefijo,documentos.retencion_cree 
   FROM terceros, documentos_lin, referencias,documentos 
   WHERE documentos_lin.numero = '122305' and documentos_lin.codigo = referencias.codigo and terceros.nit = documentos_lin.nit and terceros.nit = documentos.nit and documentos_lin.numero = documentos.numero and documentos.tipo = 'FV' ORDER BY referencias.codigo DESC