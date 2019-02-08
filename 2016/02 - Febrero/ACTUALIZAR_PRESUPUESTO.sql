SELECT   TV.nit,TV.nombres,SUM(galones)
FROM presupuesto P 
INNER JOIN terceros T ON (P.Nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE  P.ano=2015 AND P.mes=1 AND TV.nit=114
GROUP BY TV.nit,TV.nombres

	UPDATE presupuesto
	SET galones=ROUND((galones/704268)*   695576  ,0)
	FROM presupuesto P 
	INNER JOIN terceros T ON (P.Nit=T.nit)
	INNER JOIN terceros TV ON (T.vendedor=TV.nit)
	WHERE  P.ano=2015 AND P.mes=6 AND TV.nit=118

