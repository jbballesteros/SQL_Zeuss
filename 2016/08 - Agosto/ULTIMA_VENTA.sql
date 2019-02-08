SELECT T.codigo_alterno,T.NIT,T.NOMBRES,t.concepto_2,UV.FECHA_PRI,UV.FECHA_ULT,BC.BODEGA,B.DESCRIPCION
FROM terceros T LEFT JOIN ultima_venta_CC UV ON T.nit=UV.NIT
LEFT JOIN Bodegas_Clientes BC ON (T.nit=BC.nit)
LEFT JOIN BODEGAS B ON (BC.bodega=B.bodega)
WHERE T.bloqueo IN (0,2) AND T.nit<>T.nit_real 


