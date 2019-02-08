


ALTER      VIEW [dbo].[v_nom_autoliq_contable_pension]

AS
/****** APORTE EMPLEADO SIN SLN ******/

SELECT  nit_empleado=afp.nit,   tipo_dato = 'P', afp.sucursal, nomina = afp.nomina, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl AS centro, nit = afp.nit, 

      tipo = 1, concepto = seg.cpto_pension_empresa, valor = round((((sum(afp.vr_pension_afp * 0.25)))), 0) + sum(isnull(afp.vr_fsp_afp, 0)) 

      + sum(isnull(afp.vr_fsp_subs, 0)) + sum(isnull(afp.vr_vol_emp_afp, 0)), cuenta = cta.debito, cuenta_credito = max(fon.cta_ctble_autol_pension), 

      destino=0,

      dias_incap=isnull((select sum(isnull(y.dias,0)) from y_liquidacion as y where y.nit=afp.nit and y.ano=afp.ano and y.mes=afp.mes and y.concepto=96),0)

FROM  v_nom_autoliquidacion_nit AS afp JOIN

      y_fondos                  AS fon  ON fon.codigo_pension = afp.codigo_pension AND fon.fondo_pension = 1 JOIN

      y_seguros                 AS seg  ON seg.nomina = afp.nomina JOIN

      y_ctas_nomina             AS cta  ON cta.concepto = seg.cpto_pension_emplea AND cta.planta = afp.planta_grl AND cta.nomina = afp.nomina_grl JOIN

      centros                   AS cen  ON cen.centro = afp.centro_grl JOIN

      y_conceptos_nom           AS cpto ON cpto.concepto = seg.cpto_pension_emplea

WHERE     afp.sln_grl <> 'X'  

GROUP BY afp.nit,afp.sucursal, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl, seg.cpto_pension_empresa, afp.nomina, cta.debito
UNION
/****** APORTE EMPRESA SIN SLN ******/

SELECT  nit_empleado=afp.nit,   tipo_dato = 'P', afp.sucursal, nomina = afp.nomina, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl AS centro, nit = max(fon.nro_nit_autol), 

      tipo = 1, concepto = seg.cpto_pension_empresa, valor = (isnull(sum(afp.vr_pension_afp), 0)) - (round((((sum(afp.vr_pension_afp * 0.25)))), 0)) 

      + sum(isnull(afp.vr_vol_pat_afp, 0)), cuenta = cta.debito, cuenta_credito = max(fon.cta_ctble_autol_pension), destino=0,

      dias_incap=isnull((select sum(isnull(y.dias,0)) from y_liquidacion as y where y.nit=afp.nit and y.ano=afp.ano and y.mes=afp.mes and y.concepto=96),0)

FROM  v_nom_autoliquidacion_nit AS afp JOIN

      y_fondos                  AS fon ON fon.codigo_pension = afp.codigo_pension AND fon.fondo_pension = 1 JOIN

      y_seguros                 AS seg ON seg.nomina = afp.nomina JOIN

      y_ctas_nomina             AS cta ON cta.concepto = seg.cpto_pension_empresa AND cta.planta = afp.planta_grl AND cta.nomina = afp.nomina_grl JOIN

      centros                   AS cen ON cen.centro = afp.centro_grl JOIN

      y_conceptos_nom           AS cpto ON cpto.concepto = seg.cpto_pension_empresa

WHERE     afp.sln_grl <> 'X' 

GROUP BY afp.nit,afp.sucursal, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl, seg.cpto_pension_empresa, afp.nomina, cta.debito

UNION
/****** APORTE EMPRESA CON SLN ******/

SELECT  nit_empleado=afp.nit,   tipo_dato = 'P', afp.sucursal, nomina = afp.nomina, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl AS centro, nit = max(fon.nro_nit_autol), 

          tipo = 1, concepto = seg.cpto_pension_empresa, valor = (isnull(sum(afp.vr_pension_afp), 0)) + sum(isnull(afp.vr_fsp_afp, 0)) 

          + sum(isnull(afp.vr_fsp_subs, 0)) + sum(isnull(afp.vr_vol_emp_afp, 0)), cuenta = cta.debito, cuenta_credito = max(fon.cta_ctble_autol_pension), 

          destino=0,

         dias_incap=isnull((select sum(isnull(y.dias,0)) from y_liquidacion as y where y.nit=afp.nit and y.ano=afp.ano and y.mes=afp.mes and y.concepto=96),0)

FROM  v_nom_autoliquidacion_nit AS afp JOIN

      y_fondos                  AS fon ON fon.codigo_pension = afp.codigo_pension AND fon.fondo_pension = 1 JOIN

      y_seguros                 AS seg ON seg.nomina = afp.nomina JOIN

      y_ctas_nomina             AS cta ON cta.concepto = seg.cpto_pension_empresa AND cta.planta = afp.planta_grl AND cta.nomina = afp.nomina_grl JOIN

      centros                   AS cen ON cen.centro = afp.centro_grl JOIN

      y_conceptos_nom           AS cpto ON cpto.concepto = seg.cpto_pension_empresa

WHERE     afp.sln_grl = 'X' 

GROUP BY afp.nit,afp.sucursal, afp.ano, afp.mes, afp.planta, fon.fondo, afp.centro_grl, seg.cpto_pension_empresa, afp.nomina, cta.debito



GO


