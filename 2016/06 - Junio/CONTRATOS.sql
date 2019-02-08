



ALTER VIEW [dbo].[contratos_eds]
AS
SELECT     TOP (100) PERCENT NIT, CLIENTE, RAZON_COMERCIAL, TIPO_EDS, TIPO_CONTRATO, FECHA_INICIAL, FECHA_FINAL, FECHA_ESTIMADA_FINAL, VOLUMEN_TOTAL_CONTRATO, 
                      VOLUMEN_ACUMULADO_ACTUAL, VOLUMEN_FALTANTE, FECHA_PROYECTADA_VENCIMIENTO, PRIMA_PAGADA, PESOS, MARGEN, DIAS, PROMEDIO_MENSUAL, 
                      GALONAJE_MENSUAL_ESTIMADO,VENDEDOR
FROM         (SELECT     NIT, CLIENTE, RAZON_COMERCIAL, TIPO_EDS, TIPO_CONTRATO, FECHA_INICIAL, FECHA_FINAL, FECHA_ESTIMADA_FINAL, VOLUMEN_TOTAL_CONTRATO, 
                                              VOLUMEN_ACUMULADO_ACTUAL, 
                                              
                                              
                                              CASE WHEN GTTIPO = 3 AND PROYECTADA2 < FECHA_FINAL THEN (CASE WHEN (VOLUMEN_TOTAL_CONTRATO - VOLUMEN_ACUMULADO_ACTUAL) 
                                              < 0 THEN VOLUMEN_FALTANTE ELSE (DATEDIFF(DAY, CAST('31/05/2016' AS DATE), P.FECHA_PROYECTADA_VENCIMIENTO)/30.00 * PROMEDIO_MENSUAL) END) 
                                              ELSE VOLUMEN_FALTANTE END AS VOLUMEN_FALTANTE, FECHA_PROYECTADA_VENCIMIENTO, PRIMA_PAGADA, PESOS, MARGEN, DIAS, PROMEDIO_MENSUAL, 
                                              GALONAJE_MENSUAL_ESTIMADO,VENDEDOR
                       FROM          (SELECT     GTTIPO, NIT, CLIENTE, ISNULL(RAZON_COMERCIAL, '') AS RAZON_COMERCIAL, ISNULL(CATEGORIA, '') AS TIPO_EDS, TIPO_CONTRATO, DESDE AS FECHA_INICIAL, 
                                                                      CASE WHEN GTTIPO IN (1, 3) THEN HASTA WHEN GTTIPO = 2 THEN NULL ELSE NULL END AS FECHA_FINAL, CASE WHEN GTTIPO IN (1) THEN NULL WHEN GTTIPO IN (2, 3) 
                                                                      THEN 
                          DATEADD(MINUTE, 43829.2543*ROUND(CASE WHEN ISNULL(GALONAJE_MENSUAL_ESTIMADO, 0) = 0 THEN 0 ELSE ISNULL(GALONAJE_ESTIMADA, 0)  / ISNULL(GALONAJE_MENSUAL_ESTIMADO, 0) END, 0), CAST(DESDE AS DATETIME)) ELSE NULL END AS FECHA_ESTIMADA_FINAL, CASE WHEN GTTIPO IN (1) THEN ISNULL(DATEDIFF(M, DESDE,
                                                                       HASTA) * GALONAJE_MENSUAL_ESTIMADO, 0) WHEN GTTIPO IN (2, 3) THEN ISNULL(GALONAJE_ESTIMADA, 0) ELSE 0 END AS VOLUMEN_TOTAL_CONTRATO, 
                                                                      ROUND(ISNULL(SUM(CONSUMO),0), 0) AS VOLUMEN_ACUMULADO_ACTUAL, 
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      (CASE WHEN GTTIPO IN (1) 
                                                                      THEN (CASE WHEN SUM(PROMEDIO_ACT) IS NOT NULL THEN ISNULL(DATEDIFF(DAY, CAST('31/05/2016' AS DATE), HASTA)/30.00 * SUM(PROMEDIO_ACT), 0) + ISNULL(SUM(CONSUMO),0) ELSE ISNULL(DATEDIFF(M, DESDE, HASTA) 
                                                                      * GALONAJE_MENSUAL_ESTIMADO, 0) END) WHEN GTTIPO = 3 THEN (CASE WHEN ISNULL(GALONAJE_ESTIMADA, 0) - ISNULL(SUM(CONSUMO),0) < 0 AND HASTA > CAST('31/05/2016' 
                                                                      AS date) THEN ISNULL(DATEDIFF(DAY, CAST('31/05/2016' AS DATE), HASTA)/30.00 * SUM(PROMEDIO_ACT), 0) + ISNULL(SUM(CONSUMO),0) ELSE ISNULL(GALONAJE_ESTIMADA, 0) END) 
                                                                      WHEN GTTIPO = 2 THEN ISNULL(GALONAJE_ESTIMADA, 0) ELSE 0 END) - ISNULL(SUM(CONSUMO), 0) AS VOLUMEN_FALTANTE, CASE WHEN GTTIPO IN (1) THEN NULL 
                                                                      WHEN ISNULL(SUM(PROMEDIO_ACT), '') = 0 THEN (CASE WHEN GTTIPO IN (1) THEN NULL WHEN GTTIPO IN (2, 3) THEN 
                                                                      DATEADD(MINUTE, 43829.2543*
                                                                      ROUND(CASE WHEN ISNULL(GALONAJE_MENSUAL_ESTIMADO, 0) = 0 THEN 0 ELSE ISNULL(GALONAJE_ESTIMADA, 0) / ISNULL(GALONAJE_MENSUAL_ESTIMADO, 0) END, 
                                                                      0), CAST(DESDE AS DATETIME)) ELSE NULL END) WHEN GTTIPO = 2 THEN DATEADD(MINUTE,43829.2543* ISNULL((GALONAJE_ESTIMADA - ISNULL(SUM(CONSUMO), 0)) / SUM(PROMEDIO_ACT), 0), '31/05/2016'
                                                                      ) WHEN GTTIPO = 3 THEN (CASE WHEN DATEADD(MINUTE,43829.2543* ISNULL((GALONAJE_ESTIMADA - ISNULL(SUM(CONSUMO), 0)) / SUM(PROMEDIO_ACT), 0), '31/05/2016' 
                                                                      ) < HASTA THEN HASTA ELSE DATEADD(MINUTE, 43829.2543*ISNULL((GALONAJE_ESTIMADA - ISNULL(SUM(CONSUMO),0)) / SUM(PROMEDIO_ACT), 0), '31/05/2016' ) END) 
                                                                      ELSE NULL END AS FECHA_PROYECTADA_VENCIMIENTO, ISNULL(PRIMA, 0) AS PRIMA_PAGADA, ISNULL(PESOS, 0) AS PESOS, ISNULL(MARGEN, 0) AS MARGEN, DIAS, 
                                                                      ISNULL(SUM(PROMEDIO_ACT), '') AS PROMEDIO_MENSUAL, DATEADD(MINUTE, 43829.2543*ISNULL((GALONAJE_ESTIMADA - ISNULL(SUM(CONSUMO),0)) / SUM(PROMEDIO_ACT), 0), '31/05/2016' 
                                                                      ) AS PROYECTADA2, primera_venta, FECHA_PRI, GALONAJE_MENSUAL_ESTIMADO,VENDEDOR
                                               FROM          (
                                               
                                               
                                               SELECT     T.nit AS NIT, T.nombres AS CLIENTE, T.razon_comercial AS RAZON_COMERCIAL, T2.descripcion AS TIPO_CL, 
                                                                                              CASE WHEN aplica_primera = 1 THEN primera_venta ELSE GT.val_desde END AS DESDE, GT.val_hasta AS HASTA, 
                                                                                              CASE WHEN GT.tipo = 1 THEN 'FECHA' WHEN GT.tipo = 2 THEN 'GALONES' WHEN GT.tipo = 3 THEN 'AMBOS' ELSE '' END AS TIPO_CONTRATO, GT.tipo AS GTTIPO,
                                                                                               GT.galonaje AS GALONAJE_ESTIMADA, ISNULL(GT.galonaje_mensual, 0) AS GALONAJE_MENSUAL_ESTIMADO, ROUND(SUM(CASE WHEN val_desde IS NULL 
                                                                                              THEN 0 WHEN val_desde IS NOT NULL THEN (CASE WHEN ZL.fec BETWEEN val_desde AND CAST('31/05/2016' AS DATE) AND ZL.subgrupo2 IN (2, 3, 4) 
                                                                                              THEN ZL.can_ventas - ZL.can_devolu ELSE 0 END) ELSE 0 END), 0) AS CONSUMO, MAX(UV.FECHA_ULT) AS ULTIMA_FACTURA, ISNULL(PC.PROMEDIO, 
                                                                                              PCC.PROMEDIO) AS PROMEDIO_ACT, T5.descripcion AS CATEGORIA, GT.valor_prima AS PRIMA, ISNULL(T8.descripcion, '0') AS PESOS, ISNULL(T9.descripcion, '0') 
                                                                                              AS MARGEN, CP.dias_vcto AS DIAS, GT.usuario, GT.primera_venta, MIN(UV.FECHA_PRI) AS FECHA_PRI,T.vendedor VENDEDOR
                                                                       FROM          dbo.terceros AS T LEFT JOIN
                                                                        terceros_codigos_cambio TCC ON (T.nit=TCC.NUEVO_NIT) INNER JOIN
                                                                                              dbo.terceros_criterios AS TC ON T.nit= TC.nit AND TC.concepto_29 = 1 LEFT OUTER JOIN
                                                                                           
                                                                                              dbo.Zeuss_Lin_Ventas AS ZL ON (ZL.nit=ISNULL(TCC.NIT,T.nit)  OR ZL.nit=T.nit ) LEFT OUTER JOIN
                                                                                              dbo.gterceros_contratos_ult AS GT ON T.nit = GT.nit LEFT OUTER JOIN
                                                                                              dbo.terceros_2 AS T2 ON T.concepto_2 = T2.concepto_2 LEFT OUTER JOIN
                                                                                              dbo.ultima_venta AS UV ON T.nit = UV.nit LEFT OUTER JOIN
                                                                                              dbo.terceros_5 AS T5 ON T.concepto_5 = T5.concepto_5 LEFT OUTER JOIN
                                                                                              dbo.terceros_8 AS T8 ON T8.concepto_8 = T.concepto_8 LEFT OUTER JOIN
                                                                                              dbo.terceros_9 AS T9 ON T9.concepto_9 = T.concepto_9 LEFT OUTER JOIN
                                                                                              dbo.condiciones_pago AS CP ON T.condicion = CP.condicion LEFT OUTER JOIN
                                                                                              dbo.promedio_clientes AS PC ON T.nit = PC.nit LEFT OUTER JOIN
                                                                                              dbo.promedio_clientes_comer AS PCC ON T.nit = PCC.nit_comer
                                                                       WHERE      (ZL.subgrupo2 IN (2, 3, 4) OR ZL.subgrupo2 IS NULL ) AND T.concepto_2='14' 
                                                                       GROUP BY T.nit, T.nombres, T.razon_comercial, T2.descripcion, GT.val_desde, GT.val_hasta, GT.tipo, GT.galonaje, GT.galonaje_mensual, T5.descripcion, GT.valor_prima, 
                                                                                              T8.descripcion, T9.descripcion, CP.dias_vcto, GT.usuario, GT.aplica_primera, GT.primera_venta, PC.PROMEDIO, PCC.PROMEDIO,T.vendedor) AS P_1
                                               GROUP BY NIT, CLIENTE, RAZON_COMERCIAL, CATEGORIA, TIPO_CONTRATO, DESDE, GTTIPO, HASTA, GALONAJE_ESTIMADA, GALONAJE_MENSUAL_ESTIMADO, PRIMA, PESOS, 
                                                                      MARGEN, DIAS, primera_venta, FECHA_PRI,VENDEDOR) AS P) AS Y
ORDER BY NIT






GO


