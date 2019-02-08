USE [zeuss]
GO

/****** Object:  View [dbo].[v_inventario_real_plantas_prod]    Script Date: 12/27/2016 20:36:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  ALTER view [dbo].[v_inventario_real_plantas_prod] as
select bodega, producto_componente, sede, descripcion,SUBSTRING(stock2, 1, CHARINDEX('.', stock2) - 1) AS stock, costo_real_stock,
SUBSTRING(costo_stock2, 1, CHARINDEX('.', costo_stock2) - 1) AS costo_stock,fecha_medida from
(select bodega, producto_componente, sede,Descripcion, CONVERT(VARCHAR(20), CAST(stock AS MONEY), 1) 
 AS stock2, CONVERT(VARCHAR(20), CAST(costo_stock AS MONEY), 1)  as costo_stock2,fecha_medida,costo_stock as costo_real_stock  from
( 
select p.sede as bodega,  p.producto_componente, 'GIRARDOTA' as sede, 
 case when p.descripcion='DIESEL CONSUMO INTERNO' then 'DIESEL' ELSE p.Descripcion end as Descripcion, 

sum( GalonesNeto) as stock, sum(GalonesNeto * Costo_Unitario)
   as costo_stock, '' as codigo_dms,
fecha AS fecha_medida
  from operaciones.dbo.v_inventario_diario_operaciones i
inner join operaciones.dbo.Maestro_Tanques MT on i.Codigo_Tanque = MT.codigo
Inner join operaciones.dbo.Producto P on MT.producto = p.Cod_Producto  left join referencias_costo as cost
on p.producto_componente=cost.codigo and cost.mes=month(getdate())
where  Codigo_Dms not in ('13','NA') 
group by fecha,case when p.descripcion='DIESEL CONSUMO INTERNO' then 'DIESEL' ELSE p.Descripcion end,p.producto_componente,p.sede

union
SELECT a.sede as bodega, b.producto_componente, c.descripcion as sede,b.Descripcion, sum(a. galones),  sum(a. galones * cost.costo_unitario) as costo,'',
cast(fecha_medida as date) AS fecha_medida from  operaciones. [dbo].[inventario_plantas]
 as a inner join  operaciones.dbo.Producto
 as b on a.codigo_producto=b.Cod_Producto inner join bodegas as c on
  a.sede=c.bodega  inner join referencias_costo as cost
on b.producto_componente=cost.codigo and cost.mes=month(getdate())
  WHERE       (anula IS NULL) 
    group by c.descripcion,cast(fecha_medida as date),b.Descripcion,b.producto_componente,a.sede) as pp) as hh

GO


