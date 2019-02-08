SELECT P.*,S.SALDO
FROM (
SELECT M.tipo TIPO,M.numero NUMERO,M.seq SEQ,M.cuenta CUENTA,M.nit NIT,T.nombres CLIENTE,M.fec FECHA,M.valor VALOR,M.valor VALOR_CRUCE,M.explicacion EXPLICACION
FROM movimiento M INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN terceros T ON (M.NIT=T.NIT)
WHERE  M.cuenta='130510' AND D.sw<>1
UNION
select D.tipo TIPO,D.numero NUMERO,DL.seq SEQ,M.cuenta CUENTA,D.nit NIT,T.NOMBRES CLIENTE,D.fecha FECHA,DL.cantidad*DL.valor_unitario VALOR,DL.cantidad*DL.valor_unitario*-1 VALOR_CRUCE,D.notas EXPLICACION
from movimiento M 
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN terceros T ON (D.NIT=T.NIT)
where M.cuenta='130510' ) AS P
LEFT JOIN (SELECT nit,SUM(saldo_inicial+debito-credito) SALDO
FROM cuentas_val
WHERE cuenta='130510' AND ano=2015 AND mes=3
GROUP BY nit) AS S ON (P.NIT=S.nit)
ORDER BY NIT, TIPO,NUMERO

