DECLARE @A�O AS INTEGER
DECLARE @MES AS INTEGER
DECLARE @CUANTIA AS MONEY
SET @A�O=2014
SET @MES=12
SET @CUANTIA=-1000000
SELECT PRIMERA.*,ISNULL(SEGUNDA.SALDOFINAL,0) DEVOLUCIONES
FROM (
SELECT Q.CONCEPTO,Q.TIPO,Q.NIT,'' DV,Q.PRIMERAPELLIDO,Q.SEGUNDOAPELLIDO,Q.PRIMERNOMBRE,Q.SEGUNDONOMBRE,Q.RAZONSOCIAL,Q.CODPAIS,
ROUND(SUM(Q.SALDOFINAL),0,0) SALDOFINAL, SUM(Q.CONSORCIO) CONSORCIO,SUM(Q.ADMINISTRACION) ADMINISTRACION,SUM(Q.MINERALES) MINERALES,
SUM(Q.FIDUCIA) FIDUCIA,SUM(Q.RCTERCEROS) RCTERCEROS
FROM (
SELECT C.CONCEPTO,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN 43 ELSE
CASE WHEN C.TIPO='C' THEN 13 ELSE
CASE WHEN C.TIPO='N' THEN 31 ELSE
CASE WHEN C.TIPO='T' THEN 12 ELSE 0 END END END END TIPO,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN 222222222 ELSE C.NIT END NIT,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN ' ' ELSE 
CASE WHEN C.TIPO='N' THEN C.DV ELSE ' ' END END DV,
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,1,C.PRIMERESPACIO-1) ELSE '' END PRIMERAPELLIDO,
CASE WHEN (C.SEGUNDOESPACIO=0 OR C.TERCERESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN '' ELSE
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,(C.SEGUNDOESPACIO-C.PRIMERESPACIO)-1) ELSE '' END END SEGUNDOAPELLIDO,
CASE WHEN (C.TERCERESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,(C.SEGUNDOESPACIO-C.PRIMERESPACIO)-1) ELSE 
CASE WHEN (C.SEGUNDOESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,LEN(C.TERCERO)) ELSE  
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.SEGUNDOESPACIO+1,(C.TERCERESPACIO-C.SEGUNDOESPACIO-1)) ELSE '' END END END PRIMERNOMBRE,
CASE WHEN (C.TERCERESPACIO=0 OR C.SEGUNDOESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.SEGUNDOESPACIO+1,LEN(C.TERCERO)) ELSE 
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.TERCERESPACIO+1,LEN(C.TERCERO)) ELSE '' END END SEGUNDONOMBRE,
CASE WHEN C.TIPO='N' OR C.TERCERO='CUANTIAS MENORES' THEN C.TERCERO ELSE '' END RAZONSOCIAL,
C.CODPAIS,
C.SALDOFINAL*-1 SALDOFINAL,0 CONSORCIO,0 ADMINISTRACION,0 MINERALES,0 FIDUCIA,0 RCTERCEROS
FROM (
SELECT P.CONCEPTO,P.TIPO,P.NIT,P.DV,P.NOMBRES,P.CODPAIS, SUM(P.SALDOFINAL) SALDOFINAL,
CHARINDEX(' ',P.NOMBRES) PRIMERESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1) SEGUNDOESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1)+1) TERCERESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1)+1)+1) CUARTOESPACIO,
CASE WHEN SUM(P.SALDOFINAL)>@CUANTIA THEN 'CUANTIAS MENORES' ELSE P.NOMBRES END TERCERO
FROM (
SELECT 
CASE WHEN CV.cuenta LIKE '41%'  THEN 4001 ELSE
CASE WHEN CV.cuenta LIKE '4210%'   THEN 4003 ELSE
CASE WHEN CV.cuenta BETWEEN '4220' AND '43' THEN 4002 ELSE 0 END END END CONCEPTO,
TR.tipo_identificacion TIPO,
TR.nit_real NIT, 
CAST(TR.digito AS VARCHAR(2)) DV,TR.nombres NOMBRES,TR.y_pais CODPAIS,
CV.saldo_inicial + CV.debito - CV.credito SALDOFINAL
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (TR.y_ciudad=YC.ciudad AND TR.y_dpto=YC.departamento)
WHERE CV.ano=@A�O AND CV.mes=@MES AND 
(CV.cuenta LIKE '41%' OR CV.cuenta LIKE '42%' ))
AS P 
WHERE P.SALDOFINAL<>0
GROUP BY P.CONCEPTO,P.TIPO,P.NIT,P.DV,P.NOMBRES,P.CODPAIS) AS C) AS Q
GROUP BY Q.CONCEPTO,Q.TIPO,Q.NIT,Q.DV,Q.PRIMERAPELLIDO,Q.SEGUNDOAPELLIDO,Q.PRIMERNOMBRE,Q.SEGUNDONOMBRE,Q.RAZONSOCIAL,Q.CODPAIS)  AS PRIMERA
LEFT JOIN 
(SELECT Q.CONCEPTO,Q.TIPO,Q.NIT,Q.DV,Q.PRIMERAPELLIDO,Q.SEGUNDOAPELLIDO,Q.PRIMERNOMBRE,Q.SEGUNDONOMBRE,Q.RAZONSOCIAL,Q.CODPAIS,
ROUND(SUM(Q.SALDOFINAL),0,0) SALDOFINAL, SUM(Q.CONSORCIO) CONSORCIO,SUM(Q.ADMINISTRACION) ADMINISTRACION,SUM(Q.MINERALES) MINERALES,
SUM(Q.FIDUCIA) FIDUCIA,SUM(Q.RCTERCEROS) RCTERCEROS
FROM (
SELECT C.CONCEPTO,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN 43 ELSE
CASE WHEN C.TIPO='C' THEN 13 ELSE
CASE WHEN C.TIPO='N' THEN 31 ELSE
CASE WHEN C.TIPO='T' THEN 12 ELSE 0 END END END END TIPO,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN 222222222 ELSE C.NIT END NIT,
CASE WHEN C.TERCERO='CUANTIAS MENORES' THEN ' ' ELSE 
CASE WHEN C.TIPO='N' THEN C.DV ELSE ' ' END END DV,
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,1,C.PRIMERESPACIO-1) ELSE '' END PRIMERAPELLIDO,
CASE WHEN (C.SEGUNDOESPACIO=0 OR C.TERCERESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN '' ELSE
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,(C.SEGUNDOESPACIO-C.PRIMERESPACIO)-1) ELSE '' END END SEGUNDOAPELLIDO,
CASE WHEN (C.TERCERESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,(C.SEGUNDOESPACIO-C.PRIMERESPACIO)-1) ELSE 
CASE WHEN (C.SEGUNDOESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.PRIMERESPACIO+1,LEN(C.TERCERO)) ELSE  
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.SEGUNDOESPACIO+1,(C.TERCERESPACIO-C.SEGUNDOESPACIO-1)) ELSE '' END END END PRIMERNOMBRE,
CASE WHEN (C.TERCERESPACIO=0 OR C.SEGUNDOESPACIO=0) AND C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.SEGUNDOESPACIO+1,LEN(C.TERCERO)) ELSE 
CASE WHEN C.TIPO IN ('C','T') AND C.TERCERO<>'CUANTIAS MENORES' THEN SUBSTRING(C.TERCERO,C.TERCERESPACIO+1,LEN(C.TERCERO)) ELSE '' END END SEGUNDONOMBRE,
CASE WHEN C.TIPO='N' OR C.TERCERO='CUANTIAS MENORES' THEN C.TERCERO ELSE '' END RAZONSOCIAL,
C.CODPAIS,
C.SALDOFINAL SALDOFINAL,0 CONSORCIO,0 ADMINISTRACION,0 MINERALES,0 FIDUCIA,0 RCTERCEROS
FROM (
SELECT P.CONCEPTO,P.TIPO,P.NIT,P.DV,P.NOMBRES,P.CODPAIS, SUM(P.SALDOFINAL) SALDOFINAL,
CHARINDEX(' ',P.NOMBRES) PRIMERESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1) SEGUNDOESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1)+1) TERCERESPACIO,
CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES,CHARINDEX(' ',P.NOMBRES)+1)+1)+1) CUARTOESPACIO,
 P.NOMBRES   TERCERO
FROM (
SELECT 
CASE WHEN CV.cuenta IN ('') THEN 4001 ELSE 0 END  CONCEPTO,
TR.tipo_identificacion TIPO,
TR.nit_real NIT, 
CAST(TR.digito AS VARCHAR(2)) DV,TR.nombres NOMBRES,TR.y_pais CODPAIS,
CV.saldo_inicial + CV.debito - CV.credito SALDOFINAL
FROM cuentas_val CV INNER JOIN terceros T ON (CV.nit=T.nit) INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (TR.y_ciudad=YC.ciudad AND TR.y_dpto=YC.departamento)
WHERE CV.ano=@A�O AND CV.mes=@MES AND 
CV.cuenta IN (''))
AS P 
WHERE P.SALDOFINAL<>0
GROUP BY P.CONCEPTO,P.TIPO,P.NIT,P.DV,P.NOMBRES,P.CODPAIS) AS C) AS Q
GROUP BY Q.CONCEPTO,Q.TIPO,Q.NIT,Q.DV,Q.PRIMERAPELLIDO,Q.SEGUNDOAPELLIDO,Q.PRIMERNOMBRE,Q.SEGUNDONOMBRE,Q.RAZONSOCIAL,Q.CODPAIS) AS SEGUNDA ON (PRIMERA.CONCEPTO=SEGUNDA.CONCEPTO AND PRIMERA.NIT=SEGUNDA.NIT)


