
SELECT 
SSEPARADA.CONCEPTO,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN 43 ELSE
CASE WHEN SSEPARADA.TIPO='C' THEN 13 ELSE
CASE WHEN SSEPARADA.TIPO='N' THEN 31 ELSE
CASE WHEN SSEPARADA.TIPO='T' THEN 12 ELSE 0 END END END END TIPO,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN 222222222 ELSE SSEPARADA.NIT END NIT,
CASE WHEN TIPO='N' THEN CAST(DV AS VARCHAR(4)) ELSE '' END DV,
CASE WHEN SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,1,SSEPARADA.PRIMERESPACIO-1) ELSE '' END PRIMERAPELLIDO,
CASE WHEN (SSEPARADA.SEGUNDOESPACIO=0 OR SSEPARADA.TERCERESPACIO=0) AND SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN '' ELSE
CASE WHEN SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.PRIMERESPACIO+1,(SSEPARADA.SEGUNDOESPACIO-SSEPARADA.PRIMERESPACIO)-1) ELSE '' END END SEGUNDOAPELLIDO,
CASE WHEN (SSEPARADA.TERCERESPACIO=0) AND SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.PRIMERESPACIO+1,(SSEPARADA.SEGUNDOESPACIO-SSEPARADA.PRIMERESPACIO)-1) ELSE 
CASE WHEN (SSEPARADA.SEGUNDOESPACIO=0) AND SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.PRIMERESPACIO+1,LEN(SSEPARADA.TERCERO)) ELSE  
CASE WHEN SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.SEGUNDOESPACIO+1,(SSEPARADA.TERCERESPACIO-SSEPARADA.SEGUNDOESPACIO-1)) ELSE '' END END END PRIMERNOMBRE,
CASE WHEN (SSEPARADA.TERCERESPACIO=0 OR SSEPARADA.SEGUNDOESPACIO=0) AND SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.SEGUNDOESPACIO+1,LEN(SSEPARADA.TERCERO)) ELSE 
CASE WHEN SSEPARADA.TIPO IN ('C','T') AND SSEPARADA.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(SSEPARADA.TERCERO,SSEPARADA.TERCERESPACIO+1,LEN(SSEPARADA.TERCERO)) ELSE '' END END SEGUNDONOMBRE,
CASE WHEN SSEPARADA.TIPO='N' OR SSEPARADA.TERCERO='CUANTIAS MENORES' THEN SSEPARADA.TERCERO ELSE '' END RAZONSOCIAL,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN 'ENTRADA A GIRARDOTA ANTIGUA ESTACION FERROCARRIL' ELSE SSEPARADA.DIRECCION END DIRECCION,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN '05' ELSE SSEPARADA.CODPTO END CODDPTO,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN '308' ELSE SSEPARADA.CODMUN END CODCIUDAD,
CASE WHEN SSEPARADA.TERCERO='CUANTIAS MENORES' THEN '169' ELSE SSEPARADA.CODPAIS END CODPAIS,
SSEPARADA.SALDOFINAL SALDOFINAL,SSEPARADA.IVA PGNDED,ISNULL(IVAMAY.IVA,0) IVAMAY,0 IVAMAY2,ISNULL(RETENCION.RETEFUENTE,0) RETEFUENTE ,0 RETEFUENTEAS,ISNULL(RETENCION.RETEIVA,0)RETEIVA,0 RETEIVASIM,0 RETEIVND,ISNULL(0,0) RETECREE,0 RETECREE2
FROM (
SELECT *,
CHARINDEX(' ',PFINAL.NOMBRES) PRIMERESPACIO,
CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES)+1) SEGUNDOESPACIO,
CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES)+1)+1) TERCERESPACIO,
CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES,CHARINDEX(' ',PFINAL.NOMBRES)+1)+1)+1) CUARTOESPACIO,
PFINAL.NOMBRES TERCERO
FROM (
SELECT *
FROM (
SELECT PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.DIRECCION,PNORMAL.CODPTO,PNORMAL.CODMUN,PNORMAL.CODPAIS,ROUND(SUM(PNORMAL.SALDOFINAL),0,0) SALDOFINAL,ROUND(SUM(PNORMAL.IVA),0,0) IVA
FROM (

SELECT BASE.CONCEPTO, TR.tipo_identificacion TIPO,
TR.nit NIT, 
TR.digito DV,TR.nombres NOMBRES,TR.direccion DIRECCION,TR.y_dpto CODPTO,TR.y_ciudad CODMUN,TR.y_pais CODPAIS,SUM(VALOR) SALDOFINAL,SUM(VALOR2) IVA
FROM (

-----FORMATO 1001 CONCEPTO 5001


select 5001 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta BETWEEN '5105' AND '510539') OR 
(CV.cuenta BETWEEN '510545' AND '51054504') OR 
(CV.cuenta BETWEEN '51059503' AND '51059504') OR 
(CV.cuenta BETWEEN '520506' AND '520539') OR 
(CV.cuenta IN ('510548','520548','52059503','52059504'))) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CONCEPTO 5001
UNION
-----FORMATO 1001 CONCEPTO 5002
select 5002 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta BETWEEN '511010' AND '511035') OR 
(CV.cuenta BETWEEN '52109501' AND '52109501')) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CONCEPTO 5002
UNION
-----FORMATO 1001 CCONCEPTO 5007
SELECT 5007 CONCEPTO,M.nit NIT,SUM(M.valor) VALOR,0 VALOR2
FROM movimiento M INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero) 
WHERE fec BETWEEN '01/01/2014' AND '31/12/2014' AND (D.sw=3 OR D.tipo='SCBI') AND cuenta BETWEEN '14' AND '14999999999999'
GROUP BY M.nit
-----FORMATO 1001 CCONCEPTO 5007
UNION
-----FORMATO 1001 CCONCEPTO 5004
SELECT 5004 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta LIKE '5135%')  OR 
(CV.cuenta LIKE '5145%')  OR 
(CV.cuenta LIKE '5235%')  OR 
(CV.cuenta LIKE '5245%') ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5004
UNION
-----FORMATO 1001 CCONCEPTO 5005
select  5005 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta LIKE '5120%')  OR  
(CV.cuenta LIKE '5220%')   ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5005
UNION
-----FORMATO 1001 CCONCEPTO 5006
select  5006 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta BETWEEN '530520' AND '530520')  ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5006
--UNION
-------FORMATO 1001 CCONCEPTO 5008 ---- NO VA ZEUSS
--SELECT  5008 CONCEPTO,M.nit NIT,SUM(CASE WHEN M.valor>0 THEN M.valor ELSE 0 END)VALOR,0 VALOR2
--FROM movimiento M INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero) 
--WHERE fec BETWEEN '01/01/2014' AND '31/12/2014'  AND cuenta BETWEEN '15' AND '16' AND M.nit<>811043174
--GROUP BY M.nit
-------FORMATO 1001 CCONCEPTO 5008
UNION
-----FORMATO 1001 CCONCEPTO 5010
select 5010 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  INNER JOIN terceros T ON (CV.nit=T.nit)
where (
(CV.cuenta BETWEEN '510572' AND '510572') or (CV.cuenta BETWEEN '520572' AND '520572')   ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5010
UNION
-----FORMATO 1001 CCONCEPTO 5011
select 5011 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito )  VALOR,0 VALOR2
from cuentas_val CV  
where (
 (CV.cuenta BETWEEN '510568' AND '510569') or 
 (CV.cuenta BETWEEN '520568' AND '520569')    ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5011
--UNION
-------FORMATO 1001 CCONCEPTO 5012
--select 5012 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
--from cuentas_val CV  
--where (
--  (CV.cuenta IN ( '510570','520570'))   ) and ano=2014 AND mes=12
--GROUP BY CV.nit
--HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-------FORMATO 1001 CCONCEPTO 5012
--UNION
-------FORMATO 1001 CCONCEPTO 5013
--select 5013 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
--from cuentas_val CV 
--where (
--  (CV.cuenta IN ('539525')) ) and ano=2014 AND mes=12
--GROUP BY CV.nit
--HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-------FORMATO 1001 CCONCEPTO 5013
UNION
-----FORMATO 1001 CCONCEPTO 5015 ----   CUENTA 511570,521570 COLUMNA IVA  desc
select 5015 CONCEPTO,CV.nit NIT,
SUM( CASE WHEN CV.CUENTA NOT IN ('511570','521570') THEN CV.saldo_inicial+CV.debito-CV.credito ELSE 0 END ) VALOR,
SUM( CASE WHEN CV.CUENTA  IN ('511570','521570') THEN CV.saldo_inicial+CV.debito-CV.credito ELSE 0 END )VALOR2
from cuentas_val CV  
where (
  (CV.cuenta BETWEEN '5115' AND '511595') or 
  (CV.cuenta BETWEEN '5215' AND '521596')  ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5015
UNION
-----FORMATO 1001 CCONCEPTO 5016 ----   CUENTA 531570 COLUMNA IVA desc   - SACAR LOS CREDITOS DE LA 53053501
select 5016 CONCEPTO,CV.nit NIT,
SUM( CASE WHEN CV.CUENTA NOT IN ('531570') THEN CASE WHEN CV.cuenta='53053501' THEN saldo_inicial+CV.debito+CV.credito ELSE saldo_inicial+CV.debito-CV.credito END ELSE 0 END ) VALOR,
SUM( CASE WHEN CV.CUENTA  IN ('531570') THEN CV.saldo_inicial+CV.debito-CV.credito ELSE 0 END )VALOR2
from cuentas_val CV  
where (
(CV.cuenta IN ('510551','510563','510584','51059501','51059502','520548','520551','520560','520563','520584','52059501','52059502','522510','530505','530515', '530525','530535','53059501') OR 
(CV.cuenta BETWEEN '510551' AND '510566') OR 
(CV.cuenta LIKE '5125%') OR 
(CV.cuenta LIKE '5130%') OR 
(CV.cuenta LIKE '5140%') OR
(CV.cuenta LIKE '5150%') OR  
(CV.cuenta LIKE '5155%') OR 
(CV.cuenta LIKE '5195%') OR 
(CV.cuenta LIKE '5240%') OR
(CV.cuenta LIKE '5250%') OR
(CV.cuenta LIKE '5255%') OR
(CV.cuenta LIKE '5295%') OR
(CV.cuenta LIKE '5310%') OR
(CV.cuenta LIKE '5315%') OR
(CV.cuenta LIKE '5395%')  ))  and ano=2014 AND mes=12 
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CCONCEPTO 5016
UNION
-----FORMATO 1001 CONCEPTO 5035
select 5035 CONCEPTO,CV.nit NIT,SUM(CV.saldo_inicial+CV.debito-CV.credito ) VALOR,0 VALOR2
from cuentas_val CV  
where (
(CV.cuenta LIKE '5165%' ) or (CV.cuenta LIKE '5265%' ) ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
-----FORMATO 1001 CONCEPTO 5035
) 
AS BASE INNER JOIN terceros T ON (BASE.NIT=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
GROUP BY BASE.CONCEPTO, TR.tipo_identificacion ,TR.nit , 
TR.digito ,TR.nombres ,TR.direccion ,TR.y_dpto ,TR.y_ciudad ,TR.y_pais 	) AS PNORMAL
GROUP BY PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.DIRECCION,PNORMAL.CODPTO,PNORMAL.CODMUN,PNORMAL.CODPAIS) AS PAGRUPADA
WHERE PAGRUPADA.SALDOFINAL<>0) AS PFINAL) AS SSEPARADA 
LEFT JOIN 
(select 'RETENCION' CONCEPTO,CV.nit NIT,
SUM(CASE WHEN CV.cuenta BETWEEN '2365' AND '236550' THEN CASE WHEN CV.valor<0 THEN CV.valor ELSE 0 END  ELSE 0 END)*-1 RETEFUENTE,
SUM(CASE WHEN CV.cuenta BETWEEN '236701' AND '236701' THEN CASE WHEN CV.valor<0 THEN CV.valor ELSE 0 END  ELSE 0 END)*-1 RETEIVA
from movimiento CV  
where (
(CV.cuenta BETWEEN '2365' AND '236550' ) OR (CV.cuenta BETWEEN '236701' AND '236701')) and YEAR(fec)=2014  AND CV.nit NOT IN (811043174,999,9999,800197268) 
GROUP BY CV.nit) AS RETENCION ON (SSEPARADA.NIT=RETENCION.NIT)
LEFT JOIN
(
select 5015 CONCEPTO,CV.nit NIT,
SUM( CASE WHEN CV.CUENTA  IN ('511570','521570') THEN CV.saldo_inicial+CV.debito-CV.credito ELSE 0 END ) IVA
from cuentas_val CV  
where (
CV.CUENTA  IN ('511570','521570')  ) and ano=2014 AND mes=12
GROUP BY CV.nit
HAVING SUM(CV.saldo_inicial+CV.debito-CV.credito )<>0
) AS IVAMAY  ON (SSEPARADA.NIT=IVAMAY.NIT)
ORDER BY SSEPARADA.CONCEPTO