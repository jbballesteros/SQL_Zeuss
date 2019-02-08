SELECT *
FROM (


SELECT  NIT, CLIENTE, RAZON_COMERCIAL, TIPO_EDS, TIPO_CONTRATO, FECHA_INICIAL, FECHA_FINAL, FECHA_ESTIMADA_FINAL, VOLUMEN_TOTAL_CONTRATO, 
                      VOLUMEN_ACUMULADO_ACTUAL, 
                      
                      CASE WHEN GTTIPO=3 AND PROYECTADA2<FECHA_FINAL THEN   
(CASE WHEN (VOLUMEN_TOTAL_CONTRATO-VOLUMEN_ACUMULADO_ACTUAL)<0 THEN VOLUMEN_FALTANTE ELSE 
(DATEDIFF(M,CAST(GETDATE() AS DATE),P.FECHA_PROYECTADA_VENCIMIENTO)*PROMEDIO_MENSUAL) END)ELSE VOLUMEN_FALTANTE END VOLUMEN_FALTANTE, FECHA_PROYECTADA_VENCIMIENTO, PRIMA_PAGADA, PESOS, MARGEN, DIAS, PROMEDIO_MENSUAL ,GALONAJE_MENSUAL_ESTIMADO
                      

FROM (

SELECT GTTIPO,NIT,CLIENTE,ISNULL(RAZON_COMERCIAL,'') RAZON_COMERCIAL, ISNULL(CATEGORIA,'') TIPO_EDS,TIPO_CONTRATO,DESDE FECHA_INICIAL,
  CASE 
                      WHEN GTTIPO IN (1,3) THEN HASTA
                      WHEN GTTIPO=2 THEN NULL
                       ELSE NULL END AS FECHA_FINAL,
                       
                       
                       
                         CASE 
                      WHEN GTTIPO IN (1) THEN NULL
                      WHEN GTTIPO IN (2,3) THEN DATEADD(M, ROUND( CASE WHEN      ISNULL(GALONAJE_MENSUAL_ESTIMADO,0)=0 THEN   0 ELSE           ISNULL(GALONAJE_ESTIMADA,0)/ISNULL(GALONAJE_MENSUAL_ESTIMADO,0) END,0),DESDE)
                       ELSE NULL END AS FECHA_ESTIMADA_FINAL,
                       
                       
                         CASE 
                      WHEN GTTIPO IN (1) THEN    ISNULL(DATEDIFF(M,DESDE,HASTA)*GALONAJE_MENSUAL_ESTIMADO,0) 
                      
                      WHEN GTTIPO  IN (2,3)  THEN ISNULL(GALONAJE_ESTIMADA,0)
                       ELSE 0 END AS VOLUMEN_TOTAL_CONTRATO,
                       
                       
                       ROUND(SUM(CONSUMO),0) VOLUMEN_ACUMULADO_ACTUAL,
                       
                       
						(CASE 
                      WHEN GTTIPO IN (1) THEN (CASE WHEN  SUM(PROMEDIO_ACT) IS NOT NULL 
                      THEN     ISNULL(DATEDIFF(M,CAST(GETDATE() AS DATE),HASTA)*SUM(PROMEDIO_ACT),0)+SUM(CONSUMO) ELSE ISNULL(DATEDIFF(M,DESDE,HASTA)*GALONAJE_MENSUAL_ESTIMADO,0) END)         
                      WHEN GTTIPO=3 THEN (CASE WHEN  ISNULL(GALONAJE_ESTIMADA,0)-SUM(CONSUMO)<0 AND HASTA>CAST(GETDATE() as date) THEN     ISNULL(DATEDIFF(M,CAST(GETDATE() AS DATE),HASTA)*SUM(PROMEDIO_ACT),0)+SUM(CONSUMO) ELSE ISNULL(GALONAJE_ESTIMADA,0) END)
                      WHEN GTTIPO=2 THEN ISNULL(GALONAJE_ESTIMADA,0)
                       ELSE 0 END)- ISNULL(SUM(CONSUMO),0) VOLUMEN_FALTANTE,
                       
                       
                      CASE 
                      WHEN GTTIPO IN (1) THEN NULL 
                      
                      WHEN ISNULL(SUM(PROMEDIO_ACT),'')=0 THEN 
                       (CASE 
                      WHEN GTTIPO IN (1) THEN NULL
                      WHEN GTTIPO IN (2,3) THEN DATEADD(M, ROUND( CASE WHEN      ISNULL(GALONAJE_MENSUAL_ESTIMADO,0)=0 THEN   0 ELSE           ISNULL(GALONAJE_ESTIMADA,0)/ISNULL(GALONAJE_MENSUAL_ESTIMADO,0) END,0),DESDE)
                       ELSE NULL END)   
                      
                      WHEN GTTIPO =2 THEN
                     
                     
                     DATEADD(M,ISNULL((GALONAJE_ESTIMADA- ISNULL(SUM(CONSUMO),0))/SUM(PROMEDIO_ACT),0),CAST(GETDATE() AS DATE))
                          WHEN GTTIPO=3 THEN (CASE WHEN DATEADD(M,ISNULL((GALONAJE_ESTIMADA- ISNULL(SUM(CONSUMO),0))/SUM(PROMEDIO_ACT),0),CAST(GETDATE() AS DATE))<HASTA THEN HASTA ELSE DATEADD(M,ISNULL((GALONAJE_ESTIMADA- SUM(CONSUMO))/SUM(PROMEDIO_ACT),0),CAST(GETDATE() AS DATE)) END) ELSE NULL END 
                      
                      
                      
                      
                      
                      FECHA_PROYECTADA_VENCIMIENTO, 
                       
                       
                       
                       isnull(PRIMA,0) PRIMA_PAGADA,isnull(PESOS,0)PESOS ,isnull(MARGEN,0) MARGEN,DIAS,ISNULL(SUM(PROMEDIO_ACT),'') PROMEDIO_MENSUAL,
                       
                        DATEADD(M,ISNULL((GALONAJE_ESTIMADA- SUM(CONSUMO))/SUM(PROMEDIO_ACT),0),CAST(GETDATE() AS DATE)) PROYECTADA2,primera_venta,FECHA_PRI,GALONAJE_MENSUAL_ESTIMADO
                       
                       
                       
                       
                       

FROM (

SELECT   T.nit AS NIT, T.nombres AS CLIENTE, T.razon_comercial AS RAZON_COMERCIAL, T2.descripcion AS TIPO_CL, CASE WHEN aplica_primera=1 THEN primera_venta ELSE GT.val_desde END AS DESDE, GT.val_hasta AS HASTA, 
                      CASE 
                      WHEN GT.tipo=1 THEN 'FECHA'
                      WHEN GT.tipo=2 THEN 'GALONES'
                      WHEN GT.tipo=3 THEN 'AMBOS' ELSE '' END AS TIPO_CONTRATO,GT.tipo GTTIPO, GT.galonaje AS GALONAJE_ESTIMADA, ISNULL(GT.galonaje_mensual,0) AS GALONAJE_MENSUAL_ESTIMADO, 
                      
                      SUM(CASE WHEN val_desde IS NULL   THEN 0 WHEN val_desde IS NOT NULL THEN (CASE WHEN ZL.fec BETWEEN val_desde AND CAST(GETDATE() AS DATE) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END) ELSE 0 END) CONSUMO,
                      
                  MAX(  UV.FECHA_ULT) ULTIMA_FACTURA,ISNULL(PC.PROMEDIO,PCC.PROMEDIO) PROMEDIO_ACT,T5.DESCRIPCION CATEGORIA,
     
     GT.VALOR_PRIMA PRIMA,ISNULL(T8.DESCRIPCION,'0') PESOS, ISNULL(T9.descripcion,'0') MARGEN,CP.dias_vcto DIAS,GT.usuario,primera_venta,MIN(UV.FECHA_PRI) FECHA_PRI
     
FROM        dbo.terceros T 
INNER JOIN terceros_criterios TC ON (T.nit=TC.nit AND TC.concepto_29=1)
LEFT JOIN terceros TOT ON (T.nit=TOT.NIT_COMER)
LEFT JOIN 


dbo.Zeuss_Lin_Ventas AS ZL ON ( ZL.nit = T.nit OR ZL.nit=T.NIT2 OR TOT.nit=ZL.nit) LEFT OUTER JOIN
                      
                      dbo.gterceros_contratos_ult AS GT ON T.nit = GT.nit LEFT OUTER JOIN
                      dbo.terceros_2 AS T2 ON T.concepto_2 = T2.concepto_2 
                      LEFT JOIN ultima_venta UV on (ZL.NIT=UV.NIT)
                      LEFT JOIN terceros_5 T5 ON (T.concepto_5=T5.concepto_5)
                      LEFT JOIN terceros_8 T8 ON (T8.concepto_8=T.concepto_8)
                      LEFT JOIN terceros_9 T9 ON (T9.concepto_9=T.concepto_9)
                      LEFT JOIN condiciones_pago CP ON (T.condicion=CP.condicion)
                      LEFT JOIN promedio_clientes PC ON (T.nit=PC.nit )
                      LEFT JOIN promedio_clientes_comer PCC ON (T.nit=PCC.nit_comer )
WHERE     (ZL.subgrupo2 IN (2, 3, 4) or ZL.SUBGRUPO2 IS NULL)   
GROUP BY  T.nit, T.nombres, T.razon_comercial, T2.descripcion, GT.val_desde, GT.val_hasta, GT.tipo, GT.galonaje, GT.galonaje_mensual,T5.DESCRIPCION,GT.VALOR_PRIMA,T8.DESCRIPCION,T9.descripcion,CP.dias_vcto,GT.usuario ,GT.aplica_primera,GT.primera_venta,PC.PROMEDIO,PCC.PROMEDIO
) AS P

GROUP BY P.NIT,P.CLIENTE,P.RAZON_COMERCIAL,P.CATEGORIA,P.TIPO_CONTRATO,P.DESDE,P.GTTIPO,P.HASTA,P.GALONAJE_ESTIMADA,P.GALONAJE_MENSUAL_ESTIMADO,P.PRIMA,P.PESOS,P.MARGEN,P.DIAS,primera_venta,FECHA_PRI) AS P

) AS Y

ORDER BY NIT
