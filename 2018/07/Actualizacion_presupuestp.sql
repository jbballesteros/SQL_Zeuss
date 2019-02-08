SELECT P.*,TV.NIT,TV.nombres,TV.concepto_4
FROM presupuesto P  
INNER JOIN terceros T ON (P.Nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
LEFT JOIN Bodegas_Clientes BC ON (P.Nit=BC.nit)
WHERE P.ano=2018 AND P.codigo<>1 AND BC.nit IS NULL AND TV.concepto_4  NOT IN (1,2,3)


UPDATE presupuesto
SET codigo=900724
FROM presupuesto P  LEFT JOIN Bodegas_Clientes BC ON (P.Nit=BC.nit)
WHERE P.ano=2018 AND P.codigo<>1 AND BC.bodega=6


UPDATE presupuesto
SET codigo=900155
FROM presupuesto P  
INNER JOIN terceros T ON (P.Nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
LEFT JOIN Bodegas_Clientes BC ON (P.Nit=BC.nit)
WHERE P.ano=2018 AND P.codigo<>1 AND BC.nit IS NULL AND TV.concepto_4 =4