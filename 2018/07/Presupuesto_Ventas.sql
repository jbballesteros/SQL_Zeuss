SELECT *
FROM (

SELECT ZL.ano,ZL.mes,ZL.nit,T.nombres, SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD
FROM Zeuss_Lin_Ventas ZL INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE ZL.ano=2018 AND ZL.mes=6 AND ZL.subgrupo2 IN (2,3,4) AND ZL.bodega=6
GROUP BY ZL.ano,ZL.mes,ZL.nit,T.nombres ) AS S
LEFT JOIN presupuesto P ON (P.ano=S.ano AND P.mes=S.MES AND P.Nit=S.nit )



SELECT *
FROM presupuesto 
WHERE ano=2018 AND MES=6 AND codigo=900155