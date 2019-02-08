select  p.ano AÑO,p.mes MES,T.nit NIT,T.nombres CLIENTE,TV.nit NIT_VEN,TV.nombres VENDEDOR,P.galones PRESUPUESTO
from presupuesto P 
INNER JOIN terceros T ON (P.Nit=t.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE P.codigo<>1 and P.ano=2018