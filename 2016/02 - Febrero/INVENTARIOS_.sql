SELECT P.*,ISNULL(CASE WHEN M.valor<0 THEN M.valor*-1 ELSE M.valor END,0) VALOR
FROM (
SELECT DL.tipo,DL.numero,RC.cta_inventario,C.descripcion CUENTA_INV,RC.cta_costo,C2.descripcion CUENTA_CTO,SUM(DL.costo_unitario*DL.cantidad) ZINV
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
INNER JOIN documentos D ON (DL.tipo=D.tipo AND D.numero=DL.numero)
LEFT JOIN referencias_con RC ON (R.contable=RC.contable)
LEFT JOIN cuentas C ON (RC.cta_inventario=C.cuenta)
LEFT JOIN cuentas C2 ON (RC.cta_costo=C2.cuenta)
WHERE DL.fec BETWEEN '01/04/2015' AND '30/04/2015' AND DL.maneja_inventario='S' AND D.sw NOT IN (3,4)
GROUP BY DL.tipo,DL.numero,RC.cta_inventario,C.descripcion,RC.cta_costo,C2.descripcion) AS P
LEFT  JOIN movimiento M ON (M.tipo=P.tipo AND M.numero=P.numero AND M.cuenta=P.cta_inventario)
ORDER  BY P.TIPO,P.NUMERO
