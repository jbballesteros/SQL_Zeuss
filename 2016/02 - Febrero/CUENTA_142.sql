SELECT D.tipo,D.numero,M.cuenta,RC.cta_inventario,DL.codigo,R.descripcion
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
LEFT JOIN referencias_con RC ON (R.contable=RC.contable)
WHERE D.sw=3 AND M.cuenta LIKE '1435%'
GROUP BY D.tipo,D.numero,M.cuenta,RC.cta_inventario,DL.codigo,R.descripcion
ORDER BY tipo,numero


SELECT M.tipo,M.numero,P.VALOR,M.valor
FROM (
SELECT D.tipo,D.numero,DL.cantidad*DL.valor_unitario VALOR
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE codigo IN (
SELECT R.codigo
FROM referencias R INNER JOIN referencias_con RC ON (R.contable=RC.contable)
WHERE cta_inventario='14350102') AND D.sw=3 
GROUP BY D.tipo,D.numero,DL.cantidad,DL.valor_unitario) AS P INNER JOIN movimiento M ON (P.tipo=M.tipo AND M.numero=P.numero)
WHERE M.cuenta='14350102'
GROUP BY M.tipo,M.numero,P.VALOR,M.valor
ORDER BY M.tipo,M.numero