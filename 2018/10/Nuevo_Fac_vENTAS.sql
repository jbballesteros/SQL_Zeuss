SELECT ZL.vendedor Snk_asesores,ZL.bodega Snk_bodega,ZL.codigo Snk_productos,ZL.nit Snk_clientes,ZL.fec Snk_fecha,ZL.tipo,ZL.numero,
ZL.tipo + CAST(ZL.numero AS VARCHAR) + CAST(ZL.seq AS VARCHAR) num_fac,0 iva,
ZL.can_ventas cantidad_vendida,
ZL.can_devolu cantidad_devuelta,
ZL.can_ventas-ZL.can_devolu cantidad_neta,
ZL.vlr_ventas valor_venta,
ZL.vlr_devolu valor_devolucion,
ZL.vlr_ventas-ZL.vlr_devolu venta_neta,
CASE WHEN ZL.ano=2018 THEN ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END venta_2018,
CASE WHEN ZL.ano=2017 THEN ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END venta_2017,
CASE WHEN ZL.ano=2016 THEN ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END venta_2016,
CASE WHEN ZL.ano=2015 THEN ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END venta_2015,
CASE WHEN ZL.ano=2014 THEN ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END venta_2014,
CASE WHEN ZL.ano=2018 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END cantidad_neta_2018,
CASE WHEN ZL.ano=2017 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END cantidad_neta_2017,
CASE WHEN ZL.ano=2016 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END cantidad_neta_2016,
CASE WHEN ZL.ano=2015 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END cantidad_neta_2015,
CASE WHEN ZL.ano=2014 THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END cantidad_neta_2014,
ZL.costo_ventas-ZL.costo_devol costo_neto,
T.vendedor  Snk_vendedor, ZA.VALORMAX valormax,ZB.total_bonificacion
FROM Zeuss_Lin_Ventas  ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
LEFT JOIN ZBonificacionAsesoresTB ZA ON (ZA.tipo=ZL.tipo AND ZA.numero=ZL.numero AND ZL.codigo=ZA.codigo AND ZL.seq=ZA.seq)
LEFT JOIN bon_bonificacion_tbl ZB ON (ZL.tipo=ZB.tipo AND ZL.numero=ZB.numero AND ZL.codigo=ZB.codigo AND ZL.seq=ZB.seq)
WHERE ZL.ano>=2015 AND ZL.subgrupo IN (2,3,4,39) 
