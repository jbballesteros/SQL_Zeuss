SELECT *,valor_rs-valor_cv
FROM v_inventarios_control
WHERE ano=2018 AND mes=3 and bodega=1
ORDER BY bodega 