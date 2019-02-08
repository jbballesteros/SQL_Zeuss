
  
  
  
alter view [dbo].[Facturas_Comisiones2017] as   
SELECT   fcd.id,  fcd.tipo, fcd.numero, fcd.TipoCruce, fcd.NumeroCruce, fcd.dcto2, fcd.fecha, fcd.fecha_real as fecha_rango,cast(fcd.fechacruce as date) as fecha_real,  
 fcd.codigo, r.descripcion as prod, case when  rt1.descripcion IN ('PREMIUM','COMPETITIVE','FLAGSHIP','OTROS') then   
 CASE WHEN fcd.dcto2>45 then 0.45 else  (-0.071 * (dcto2/100)+0.04) *100 end end as porc_comision_dcto,  
 (case when fcd.Dias>110 then 0 when fcd.Dias<=45 then  
  1+ (45- fcd.dias)*0.0111 when fcd.Dias between 46 and 65 then 0.75 + (65- fcd.dias)*0.0125  
 when fcd.Dias between 66 and 110 then 0.2 + (100- fcd.dias)*0.0157142857142857 else 0 end)*100  as porc_comisiones_dias, case when   
 rt1.descripcion ='COMPETITIVE' then 1 when rt1.descripcion ='PREMIUM' then 1.25 when rt1.descripcion ='FLAGSHIP' then 1.50 ELSE 1 end as porc_comision_categoria,  
                      fcd.Dias, d.nit, ter.nombres, ter.vendedor, case  when ter.vendedor between 100 and 199 then 'ANTIOQUIA'   
                      when ter.vendedor between 200 and 299 then 'EJE CAFETERO' when ter.vendedor between 300 and 399 then 'COSTA' when   
                      ter.vendedor between 400 and 499 then 'BOGOTA' else 'OTROS' end as sede, vend.nombres as nomvendedor,  
       case when vlr_facturado -total_devolucion<1000 then 0 when valor_total-valor_aplicado>0 then 0  else   
    case when  ((vlr_item - (vlr_item * dcto2 / 100))) - Total_DV<0 then 0 else     ((vlr_item - (vlr_item * dcto2 / 100))) - Total_DV end end AS Valor_Neto,   
    vlr_item, fcd.Registros,  
        d.valor_total - d.valor_aplicado AS saldo, d.prefijo, d.valor_total, vlr_facturado,  
                      fcd.Total_Dv, fcd.Total_NC, fcd.descuento_rc, YEAR(fcd.fechacruce) AS Año, MONTH(fcd.fechacruce) AS Mes,   
       d.valor_aplicado, rt1.descripcion as categoria  
FROM         dbo.FacturasPorCategoDias2013 AS fcd INNER JOIN  
                      dbo.documentos AS d ON fcd.numero = d.numero AND fcd.tipo = d.tipo   
                      inner join terceros as ter on d.nit=ter.nit left join terceros as vend on ter.vendedor=vend.nit  
                        
                       INNER JOIN  
                      dbo.referencias AS r ON r.codigo = fcd.codigo INNER JOIN  
                      dbo.referencias_tip1 AS rt1 ON rt1.tipo_1 = r.tipo_1  
       left join comisiones_dias as dias on fcd.dias =dias.dias  
    where     
       fcd.tipo<>'FAR'  and r.clase<>'5'    