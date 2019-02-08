SELECT UV.FECHA_ULT,UV.FECHA_PRI,T.nit,nombres,direccion,telefono_1,NIT_REAL,RAZON_COMERCIAL,T.CODIGO_aLTERNO,T.CIUDAD
FROM terceros  t INNER JOIN ultima_venta UV ON (T.nit=UV.nit)
WHERE y_dpto+  y_ciudad IN (SELECT y_dpto+  y_ciudad FROM TERCEROS WHERE NIT=900011) AND T.NIT<>NIT_REAL