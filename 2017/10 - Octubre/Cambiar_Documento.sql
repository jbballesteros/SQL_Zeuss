SELECT *
FROM movimiento M INNER JOIN tipo_transacciones T ON (M.TIPO=T.TIPO)
WHERE T.SW=22 AND M.FEC>='01/09/2017' AND M.DOCUMENTO IS NOT NULL



update movimiento
set documento=1
FROM movimiento M INNER JOIN tipo_transacciones T ON (M.TIPO=T.TIPO)
WHERE T.SW=22 AND M.FEC>='01/09/2017' AND M.DOCUMENTO IS NOT NULL



update movimiento
set documento=1
FROM movimiento M INNER JOIN tipo_transacciones T ON (M.TIPO=T.TIPO)
WHERE T.SW=22 AND M.FEC>='01/09/2017' AND M.cuenta like '11%'
