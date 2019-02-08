SELECT RS.*
FROM referencias_estruc_simple RS INNER JOIN referencias R ON (RS.codigo=R.codigo)
WHERE R.clase=13


INSERT INTO documentos_lin (sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  tipo_bonificacion, numero_bonificacion)
SELECT DL.sw,DL.tipo,DL.numero,P.componente,ROW_NUMBER() OVER (ORDER BY DL.NUMERO)+100,DL.fec,DL.nit,P.cantidad*DL.cantidad,0,0,0,0,NULL,DL.vendedor,DL.bodega,'UND',1,0,'S',
0,DL.pedido,DL.lote,DL.cantidad_otra_und,DL.telefono,DL.tipo_op,DL.numero_op,DL.lote_vcmto,DL.cantidad_devuelta,
tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  tipo_bonificacion, numero_bonificacion
FROM documentos_lin DL INNER JOIN (SELECT RS.*
FROM referencias_estruc_simple RS INNER JOIN referencias R ON (RS.codigo=R.codigo)
WHERE R.clase=13) AS P ON (DL.codigo=P.codigo)
WHERE  DL.bodega=1 AND DL.fec BETWEEN '01/02/2016' AND '04/02/2016'