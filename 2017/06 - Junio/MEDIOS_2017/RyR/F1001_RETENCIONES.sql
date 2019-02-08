SELECT nit_real NIT,SUM(ROUND(P,0)) P ,SUM(ROUND(R,0)*-1) R ,SUM(ROUND(T,0)*-1) T ,SUM(ROUND(U,0)*-1) U
FROM (
SELECT T.nit_real,
SUM(CASE WHEN cuenta BETWEEN '24081002' AND '24081004' THEN M.valor ELSE 0 END ) P,
SUM(CASE WHEN cuenta BETWEEN '2365' AND '23654002' THEN M.valor ELSE 0 END ) R,
SUM(CASE WHEN cuenta IN ('236702') THEN M.valor ELSE 0 END ) T,
SUM(CASE WHEN cuenta IN ('236701') THEN M.valor ELSE 0 END ) U
FROM movimiento M 
INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
INNER JOIN terceros T ON (T.nit=(CASE WHEN M.nit=0 THEN D.nit ELSE M.nit END))
WHERE YEAR(M.fec)=2016 AND M.tipo<>'Z1' AND T.nit_real<>800197268 AND M.nit<>13 AND
(
cuenta IN ('24081002','24081003','24081004') OR
cuenta BETWEEN '2365' AND '23654002' OR
cuenta IN ('236702','236701'))
GROUP BY T.nit_real

) AS P
GROUP BY nit_real
HAVING SUM(P+R+T+U)<>0