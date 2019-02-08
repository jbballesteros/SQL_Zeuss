SELECT 
CASE WHEN TR.tipo_identificacion='C' THEN 13 ELSE 31 END TIPON,
TR.nit NIT,
CASE WHEN TR.tipo_identificacion='C' THEN '' ELSE CAST(TR.DIGITO AS VARCHAR(2)) END DIGITO,
CASE WHEN TR.tipo_identificacion='C' THEN TR.nombres ELSE '' END NOMBRES,
CASE WHEN TR.tipo_identificacion<>'C' THEN TR.nombres ELSE '' END RAZON_SOCIAL,
SUM(M.valor)*-1 VALOR
FROM movimiento M 
INNER JOIN documentos D ON (M.TIPO=D.tipo AND M.numero=D.numero)
INNER JOIN terceros T ON (D.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
WHERE M.fec BETWEEN '01/01/2015' AND '31/12/2015' AND M.tipo<>'Z1' AND M.cuenta IN ('24080501','24080502')
GROUP BY TR.tipo_identificacion,TR.nit,TR.nombres,TR.digito
