SELECT tipo,numero,SUM(ventas_sin_iva) ventas_sin
FROM v_estinsa_lin_ventas_reclasificacion
where ano=2016 and mes=3 and GRUPO_CONTABLE='MANTENIMIENTO REPARACION Y LAVADO' and SUBGRUPO_CONTABLE='SERVICIO LAVADO' and bodega=1
GROUP BY tipo,numero



SELECT centro,SUM(valor)
FROM movimiento
WHERE cuenta='41350402' AND YEAR(fec)=2016  AND MONTH(FEC)=3
GROUP BY centro


SELECT *
FROM movimiento
WHERE cuenta='41350402' AND YEAR(fec)=2016  AND MONTH(FEC)=3 AND centro=5


SELECT *,ISNULL(P.ventas_sin,0), ISNULL(T.VALOR,0)*-1
FROM (

SELECT tipo,numero,SUM(ventas_sin_iva) ventas_sin
FROM v_estinsa_lin_ventas_reclasificacion
where ano=2016 and mes=3 and GRUPO_CONTABLE='MANTENIMIENTO REPARACION Y LAVADO' and SUBGRUPO_CONTABLE='SERVICIO LAVADO' and bodega=1
GROUP BY tipo,numero) AS P FULL JOIN 

(
SELECT tipo,numero,SUM(VALOR) VALOR
FROM movimiento
WHERE cuenta='41350402' AND YEAR(fec)=2016  AND MONTH(FEC)=3 AND centro=5
group by tipo,numero
) AS T ON (P.tipo=T.TIPO AND P.NUMERO=T.NUMERO)

