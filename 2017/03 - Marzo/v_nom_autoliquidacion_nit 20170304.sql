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
                      autt.fec_ini_irl,autt.fec_fin_irl,ibc_otro_para=isnull(SUM(ISNULL(par.devengados_caja, 0)),0),autt.horas_laboradas,autt.secuencia_empl,
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
