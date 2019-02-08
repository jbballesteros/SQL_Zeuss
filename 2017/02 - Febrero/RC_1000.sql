SELECT T.nit NIT,T.nombres CLIENTE,M.tipo TIPO,M.numero NUMERO,M.explicacion EXPLICACION,M.centro CENTRO,M.valor VALOR
FROM movimiento M INNER JOIN terceros T ON (M.nit=T.nit)
WHERE cuenta='130512' AND fec>='01/01/2017' AND tipo LIKE 'RC%' AND centro=1000