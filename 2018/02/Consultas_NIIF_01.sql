SELECT *
FROM movimiento
WHERE cuenta='41750210' AND ISNULL(valor,0)=ISNULL(valor_niif,0)

UPDATE movimiento 
SET valor_niif=valor
WHERE cuenta='510539' AND ISNULL(valor,0)<>ISNULL(valor_niif,0)


SELECT *
FROM  cuentas_val
WHERE ano=2003 AND mes=1 AND cuenta='530520'

update cuentas_val
set saldo_inicial_niif=saldo_inicial, debito_niif=debito,credito_niif=credito
where cuenta='530520'