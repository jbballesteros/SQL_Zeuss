SELECT tipo,numero,sw,'01' as  IdConceptoImpuesto,0 as TaxeEvidenceIndicator,
 round(	sum( case when a.subgrupo2 in ('35') THEN (b.valor_und1 * a.cantidad) end),0)
  as Base,b.und_1 as Porcentaje,sum( vlr_ventas+ vlr_devolu) as Valor 
from zeuss.dbo.Zeuss_Lin_Ventas as a inner join zeuss.dbo.referencias as b on a.codigo= b.codigo
WHERE a.grupo='1' and a.subgrupo2  in ('35')  and a.fec>='01/08/2018'  and a.tipo='FV' AND A.numero=201209
group by tipo,numero,sw, b.und_1	

union
	select a.tipo,a.numero, a.sw, a.IdConceptoImpuesto,  0 as TaxeEvidenceIndicator,  
	round(sum(CostoTotalSinImpuestos),0) as Base,
	PORCENTAJEIVA as Porcentaje ,round(sum(Valor),0) as Valor 
	from zeuss.dbo.v_facturaelectronica  as a 
						 left join [dbo].[Factura_electronica] as b on a.tipo= b.tipo
						 and a.numero= b.numero and a.sw= b.sw 
						  where a.FECHA_DOCUMENTO>='01/08/2018' and a.tipo='FV' AND A.numero=201209
						  group by PORCENTAJEIVA, a.tipo,a.numero, a.sw,a.IdConceptoImpuesto
						  having sum(Valor)<>0
						   ORDER By a.sw,a.tipo,a.numero