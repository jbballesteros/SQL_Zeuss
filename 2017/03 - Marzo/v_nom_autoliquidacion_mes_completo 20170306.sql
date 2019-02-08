CREATE  VIEW [dbo].[v_nom_autoliquidacion_mes_completo]
as
SELECT distinct  pp.ano,pp.mes,sucursal=yp.sucursal_salud,yp.nit,yp.contrato,nro_contratos=count (nit),
       fecha_ingreso_ini=(yp.fecha_ingreso),
       fecha_retiro_fin=(yp.fecha_retiro),
       dias_cotizar=30
FROM y_personal_contratos as yp JOIN
     y_periodos           as pp ON pp.nomina=yp.nomina
WHERE yp.estado='A' AND
      (not ((year(yp.fecha_ingreso)=pp.ano and month(yp.fecha_ingreso)=pp.mes))) and
      ((not ((year(yp.fecha_retiro)=pp.ano and month(yp.fecha_retiro)=pp.mes))) or yp.fecha_retiro is null)
GROUP BY pp.ano,pp.mes,yp.sucursal_salud,yp.nit,yp.contrato,yp.fecha_ingreso,yp.fecha_retiro,yp.estado

