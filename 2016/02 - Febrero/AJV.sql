


SELECT *
FROM (
SELECT T.nit,T.nombres,
SUM(CASE WHEN M.cuenta='130510' THEN 1 ELSE 0 END) CUENTA1,
SUM(CASE WHEN M.cuenta='130512' THEN 1 ELSE 0 END) CUENTA2
FROM movimiento M INNER JOIN terceros T ON (M.nit=T.nit)
WHERE M.cuenta IN ('130510','130512')
GROUP BY T.nit,T.nombres) AS P  INNER JOIN movimiento M ON (P.nit=M.nit)
WHERE P.CUENTA1<>0 AND P.CUENTA2<>0  AND M.cuenta IN ('130510','130512')
ORDER BY M.nit,M.fec


