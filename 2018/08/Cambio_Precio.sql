SELECT RC.CODIGO,R.descripcion,RC.DESCUENTO,R.valor_unitario
FROM Referencias_cambio_precio RC 
INNER JOIN referencias R ON (RC.CODIGO=R.codigo)


SELECT RC.CODIGO,RL.lista,RL.precio,RC.DESCUENTO,ROUND(RL.precio*(1+RC.DESCUENTO),2) precio_2
into Referencias_cambio_precio_hist
FROM Referencias_cambio_precio RC 
INNER JOIN referencias_listas RL ON (RC.CODIGO=RL.codigo)