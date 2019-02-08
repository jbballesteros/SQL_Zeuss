
SELECT C.CONCEPTO,TM.TIPO,ISNULL(TM.NIT,C.NIT) NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,UPPER(TM.DIRECCION) DIRECCION,TM.DEPARTAMENTO,TM.CIUDAD,TM.PAIS,C.VALOR,C.O O,0 P,C.Q Q,C.R R,0 S,C.T T,0 U,0 V,0 W,0 X
FROM( 

SELECT CONCEPTO,NIT,SUM(T.VALOR) VALOR,SUM(T.O) O,SUM(T.R) R , SUM(T.T) T,SUM(T.Q) Q
FROM (

SELECT S.CONCEPTO,CASE WHEN S.VALOR<100000 THEN 222222222 else S.NIT END NIT,S.VALOR,S.O,S.R,S.T,S.Q
FROM (

SELECT ISNULL(P.CONCEPTO,5001) CONCEPTO,ISNULL(P.NIT,R.NIT) NIT,ISNULL(P.VALOR,0) VALOR,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.O,0) ELSE 0 END O,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.R,0) ELSE 0 END  R,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.T,0) ELSE 0 END T,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.Q,0) ELSE 0 END Q
FROM (

SELECT *,ROW_NUMBER() OVER ( PARTITION BY NIT ORDER BY nit ASC) ID
FROM F1001_CONCEPTOS_2017_FN) AS P FULL JOIN F1001_RETENCIONES R ON (P.NIT=R.NIT)) AS S) AS T

GROUP BY CONCEPTO,NIT) AS C LEFT JOIN terceros_medios TM ON (C.NIT=TM.NIT)

ORDER BY CONCEPTO,C.NIT



