SELECT YEAR(fec) A�O,MONTH(fec) FECHA,tipo TIPO,numero NUMERO,cuenta CUENTA	,centro CENTRO,FEC FECHA,
CASE WHEN valor<0 THEN valor*-1 ELSE 0 END VALOR_CR,
CASE WHEN valor>=0 THEN valor ELSE 0 END VALOR_DB
FROM movimiento
WHERE fec BETWEEN '01/01/2015' AND '30/04/2015' AND cuenta='11051003' 
ORDER BY VALOR_DB DESC,VALOR_CR ASC