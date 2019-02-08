SELECT *
FROM (

SELECT tipo,numero, CASE WHEN SUM(valor)<0 THEN SUM(valor)*-1 ELSE SUM(valor) END VALOR
FROM movimiento M INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
WHERE fec BETWEEN '01/05/2017' AND '31/05/2017' AND M.cuenta LIKE '61%'
GROUP BY tipo,numero) AS P LEFT JOIN (


SELECT tipo,numero,SUM(cantidad*costo_unitario) COSTO
FROM documentos_lin
WHERE fec BETWEEN '01/05/2017' AND '31/05/2017' AND maneja_inventario='S'
GROUP BY tipo,numero) AS T ON (P.tipo=T.tipo AND P.numero=T.numero)