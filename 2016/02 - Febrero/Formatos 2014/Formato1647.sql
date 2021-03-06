DECLARE @A�O AS INTEGER
SET @A�O=2014
SELECT FINAL.CONCEPTO,FINAL.TIPO,FINAL.NIT,FINAL.DV,FINAL.PRIMERAPELLIDO,FINAL.SEGUNDOAPELLIDO,FINAL.PRIMERNOMBRE,FINAL.SEGUNDONOMBRE,FINAL.RAZONSOCIAL,FINAL.CODPAIS,
ROUND(SUM(FINAL.SALDOFINAL),0,0) SALDOFINAL,
FINAL.TIPOBEN,FINAL.NITBEN,FINAL.PRIMERAPELLIDOBEN,FINAL.SEGUNDOAPELLIDOBEN,FINAL.PRIMERNOMBREBEN,FINAL.SEGUNDONOMBREBEN,FINAL.RAZONSOCIALBEN,FINAL.DIRECCIONBEN,FINAL.CODPTOBEN,FINAL.CODMUNBEN,FINAL.CODPAISBEN
FROM (
SELECT 
TOTALAGRUPADA.CONCEPTO,
CASE WHEN TOTALAGRUPADA.TERCERO='CUANTIAS MENORES' THEN 43 ELSE
CASE WHEN TOTALAGRUPADA.TIPO='C' THEN 13 ELSE
CASE WHEN TOTALAGRUPADA.TIPO='N' THEN 31 ELSE
CASE WHEN TOTALAGRUPADA.TIPO='T' THEN 12 ELSE 0 END END END END TIPO,
TOTALAGRUPADA.NIT NIT,
' ' DV,
CASE WHEN TOTALAGRUPADA.TIPO IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,1,TOTALAGRUPADA.PRIMERESPACIO-1) ELSE '' END PRIMERAPELLIDO,
CASE WHEN (TOTALAGRUPADA.SEGUNDOESPACIO=0 OR TOTALAGRUPADA.TERCERESPACIO=0) AND TOTALAGRUPADA.TIPO IN ('C','T') THEN '' ELSE
CASE WHEN TOTALAGRUPADA.TIPO IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.PRIMERESPACIO+1,(TOTALAGRUPADA.SEGUNDOESPACIO-TOTALAGRUPADA.PRIMERESPACIO)-1) ELSE '' END END SEGUNDOAPELLIDO,
CASE WHEN (TOTALAGRUPADA.TERCERESPACIO=0) AND TOTALAGRUPADA.TIPO IN ('C','T') THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.PRIMERESPACIO+1,(TOTALAGRUPADA.SEGUNDOESPACIO-TOTALAGRUPADA.PRIMERESPACIO)-1) ELSE 
CASE WHEN (TOTALAGRUPADA.SEGUNDOESPACIO=0) AND TOTALAGRUPADA.TIPO IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.PRIMERESPACIO+1,LEN(TOTALAGRUPADA.TERCERO)) ELSE  
CASE WHEN TOTALAGRUPADA.TIPO IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.SEGUNDOESPACIO+1,(TOTALAGRUPADA.TERCERESPACIO-TOTALAGRUPADA.SEGUNDOESPACIO-1)) ELSE '' END END END PRIMERNOMBRE,
CASE WHEN (TOTALAGRUPADA.TERCERESPACIO=0 OR TOTALAGRUPADA.SEGUNDOESPACIO=0) AND TOTALAGRUPADA.TIPO IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.SEGUNDOESPACIO+1,LEN(TOTALAGRUPADA.TERCERO)) ELSE 
CASE WHEN TOTALAGRUPADA.TIPO IN ('C','T') THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.TERCERESPACIO+1,LEN(TOTALAGRUPADA.TERCERO)) ELSE '' END END SEGUNDONOMBRE,
CASE WHEN TOTALAGRUPADA.TIPO='N'  THEN TOTALAGRUPADA.TERCERO ELSE '' END RAZONSOCIAL,
TOTALAGRUPADA.CODPAIS  CODPAIS,
TOTALAGRUPADA.SALDOFINAL SALDOFINAL,
CASE WHEN TOTALAGRUPADA.TERCEROBEN='CUANTIAS MENORES' THEN 43 ELSE
CASE WHEN TOTALAGRUPADA.TIPOBEN='C' THEN 13 ELSE
CASE WHEN TOTALAGRUPADA.TIPOBEN='N' THEN 31 ELSE
CASE WHEN TOTALAGRUPADA.TIPOBEN='T' THEN 12 ELSE 0 END END END END TIPOBEN ,
TOTALAGRUPADA.NITBEN NITBEN ,
CASE WHEN TOTALAGRUPADA.TIPOBEN IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,1,TOTALAGRUPADA.PRIMERESPACIOBEN-1) ELSE '' END PRIMERAPELLIDOBEN,
CASE WHEN (TOTALAGRUPADA.SEGUNDOESPACIOBEN=0 OR TOTALAGRUPADA.TERCERESPACIOBEN=0) AND TOTALAGRUPADA.TIPOBEN IN ('C','T') THEN '' ELSE
CASE WHEN TOTALAGRUPADA.TIPOBEN IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,TOTALAGRUPADA.PRIMERESPACIOBEN+1,(TOTALAGRUPADA.SEGUNDOESPACIOBEN-TOTALAGRUPADA.PRIMERESPACIOBEN)-1) ELSE '' END END SEGUNDOAPELLIDOBEN,
CASE WHEN (TOTALAGRUPADA.TERCERESPACIOBEN=0) AND TOTALAGRUPADA.TIPOBEN IN ('C','T') THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,TOTALAGRUPADA.PRIMERESPACIOBEN+1,(TOTALAGRUPADA.SEGUNDOESPACIOBEN-TOTALAGRUPADA.PRIMERESPACIOBEN)-1) ELSE 
CASE WHEN (TOTALAGRUPADA.SEGUNDOESPACIOBEN=0) AND TOTALAGRUPADA.TIPOBEN IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCERO,TOTALAGRUPADA.PRIMERESPACIO+1,LEN(TOTALAGRUPADA.TERCEROBEN)) ELSE  
CASE WHEN TOTALAGRUPADA.TIPOBEN IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,TOTALAGRUPADA.SEGUNDOESPACIO+1,(TOTALAGRUPADA.TERCERESPACIO-TOTALAGRUPADA.SEGUNDOESPACIOBEN-1)) ELSE '' END END END PRIMERNOMBREBEN,
CASE WHEN (TOTALAGRUPADA.TERCERESPACIOBEN=0 OR TOTALAGRUPADA.SEGUNDOESPACIOBEN=0) AND TOTALAGRUPADA.TIPOBEN IN ('C','T')  THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,TOTALAGRUPADA.SEGUNDOESPACIOBEN+1,LEN(TOTALAGRUPADA.TERCEROBEN)) ELSE 
CASE WHEN TOTALAGRUPADA.TIPOBEN IN ('C','T') THEN SUBSTRING(TOTALAGRUPADA.TERCEROBEN,TOTALAGRUPADA.TERCERESPACIOBEN+1,LEN(TOTALAGRUPADA.TERCEROBEN)) ELSE '' END END SEGUNDONOMBREBEN,
CASE WHEN TOTALAGRUPADA.TIPOBEN='N'  THEN TOTALAGRUPADA.TERCEROBEN ELSE '' END RAZONSOCIALBEN,
TOTALAGRUPADA.DIRECCIONBEN  DIRECCIONBEN,
TOTALAGRUPADA.CODDPTBEN  CODPTOBEN,
TOTALAGRUPADA.CODCIUDADBEN  CODMUNBEN,
TOTALAGRUPADA.CODPAISBEN  CODPAISBEN
FROM (
SELECT *,
CHARINDEX(' ',TOTALSEPERADA.NOMBRES) PRIMERESPACIO,
CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES)+1) SEGUNDOESPACIO,
CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES)+1)+1) TERCERESPACIO,
CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES,CHARINDEX(' ',TOTALSEPERADA.NOMBRES)+1)+1)+1) CUARTOESPACIO,
TOTALSEPERADA.NOMBRES TERCERO,
CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN) PRIMERESPACIOBEN,
CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN)+1) SEGUNDOESPACIOBEN,
CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN)+1)+1) TERCERESPACIOBEN,
CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN,CHARINDEX(' ',TOTALSEPERADA.NOMBRESBEN)+1)+1)+1) CUARTOESPACIOBEN,
TOTALSEPERADA.NOMBRESBEN TERCEROBEN
FROM (
SELECT *
FROM (
SELECT *
FROM (
SELECT PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,ROUND(SUM(PNORMAL.SALDOFINAL),0,0) SALDOFINAL,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN
FROM (
SELECT 
CASE WHEN CV.cuenta IN ('24440501','24440503') THEN 4070 ELSE  0  END CONCEPTO,
TR.tipo_identificacion TIPO,
TR.nit_real NIT, 
' ' DV,TR.nombres NOMBRES,TR.y_pais CODPAIS,SM.CODDANE,
CV.credito SALDOFINAL,TM.tipo_identificacion TIPOBEN, TM.nit NITBEN,TM.nombres NOMBRESBEN,TM.direccion DIRECCIONBEN,TM.y_dpto CODDPTBEN,TM.y_ciudad CODCIUDADBEN,
TM.y_pais CODPAISBEN
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (TR.y_ciudad=YC.ciudad AND TR.y_dpto=YC.departamento)
INNER JOIN SobretasaMunicipios SM ON (TR.y_dpto +TR.y_ciudad=SM.CODDANE)
LEFT JOIN Terceros TM ON (SM.NIT=TM.NIT)
WHERE CV.ano=@A�O AND CV.mes<>13 AND T.nit NOT IN (890384912,890894043,890981138,8909820682) AND
CV.cuenta IN ('24440501','24440503')) AS PNORMAL
GROUP BY PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN) AS PAGRUPADA
WHERE PAGRUPADA.SALDOFINAL<>0
UNION 
SELECT *
FROM (
SELECT PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,ROUND(SUM(PNORMAL.SALDOFINAL),0,0) SALDOFINAL,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN
FROM (
SELECT 
CASE WHEN CV.cuenta IN ('24440502') THEN 4070 ELSE  0  END CONCEPTO,
TR.tipo_identificacion TIPO,
TR.nit_real NIT, 
' ' DV,TR.nombres NOMBRES,TR.y_pais CODPAIS,
CV.credito SALDOFINAL,TM.tipo_identificacion TIPOBEN, TM.nit NITBEN,TM.nombres NOMBRESBEN,TM.direccion DIRECCIONBEN,TM.y_dpto CODDPTBEN,TM.y_ciudad CODCIUDADBEN,
TM.y_pais CODPAISBEN
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (TR.y_ciudad=YC.ciudad AND TR.y_dpto=YC.departamento)
LEFT JOIN Terceros TM ON (TM.NIT=899999090)
WHERE CV.ano=@A�O AND CV.mes<>13 AND 
CV.cuenta IN ('24440502')) AS PNORMAL
GROUP BY PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN) AS SAGRUPADA
WHERE SAGRUPADA.SALDOFINAL<>0
UNION
SELECT *
FROM (
SELECT PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,ROUND(SUM(PNORMAL.SALDOFINAL),0,0) SALDOFINAL,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN
FROM (
SELECT 
CASE WHEN CV.cuenta IN ('28150501') THEN 4070 ELSE  0  END CONCEPTO,
TR.tipo_identificacion TIPO,
TR.nit_real NIT, 
' ' DV,TR.nombres NOMBRES,TR.y_pais CODPAIS,
CV.credito SALDOFINAL,TM.tipo_identificacion TIPOBEN, TM.nit NITBEN,TM.nombres NOMBRESBEN,TM.direccion DIRECCIONBEN,TM.y_dpto CODDPTBEN,TM.y_ciudad CODCIUDADBEN,
TM.y_pais CODPAISBEN
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (TR.y_ciudad=YC.ciudad AND TR.y_dpto=YC.departamento)
LEFT JOIN Terceros TM ON (TM.NIT=800067604)
WHERE CV.ano=@A�O AND CV.mes<>13 AND 
CV.cuenta IN ('28150501')) AS PNORMAL
GROUP BY PNORMAL.CONCEPTO,PNORMAL.TIPO,PNORMAL.NIT,PNORMAL.DV,PNORMAL.NOMBRES,PNORMAL.CODPAIS,PNORMAL.TIPOBEN,PNORMAL.NITBEN,PNORMAL.NOMBRESBEN,PNORMAL.DIRECCIONBEN,PNORMAL.CODDPTBEN,PNORMAL.CODCIUDADBEN,PNORMAL.CODPAISBEN) AS TAGRUPADA
WHERE TAGRUPADA.SALDOFINAL<>0) AS CTOTAL) AS TOTALSEPERADA) AS TOTALAGRUPADA) as FINAL
GROUP BY FINAL.CONCEPTO,FINAL.TIPO,FINAL.NIT,FINAL.DV,FINAL.PRIMERAPELLIDO,FINAL.SEGUNDOAPELLIDO,FINAL.PRIMERNOMBRE,FINAL.SEGUNDONOMBRE,FINAL.RAZONSOCIAL,FINAL.CODPAIS,
FINAL.TIPOBEN,FINAL.NITBEN,FINAL.PRIMERAPELLIDOBEN,FINAL.SEGUNDOAPELLIDOBEN,FINAL.PRIMERNOMBREBEN,FINAL.SEGUNDONOMBREBEN,FINAL.RAZONSOCIALBEN,FINAL.DIRECCIONBEN,FINAL.CODPTOBEN,FINAL.CODMUNBEN,FINAL.CODPAISBEN
ORDER BY FINAL.NIT
