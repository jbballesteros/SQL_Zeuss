SELECT RG.descripcion GRUPO,RCL.descripcion CLASE,R.codigo CODIGO,R.descripcion PRODUCTO,RC.cta_ventas CUENTA_VENTAS,C.descripcion DESCRIPCION_CUENTA
FROM referencias R 
INNER JOIN documentos_lin DL ON (DL.codigo=R.codigo AND DL.sw IN (1,3))
LEFT JOIN referencias_gru RG ON (R.grupo=RG.grupo)
LEFT JOIN referencias_cla RCL ON (R.clase=RCL.clase)
LEFT JOIN referencias_con RC ON (R.contable=RC.contable)
LEFT JOIN cuentas C ON (RC.cta_ventas=C.cuenta)
GROUP BY RG.descripcion,RCL.descripcion,R.codigo,R.descripcion,RC.cta_ventas,C.descripcion