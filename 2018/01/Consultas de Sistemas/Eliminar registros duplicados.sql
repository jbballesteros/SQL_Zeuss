 
  update movimiento set valor=p.valor_total from movimiento d inner join  (
 select d.tipo,d.numero,valor_total from documentos d inner join movimiento m on m.tipo=d.tipo and m.numero=d.numero where 
 d.tipo='FVC1' and d.fecha='17/11/2015' and anulado=0 and m.valor<0 ) as p 
 on d.tipo=p.tipo and d.numero=p.numero where cuenta=130512 and d.tipo='FVC1' and d.fec='17/11/2015' and d.seq=1


select
select * from documentos_ped where fecha='13/11/2015' and bodega=7



select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
 where dl.tipo='FVC1' and dl.bodega=1 and fec='17/11/2015'
 group by dl.tipo,dl.numero,d.valor_total



 
 update documentos set valor_total=p.valor, valor_mercancia=p.valor from documentos d inner join (
 select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
 where dl.tipo='FV1' and dl.numero IN (2800, 2801, 2802, 2803, 2804, 2806, 2807, 2808, 2809, 2810 )
 group by dl.tipo,dl.numero,d.valor_total) as p on p.tipo=d.tipo and p.numero=d.numero
 where d.tipo='FV1' and d.numero IN (2800, 2801, 2802, 2803, 2804, 2806, 2807, 2808, 2809, 2810 )
 
 

  update movimiento set valor=p.valor from movimiento d inner join (
 select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
 where dl.tipo='FV1' and dl.numero IN (2800, 2801, 2802, 2803, 2804, 2806, 2807, 2808, 2809, 2810 )
 group by dl.tipo,dl.numero,d.valor_total) as p on p.tipo=d.tipo and p.numero=d.numero
 where d.tipo='FV1' and d.numero IN (2800, 2801, 2802, 2803, 2804, 2806, 2807, 2808, 2809, 2810 ) and d.valor>0
 
 


 
 

 
 
 
 
 
delete from documentos_lin
where id in (

select distinct a1.id from documentos_lin a1
    inner join documentos_lin a2
    on a1.numero_link = a2.numero_link
    and a1.id > a2.id and a1.codigo=a2.codigo and a1.cantidad=a2.cantidad and a1.valor_unitario=a2.valor_unitario
    where a1.tipo='FV1' and a1.numero IN (3008)

) and tipo='FV1' and numero IN (3008)




  update movimiento set valor=p.valor*-1 from movimiento d inner join (
 select dl.tipo,dl.numero,ROUND(SUM(cantidad*valor_unitario),0)valor,d.valor_total
 from documentos_lin dl inner join documentos d on d.numero=dl.numero and d.tipo =dl.tipo
 where dl.tipo='FV1' and dl.numero IN (3008 )
 group by dl.tipo,dl.numero,d.valor_total) as p on p.tipo=d.tipo and p.numero=d.numero
 where d.tipo='FV1' and d.numero IN (3008) and d.valor<0






UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;

update documentos set valor_total=5000,valor_mercancia=500
where fecha='17/09/2015' and bodega=1 




select * from documentos where tipo='FVC1' and fecha='17/11/2015' and bodega=5



