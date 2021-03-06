
SELECT C.CONCEPTO,TM.TIPO,ISNULL(TM.NIT,C.NIT) NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,UPPER(TM.DIRECCION) DIRECCION,TM.DEPARTAMENTO,TM.CIUDAD,TM.PAIS,C.VALOR,C.O ,0 P,0 Q,C.R R,0 S,C.T ,0 U,0 V,0 W,0 X 
FROM( 

SELECT CONCEPTO,NIT,SUM(T.VALOR) VALOR,SUM(T.DEDUCIBLE) O,SUM(T.RTE_FTE) R,SUM(T.RTE_IVA) T
FROM (

SELECT S.CONCEPTO,CASE WHEN S.VALOR<100000 THEN 222222222 else S.NIT END NIT,S.VALOR,S.DEDUCIBLE ,RTE_FTE,RTE_IVA
FROM (

SELECT ISNULL(P.CONCEPTO,5001) CONCEPTO,ISNULL(P.NIT,R.nit_real) NIT,ISNULL(P.VALOR,0) VALOR,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.DEDUCIBLE,0) ELSE 0 END DEDUCIBLE,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.RTE_FTE,0) ELSE 0 END RTE_FTE,
CASE WHEN ID=1 OR P.NIT IS NULL THEN ISNULL(R.RTE_IVA,0) ELSE 0 END RTE_IVA
FROM (

SELECT *,ROW_NUMBER() OVER ( PARTITION BY NIT ORDER BY nit ASC) ID
FROM F1001_CONCEPTOS_2017_FN) AS P FULL JOIN F1001_Retenciones_2017 R ON (P.NIT=R.nit_real)) AS S) AS T

GROUP BY CONCEPTO,NIT) AS C LEFT JOIN terceros_medios TM ON (C.NIT=TM.NIT)

ORDER BY CONCEPTO,C.NIT



