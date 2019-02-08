DECLARE @TIPO AS VARCHAR(10)='FV1'
DECLARE @NUMERO AS INTEGER=3258


 
 
delete from documentos_lin
where id in (

select distinct a1.id from documentos_lin a1
    inner join documentos_lin a2
    on a1.numero_link = a2.numero_link
    and a1.id > a2.id and a1.codigo=a2.codigo and a1.cantidad=a2.cantidad and a1.valor_unitario=a2.valor_unitario
    where a1.tipo=@TIPO and a1.numero IN (@NUMERO)

) and tipo=@TIPO and numero IN (@NUMERO)




 
 update documentos set valor_total=p.valor, valor_mercancia=p.valor from documentos d inner join (
 select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
 where dl.tipo=@TIPO and dl.numero IN (@NUMERO )
 group by dl.tipo,dl.numero,d.valor_total) as p on p.tipo=d.tipo and p.numero=d.numero
 where d.tipo=@TIPO and d.numero IN (@NUMERO)
 f
 

  update movimiento set valor=p.valor from movimiento d inner join (
 select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
  where dl.tipo=@TIPO and dl.numero IN (@NUMERO )
 group by dl.tipo,dl.numero,d.valor_total) as p on p.tipo=d.tipo and p.numero=d.numero
 where d.tipo=@TIPO and d.numero IN (@NUMERO) and d.valor>0