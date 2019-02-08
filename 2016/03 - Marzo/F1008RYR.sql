SELECT FORMATO,TIPON,P.NIT,DIGITO,NOMBRES,RAZON_SOCIAL,DIRECCION,CIUDAD,DEPTO,PAIS,ROUND(SUM(P.VALOR),0) VALOR
 FROM (

SELECT 
CASE WHEN M.cuenta BETWEEN '130505' AND '130505' THEN 1315
		WHEN M.cuenta BETWEEN '1310' AND '1326' THEN 1316
			WHEN M.cuenta  BETWEEN '1330' AND '138095'  THEN 1317 ELSE 0 END FORMATO

,
CASE WHEN TR.tipo_identificacion='C' THEN 13 ELSE 31 END TIPON,
TR.nit NIT,
CASE WHEN TR.tipo_identificacion='C' THEN '' ELSE CAST(TR.DIGITO AS VARCHAR(2)) END DIGITO,
UPPER(replace(CASE WHEN TR.tipo_identificacion='C' THEN TR.nombres ELSE '' END,'.','')) NOMBRES,
UPPER(replace(CASE WHEN TR.tipo_identificacion<>'C' THEN TR.nombres ELSE '' END,'.','')) RAZON_SOCIAL,
UPPER(TR.direccion) DIRECCION, TR.y_ciudad CIUDAD,TR.y_dpto DEPTO,TR.y_pais PAIS,
ROUND((M.saldo_inicial+M.debito-M.credito),0) VALOR
FROM cuentas_val M 
INNER JOIN terceros T ON (M.nit=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)

WHERE M.ano=2015 AND M.mes=12 AND 

(

M.cuenta BETWEEN '130505' AND '130505' OR

M.cuenta BETWEEN '1310' AND '1326' OR
M.cuenta BETWEEN '1330' AND '138095' 
)
AND (M.saldo_inicial+M.debito-M.credito)<>0) AS P



GROUP BY FORMATO,TIPON,P.NIT,DIGITO,NOMBRES,RAZON_SOCIAL,DIRECCION,CIUDAD,DEPTO,PAIS
HAVING ROUND(SUM(P.VALOR),0)<>0
