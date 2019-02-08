SELECT RS.ano AÑO,RS.mes MES,R.codigo CODIGO,R.descripcion PRODUCTO,RS.can_ini CANTIDAD
FROM referencias_sto RS 
INNER JOIN referencias R ON (RS.codigo=R.codigo)
WHERE RS.ano=2017 AND mes=2 AND R.generico=202
ORDER BY CANTIDAD DESC