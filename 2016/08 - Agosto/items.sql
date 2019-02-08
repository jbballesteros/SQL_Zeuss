SELECT *
FROM (

SELECT UC.BODEGA,UC.CODIGO,UC.DESCRIPCION,'COMPRA' CONCEPTO,UC.VALOR_UNITARIO
FROM u_uc_inventario UC 

UNION


SELECT RG.descripcion,R.codigo,R.descripcion,RC.Descripcion,RS.valor
FROM REFERENCIAS R INNER JOIN 
 referencias_gen RG ON (R.generico=RG.generico) INNER JOIN 
referencias_SubeBajaCosto RS  ON (R.id=RS.id_referencia)
INNER JOIN referencias_Clase_SubeBajaCosto RC ON (RS.id_clase=RC.id)
WHERE RS.id_clase IN (2,10,11)) AS P
ORDER BY P.BODEGA,P.CODIGO,P.CONCEPTO
