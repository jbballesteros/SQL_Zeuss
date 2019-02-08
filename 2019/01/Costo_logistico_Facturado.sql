SELECT *, 
CASE WHEN P.nit=S.nit THEN 'VERDADERO' ELSE 'FALSO' END CUADRE
FROM (
select tipo TIPO_VENTA, numero NUMERO_VENTA, T.nit
from Zeuss_Lin_Ventas ZL INNER JOIN terceros T ON (ZL.nit=T.nit)
where subgrupo2 IN (2,3,4,39) AND T.concepto_7>=1 and ano=2019 and mes=1 ) as P
FULL JOIN (

select tipo TIPO_VENTA, numero NUMERO_VENTA, T.nit
from Zeuss_Lin_Ventas ZL INNER JOIN terceros T ON (ZL.nit=T.nit)
where subgrupo2 IN (10,15,16) and ano=2019 and mes=1 ) as S ON P.TIPO_VENTA=S.TIPO_VENTA AND P.NUMERO_VENTA=S.NUMERO_VENTA