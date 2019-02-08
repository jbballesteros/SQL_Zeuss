SELECT *
FROM v_descargatransaccionesinterfaz b
where CodigoEstacion=8 and DespachoFechaNegocio='21/11/2018'


SELECT *
FROM [v_atio_interfaz_ventas_prueba] b
where CodigoEstacion=8 and FechaNegocioFinal='21/11/2018'

select a.*,b.preciounitario,b.galones     
from [v_atio_interfaz_ventas_prueba] as a     
left join v_descargatransaccionesinterfaz as b on
 (a.codigoestacion=b.CodigoEstacion and a.fechanegociofinal=b.DespachoFechaNegocio 
 and a.numeroturno=b.TurnoEstacion and a.codigogrado=b.CodigoProducto  and      
a.NumeroManguera=b.DespachoSurtidor and a.SubcodigoEstacion=b.DespachoCodigoIsla ) 
WHERE a.codigoestacion=8 and a.FechaNegocioFinal='21/11/2018'