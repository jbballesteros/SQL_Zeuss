


UPDATE control_numeracion
SET finalmecanica=168728, final=388.03
from control_numeracion CN INNER JOIN  control_numeracion_parametrizacion CP ON (CN.id_parametro=CP.id)
WHERE CP.bodega=9 AND CP.manguera IN (5) AND CN.fecha='10/02/2018'  




