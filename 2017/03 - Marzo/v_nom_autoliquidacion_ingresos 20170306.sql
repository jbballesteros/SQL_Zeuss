CREATE  VIEW [dbo].[v_nom_autoliquidacion_ingresos]
as
SELECT distinct  pp.ano,pp.mes,sucursal=yp.sucursal_salud,yp.nit,nro_contratos=count (nit),yp.contrato,
       fecha_ingreso_ini=(yp.fecha_ingreso),
       dias_cotizar=(case when yp.fecha_retiro is null then
                              (30 - day(yp.fecha_ingreso) + 1) else
                     case when (year(yp.fecha_retiro)=pp.ano and month(yp.fecha_retiro)=pp.mes) then
                               (day(yp.fecha_retiro) - day(yp.fecha_ingreso) + 1) else
                               (30 - day(yp.fecha_ingreso) + 1)
                     end end )
FROM y_personal_contratos as yp JOIN
     y_periodos           as pp ON pp.nomina=yp.nomina
WHERE  ((year(yp.fecha_ingreso)=pp.ano and month(yp.fecha_ingreso)=pp.mes))
GROUP BY pp.ano,pp.mes,yp.sucursal_salud,yp.nit,yp.fecha_ingreso,yp.fecha_retiro,yp.contrato


GO

