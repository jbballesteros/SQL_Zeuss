



CREATE view [dbo].[v_nom_autoliquidacion_nit] as
SELECT DISTINCT 
                      autt.ano, autt.mes, autt.sucursal, autt.secuencia, autt.nro_autorizacion, autt.nit, autt.contrato, MAX(ter.tipo_identificacion) AS tipo_identificacion, MAX(ter.digito) 
                      AS digito, MAX(autt.ing_grl) AS ing_grl, MAX(autt.ret_grl) AS ret_grl, MAX(autt.tda_eps) AS tda_eps, MAX(autt.taa_eps) AS taa_eps, MAX(autt.tda_afp) AS tda_afp, 
                      MAX(autt.taa_afp) AS taa_afp, MAX(autt.vsp_grl) AS vsp_grl, MAX(autt.vte_grl) AS vte_grl, MAX(autt.vst_grl) AS vst_grl, autt.sln_grl, MAX(autt.ige_eps) AS ige_eps, 
                      MAX(autt.lma_eps) AS lma_eps, MAX(autt.irp_arp) AS irp_arp, MAX(autt.vac_grl) AS vac_grl, MAX(autt.avp_afp) AS avp_afp, MAX(autt.vct_arp) AS vct_arp, 
                      SUM(ISNULL(autt.dias_suspen_afp, 0)) AS dias_suspen_afp, MAX(autt.dias_inca_acc_arp) AS dias_Inca_acc_arp, MAX(autt.nro_auto_incap_acc_arp) 
                      AS nro_auto_incap_acc_arp, MAX(autt.vr_auto_incap_acc_arp) AS vr_auto_incap_acc_arp,
                          (SELECT     codigo_arp
                            FROM          dbo.y_fondos AS farp
                            WHERE      (MAX(autt.fondo_arp) = fondo)) AS codigo_arp,
                          (SELECT     codigo_arp
                            FROM          dbo.y_fondos AS farp2
                            WHERE      (MAX(per.fondo_arp_new) = fondo)) AS codigo_arp_new,
                          (SELECT     codigo_pension
                            FROM          dbo.y_fondos AS fpen
                            WHERE      (MAX(autt.fondo_pension_afp) = fondo)) AS codigo_pension,
                          (SELECT     codigo_pension
                            FROM          dbo.y_fondos AS fpen2
                            WHERE      (MAX(per.fondo_pension_new) = fondo)) AS codigo_pension_new,
                          (SELECT     codigo_salud
                            FROM          dbo.y_fondos AS fsal
                            WHERE      (MAX(autt.fondo_salud_eps) = fondo)) AS codigo_salud,
                          (SELECT     codigo_salud
                            FROM          dbo.y_fondos AS fsal2
                            WHERE      (MAX(per.fondo_salud_new) = fondo)) AS codigo_salud_new, MAX(autt.tarifa_afp) AS Tarifa_afp, MAX(autt.dias_pension_afp) AS dias_pension_afp, 
                      MAX(autt.dias_salud_eps) AS dias_salud_eps, MAX(autt.dias_arp) AS dias_arp, MAX(autt.basico_mes_grl) AS basico_mes_grl, MAX(autt.ibc_pension_afp) 
                      AS ibc_pension_afp, MAX(autt.ibc_salud_eps) AS ibc_salud_eps, MAX(autt.ibc_arp) AS ibc_arp, MAX(autt.vr_pension_afp) AS vr_pension_afp, 
                      MAX(autt.vr_vol_emp_afp) AS vr_vol_emp_afp, MAX(autt.vr_vol_pat_afp) AS vr_vol_pat_afp, MAX(autt.vr_fsp_afp) AS vr_fsp_afp, MAX(autt.vr_fsp_subs) 
                      AS vr_fsp_subs, MAX(autt.vr_no_retfte_afp) AS vr_no_retfte_afp, MAX(autt.tarifa_eps) AS Tarifa_eps, MAX(autt.vr_salud_eps) AS vr_salud_eps, MAX(autt.vr_upc_eps) 
                      AS vr_upc_eps, MAX(autt.nro_auto_incap_eg_eps) AS nro_auto_incap_eg_eps, MAX(autt.vr_auto_incap_eg_eps) AS vr_auto_incap_eg_eps, 
                      MAX(autt.nro_auto_incap_mat_eps) AS nro_auto_incap_mat_eps, MAX(autt.vr_auto_incap_mat_eps) AS vr_auto_incap_mat_eps, MAX(autt.tarifa_arp) AS Tarifa_arp, 
                      MAX(autt.nomina_grl) AS centro_trab_arp, MAX(autt.vr_arp) AS vr_arp, MAX(ISNULL(par.porc_caja, 0.0)) AS Tarifa_caja, MAX(ISNULL(par.porc_sena, 0.0)) 
                      AS Tarifa_sena, MAX(ISNULL(par.porc_icbf, 0.0)) AS Tarifa_icbf, 0.5 AS Tarifa_esap, 1.0 AS Tarifa_educ, MAX(ISNULL(par.valor_caja, 0)) AS vr_caja, 
                      MAX(ISNULL(par.valor_sena, 0)) AS vr_sena, MAX(ISNULL(par.valor_icbf, 0)) AS vr_icbf, 0 AS vr_esap, 0 AS vr_educ,
                          (SELECT     TOP (1) codigo_caja
                            FROM          dbo.y_fondos AS f
                            WHERE      (nro_nit_autol = MAX(par.nit_cajac)) AND (fondo_caja = 1)) AS codigo_caja, SUM(ISNULL(par.devengados_caja, 0)) AS ibc_caja, 
                      SUM(ISNULL(par.devengados_sena, 0)) AS ibc_sena_icbf, MAX(autt.basico_mes_grl) AS ibc_gral, MAX(per.nit_cajac) AS nit_cajac, MAX(per.nit_sena) AS nit_sena, 
                      MAX(per.nit_icbf) AS nit_icbf, MAX(per.tipo_cotizante) AS tipo_cotizante, MAX(per.subtipo_cotizante) AS subtipo_cotizante, MAX(per.departamento) AS departamento,
                          (SELECT     porc_pension
                            FROM          dbo.y_oficios AS o
                            WHERE      (oficio = MAX(autt.oficio_grl))) AS porc_pension_oficio, MAX(autt.ciudad_grl) AS ciudad, MAX(per.extranjero) AS extranjero, ISNULL(per.Es_pensionado, 0) 
                      AS es_pensionado, MAX(per.sucursal_arp) AS sucursal_arp,
                          (SELECT     aproxima_valor
                            FROM          dbo.y_fondos AS f
                            WHERE      (fondo = MAX(autt.fondo_pension_afp))) AS aproxima_pension,
                          (SELECT     aproxima_valor
                            FROM          dbo.y_fondos AS f
                            WHERE      (fondo = MAX(autt.fondo_salud_eps))) AS aproxima_salud,
                          (SELECT     aproxima_valor
                            FROM          dbo.y_fondos AS f
                            WHERE      (fondo = MAX(autt.fondo_arp))) AS aproxima_arp, MAX(autt.centro_grl) AS centro_grl, MAX(autt.oficio_grl) AS oficio_grl, MAX(autt.planta_grl) AS planta_grl, 
                      MAX(autt.nomina_grl) AS nomina_grl, MAX(autt.vr_cotiza_plano_afp) AS vr_cotiza_plano_afp, MAX(autt.vr_cotiza_plano_eps) AS vr_cotiza_plano_eps, 
                      MAX(autt.vr_cotiza_plano_arp) AS vr_cotiza_plano_arp, MAX(autt.nomina_grl) AS nomina, MAX(autt.planta_grl) AS planta, (CASE WHEN year(MAX(per.fecha_salud)) 
                      = autt.ano AND month(MAX(per.fecha_salud)) = autt.mes THEN MAX(per.fecha_salud) ELSE CASE WHEN year(MAX(per.fecha_pension)) = autt.ano AND 
                      month(MAX(per.fecha_pension)) = autt.mes THEN MAX(per.fecha_pension) ELSE CASE WHEN year(MAX(per.fecha_arp)) = autt.ano AND month(MAX(per.fecha_arp)) 
                      = autt.mes THEN MAX(per.fecha_arp) END END END) AS fecha_ingreso, (CASE WHEN year(MAX(per.fecha_final_salud)) = autt.ano AND 
                      month(MAX(per.fecha_final_salud)) = autt.mes THEN MAX(per.fecha_final_salud) ELSE CASE WHEN year(MAX(per.fecha_final_pension)) = autt.ano AND 
                      month(MAX(per.fecha_final_pension)) = autt.mes THEN MAX(per.fecha_final_pension) ELSE CASE WHEN year(MAX(per.fecha_final_arp)) = autt.ano AND 
                      month(MAX(per.fecha_final_arp)) = autt.mes THEN MAX(per.fecha_final_arp) END END END) AS fecha_retiro, MAX(seg.maximo_pension) AS maximo_pension, 
                      MAX(seg.maximo_salud) AS maximo_salud, MAX(seg.maximo_fsp) AS maximo_fsp, MAX(seg.maximo_atep) AS maximo_atep, MAX(seg.minimo_pension) 
                      AS minimo_pension, MAX(seg.minimo_salud) AS minimo_salud, MAX(seg.minimo_fsp) AS minimo_fsp, MAX(seg.minimo_atep) AS minimo_atep,
                          (SELECT     TOP (1) aproxima_valor
                            FROM          dbo.y_fondos AS f
                            WHERE      (nro_nit_autol = MAX(par.nit_cajac)) AND (fondo_caja = 1)) AS aproxima_caja, SUM(ISNULL(autt.vr_suspen, 0)) AS vr_suspen, 
                      SUM(ISNULL(autt.vr_suspen_afp, 0)) AS vr_suspen_afp, SUM(ISNULL(autt.vr_suspen_eps, 0)) AS vr_suspen_eps, autt.tipo_planilla, per.tipo_salario, 
                      cpto.porc_basico AS tarifa_salud_empresa, par.CREE,autt.fec_ingreso,autt.fec_retiro,autt.fec_ini_vsp,autt.fec_ini_sln,autt.fec_fin_sln,
                      autt.fec_ini_ige,autt.fec_fin_ige,autt.fec_ini_lma,autt.fec_fin_lma,autt.fec_ini_vaclr,autt.fec_fin_vaclr,autt.fec_ini_vct,autt.fec_fin_vct,
                      autt.fec_ini_irl,autt.fec_fin_irl,ibc_otro_para=(case when sum(isnull(par.valor_sena,0)) > 0 then isnull(SUM(ISNULL(par.devengados_sena, 0)),0) else 0 end),autt.horas_laboradas,autt.secuencia_empl,
                      dias_inca_gral_eps=max(dias_inca_gral_eps),dias_inca_mate_eps=max(dias_inca_mate_eps),
                      dias_inca_prof_eps=max(dias_inca_prof_eps),dias_inca_provi_eps=max(dias_inca_provi_eps),dias_vacaci_eps=max(dias_vacaci_eps),
					  dias_parafiscal = max(dias_parafiscal),dias_suspen_eps = max(dias_suspen_eps),autt.tipo_novedad
FROM         dbo.y_autoliquidaciones AS autt LEFT OUTER JOIN
                      dbo.y_parafiscales AS par ON isnull(par.tipo_planilla,'E') = autt.tipo_planilla AND par.contrato = autt.contrato AND par.nit = autt.nit AND par.ano = autt.ano and par.secuencia_empl = autt.secuencia_empl and par.tipo_novedad = autt.tipo_novedad AND 
                      par.mes = autt.mes AND par.sln = autt.sln_grl INNER JOIN
                      dbo.y_personal_contratos AS per ON per.nit = autt.nit AND per.contrato = autt.contrato INNER JOIN
                      dbo.terceros AS ter ON ter.nit = per.nit INNER JOIN
                      dbo.y_seguros AS seg ON seg.nomina = autt.nomina_grl LEFT OUTER JOIN
                      dbo.y_conceptos_nom AS cpto ON cpto.concepto = seg.cpto_salud_empresa
GROUP BY autt.tipo_planilla, autt.ano, autt.mes, autt.sucursal, autt.secuencia, autt.sucursal, autt.nro_autorizacion, autt.nit, ISNULL(per.Es_pensionado, 0), autt.contrato, 
                      per.tipo_salario, cpto.porc_basico, autt.sln_grl, par.CREE,autt.fec_ingreso,autt.fec_retiro,autt.fec_ini_vsp,autt.fec_ini_sln,autt.fec_fin_sln,
autt.fec_ini_ige,autt.fec_fin_ige,autt.fec_ini_lma,autt.fec_fin_lma,autt.fec_ini_vaclr,autt.fec_fin_vaclr,autt.fec_ini_vct,autt.fec_fin_vct,
autt.fec_ini_irl,autt.fec_fin_irl,autt.horas_laboradas,autt.secuencia_empl,autt.tipo_novedad


GO

/****** Object:  View [dbo].[v_nom_autoliquidacion_ingresos]    Script Date: 02/23/2017 9:08:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


/****** Object:  View [dbo].[v_nom_autoliquidacion_retiros]    Script Date: 02/23/2017 9:09:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  VIEW [dbo].[v_nom_autoliquidacion_retiros] 
as
SELECT distinct  pp.ano,pp.mes,sucursal=yp.sucursal_salud,yp.nit,yp.contrato,nro_contratos=count (nit),
       fecha_retiro_fin=(yp.fecha_retiro),
       dias_cotizar=(day(yp.fecha_retiro)) 
FROM y_personal_contratos as yp JOIN 
     y_periodos           as pp ON pp.nomina=yp.nomina
WHERE  (not(yp.fecha_retiro is null)) and  
           (year(yp.fecha_retiro)=pp.ano and month(yp.fecha_retiro)=pp.mes) 
GROUP BY pp.ano,pp.mes,yp.sucursal_salud,yp.nit,yp.contrato,yp.fecha_ingreso,yp.fecha_retiro

GO

/****** Object:  View [dbo].[v_nom_autoliquidacion_mes_completo]    Script Date: 02/23/2017 9:10:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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


GO



/****** Object:  View [dbo].[v_nom_autoliquidacion_unificar]    Script Date: 02/23/2017 9:04:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_unificar] 
as
SELECT tipo='ingresos',pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,nro_contratos= max(pp.nro_contratos),
       dias_cotizar = sum(pp.dias_cotizar)
FROM v_nom_autoliquidacion_ingresos as pp 
WHERE pp.nro_contratos=1
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato                                                 
UNION
SELECT tipo='retiros',pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato,nro_contratos=max(pp.nro_contratos),
       dias_cotizar = sum(pp.dias_cotizar )
FROM v_nom_autoliquidacion_retiros      as pp 
WHERE pp.nro_contratos=1
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit,pp.contrato                                                 
UNION
SELECT tipo='varios_completos',pp.ano,pp.mes,pp.sucursal,pp.nit,contrato=min(pp.contrato),nro_contratos=count (nit),
       dias_cotizar = sum(pp.dias_cotizar)
FROM v_nom_autoliquidacion_mes_completo  as pp 
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit  
HAVING (count (pp.nit) > 1)                                               
UNION
SELECT tipo='un_solo_contrato',pp.ano,pp.mes,pp.sucursal,pp.nit,contrato=min(pp.contrato),nro_contratos=count (nit),
       dias_cotizar = sum(pp.dias_cotizar)
FROM v_nom_autoliquidacion_mes_completo  as pp 
GROUP BY pp.ano,pp.mes,pp.sucursal,pp.nit  
HAVING (count (pp.nit) = 1)                                               


GO

/****** Object:  View [dbo].[v_nom_autoliquidacion_nit_unificar_decreto_2388]    Script Date: 02/23/2017 9:05:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_nom_autoliquidacion_nit_unificar_decreto_2388] 
as

/****** Vacaciones ******/

SELECT DISTINCT orden='1',tipo=(case when cpto.clase_concepto=9 or cpto.clase_concepto=11 then 'VAC' end ), 
       liq.ano,liq.mes,nomina=max(liq.nomina),liq.nit,liq.contrato,
	   fecha_ini=(liq.fecha_ini),
	   fecha_fin=(liq.fecha_fin),
	   concepto=(select p.concepto from y_personal_contratos as c join y_parametros as p on p.nomina=c.nomina and p.tipo_contrato=c.tipo_contrato and p.tipo_salario=c.tipo_salario and p.tipo_parametro=5 and p.ano=liq.ano where c.contrato=liq.contrato),
	   liq.numero,
       dias =  ( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end),
       valor = isnull(sum(liq.valor),0),
       dias_total = sum(isnull(liq.dias,0))
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato and year(fecha)=v.ano and month(fecha)=v.mes JOIN 
     y_conceptos_nom                as cpto on cpto.concepto=liq.concepto
WHERE cpto.clase_concepto IN (9,11) and liq.turno<>50 and (year(liq.fecha_ini) = v.ano and month(fecha_ini)=v.mes and year(liq.fecha_fin) = v.ano and month(fecha_fin)=v.mes)
GROUP BY (case when cpto.clase_concepto=9 or cpto.clase_concepto=11 then 'VAC' end ),
      liq.ano,liq.mes,liq.nit,liq.contrato,liq.numero,liq.fecha_ini,liq.fecha_fin
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
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato and year(fecha)=v.ano and month(fecha)=v.mes JOIN 
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
     y_liquidacion                  as liq  ON liq.nit=v.nit and liq.contrato=v.contrato and year(fecha)=v.ano and month(fecha)=v.mes JOIN 
	 y_conceptos_nom                as cpto ON cpto.concepto=liq.concepto join
	 y_seguros                      as seg  ON seg.nomina=liq.nomina 
WHERE cpto.clase_concepto IN (12,33) and liq.turno<>50 and (year(liq.fecha_ini) = v.ano and month(fecha_ini)=v.mes and year(liq.fecha_fin) = v.ano and month(fecha_fin)=v.mes) 
GROUP BY ( case when cpto.clase_concepto=12 OR cpto.clase_concepto=33 then 'INC' end ),
       v.ano,v.mes,v.nit,v.contrato,liq.numero,liq.fecha_ini,liq.fecha_fin
HAVING (( case when day(liq.fecha_ini) = 31 or day(liq.fecha_fin) = 31 then ((sum(isnull(liq.dias,0))) - 1) else  (sum(isnull(liq.dias,0))) end) >= 1)
UNION
/****** incapacidades igual mas 180 dias cuando no son liquidadas ******/
SELECT DISTINCT orden='4',tipo='INC', 
       v.ano,v.mes,nomina=max(liq.nomina),v.nit,v.contrato,
	   fecha_ini=(select MIN(cal.fecha) from y_calendario as cal where year(fecha)=v.ano and month(fecha)=v.mes),
	   fecha_fin=(select MAX(cal.fecha) from y_calendario as cal where year(fecha)=v.ano and month(fecha)=v.mes),
	   concepto=0,numero=0,
       dias =  sum(isnull(v.dias_cotizar,0)) ,
       valor = (max(seg.minimo_salud)) ,
       dias_total = sum(isnull(v.dias_cotizar,0)) 
FROM v_nom_autoliquidacion_unificar as v JOIN
     y_personal_contratos           as liq ON liq.nit=v.nit and liq.contrato=v.contrato JOIN 
	 y_seguros                      as seg on seg.nomina=liq.nomina 
WHERE liq.turno=50 and liq.estado<>'R' 
GROUP BY  v.ano,v.mes,v.nit,v.contrato
UNION
/****** Salarios e incapacidades pagadas de meses anteriores ******/

SELECT DISTINCT orden='5',tipo='SAL' , v.ano,v.mes,nomina=max(liq.nomina),v.nit,v.contrato,
       fecha_ini =  min(liq.fecha),
       fecha_fin =  max(liq.fecha),
       concepto=0,numero=0,
       dias =  ( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ),
       valor = sum(isnull(liq.valor,0)),
       dias_total =  sum(isnull(v.dias_cotizar,0))
FROM v_nom_autoliquidacion_unificar as v JOIN 
     y_liquidacion                  as liq ON liq.nit=v.nit and liq.contrato=v.contrato  and liq.ano=v.ano and liq.mes=v.mes JOIN 
     y_conceptos_nom                as cpto ON cpto.concepto=liq.concepto
WHERE ((cpto.clase_concepto IN (1,2,16) and liq.turno<>50)  or
      (cpto.clase_concepto in (4,9,11,12,33) and not(year(liq.fecha_ini) = v.ano and month(liq.fecha_ini)=v.mes)))
GROUP BY v.ano,v.mes,v.nit,v.contrato
HAVING (( case when sum(isnull(liq.dias,0)) > 30 then 30 else sum(isnull(liq.dias,0))  end ) > 1) and (sum(isnull(liq.valor,0)) > 0 )


GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_total_fondos_arp]    Script Date: 02/20/2017 10:01:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_total_fondos_arp]
AS
SELECT     'arp' AS tipo, ano, mes, sucursal, codigo_arp AS fondo, nro_autorizacion, secuencia, COUNT(DISTINCT nit) AS total_empl, COUNT(nit) AS total_regi, 
                      SUM(basico_mes_grl) AS basico_mes_grl, SUM(vr_arp) AS vr_arp, SUM(ibc_gral) AS ibc_gral, SUM(vr_arp) * (1 / 100) AS fondo_solidario_riesgos, 
                      SUM(dias_Inca_acc_arp) AS dias_incap_acc_arp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 13) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS nro_auto_incap_acc_arp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 13) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS vr_auto_incap_acc_arp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 11) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS nro_nota_debito_arp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 11) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS val_nota_debito_arp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 12) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS nro_nota_credito_arp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 12) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS val_nota_credito_arp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 14) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS nro_nota_mes_ant_arp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 14) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS val_nota_mes_ant_arp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 15) AND (ano = v.ano) AND (mes = v.mes) AND (sucursal = v.sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS nro_auto_interes_arp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 15) AND (ano = ano) AND (mes = mes) AND (sucursal = sucursal) AND (idautoliq = idautoliq) AND (secuencia = secuencia)) 
                      AS val_auto_interes_arp, tipo_planilla
FROM         dbo.v_nom_autoliquidacion_nit AS v
WHERE     (codigo_arp <> '')
GROUP BY ano, mes, sucursal, codigo_arp, nro_autorizacion, secuencia, tipo_planilla

GO



/****** Object:  View [dbo].[v_nom_autoliquidacion_total_fondos_parafiscal]    Script Date: 02/20/2017 10:01:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_nom_autoliquidacion_total_fondos_parafiscal]
AS
SELECT  'parafiscal' AS tipo, par.ano, par.mes, par.sucursal AS sucursal, fon.codigo_caja AS fondo, 0 AS nro_autorizacion, par.secuencia, par.nit_cajac,
                          (SELECT     TOP (1) nit_sena
                            FROM          dbo.y_personal_contratos AS per
                            WHERE      (nit = MAX(par.nit))) AS nit_sena,
                          (SELECT     TOP (1) nit_icbf
                            FROM          dbo.y_personal_contratos AS per
                            WHERE      (nit = MAX(par.nit))) AS nit_icbf, COUNT(DISTINCT par.nit) AS total_empl, COUNT(par.nit) AS total_regi, SUM(ISNULL(par.valor_caja, 0)) 
                      AS vr_caja, SUM(ISNULL(par.valor_sena, 0)) AS vr_sena, SUM(ISNULL(par.valor_icbf, 0)) AS vr_icbf, SUM(par.devengados_caja) AS ibc_caja, 
                      par.tipo_planilla
FROM   dbo.y_parafiscales AS par INNER JOIN
       dbo.y_fondos AS fon ON fon.nro_nit_caja = par.nit_cajac and fon.fondo_caja=1
GROUP BY par.ano, par.mes, fon.codigo_caja, par.secuencia, par.nit_cajac, par.tipo_planilla,par.sucursal

GO




/****** Object:  View [dbo].[v_nom_autoliquidacion_total_fondos_pension]    Script Date: 02/20/2017 10:02:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_total_fondos_pension]
AS
SELECT     'pension' AS tipo, MAX(f.descripcion) AS descripcion, d.ano, d.mes, d.sucursal, d.codigo_pension AS fondo, d.nro_autorizacion, d.secuencia, COUNT(DISTINCT d.nit) 
                      AS total_empl, COUNT(d.nit) AS total_regi, SUM(d.basico_mes_grl) AS basico_mes_grl, SUM(d.ibc_pension_afp) AS ibc_pension_afp, SUM(ISNULL(d.vr_pension_afp, 
                      0)) AS vr_pension_afp, SUM(d.vr_vol_emp_afp) AS vr_vol_emp_afp, SUM(d.vr_vol_pat_afp) AS vr_vol_pat_afp, SUM(ISNULL(d.vr_fsp_afp, 0)) 
                      + SUM(ISNULL(d.vr_fsp_subs, 0)) AS vr_fsp_afp, SUM(d.vr_no_retfte_afp) AS vr_no_retfte_afp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 7) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS nro_nota_debito_afp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 7) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS val_nota_debito_afp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 8) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS nro_nota_credito_afp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 8) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS val_nota_credito_afp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 9) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS nro_nota_mes_ant_afp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 9) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS val_nota_mes_ant_afp,
                          (SELECT     MAX(nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 10) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS nro_auto_interes_afp,
                          (SELECT     SUM(valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n
                            WHERE      (tipo_docto = 10) AND (ano = d.ano) AND (mes = d.mes) AND (sucursal = d.sucursal) AND (secuencia = secuencia)) AS val_auto_interes_afp, 
                      d.tipo_planilla
FROM         dbo.v_nom_autoliquidacion_nit AS d INNER JOIN
                      dbo.y_fondos AS f ON f.codigo_pension = d.codigo_pension
WHERE     (d.codigo_pension <> '') AND (d.vr_pension_afp <> 0)
GROUP BY d.codigo_pension, d.ano, d.mes, d.sucursal, d.nro_autorizacion, d.secuencia, d.tipo_planilla

GO



/****** Object:  View [dbo].[v_nom_autoliquidacion_total_fondos_salud]    Script Date: 02/20/2017 10:02:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_total_fondos_salud]
AS
SELECT     'salud' AS tipo, ano, mes, sucursal, codigo_salud AS fondo, nro_autorizacion, secuencia, COUNT(DISTINCT nit) AS total_empl, COUNT(nit) AS total_regi, 
                      SUM(basico_mes_grl) AS basico_mes_grl, SUM(vr_salud_eps) AS vr_salud_eps, SUM(vr_upc_eps) AS vr_upc_eps, SUM(ibc_salud_eps) * (1 / 100) AS garantia_salud, 
                      SUM(ibc_salud_eps) AS vr_ibc_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 11) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_auto_incap_mat_eps,
                          (SELECT     SUM(ISNULL(n.valor_autoriza, 0)) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 11) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS vr_auto_incap_mat_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 3) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_auto_incap_eg_eps,
                          (SELECT     SUM(ISNULL(n.valor_autoriza, 0)) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 3) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS vr_auto_incap_eg_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 1) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_nota_debito_eps,
                          (SELECT     SUM(n.valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 1) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS val_nota_debito_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 2) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_nota_credito_eps,
                          (SELECT     SUM(n.valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 2) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS val_nota_credito_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 5) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_nota_mes_ant_eps,
                          (SELECT     SUM(n.valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 5) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS val_nota_mes_ant_eps,
                          (SELECT     MAX(n.nro_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 6) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS nro_auto_interes_eps,
                          (SELECT     SUM(n.valor_autoriza) AS Expr1
                            FROM          dbo.y_autoliq_notas AS n INNER JOIN
                                                   dbo.y_fondos AS f ON f.fondo = n.fondo
                            WHERE      (n.tipo_docto = 6) AND (n.ano = v.ano) AND (n.mes = v.mes) AND (n.sucursal = v.sucursal) AND (f.codigo_salud = v.codigo_salud) AND 
                                                   (n.secuencia = n.secuencia)) AS val_auto_interes_eps, tipo_planilla
FROM         dbo.v_nom_autoliquidacion_nit AS v
WHERE     (codigo_salud <> '')
GROUP BY ano, mes, sucursal, codigo_salud, nro_autorizacion, secuencia, tipo_planilla

GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_total_secuencia]    Script Date: 02/20/2017 10:03:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO



CREATE VIEW [dbo].[v_nom_autoliquidacion_total_secuencia] AS  
SELECT det.ano,det.mes,det.sucursal,det.secuencia,  total_empl=count(distinct nit),total_regi=count(nit),  
             basico_mes_grl=sum(basico_mes_grl), ibc_caja=sum(ibc_caja),  ibc_gral=sum(ibc_gral) , 
             ibc_pension_afp=sum(ibc_pension_afp), ibc_salud_eps=sum(ibc_salud_eps),ibc_arp=sum(ibc_arp), 
             vr_pension_afp=sum(vr_cotiza_plano_afp),   vr_fsp_afp=sum(vr_fsp_afp),
             vr_vol_emp_afp=sum(vr_vol_emp_afp),vr_vol_pat_afp=sum(vr_vol_pat_afp),vr_no_retfte_afp=sum(vr_no_retfte_afp),  
             vr_salud_eps=sum(vr_cotiza_plano_eps),vr_upc_eps=sum(vr_upc_eps),  
             vr_auto_incap_eg_eps=sum(vr_auto_incap_eg_eps),vr_auto_incap_mat_eps=sum(vr_auto_incap_mat_eps),   
             vr_arp=sum(vr_cotiza_plano_arp), 
             vr_caja=sum(vr_caja),  vr_sena=sum(vr_sena),  vr_icbf=sum(vr_icbf),  vr_esap=sum(vr_esap),  vr_educ=sum(vr_educ),
             fecha_cotiza_salud=( select top 1 fecha_cotiza 
                                                 from  y_autoliquidacion as aut JOIN y_fondos as fon ON fon.fondo_salud=1
                                                 where aut.ano=det.ano and aut.mes=det.mes and aut.sucursal=det.sucursal ) , 
             fecha_cotiza_pension=( select top 1 fecha_cotiza 
                                                 from  y_autoliquidacion as aut JOIN y_fondos as fon ON fon.fondo_pension=1
                                                 where aut.ano=det.ano and aut.mes=det.mes and aut.sucursal=det.sucursal ),  
             fecha_cotiza_arp=( select top 1 fecha_cotiza 
                                                 from  y_autoliquidacion as aut JOIN y_fondos as fon ON fon.fondo_arp=1
                                                 where aut.ano=det.ano and aut.mes=det.mes and aut.sucursal=det.sucursal ) , 
             fecha_pago=( select top 1 fecha_pago 
                                                 from  y_autoliquidacion as aut JOIN y_fondos as fon ON fon.fondo_arp=1
                                                 where aut.ano=det.ano and aut.mes=det.mes and aut.sucursal=det.sucursal ),
            det.tipo_planilla                                                   
FROM v_nom_autoliquidacion_nit as det 
GROUP BY det.ano,det.mes,det.sucursal,det.secuencia,det.tipo_planilla




GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_resumen_cajas]    Script Date: 02/20/2017 10:03:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Object:  View [dbo].[v_nom_autoliquidacion_resumen_cajas]    Script Date: 02/20/2017 10:03:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_resumen_cajas]
AS
SELECT     'caja' AS tipo, f.fondo AS cod_fondo, v.ano, v.mes, v.fondo, f.descripcion, v.secuencia, COUNT(v.total_regi) AS total_regi, SUM(v.vr_caja) 
                      AS total_fondo, SUM(v.vr_icbf) AS total_fondo1, SUM(v.vr_sena) AS total_fondo2, f.nro_nit_autol, f.cta_ctble_caja AS cuenta_emplea, 
                      f.cta_causacion_autol_caja AS cuenta_empresa, f.cta_ctble_caja, f.nro_nit_caja, v.sucursal, v.tipo_planilla
FROM         dbo.v_nom_autoliquidacion_total_fondos_parafiscal AS v INNER JOIN
                      dbo.y_fondos AS f ON v.fondo = f.codigo_caja
WHERE     (v.vr_caja > 0) AND (f.fondo_caja = 1)
GROUP BY v.ano, v.mes, f.fondo, v.fondo, f.descripcion, v.secuencia, f.nro_nit_autol, f.cta_ctble_autol_caja, f.cta_causacion_autol_caja, f.cta_ctble_caja, 
                      f.nro_nit_caja, f.fondo_caja, v.sucursal, v.tipo_planilla

GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_resumen_fondos_arp]    Script Date: 02/20/2017 10:04:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_resumen_fondos_arp]
AS
SELECT     'arp' AS tipo, f.fondo AS cod_fondo, v.ano, v.mes, v.fondo, f.descripcion, v.secuencia, COUNT(v.total_regi) AS total_regi, SUM(v.vr_arp) 
                      - SUM(ISNULL(v.val_nota_debito_arp, 0)) + SUM(ISNULL(v.val_nota_credito_arp, 0)) + SUM(ISNULL(v.val_nota_mes_ant_arp, 0)) 
                      + SUM(ISNULL(v.val_auto_interes_arp, 0)) AS total_fondo, 0 AS total_fondo1, 0 AS total_fondo2, f.nro_nit_autol, f.cta_ctble_arp AS cuenta_emplea, 
                      f.cta_causacion_autol_arp AS cuenta_empresa, f.cta_ctble_arp, f.nro_nit_arp, v.sucursal, v.tipo_planilla
FROM         dbo.v_nom_autoliquidacion_total_fondos_arp AS v INNER JOIN
                      dbo.y_fondos AS f ON v.fondo = f.codigo_arp
GROUP BY v.ano, v.mes, f.fondo, v.fondo, f.descripcion, v.secuencia, f.nro_nit_autol, f.cta_ctble_autol_arp, f.cta_causacion_autol_arp, f.cta_ctble_arp, f.nro_nit_arp, v.sucursal, 
                      v.tipo_planilla

GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_resumen_fondos_pension]    Script Date: 02/20/2017 10:04:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_resumen_fondos_pension]
AS
SELECT     'pension' AS tipo, f.fondo AS cod_fondo, v.ano, v.mes, v.fondo, f.descripcion, v.secuencia, COUNT(v.total_regi) AS total_regi, 
                      SUM(v.vr_pension_afp + v.vr_vol_emp_afp + v.vr_vol_pat_afp + v.vr_fsp_afp + v.vr_no_retfte_afp) AS total_fondo, 0 AS total_fondo1, 0 AS total_fondo2, 
                      f.nro_nit_autol, f.cta_ctble_pension AS cuenta_emplea, f.cta_causacion_autol_pension AS cuenta_empresa, f.cta_ctble_pension, f.nro_nit_pension, v.sucursal, 
                      v.tipo_planilla
FROM         dbo.v_nom_autoliquidacion_total_fondos_pension AS v INNER JOIN
                      dbo.y_fondos AS f ON v.fondo = f.codigo_pension
GROUP BY v.ano, v.mes, f.fondo, v.fondo, f.descripcion, v.secuencia, f.nro_nit_autol, f.cta_ctble_autol_pension, f.cta_causacion_autol_pension, f.cta_ctble_pension, 
                      f.nro_nit_pension, v.sucursal, v.tipo_planilla

GO


/****** Object:  View [dbo].[v_nom_autoliquidacion_resumen_fondos_salud]    Script Date: 02/20/2017 10:04:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_nom_autoliquidacion_resumen_fondos_salud]
AS
SELECT     'salud' AS tipo, f.fondo AS cod_fondo, v.ano, v.mes, v.fondo, f.descripcion, v.secuencia, COUNT(v.total_regi) AS total_regi, SUM(v.vr_salud_eps) 
                      - SUM(ISNULL(v.val_nota_debito_eps, 0)) + SUM(ISNULL(v.val_nota_credito_eps, 0)) + SUM(ISNULL(v.val_nota_mes_ant_eps, 0)) 
                      + SUM(ISNULL(v.val_auto_interes_eps, 0)) AS total_fondo, 0 AS total_fondo1, 0 AS total_fondo2, f.nro_nit_autol, f.cta_ctble_salud AS cuenta_emplea, 
                      f.cta_causacion_autol_salud AS cuenta_empresa, f.cta_ctble_salud, f.nro_nit_salud, v.sucursal, v.tipo_planilla
FROM         dbo.v_nom_autoliquidacion_total_fondos_salud AS v INNER JOIN
                      dbo.y_fondos AS f ON v.fondo = f.codigo_salud
GROUP BY v.ano, v.mes, f.fondo, v.fondo, f.descripcion, v.secuencia, f.nro_nit_autol, f.cta_ctble_autol_salud, f.cta_causacion_autol_salud, f.cta_ctble_salud, f.nro_nit_salud, 
                      v.sucursal, v.tipo_planilla

GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
