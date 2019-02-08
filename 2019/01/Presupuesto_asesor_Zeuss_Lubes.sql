SELECT t.nit,t.nombres,SUM(ventas) ventas,SUM(presupuesto) presupuesto
FROM (

SELECT ISNULL(P.nit,T.nit) nit,ISNULL(P.ventas,0) ventas,ISNULL(T.presupuesto,0) presupuesto
FROM (
SELECT R.vendedorter nit,ROUND(SUM(R.can_ventas-R.can_devolu),0) ventas
FROM Zeuss_Lin_Ventas R  
WHERE ano=2018 AND mes=11  AND R.clase=1
GROUP BY R.vendedorter
) AS P FULL JOIN

(SELECT nit,SUM(galones) presupuesto
FROM presupuesto
WHERE ano=2018 and mes=11 and codigo=1
GROUP BY nit) AS T ON (P.nit=T.nit)) AS A INNER JOIN terceros T ON (A.nit=T.nit)

GROUP BY t.nit,t.nombres
