SELECT YEAR(YM.fecha) A�O,MONTH(YM.fecha) MES,DAY(YM.fecha) DIA,YM.BODEGA,
ISNULL(P.IACPM,0) IACPM,
ISNULL(P.CACPM,0) CACPM,
ISNULL(P.VACPM,0) VACPM,
ISNULL(P.ICORRIENTE,0) ICORRIENTE,
ISNULL(P.CCORRIENTE,0) CCORRIENTE,
ISNULL(P.VCORRIENTE,0) VCORRIENTE,
ISNULL(P.IEXTRA,0) IEXTRA,
ISNULL(P.CEXTRA,0) CEXTRA,
ISNULL(P.VEXTRA,0) VEXTRA,
ISNULL(P.IB100,0) IB100,
ISNULL(P.CB100,0) CB100,
ISNULL(P.VB100,0) VB100,
ISNULL(P.IALCOHOL,0) IALCOHOL,
ISNULL(P.CALCOHOL,0) CALCOHOL,
ISNULL(P.VALCOHOL,0) VALCOHOL

FROM y_calendario_bodegas YM LEFT JOIN (



SELECT DL.fec,DL.bodega ,
MAX(CASE WHEN R.subgrupo2 IN (8) THEN RS.can_ini ELSE 0 END) IACPM,
SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD*-1 ELSE 0 END) CACPM,
SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD*-1 ELSE 0 END) VACPM,
MAX(CASE WHEN R.subgrupo2 IN (5) THEN RS.can_ini ELSE 0 END) ICORRIENTE,
SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD*-1 ELSE 0 END) CCORRIENTE,
SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD*-1 ELSE 0 END) VCORRIENTE,
MAX(CASE WHEN R.subgrupo2 IN (7) THEN RS.can_ini ELSE 0 END) IEXTRA,
SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD*-1 ELSE 0 END) CEXTRA,
SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD*-1 ELSE 0 END) VEXTRA,
MAX(CASE WHEN R.subgrupo2 IN (9) THEN RS.can_ini ELSE 0 END) IB100,
SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD*-1 ELSE 0 END) CB100,
SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD*-1 ELSE 0 END) VB100,
MAX(CASE WHEN R.subgrupo2 IN (6) THEN RS.can_ini ELSE 0 END) IALCOHOL,
SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD*-1 ELSE 0 END) CALCOHOL,
SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD*-1 ELSE 0 END) VALCOHOL
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo AND R.subgrupo2 IN (5,6,7,8,9))
INNER JOIN bodegas B ON B.bodega=DL.bodega
INNER JOIN referencias_sto	RS ON (R.codigo=RS.codigo AND RS.ano=YEAR(DL.fec) AND RS.mes=MONTH(DL.fec) AND RS.bodega=DL.bodega)
WHERE DL.sw IN (1,2,3,4) AND DL.fec>='01/04/2016'
GROUP BY DL.fec,DL.bodega) AS P ON (YM.fecha=P.fec AND YM.BODEGA=P.BODEGA)
WHERE YM.fecha BETWEEN '01/04/2016' AND '30/04/2016'
ORDER BY YM.fecha,YM.BODEGA ASC