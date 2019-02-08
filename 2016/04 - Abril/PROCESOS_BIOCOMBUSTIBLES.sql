DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=6


----------- INSERTAR EL B100 -----------

INSERT INTO documentos_lin (sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und, cantidad_pedida, 
                      maneja_inventario, costo_unitario_sin, pedido, lote, cantidad_otra_und, telefono, tipo_op, numero_op, lote_vcmto, cantidad_devuelta, tipo_link, numero_link, seq_link, cantidad_dos, serial, 
                      porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  tipo_bonificacion, numero_bonificacion)




SELECT ZL.sw,ZL.tipo,ZL.numero,RS.componente,100,ZL.fec,ZL.nit,ROUND(RS.cantidad*ZL.cantidad,2) ,
0,0,0,0,'REMEZCLA DE GALONES',DL.vendedor,ZL.bodega,'UND',1,0,'S',
0,DL.pedido,DL.lote,DL.cantidad_otra_und,DL.telefono,DL.tipo_op,DL.numero_op,DL.lote_vcmto,DL.cantidad_devuelta,
DL.tipo_link,DL.numero_link, DL.seq_link, DL.cantidad_dos, DL.serial, 
                      DL.porc_dcto_2, DL.porc_dcto_3, DL.Id_Documentos_lin_ped, desc_adicional, otro_impuesto_lin,  DL.tipo_bonificacion, DL.numero_bonificacion
FROM Zeuss_Lin_Ventas ZL
 LEFT JOIN referencias_estruc_simple RS ON (ZL.codigo=RS.codigo)
LEFT JOIN documentos_lin DL ON (RS.componente=DL.codigo AND ZL.tipo=DL.tipo AND DL.numero=ZL.numero)
WHERE ZL.ano=2016 AND ZL.mes=6  AND ZL.subgrupo2=27 AND RS.componente=900180
ORDER BY ZL.tipo,ZL.numero


