
INSERT INTO  movimiento(tipo, numero, seq, cuenta, centro, nit, fec, valor)

SELECT tipo,numero,SEQ,cta_ventas,centro,P.nit,fecha,VALOR*-1
FROM (

SELECT ROW_NUMBER() OVER (ORDER BY DL.NIT) +1 SEQ,DL.nit,DL.codigo,RC.cta_ventas,RB.centro,ROUND(SUM((DL.valor_unitario-R.valor_unitario)*DL.cantidad),0) VALOR
FROM documentos_lin DL 

INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN referencias_con RC ON (R.contable=RC.contable)
LEFT JOIN referencia_x_bodega RB ON (R.codigo=RB.codigo AND RB.bodega=DL.bodega)
WHERE DL.fec='05/04/2016' AND R.valor_unitario<>DL.valor_unitario AND DL.valor_unitario<>0 AND R.valor_unitario<>0 AND sw=1 and DL.nit<>909952
GROUP BY DL.nit,DL.codigo,RC.cta_ventas,RB.centro
) AS P INNER JOIN (


SELECT tipo,numero,nit,fecha,valor_total
FROM documentos
WHERE tipo='NC' AND numero BETWEEN 15310 AND 15317) AS T ON (P.nit=T.nit)