select codigo_dms                  
from  v_atio_interfaz_ventas_11                   
where FechaNegocioFinal='30/01/2019' and codigoestacion=11                    
and galones is not null and             
  vendedor  in (select nit  from terceros where nit<10000) and vendedor not in ('000001')                    
group by codigo_dms

SELECT     row_number() OVER (ORDER BY codigo_dms ASC) AS seq,cta7,900625898,sum(preciounitario*t.galones)*-1,0,sum(preciounitario*t.galones)*-1                    
from                      
v_atio_interfaz_ventas_11 as t  
inner join      referencias as a on codigo_dms=a.codigo                    
inner join referencias_con as b on a.contable=b.contable inner join tipo_transacciones_mod_nuevo as c                    
on b.contable=c.perfil_contable where c.tipo='VC11' AND A.codigo=codigo_dms AND BODEGA=0                    
and codigoestacion=11 and numeroturno=2                    
and   (CASE WHEN ISNUMERIC(vendedor )=1 THEN CAST(vendedor as decimal(18,0)) ELSE 0 END)=1114 and FechaNegocioFinal='30/01/2019' and SubcodigoEstacion=1                    
and galones is not null                    
group by codigo_dms,cta7     