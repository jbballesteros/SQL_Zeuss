SELECT NV.*,R.valor_unitario,R.impoconsumo,R.valor_und3
FROM referencias R INNER JOIN NUEVOS_PRECIOS NV ON (R.codigo=NV.codigo)
where DATEPART(HOUR,NV.fecha_hora)=14

update referencias
set valor_und3=r.valor_unitario,valor_unitario=NV.valor_unitario,impoconsumo=NV.impoconsumo
FROM referencias R INNER JOIN NUEVOS_PRECIOS NV ON (R.codigo=NV.codigo)
where DATEPART(HOUR,NV.fecha_hora)=14	zc+¿i	|	zcx+igzqyjuh