    
CREATE VIEW [dbo].[Fact_Ventas]      
AS      
SELECT     ISNULL(Snk_asesores, 0) AS Snk_asesores, Snk_bodega,  P.Snk_productos  AS Snk_productos, Snk_clientes, Snk_fecha, tipo, numero, num_fac,       
                      iva, cantidad_vendida, cantidad_devuelta, cantidad_neta, valor_venta, valor_devolucion, venta_neta, costo_neto, Snk_vendedor, VALORMAX AS comision,      
        TOTAL_BONIFICACION AS bonificacion,       
                     venta_2017,  venta_2016, venta_2015, venta_2014,cantidad_neta_2017, cantidad_neta_2016, cantidad_neta_2015, cantidad_neta_2014      
FROM         (      
SELECT     D.vendedor AS Snk_asesores, D.bodega AS Snk_bodega,       
      
      
           
     DL.codigo AS Snk_productos,       
           
           
     D.nit AS Snk_clientes, D.fecha AS Snk_fecha, D.tipo, D.numero, D.tipo + CAST(D.numero AS VARCHAR(10)) + CAST(DL.seq AS VARCHAR(10)) AS num_fac, D.iva,       
           
           
     CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END AS cantidad_vendida,       
     CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END AS cantidad_devuelta,      
            
                  (CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END) - (CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END) AS cantidad_neta,      
                        
                   CASE WHEN D .sw = 1 THEN CONVERT(real,       
                  ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END AS valor_venta,       
                        
                  CASE WHEN D .sw = 2 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0)       
                  / 100))) ELSE 0 END AS valor_devolucion,       
                        
                  (CASE WHEN D .sw = 1 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2,      
                   0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) - (CASE WHEN D .sw = 2 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100)       
                  * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) AS venta_neta,       
                        
                   CASE WHEN year(dl.fec) = 2017 THEN (CASE WHEN D .sw = 1 THEN CONVERT(real,      
                   ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END)       
                  - (CASE WHEN D .sw = 2 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0)       
                  / 100))) ELSE 0 END) ELSE 0 END AS venta_2017,       
                        
                  CASE WHEN year(dl.fec) = 2016 THEN (CASE WHEN D .sw = 1 THEN CONVERT(real,      
                   ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END)       
                  - (CASE WHEN D .sw = 2 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0)       
                  / 100))) ELSE 0 END) ELSE 0 END AS venta_2016,      
                       
                        
                  CASE WHEN year(dl.fec) = 2015 THEN (CASE WHEN D .sw = 1 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad)       
                  * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) - (CASE WHEN D .sw = 2 THEN CONVERT(real,       
                  ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END)       
                  ELSE 0 END AS venta_2015,       
                        
                  CASE WHEN year(dl.fec) = 2014 THEN (CASE WHEN D .sw = 1 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad) * (1 - DL.porcentaje_descuento / 100)       
                  * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) - (CASE WHEN D .sw = 2 THEN CONVERT(real, ((DL.valor_unitario * DL.cantidad)       
                  * (1 - DL.porcentaje_descuento / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) ELSE 0 END AS venta_2014,       
                        
                       CASE WHEN YEAR(dl.fec)       
                  = 2017 THEN (CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END) - (CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END) ELSE 0 END AS cantidad_neta_2017,       
                   CASE WHEN YEAR(dl.fec)       
                  = 2016 THEN (CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END) - (CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END) ELSE 0 END AS cantidad_neta_2016,       
                        
                  CASE WHEN YEAR(dl.fec) = 2015 THEN (CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END) - (CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END)       
                  ELSE 0 END AS cantidad_neta_2015,       
                        
                  CASE WHEN YEAR(dl.fec) = 2014 THEN (CASE WHEN D .sw = 1 THEN DL.cantidad ELSE 0 END)       
                  - (CASE WHEN D .sw = 2 THEN DL.cantidad ELSE 0 END) ELSE 0 END AS cantidad_neta_2014,       
                        
                
                  CASE WHEN D .sw = 1 THEN DL.costo_unitario * DL.cantidad ELSE (CASE WHEN D .sw = 2 THEN (DL.costo_unitario * DL.cantidad) * - 1 ELSE 0 END) END AS costo_neto,       
                  T.vendedor AS Snk_vendedor, BA.VALORMAX, ZB.TOTAL_BONIFICACION      
                          
                          
                          
                       FROM          dbo.documentos AS D INNER JOIN      
                                              dbo.documentos_lin AS DL ON D.tipo = DL.tipo AND D.numero = DL.numero INNER JOIN      
                                              dbo.terceros AS T ON D.nit = T.nit LEFT OUTER JOIN      
                                              dbo.ZBonificacionAsesoresTB AS BA ON D.tipo = BA.tipo AND D.numero = BA.numero AND DL.codigo = BA.codigo AND DL.seq = BA.seq LEFT OUTER JOIN      
                                              dbo.bon_bonificacion_tbl AS ZB ON D.tipo = ZB.tipo AND D.numero = ZB.numero AND DL.codigo = ZB.codigo AND DL.seq = ZB.seq      
                       WHERE      (D.sw IN (1, 2)) AND (D.anulado = 0) AND (YEAR(DL.fec) >= 2008)) AS P      
      