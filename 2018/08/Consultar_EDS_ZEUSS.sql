select V.SICOM,V.NOMBRE,T.nit,T.nombres,UV.FECHA_PRI,UV.FECHA_ULT,C.NIT,B.descripcion
from Verificacion_SICOM V 
LEFT JOIN terceros T ON (V.SICOM=T.codigo_alterno AND (T.nit  BETWEEN 900000 AND 990000 ) AND T.bloqueo=0 )
LEFT JOIN ultima_venta UV ON (T.nit=UV.nit AND UV.FECHA_ULT>='01/01/2018')
LEFT JOIN contratos_eds_tbl C ON (T.nit=C.NIT)
LEFT JOIN Bodegas_Clientes BC ON (T.nit=BC.nit)
LEFT JOIN bodegas B ON (BC.bodega=B.bodega)
WHERE V.ano=2019 AND V.MES=1
ORDER BY SICOM 




