SELECT B.bodega CODBOD,B.descripcion SEDE,RC.descripcion CLASE,R.codigo CODIGO,R.descripcion PRODUCTO,DL.tipo TIPO,DL.numero NUMERO,DL.fec FECHA,DL.valor_unitario VALOR,DL.cantidad CANTIDAD,DL.porcentaje_descuento DESCUENTO_1,DL.porc_dcto_2 DESCUENTO_2,DL.porc_dcto_3 DESCUENTO_3,
(SELECT TOP(1) valor_unitario
FROM documentos_lin
WHERE sw=3  AND codigo=R.codigo
ORDER BY fec DESC) ULTIMO_COSTO
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN referencias_cla RC ON (R.clase=RC.clase)
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
WHERE DL.porcentaje_descuento<>0 OR DL.porc_dcto_2<>0 OR DL.porc_dcto_3<> 0 AND DL.fec BETWEEN '01/03/2015' AND '31/03/2015'
ORDER BY B.bodega, DL.fec
