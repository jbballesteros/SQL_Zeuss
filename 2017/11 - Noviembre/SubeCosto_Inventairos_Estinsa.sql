SELECT YEAR(DL.fec) AÑO,MONTH(DL.fec) MES,
DL.tipo TIPO,DL.numero NUMERO,DL.codigo CODIGO,R.descripcion PRODUCTO,
CASE WHEN DL.sw=14 THEN  DL.costo_unitario ELSE DL.costo_unitario *-1 END  COSTO_UNITARIO,
ISNULL(D.notas,'') + ISNULL(DL.adicional,'') NOTAS, TC.descripcion CONCEPTO
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN documentos D ON (DL.tipo=D.tipo AND DL.numero=D.numero)
LEFT JOIN tipo_transacciones_concep TC ON (D.tipo=TC.tipo AND D.concepto=TC.concepto)
WHERE YEAR(DL.fec)=2017 
AND DL.sw IN (13,14)  
AND R.subgrupo2 IN  (7,8,5,6,9)
