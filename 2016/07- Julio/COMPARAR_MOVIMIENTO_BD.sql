

SELECT *,S.VALOR-P.VALOR
FROM (


SELECT cuenta,tipo,numero,SUM(valor) VALOR
FROM movimiento
WHERE fec BETWEEN '01/05/2016' AND '31/05/2016'
GROUP BY cuenta,tipo,numero) AS P


FULL JOIN
(


SELECT cuenta,tipo,numero,SUM(valor) VALOR
FROM ZP0630.DBO.movimiento
WHERE fec BETWEEN '01/05/2016' AND '31/05/2016'
GROUP BY cuenta,tipo,numero) AS S ON (P.cuenta=S.cuenta AND S.tipo=P.tipo AND S.numero=P.numero)
WHERE P.VALOR<>S.VALOR
