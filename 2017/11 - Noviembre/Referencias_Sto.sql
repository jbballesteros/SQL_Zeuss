SELECT YEAR(DL.fec) AÑO, MONTH(DL.fec) MES,
SUM(CASE WHEN DL.sw=1 
THEN DL.cantidad*DL.costo_unitario ELSE 
DL.cantidad*DL.costo_unitario*-1 END)  COSTO_TOTAL
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN documentos D ON (DL.tipo=D.tipo AND DL.numero=D.numero)
WHERE YEAR(DL.fec)=2017 
AND DL.sw IN (1,2)  
AND R.subgrupo2 IN  (7,8,5,6,9)
GROUP BY YEAR(DL.fec),MONTH(DL.fec)