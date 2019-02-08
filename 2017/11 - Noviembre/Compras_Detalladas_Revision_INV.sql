SELECT YEAR(DL.fec) AÑO,MONTH(DL.fec) MES,DAY(DL.fec) DIA,
DL.tipo TIPO,DL.numero NUMERO,DL.codigo CODIGO,R.descripcion PRODUCTO,
(CASE WHEN DL.sw=3 THEN  DL.costo_unitario ELSE DL.costo_unitario *-1 END)*DL.CANTIDAD  COSTO_UNITARIO,
DL.cantidad CANTIDAD,
ISNULL(D.notas,'') + ISNULL(DL.adicional,'') NOTAS

FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN documentos D ON (DL.tipo=D.tipo AND DL.numero=D.numero)
WHERE YEAR(DL.fec)=2017  AND MONTH(DL.fec) =10
AND D.sw IN (3,4)  
AND R.subgrupo2 IN  (7,8,5,6,9)