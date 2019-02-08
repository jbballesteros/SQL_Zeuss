SELECT AÑO,MES,ID_CLASE,CLASE,ID_GRUPO,GRUPO,SUM(VENTA_SIN_IMP) VENTA_SIN_IMP,SUM(VENTA_CON_IMP)  VENTA_CON_IMP,SUM(VALOR_CONTABLE) VALOR_CONTABLE
FROM ( 
SELECT T.*,M.cuenta CUENTA,M.valor*-1  VALOR_CONTABLE
FROM (
SELECT P.AÑO,P.MES,ID_CLASE,CLASE,ID_GRUPO,GRUPO,P.TIPO,P.NUMERO,P.CTA_VENTAS,SUM(VENTA_SIN_IMP) VENTA_SIN_IMP,SUM(VENTA_CON_IMP) VENTA_CON_IMP
FROM (
SELECT YEAR(DL.fec) AÑO,MONTH(DL.fec) MES,R.clase ID_CLASE,RCL.descripcion CLASE,R.grupo ID_GRUPO,RG.descripcion GRUPO,DL.tipo TIPO,DL.numero NUMERO,DL.CANTIDAD CANTIDAD,DL.cantidad*DL.valor_unitario VENTA_SIN_IMP,
CASE WHEN DL.sw = 1 THEN CONVERT(real, 
                      (((DL.valor_unitario + CASE WHEN DL.valor_unitario <> 0 THEN ISNULL(r.impoconsumo, 0) ELSE 0 END) * DL.cantidad) * (1 + DL.porcentaje_iva / 100) * (1 - DL.porcentaje_descuento / 100) 
                      * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - isnull(DL.porc_dcto_3, 0) / 100))) ELSE 0 END AS VENTA_CON_IMP,RC.cta_ventas CTA_VENTAS
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
LEFT JOIN referencias_cla RCL ON (R.clase=RCL.clase)
LEFT JOIN referencias_gru RG ON (R.grupo=RG.grupo)
LEFT JOIN referencias_con RC ON (R.contable=RC.contable)
WHERE DL.bodega=1  AND  DL.sw IN (1,2)) AS P
GROUP BY P.AÑO,P.MES,P.tipo,P.numero,P.cta_ventas,ID_CLASE,CLASE,ID_GRUPO,GRUPO) AS T
LEFT JOIN movimiento M ON (T.tipo=M.tipo AND T.numero=M.numero AND M.cuenta=T.CTA_VENTAS)) AS R
WHERE AÑO=2015 AND MES=4
GROUP BY AÑO,MES,ID_CLASE,CLASE,ID_GRUPO,GRUPO