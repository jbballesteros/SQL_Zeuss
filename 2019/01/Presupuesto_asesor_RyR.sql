SELECT TV.nit,TV.nombres,SUM(ventas) ventas,SUM(presupuesto) presupuesto
FROM (

SELECT ISNULL(P.nit,T.nit) nit,ISNULL(P.ventas,0) ventas,ISNULL(T.presupuesto,0) presupuesto
FROM (
SELECT R.nit,ROUND(SUM(R.can_ventas-R.can_devolu),0) ventas
FROM ryr_documentos_lin_ventas R  
WHERE ano=2018 AND mes=11  AND R.clase=1
GROUP BY R.nit
) AS P FULL JOIN

(SELECT nit,SUM(galones) presupuesto
FROM ryr_presup_cliente_vendedor
WHERE ano=2018 and mes=11
GROUP BY nit) AS T ON (P.nit=T.nit)) AS A INNER JOIN terceros T ON (A.nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
GROUP BY TV.nit,TV.nombres
