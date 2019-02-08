INSERT INTO  DOCUMENTOS (sw, tipo, numero, nit, fecha, condicion, vencimiento, valor_total, iva, retencion, retencion_causada, retencion_iva, retencion_ica, descuento_pie, fletes, iva_fletes, costo, vendedor, valor_aplicado, 
                      anulado, modelo, documento, notas, usuario, pc, fecha_hora, retencion2, retencion3, bodega, impoconsumo, descuento2, duracion, concepto, vencimiento_presup,  
                      centro_doc, valor_mercancia,  codigo_direccion)
SELECT  21,'ND',(ROW_NUMBER() OVER(ORDER BY p.NIT)+6751) ,P.NIT, '31/03/2015',1,'31/03/2015',ROUND(SUM((P.ABRIL+P.FEBRERO22)-P.VALOR_TOTAL),0),0,0,0,0,0,0,0,0,0,VENDEDORTER,0,0,34,P.NIT,'AJUSTE A PRECIO DE COMBUSTIBLE SOLDICOM CORRIENTE Y EXTRA','AUTOMATICO','SQLSERVER',GETDATE(),0,0,1,0,0,150,14,'23/02/2015',1,ROUND(SUM((P.ABRIL+P.FEBRERO22)-P.VALOR_TOTAL),0),0
FROM(

SELECT ZL.ano AÑO,ZL.mes MES,ZL.Dia	DIA,tipo TIPO, numero NUMERO,nit NIT,codigo CODIGO,descripcion PRODUCTO, can_ventas-can_devolu CANTIDAD, valor_unitario VLR_UNITARIO, (cantidad*valor_unitario) VALOR_TOTAL,
ISNULL (CASE WHEN fec BETWEEN '01/02/2015' AND '22/02/2015' THEN (CASE WHEN subgrupo2=1 THEN ((can_ventas-can_devolu) * 3.01)ELSE ((can_ventas-can_devolu) * 3.46) END)END,0) FEBRERO22,
ISNULL (CASE WHEN fec BETWEEN '23/02/2015' AND '08/04/2015' THEN (CASE WHEN subgrupo2=1 THEN ((can_ventas-can_devolu) * 3.13)ELSE ((can_ventas-can_devolu) * 3.60) END)END,0) ABRIL,ZL.vendedorter VENDEDORTER
FROM Zeuss_Lin_Ventas ZL
WHERE fec BETWEEN '01/04/2015' AND '31/03/2015' and subgrupo2 in (1,19) ) AS P 
INNER JOIN terceros T ON (T.nit = P.NIT)
GROUP BY p.nit, nombres,P.VENDEDORTER
