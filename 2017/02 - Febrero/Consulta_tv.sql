SELECT 'ZEUSS' EMPRESA,'01' CLASE,RS.descripcion PRODUCTO,0 COSTO,0 PROMEDIO,
O.rotacion,O.fecha_medida,O.fecha_medida,B.descripcion SEDE,O.cantidad GALONES,B.bodega SEDE
FROM operaciones_cierre_inv O 
INNER JOIN referencias R ON (O.codigo=R.codigo)
INNER JOIN Ventas_promedio VP ON (R.subgrupo2=VP.subgrupo2 AND R.generico=VP.bodega)
INNER JOIN bodegas B ON (R.generico=B.bodega)
INNER JOIN referencias_sub2 RS ON (R.subgrupo2=RS.subgrupo2)
WHERE O.fecha_medida='01/02/2017' 