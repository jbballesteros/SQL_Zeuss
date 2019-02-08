SELECT D.tipo,D.numero,D.fecha,D.valor_total,C.cuenta,
C.descripcion,M.valor,DC.tipo_consignacion,DC.numero_consignacion,DD.fecha
FROM documentos D  
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
LEFT JOIN (
SELECT TIPO,NUMERO,tipo_consignacion,numero_consignacion 
FROM documentos_che 
GROUP BY TIPO,NUMERO,tipo_consignacion,numero_consignacion  )DC ON (D.tipo=DC.tipo AND D.numero=DC.numero)
LEFT JOIN DOCUMENTOS DD ON (DC.tipo_consignacion=DD.tipo AND DC.numero_consignacion=DD.numero)
WHERE D.tipo='RC' AND D.fecha BETWEEN '01/09/2016' AND '30/09/2016' AND M.cuenta LIKE '11%'
ORDER BY D.tipo,D.numero,D.fecha