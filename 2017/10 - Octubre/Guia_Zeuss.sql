SELECT B.texto EXPEDICION,D.fecha FECHA,D.tipo TIPO,D.numero NUMERO,
T.nombres CLIENTE,T.codigo_alterno SICOM,T.direccion DIRECCION,
YC.descripcion CIUDAD, TC.nombres CONDUCTOR,TC.nit CEDULA
FROM documentos D INNER JOIN
terceros T ON (D.nit=T.nit) INNER JOIN
y_ciudades YC ON (T.y_ciudad=YC.ciudad AND T.y_dpto=YC.departamento) INNER JOIN
Zeuss_Lin_Ventas ZL ON (D.tipo=ZL.tipo AND D.numero=ZL.numero) INNER JOIN
vehiculos_factura_z VZ ON (D.tipo=VZ.tipo AND D.numero=VZ.numero) INNER JOIN
terceros TC ON (VZ.conductor=TC.nit) INNER JOIN
bodegas B ON (D.bodega=B.bodega)
WHERE ZL.subgrupo2 IN (2,3,4,27,28)
