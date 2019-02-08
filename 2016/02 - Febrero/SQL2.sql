SELECT TR.nit,TR.nombres,SUM(CV.saldo_inicial) SALDO_INICIAL,SUM(CV.debito) DEBITO,SUM(CV.credito) CREDITO,SUM(CV.saldo_inicial+CV.debito-CV.credito) SALDO_FINAL
FROM cuentas_val CV 
INNER JOIN terceros T ON (CV.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
WHERE CV.ano=2015 AND CV.mes=5 AND CV.cuenta='280505'
GROUP BY TR.nit,TR.nombres 