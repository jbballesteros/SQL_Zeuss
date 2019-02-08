SELECT *
FROM (

SELECT T.nit NIT,T.nombres CLIENTE,
SUM(ZL.can_ventas-ZL.can_devolu) GALONES

FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE ZL.ano IN (2016) AND ZL.subgrupo2 IN (2,3,4)  AND ZL.mes BETWEEN 7 AND 11 AND ZL.nit IN (900218,900194,900170,900261,900053,900331,900442)
GROUP BY T.nit,T.nombres) AS P

left JOIN  (

SELECT T.nit NIT,T.nombres CLIENTE,

SUM(ZL.galones) GALONES

FROM presupuesto ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE ZL.ano IN (2016) AND ZL.mes BETWEEN 7 AND 11
GROUP BY T.nit,T.nombres) AS S ON (P.NIT=S.NIT)


