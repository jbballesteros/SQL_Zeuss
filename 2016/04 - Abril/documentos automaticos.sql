--**********INSERTAR DOCUMENTOS AUTOMATICOS******************--
insert into documentos( sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, 
 retencion_iva, retencion_ica, descuento_pie, fletes, 
iva_fletes, costo, vendedor, valor_aplicado, anulado, modelo, documento, notas, usuario, 
pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, 
duracion, concepto, vencimiento_presup, prefijo, centro_doc, valor_mercancia)


SELECT 21,'ND',ROW_NUMBER()OVER ( ORDER BY P.NIT)+7325,P.NIT,'05/04/2016',0,'05/04/2016',P.VALOR,0,0,0,0,0,0,0,0,0,T.vendedor,0,0,31,'',
'DIFERENCIA EN PRECIO POR CAMBIO DE ESTRUCTURA MINISTERIO DE MINAS.','AUTOMATICO','SQLZEUSS',GETDATE(),0,0,1,0,0,60,25,'05/04/2016','ND',0,P.VALOR
FROM (


SELECT DL.nit,ROUND(SUM((DL.valor_unitario-R.valor_unitario)*DL.cantidad),0)*-1 VALOR
FROM documentos_lin DL INNER JOIN referencias R ON (DL.codigo=R.codigo)
WHERE DL.fec='05/04/2016' AND R.valor_unitario<>DL.valor_unitario AND DL.valor_unitario<>0 AND R.valor_unitario<>0 AND sw=1
GROUP BY DL.nit
HAVING  ROUND(SUM((DL.valor_unitario-R.valor_unitario)*DL.cantidad),0)<0) AS P
INNER JOIN terceros T ON (T.nit=P.nit)


