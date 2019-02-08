select DL.tipo,DL.numero,DL.cantidad,DD.tipo,DD.numero,DDL.codigo,DDL.cantidad
from documentos_lin DL 
LEFT JOIN estinsa.dbo.documentos DD ON (DL.tipo=DD.prefijo AND CAST(DL.numero AS varchar)=DD.documento)
LEFT JOIN estinsa.dbo.documentos_lin DDL ON (DD.tipo=DDL.tipo AND DD.numero=DDL.numero AND DL.cantidad=DDL.cantidad)
where DL.codigo=5006 and DL.nit=910041 AND DL.fec>='01/08/2018'

