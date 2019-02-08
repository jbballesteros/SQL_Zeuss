SELECT DL.codigo CODIGO,R.descripcion PRODUCTO,R.porcentaje_iva IVA_VENTA,R.porcentaje_iva_compra IVA_COMPRA,
RC.clase IDCLASE,RC.descripcion CLASE,
RG.grupo IDGRUPO,RG.descripcion GRUPO,
RS.subgrupo IDSUB,RS.descripcion SUBGRUPO,
RS2.subgrupo2 IDPERFIL,RS2.descripcion SUBGRUPO2,
RCC.contable IDPERFIL,RCC.descripcion PERFIL_CONTABLE,
RCC.cta_inventario IDINV,C1.descripcion CUENTA_INVENTARIO,
RCC.cta_costo IDCOS,C2.descripcion CUENTA_COSTO,
RCC.cta_ventas IDVEN,C3.descripcion CUENTA_VENTAS
FROM documentos_lin DL  
INNER JOIN referencias R ON (DL.codigo=R.codigo)
LEFT JOIN referencias_cla RC ON (R.clase=RC.clase)
LEFT JOIN referencias_gru RG ON (R.grupo=RG.grupo)
LEFT JOIN referencias_sub RS ON (RS.grupo=R.grupo AND RS.subgrupo=R.subgrupo)
LEFT JOIN referencias_sub2 RS2 ON (RS2.grupo=R.grupo AND RS2.subgrupo=R.subgrupo AND RS2.subgrupo2=R.subgrupo)
LEFT JOIN referencias_con RCC ON (R.contable=RCC.contable)
LEFT JOIN cuentas C1 ON (RCC.cta_inventario=C1.cuenta)
LEFT JOIN cuentas C2 ON (RCC.cta_costo=C2.cuenta)
LEFT JOIN cuentas C3 ON (RCC.cta_ventas=C3.cuenta)
WHERE DL.bodega=1 AND DL.sw IN (2,3)
GROUP BY DL.codigo,R.descripcion,RC.clase,RC.descripcion,
RG.grupo,RG.descripcion,RS.subgrupo,RS.descripcion,
RS.subgrupo,RS2.subgrupo2,RS2.descripcion,RCC.descripcion,RCC.contable,
RCC.cta_inventario,RCC.cta_costo,RCC.cta_ventas,C1.descripcion,C2.descripcion,C3.descripcion,R.porcentaje_iva,R.porcentaje_iva_compra
ORDER BY DL.codigo