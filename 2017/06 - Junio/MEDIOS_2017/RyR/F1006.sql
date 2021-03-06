SELECT TM.TIPO,TM.NIT,TM.DIGITO,TM.PAPELLIDO,TM.SAPELLIDO,TM.PNOMBRE,TM.SNOMBRE,TM.RAZON_SOCIAL,T.VALOR,0 J,0 K
FROM (

SELECT S.CONCEPTO,S.NIT,SUM(S.VALOR ) VALOR
FROM (
SELECT P.CONCEPTO, P.NIT  NIT,P.VALOR
FROM (
SELECT 1006 CONCEPTO,T.nit_real NIT,ROUND(SUM(M.valor)*-1,0) VALOR
FROM movimiento M 
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN terceros T ON (D.nit=T.nit)
WHERE YEAR(M.fec)=2016 AND M.cuenta IN ('24080501','24080502') AND M.tipo<>'Z1' AND D.sw IN (1,2)
GROUP BY T.nit_real
) AS P ) AS S
GROUP BY S.CONCEPTO,S.NIT

) AS T INNER JOIN terceros_medios TM ON (T.NIT=TM.NIT)