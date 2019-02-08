SELECT YEAR(D.fecha) A�O,MONTH(D.fecha) MES , T.nit,T.nombres,
ROUND(SUM(CASE WHEN DL.codigo=111 THEN (CASE WHEN D.SW=1 THEN DL.cantidad ELSE DL.CANTIDAD*-1 END) ELSE 0 END),0) CORRIENTE, 
ROUND(SUM(CASE WHEN DL.codigo=112 THEN (CASE WHEN D.SW=1 THEN DL.cantidad ELSE DL.CANTIDAD*-1 END) ELSE 0 END),0) DIESEL, 
ROUND(SUM(CASE WHEN DL.codigo=113 THEN (CASE WHEN D.SW=1 THEN DL.cantidad ELSE DL.CANTIDAD*-1 END) ELSE 0 END),0) EXTRA,
ROUND(SUM(CASE WHEN DL.codigo=114 THEN (CASE WHEN D.SW=1 THEN DL.cantidad ELSE DL.CANTIDAD*-1 END) ELSE 0 END),0) GAS
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN terceros T ON (D.nit=T.nit)
WHERE DL.codigo IN ('111','112','113','114')
GROUP BY YEAR(D.fecha),MONTH(D.fecha),T.nit,T.nombres

SELECT *
FROM referencias
WHERE contable=19