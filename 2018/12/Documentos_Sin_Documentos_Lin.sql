INSERT INTO documentos_lin (sw,tipo,numero,codigo,seq,fec,nit,cantidad,porcentaje_iva,valor_unitario,
porcentaje_descuento,costo_unitario,bodega,und,cantidad_und,cantidad_pedida,maneja_inventario,costo_unitario_sin,
porc_dcto_2,costo_unitario_niif)

SELECT 
D.sw,D.tipo,D.numero,900140,1,D.fecha,D.nit,1,0,D.valor_total,0,D.valor_total,1,'UND',1,0,'N',0,0,D.valor_total	
FROM documentos D LEFT JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw=1 AND D.anulado=0 AND DL.tipo IS NULL
ORDER BY D.fecha DESC

SELECT *
FROM documentos
WHERE usuario='NOCAMPO' AND sw=1
ORDER BY fecha DESC

