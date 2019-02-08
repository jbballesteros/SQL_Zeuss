SELECT  1 as order_id,1 as sw,
 codigositio  as bodega,
 1 as numero, a.nit,a.vendedor,DespachoFechaNegocio ,1 as condicion,1 as dias_validez,0 as descuento_pie,
 volumendispensado*preciounitariodispensado as valor_total, 
  fechahora as  fecha_hora,0,'Vale importador automaticamente Interfaz Atio' as notas,'DMS2' AS usuario,'SQLZEUSS' as  pc,
 null as duracion,null as concepto,null as moneda,null as despacho, getdate() as fecha_hora_entrega,
  null as  nit_destino, null as codigo_direccion,  null as abono, null as telefono, null as emergencia, null as documento,
   null as listaprecios, null as fletes, null as iva_fletes, despachocodigoisla,0 as vendedori,placavehiculo,a.id as id,
   codigoproducto,volumendispensado,
   preciounitariodispensado,0 as iva,despachosurtidor, case when b.concepto_2='01' then 'prepago' else 'postpago' end as tipo_cuenta  
   from AtionetInterfacesZeuss.dbo.V_Atio_Interfaz_Creditos as a inner join terceros as b on a.nit=b.nit
where DespachoFechaNegocio='15/11/2016' and b.concepto_2 in ('01','02')  and codigositio=4
