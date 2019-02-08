SELECT *
FROM (

SELECT cuenta, SUM(saldo_inicial+debito-credito) SALDO
FROM cuentas_val
WHERE ano=2014 AND mes=13 
GROUP BY cuenta) AS P  FULL JOIN (

SELECT cuenta, SUM(saldo_inicial) SALDO
FROM cuentas_val
WHERE ano=2015 AND mes=1 
GROUP BY cuenta) AS T ON (P.cuenta=T.cuenta)


WHERE ISNULL(P.SALDO,0)<>ISNULL(T.SALDO,0)