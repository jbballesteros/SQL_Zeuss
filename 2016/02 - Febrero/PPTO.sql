SELECT P.*,(galones/(SELECT SUM(galones)FROM presupuesto P INNER JOIN terceros T ON (P.Nit=T.nit)
WHERE T.vendedor=114 AND ano=2015 AND mes=1)
FROM presupuesto P INNER JOIN terceros T ON (P.Nit=T.nit)
WHERE T.vendedor=114 AND ano=2015 AND mes=1