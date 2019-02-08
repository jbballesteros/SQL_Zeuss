SELECT T.tipo TIPO,T.descripcion DESCRIPCION,TC.concepto CONCEPTO_COD,TC.descripcion CONCEPTO
FROM tipo_transacciones T 
INNER JOIN tipo_transacciones_concep TC ON (T.tipo=TC.tipo )
WHERE T.SW=3


