
CREATE VIEW [dbo].[v_nom_autoliquidacion_retiros]
as
SELECT distinct  pp.ano,pp.mes,sucursal=yp.sucursal_salud,yp.nit,yp.contrato,nro_contratos=count (nit),
       fecha_retiro_fin=(yp.fecha_final_salud),
       dias_cotizar=(day(yp.fecha_final_salud)),fecha_real_retiro=yp.fecha_retiro
FROM y_personal_contratos as yp JOIN
     y_periodos           as pp ON pp.nomina=yp.nomina
WHERE  (not(yp.fecha_final_salud is null)) and
           (year(yp.fecha_final_salud)=pp.ano and month(yp.fecha_final_salud)=pp.mes)
GROUP BY pp.ano,pp.mes,yp.sucursal_salud,yp.nit,yp.contrato,yp.fecha_ingreso,yp.fecha_final_salud,yp.fecha_retiro


GO



/****** Object:  View [dbo].[v_nom_autoliquidacion_unificar]    Script Date: 05/Mar/2017 9:04:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


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


GO



CREATE VIEW [dbo].[v_nom_autoliquidacion_nit_unificar_decreto_2388]
as

/****** Vacaciones ******/

SELECT DISTINCT orden='1',tipo=(case when cpto.clase_concepto=9 or cpto.clase_concepto=11 then 'VAC' end ),
       ano=year(liq.fecha),mes=month(liq.fecha),nomina=max(liq.nomina),liq.nit,liq.contrato,
           fecha_ini=(liq.fecha_ini),
           fecha_fin=(liq.fecha_fin),
           concepto=(select p.concepto from y_personal_contratos as c join y_parametros as p on p.nomina=c.nomina and p.tipo_contrato=c.tipo_contrato and p.tipo_salario=c.tipo_salario and p.tipo_parametro=5 and p.ano=liq.ano where c.contrato=liq.contrato),
           liq.numero,
       dias =  ( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end),
       valor = isnull(sum(liq.valor),0),
       dias_total = sum(isnull(liq.dias,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato and year(liq.fecha)=v.ano and month(liq.fecha)=v.mes JOIN
     y_conceptos_nom                as cpto on cpto.concepto=liq.concepto
WHERE cpto.clase_concepto IN (9,11) and liq.turno<>50 and (year(liq.fecha_ini) = v.ano and month(fecha_ini)=v.mes and year(liq.fecha_fin) = v.ano and month(fecha_fin)=v.mes)
GROUP BY (case when cpto.clase_concepto=9 or cpto.clase_concepto=11 then 'VAC' end ),
      liq.ano,year(liq.fecha),month(liq.fecha),liq.nit,liq.contrato,liq.numero,liq.fecha_ini,liq.fecha_fin
HAVING (( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end) > 0)  and (isnull(sum(liq.valor),0)) > 0
UNION
/****** licencias remuneradas y no remuneradas ******/
SELECT DISTINCT orden='2',tipo=( case when cpto.clase_concepto=4 then 'LR' else
                      case when cpto.clase_concepto=24 or cpto.clase_concepto = 27 then 'SLN'
                      end end ),
       liq.ano,liq.mes,nomina=max(liq.nomina),liq.nit,v.contrato,
           fecha_ini=(liq.fecha_ini),
           fecha_fin=(liq.fecha_fin),
           liq.concepto,
           liq.numero,
       dias =  ( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end),
       valor = isnull(sum(liq.valor),0),
       dias_total = sum(isnull(liq.dias,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato and year(liq.fecha)=v.ano and month(liq.fecha)=v.mes JOIN
         y_conceptos_nom                as cpto on cpto.concepto=liq.concepto
WHERE cpto.clase_concepto IN (4,24,27) and liq.turno<>50 and (year(liq.fecha_ini) = v.ano and month(fecha_ini)=v.mes and year(liq.fecha_fin) = v.ano and month(fecha_fin)=v.mes)
GROUP BY (case when cpto.clase_concepto=4 then 'LR' else
          case when cpto.clase_concepto=24 or cpto.clase_concepto = 27 then 'SLN'
         end end ),
                 liq.ano,liq.mes,liq.nit,v.contrato,liq.concepto,liq.numero,liq.fecha_ini,liq.fecha_fin
HAVING (( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end) >= 1)
UNION
/****** incapacidades menos 180 dias y pagadas en el mismo mes ******/
SELECT DISTINCT orden='3',tipo=( case when cpto.clase_concepto=12 OR cpto.clase_concepto=33 then 'INC' end ),
       v.ano,v.mes,nomina=max(liq.nomina),v.nit,v.contrato,
           fecha_ini=(liq.fecha_ini),
           fecha_fin=(liq.fecha_fin),
           concepto=0,liq.numero,
       dias =  ( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end),
       valor = isnull(sum(liq.valor),0) ,
       dias_total = sum(isnull(liq.dias,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq  ON liq.nit=v.nit and liq.contrato=v.contrato and year(liq.fecha)=v.ano and month(liq.fecha)=v.mes JOIN
         y_conceptos_nom                as cpto ON cpto.concepto=liq.concepto join
         y_seguros                      as seg  ON seg.nomina=liq.nomina
WHERE cpto.clase_concepto IN (12,33) and liq.turno<>50 and (year(liq.fecha_ini) = v.ano and month(fecha_ini)=v.mes and year(liq.fecha_fin) = v.ano and month(fecha_fin)=v.mes)
GROUP BY ( case when cpto.clase_concepto=12 OR cpto.clase_concepto=33 then 'INC' end ),
       v.ano,v.mes,v.nit,v.contrato,liq.numero,liq.fecha_ini,liq.fecha_fin
HAVING (( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end) >= 1)
UNION
/****** incapacidades igual mas 180 dias cuando no son liquidadas ******/
SELECT DISTINCT orden='4',tipo='INC',
       v.ano,v.mes,nomina=max(liq.nomina),liq.nit,liq.contrato,
           fecha_ini=(select MIN(cal.fecha) from y_calendario as cal where year(fecha)=v.ano and month(fecha)=v.mes),
           fecha_fin=(select MAX(cal.fecha) from y_calendario as cal where year(fecha)=v.ano and month(fecha)=v.mes),
           concepto=0,numero=0,
       dias =  30,
       valor = (max(seg.minimo_salud)) ,
       dias_total = 30
FROM  y_personal_contratos  as liq JOIN
      y_periodos            as v   ON v.nomina=liq.nomina JOIN
         y_seguros              as seg ON seg.nomina=liq.nomina
WHERE liq.turno=50 and liq.estado<>'R'
GROUP BY  v.ano,v.mes,liq.nit,liq.contrato
UNION
/****** Ausencias extemporaneas  ******/
SELECT DISTINCT orden='5',tipo='SAL' , v.ano,v.mes,nomina=max(liq.nomina),v.nit,contrato=max(v.contrato),
       fecha_ini =  min(liq.fecha),
       fecha_fin =  max(liq.fecha),
       concepto=0,numero=0,
       dias =  ( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ),
       valor = sum(isnull(liq.valor,0)),
       dias_total =  sum(isnull(v.dias_cotizar,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato  and liq.ano=v.ano and liq.mes=v.mes JOIN
     y_conceptos_nom                as cpto ON cpto.concepto=liq.concepto
WHERE (cpto.clase_concepto in (4,9,11,12,33) and liq.ano = v.ano and liq.mes=v.mes and
          (year(liq.fecha_ini) <> liq.ano or month(liq.fecha_ini) <> liq.mes or year(liq.fecha_fin) <> liq.ano or month(liq.fecha_fin) <> liq.mes ))
GROUP BY v.ano,v.mes,v.nit
HAVING ((( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ) >= 1)  or ((sum(v.dias_cotizar)) > 0)) and
         (sum(isnull(liq.valor,0)) > 0 )

UNION
/****** Salarios  ******/

SELECT DISTINCT orden='6',tipo='SAL' , v.ano,v.mes,nomina=max(liq.nomina),v.nit,contrato=max(v.contrato),
       fecha_ini =  min(liq.fecha),
       fecha_fin =  max(liq.fecha),
       concepto=0,numero=0,
       dias =  ( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ),
       valor = sum(isnull(liq.valor,0)),
       dias_total =  sum(isnull(v.dias_cotizar,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato  and liq.ano=v.ano and liq.mes=v.mes JOIN
     y_conceptos_nom                as cpto ON cpto.concepto=liq.concepto
WHERE (cpto.clase_concepto IN (1,2,16) and liq.turno<>50)
GROUP BY v.ano,v.mes,v.nit
HAVING ((( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ) >= 1)  or ((sum(v.dias_cotizar)) > 0)) and
         (sum(isnull(liq.valor,0)) > 0 )
UNION
/****** Empleados retirados de meses anteriore y pagados en el mes actual ******/

SELECT DISTINCT orden='7',tipo='SAL' , v.ano,v.mes,nomina=max(liq.nomina),v.nit,contrato=max(v.contrato),
       fecha_ini =  min(liq.fecha_final_salud),
       fecha_fin =  max(liq.fecha_final_salud),
       concepto=0,numero=0,
       dias =  sum(isnull(v.dias_cotizar,0)),
       valor = 0,
       dias_total =  sum(isnull(v.dias_cotizar,0))
FROM v_nom_autoliquidacion_unificar as v LEFT JOIN
     y_personal_contratos           as liq ON liq.nit=v.nit and liq.contrato=v.contrato  and liq.turno<>50
WHERE v.tipo='retiros' and liq.fecha_retiro <> liq.fecha_final_salud
GROUP BY v.ano,v.mes,v.nit
HAVING (sum(v.dias_cotizar) > 0 )

GO




