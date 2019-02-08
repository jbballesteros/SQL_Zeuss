SELECT TM.TIPO TIPO_DOCUMENTO,TM.NIT IDENTIFICACION,TM.DIGITO DIGITO,TM.PAPELLIDO PRIMER_APELLIDO,TM.SAPELLIDO SEGUNDO_APELLIDO,	TM.PNOMBRE PRIMER_NOMBRE,TM.SNOMBRE SEGUNDO_NOMBRE,TM.RAZON_SOCIAL RAZON_SOCIAL,round(SUM(M.valor),0) IMPUESTO_DESCONTABLE,0 IVA_RESULTANTE
FROM movimiento M 
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN terceros T ON (T.nit=(CASE WHEN M.nit=0 THEN D.nit ELSE M.nit END))
LEFT JOIN terceros_MEDIOS TM ON (T.nit_real=TM.NIT)
WHERE YEAR(M.fec)=2016 AND M.tipo<>'Z1' AND M.cuenta IN ('24081001') AND M.nit<>13
GROUP BY TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,	TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL
ORDER BY TM.NIT