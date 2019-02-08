SELECT *
FROM (
SELECT YEAR(D.fecha) AÑO,MONTH(D.fecha) MES,D.tipo,D.numero,SUM(DL.cantidad*DL.valor_unitario) VALR
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN referencias_con RC ON (R.contable=RC.contable)
WHERE cta_inventario='14350102'  AND D.sw=3
GROUP BY D.tipo,D.numero,D.fecha) AS P FULL OUTER JOIN (
SELECT YEAR(D.fecha) AÑO,MONTH(D.fecha) MES,D.tipo,D.numero,SUM(M.valor) VALOR
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo And M.numero=D.numero)
WHERE cuenta='14350102'  AND D.sw=3
GROUP BY YEAR(D.fecha) ,MONTH(D.fecha),D.tipo,D.numero) AS S ON (P.tipo=S.tipo AND P.numero=S.numero)
WHERE P.AÑO IS NULL

