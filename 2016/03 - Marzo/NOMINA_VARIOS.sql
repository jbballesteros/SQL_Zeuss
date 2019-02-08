SELECT *
FROM y_periodos_control
where ano=2016 AND mes=3 AND periodo=11


SELECT *
FROM documentos
WHERE notas LIKE '%período : 11%' 


SELECT *
FROM movimiento
WHERE nit=1128267901
ORDER BY fec DESC


SELECT *
FROM y_liquidacion
where ano=2016 AND mes=3 AND periodo=11


update y_periodos_control
set contabilizado=NULL
where ano=2016 AND mes=3 AND periodo=11