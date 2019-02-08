DECLARE @CUENTA AS VARCHAR(100)='14350101'
DECLARE @SEQ AS INTEGER

SELECT @SEQ=MAX(SEQ)
FROM movimiento
WHERE TIPO='AJ' AND numero=1811


INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,valor_niif)

SELECT 'AJ',1811,ROW_NUMBER() OVER (ORDER BY CUENTA,CENTRO)+@SEQ,cuenta,centro,900625898,'28/02/2018',SALDO,SALDO
FROM (

SELECT cuenta,centro,SUM(CV.saldo_inicial+CV.debito-CV.credito)*-1 SALDO
FROM cuentas_val CV
WHERE cuenta=@CUENTA AND centro BETWEEN 1 AND 99 AND centro<>1
AND ANO=2018 AND MES=2
GROUP BY CUENTA,centro
UNION
SELECT cuenta,1000,SUM(CV.saldo_inicial+CV.debito-CV.credito) SALDO
FROM cuentas_val CV
WHERE cuenta='14350101' AND centro BETWEEN 1 AND 99 AND centro<>1
AND ANO=2018 AND MES=2
GROUP BY CUENTA,centro) AS P




SELECT 'AJ',1811,ROW_NUMBER() OVER (ORDER BY CUENTA,CENTRO)+@SEQ,cuenta,centro,900625898,'28/02/2018',SALDO,SALDO
FROM (

SELECT cuenta,centro,SUM(CV.saldo_inicial+CV.debito-CV.credito)*-1 SALDO
FROM cuentas_val CV
WHERE cuenta=@CUENTA AND centro BETWEEN 1 AND 99 AND centro<>1
AND ANO=2018 AND MES=2
GROUP BY CUENTA,centro
UNION
SELECT cuenta,1000,SUM(CV.saldo_inicial+CV.debito-CV.credito) SALDO
FROM cuentas_val CV
WHERE cuenta='14350101' AND centro BETWEEN 1 AND 99 AND centro<>1
AND ANO=2018 AND MES=2
GROUP BY CUENTA,centro) AS P