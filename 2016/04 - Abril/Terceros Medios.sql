SELECT S.NIT,S.TERCERO,S.DIGITO,S.TIPO,

CASE WHEN S.TIPO=13 THEN (CASE WHEN ESPACIOS=0 THEN TERCERO ELSE SUBSTRING(TERCERO,0,S.PESPACIO) END) ELSE '' END PAPELLIDO,
CASE WHEN S.TIPO=13 THEN (CASE WHEN ESPACIOS>1 THEN SUBSTRING(TERCERO,S.PESPACIO+1,S.SESPACIO-S.PESPACIO-1) ELSE '' END) ELSE '' END PAPELLIDO,
CASE WHEN S.TIPO=13 THEN 
(CASE WHEN ESPACIOS>2 THEN SUBSTRING(TERCERO,S.SESPACIO+1,S.TESPACIO-S.SESPACIO-1) 
WHEN ESPACIOS=1 THEN SUBSTRING(TERCERO,S.PESPACIO+1,LEN(TERCERO))
ELSE '' END) ELSE '' END PNOMBRE,
CASE WHEN S.TIPO=13 THEN 
(CASE WHEN ESPACIOS>=3 THEN SUBSTRING(TERCERO,S.TESPACIO+1,LEN(TERCERO) )
ELSE '' END) ELSE '' END SNOMBRE,

CASE WHEN S.TIPO<>13 THEN TERCERO ELSE '' END RAZON_SOCIAL,
DIRECCION,PAIS,DEPARTAMENTO,CIUDAD,ESPACIOS,TERCERO
FROM (
SELECT *,
CHARINDEX(' ',TERCERO,0) PESPACIO,
CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,0)+1) SESPACIO,
CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,0)+1)+1) TESPACIO,
CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,CHARINDEX(' ',TERCERO,0)+1)+1)+1) CESPACIO,
dbo.cuenta_espacios(TERCERO) ESPACIOS
FROM (
SELECT T.nit NIT,
RTRIM(LTRIM(UPPER(REPLACE(REPLACE( 
CASE
WHEN CHARINDEX('Y/O',T.nombres,0)<>0 THEN SUBSTRING(NOMBRES,0,CHARINDEX('Y/O',T.nombres,0))
WHEN CHARINDEX('/',T.nombres,0)<>0 THEN SUBSTRING(NOMBRES,0,CHARINDEX('/',T.nombres,0))

 ELSE T.nombres END,'.',''),'*','')))) TERCERO,
CASE WHEN tipo_identificacion  IN ('C','T') THEN '' ELSE CAST(T.digito AS VARCHAR(5)) END DIGITO,
CASE WHEN T.tipo_identificacion IN ('C','T') THEN 13 ELSE 31 END TIPO,ISNULL(T.direccion,'') DIRECCION,T.y_pais PAIS,T.y_dpto DEPARTAMENTO,T.y_ciudad CIUDAD
FROM terceros T 
WHERE nit=nit_real AND nit>=999999) AS P) AS S