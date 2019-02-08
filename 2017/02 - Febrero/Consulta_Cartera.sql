SELECT T.nit CODIGO, T.nit_real NIT, T.nombres NOMBRE, T.razon_comercial RAZON_COMERCIAL, T.mail CORREO, e.nombres as vendedor, real.cupo_credito,
D.TIPO, D.NUMERO, D.FECHA, D.VENCIMIENTO,
DATEDIFF(D,D.VENCIMIENTO,GETDATE()) -ISNULL(t.dias_gracia,0) DIAS_VENCIDO,
case when d.sw in ( 1,6,4,21,22,31) then D.valor_total else D.valor_total *-1 end  TOTAL,  case when d.sw in ( 1,6,4,21,22,31) 
 then  (D.valor_total-D.valor_aplicado) else  (D.valor_total-D.valor_aplicado) *-1 end 
as PENDIENTE,d.notas NOTAS
FROM documentos D
LEFT JOIN Zeuss_FacturasXCIS F  ON (D.tipo=F.TIPO AND D.numero=F.NUMERO) 
INNER JOIN terceros T ON (T.nit = D.nit) 
left join terceros as e on t.vendedor=e.nit
inner join terceros as real on t.nit_real=real.nit
WHERE  D.sw IN(1,2,5,21,22,23)AND (D.valor_total-D.valor_aplicado)<>0  
AND T.nit_real=900310074
GROUP BY T.nit ,d.sw, T.nit_real , T.nombres , T.razon_comercial,T.mail , D.TIPO, D.NUMERO, D.FECHA, D.VENCIMIENTO,D.valor_total,D.valor_aplicado,t.cupo_credito, 
d.bodega,e.nombres,real.cupo_credito,t.dias_gracia,d.notas 
ORDER BY T.nit,D.tipo,D.numero
