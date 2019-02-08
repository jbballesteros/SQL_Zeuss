CREATE VIEW [dbo].[v_nom_autoliquidacion_unificar]
as
SELECT tipo='ingresos',pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,nro_contratos= max(pp.nro_contratos),
       dias_cotizar = sum(pp.dias_cotizar),fecha=pp.fecha_ingreso_ini
FROM v_nom_autoliquidacion_ingresos as pp
WHERE pp.nro_contratos=1
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,pp.fecha_ingreso_ini
UNION
SELECT tipo='retiros',pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,nro_contratos=max(pp.nro_contratos),
       dias_cotizar = sum(pp.dias_cotizar ),fecha=pp.fecha_retiro_fin
FROM v_nom_autoliquidacion_retiros      as pp
WHERE pp.nro_contratos=1
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,pp.fecha_retiro_fin
UNION
SELECT tipo='varios_completos',pp.ano,pp.mes,pp.sucursal,pp.nit,contrato=min(pp.contrato),nro_contratos=count (nit),
       dias_cotizar = sum(pp.dias_cotizar),fecha=pp.fecha_retiro_fin
FROM v_nom_autoliquidacion_mes_completo  as pp
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.fecha_retiro_fin
HAVING (count (pp.nit) > 1)
UNION
SELECT tipo='un_solo_contrato',pp.ano,pp.mes,pp.sucursal,pp.nit,contrato=min(pp.contrato),nro_contratos=count (nit),
       dias_cotizar = sum(pp.dias_cotizar),fecha=pp.fecha_retiro_fin
FROM v_nom_autoliquidacion_mes_completo  as pp
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.fecha_retiro_fin
HAVING (count (pp.nit) = 1)

