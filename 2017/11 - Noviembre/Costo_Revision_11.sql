SELECT MAX(DAY(FEC)) DIA,
 B.bodega COD_BOD,
B.descripcion BODEGA,

R.codigo CODIGO,
R.descripcion PRODUCTO,
ROUND(DL.costo_unitario,2) COSTO,
SUM(DL.cantidad) CANTIDAD
FROM documentos_lin DL 
INNER JOIN documentos D ON (DL.tipo=D.tipo AND DL.numero=D.numero)
INNER JOIN bodegas	B ON (DL.bodega=B.bodega)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
WHERE D.sw=3 AND fec BETWEEN '01/10/2017' AND '31/10/2017' AND R.clase='3' AND R.subgrupo2 IN (8,5,7)
GROUP BY B.descripcion,B.bodega,R.codigo,R.descripcion,ROUND(DL.costo_unitario,2)
ORDER  BY COD_BOD,CODIGO,DIA