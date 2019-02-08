SELECT *
FROM control_numeracion CN INNER JOIN 
control_numeracion_parametrizacion CP ON (CN.id_parametro=CP.id)
WHERE CP.bodega=9 AND CN.fecha='07/03/2018' AND CP.manguera =5



UPDATE control_numeracion
SET final=7.210
FROM control_numeracion CN INNER JOIN 
control_numeracion_parametrizacion CP ON (CN.id_parametro=CP.id)
WHERE CP.bodega=9 AND CN.fecha='07/03/2018' AND CP.manguera =6