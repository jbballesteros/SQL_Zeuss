UPDATE conciliacion
SET saldo_inicial_mov=P.saldo_final_mov
FROM conciliacion CC INNER JOIN (

SELECT C.cuenta,CC.ano_concilia,CC.mes_concilia,C.saldo_final_mov,CC.saldo_inicial_mov
FROM conciliacion C LEFT JOIN conciliacion CC ON (C.cuenta=CC.cuenta AND CC.ano_concilia=2018 AND CC.mes_concilia=1)
WHERE C.ano_concilia=2017 AND C.mes_concilia=12 AND C.saldo_final_mov<>CC.saldo_inicial_mov) AS P ON 
(CC.cuenta=P.cuenta AND CC.ano_concilia=P.ano_concilia AND CC.mes_concilia=P.mes_concilia )