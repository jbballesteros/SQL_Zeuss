SELECT ano,mes,
SUM(saldo_inicial) saldo_inicial,
SUM(saldo_inicial_niif) saldo_inicial_niif,
SUM(saldo_inicial+debito-credito) SALDO_VALOR,
SUM(saldo_inicial_niif+debito_niif-credito_niif) SALDO_VALOR_NIIF
FROM cuentas_val
WHERE cuenta='530535'
GROUP BY ano,mes
order by ano,mes