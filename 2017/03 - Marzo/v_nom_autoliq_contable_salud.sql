

ALTER VIEW [dbo].[v_nom_autoliq_contable_salud]  AS  
/****** APORTE EMPLEADO DEL 4 % CUANDO NO SON APRENDICES Y EXONERADOS ******/
SELECT tipos='1-APORTE EMPLEADO DEL 4 % CUANDO NO SON APRENDICES Y EXONERADOS',
       nit_empleado=eps.nit,tipo_dato='S', eps.sucursal,planta=eps.planta,nomina=eps.nomina,  
       eps.ano, eps.mes, fon.fondo,  
       eps. centro_grl as centro,nit=eps.nit,tipo=3,concepto=seg.cpto_salud_empresa,     
       valor = round((((sum(eps.vr_salud_eps)) )),0),
       cuenta=cta.debito,cuenta_credito=max(fon.cta_ctble_autol_salud),destino=0,cpto.porc_basico,eps.tarifa_eps  
FROM   v_nom_autoliquidacion_nit   as eps JOIN  
       y_fondos as fon ON fon.codigo_salud=eps.codigo_salud and fon.fondo_salud=1 JOIN  
       y_seguros       as seg  ON seg.nomina=eps.nomina JOIN  
       y_ctas_nomina   as cta  ON cta.concepto=seg.cpto_salud_emplea and cta.planta=eps.planta_grl and cta.nomina=eps.nomina_grl join
       y_conceptos_nom as cpto ON cpto.concepto=seg.cpto_salud_emplea   
WHERE  eps.tipo_cotizante not in (12,19)  and seg.porcentaje_salud <> eps.Tarifa_eps
GROUP BY 
          eps.nit,eps.sucursal,eps.ano, eps.mes, fon.fondo, eps.centro_grl,fon.nro_nit_autol,cpto.porc_basico,  
         seg.cpto_salud_empresa,eps.nomina,eps.planta,eps.cree,eps.Tarifa_eps ,seg.porcentaje_salud,cta.debito
UNION  

/****** APORTE EMPLEADO DEL 4 % CUANDO NO SON APRENDICES Y NO SON EXONERADOS******/
SELECT tipos='5-APORTE EMPLEADO DEL 4 % CUANDO NO SON APRENDICES Y NO SON EXONERADOS',
       nit_empleado=eps.nit,tipo_dato='S', eps.sucursal,planta=eps.planta,nomina=eps.nomina,  
       eps.ano, eps.mes, fon.fondo,  
       eps. centro_grl as centro,nit=eps.nit,tipo=3,concepto=seg.cpto_salud_empresa,     
       valor = round((((sum(eps.vr_salud_eps * 0.32)) )),0),
       cuenta=cta.debito,cuenta_credito=max(fon.cta_ctble_autol_salud),destino=0,cpto.porc_basico,eps.tarifa_eps   
FROM   v_nom_autoliquidacion_nit   as eps JOIN  
       y_fondos as fon ON fon.codigo_salud=eps.codigo_salud and fon.fondo_salud=1 JOIN  
       y_seguros       as seg  ON seg.nomina=eps.nomina JOIN  
       y_ctas_nomina   as cta ON cta.concepto=seg.cpto_salud_emplea and cta.planta=eps.planta_grl and cta.nomina=eps.nomina_grl JOIN
       y_conceptos_nom as cpto ON cpto.concepto=seg.cpto_salud_emplea   
WHERE   eps.tipo_cotizante not in (12,19)  and seg.porcentaje_salud = eps.Tarifa_eps
GROUP BY 
        eps.nit,eps.sucursal,eps.ano, eps.mes, fon.fondo, eps.centro_grl,fon.nro_nit_autol,cpto.porc_basico,  
        seg.cpto_salud_empresa,eps.nomina,eps.planta,eps.cree,eps.Tarifa_eps ,seg.porcentaje_salud,cta.debito
UNION
/****** APORTE EMPRESA DEL 8.5 % CUANDO EL EMPLEADO NO SON APRENDICES Y NO SON EXONERADOS ******/
SELECT tipos='6-APORTE EMPRESA DEL 8.5 % CUANDO EL EMPLEADO NO SON APRENDICES Y NO SON EXONERADOS',
       nit_empleado=eps.nit,tipo_dato='S', eps.sucursal,planta=eps.planta,nomina=eps.nomina,  
       eps.ano, eps.mes, fon.fondo,  
       eps. centro_grl as centro,nit=fon.nro_nit_autol,tipo=3,concepto=seg.cpto_salud_empresa,
       valor = (isnull(sum(eps. vr_salud_eps),0)) - round((((sum(eps. vr_salud_eps * 0.32)) )),0),  
       cuenta=cta.debito,cuenta_credito=max(fon.cta_ctble_autol_salud),destino=0,cpto.porc_basico,eps.tarifa_eps   
FROM   v_nom_autoliquidacion_nit   as eps JOIN  
       y_fondos as fon ON fon.codigo_salud=eps.codigo_salud and fon.fondo_salud=1 JOIN  
       y_seguros       as seg  ON seg.nomina=eps.nomina JOIN  
       y_ctas_nomina   as cta ON cta.concepto=seg.cpto_salud_empresa and cta.planta=eps.planta_grl and cta.nomina=eps.nomina_grl JOIN
       y_conceptos_nom as cpto ON cpto.concepto=seg.cpto_salud_empresa   
WHERE   eps.tipo_cotizante not in (12,19)  and seg.porcentaje_salud=eps.Tarifa_eps
GROUP BY 
         eps.nit,eps.sucursal,eps.ano, eps.mes, fon.fondo, eps.centro_grl,fon.nro_nit_autol,   
        fon.nro_nit_autol,cpto.porc_basico, 
        seg.cpto_salud_empresa,eps.nomina,eps.planta,eps.cree, eps.Tarifa_eps, seg.porcentaje_salud,cta.debito
UNION
/****** APORTE APRENDICES DEL 12.5 % QUE LO ASUME LA EMPRESA TOTALMENTE ******/
SELECT tipos='7-APORTE APRENDICES DEL 12.5 % QUE LO ASUME LA EMPRESA TOTALMENTE',
       nit_empleado=eps.nit,tipo_dato='S', eps.sucursal,planta=eps.planta,nomina=eps.nomina,  
       eps.ano, eps.mes, fon.fondo,  
       eps. centro_grl as centro,nit=fon.nro_nit_autol,tipo=3,concepto=seg.cpto_salud_empresa,     
       valor =  sum(isnull(eps. vr_salud_eps,0)),  
       cuenta=cta.debito,cuenta_credito=max(fon.cta_ctble_autol_salud),destino=0,porc_basico=seg.porcentaje_salud,eps.tarifa_eps   
FROM   v_nom_autoliquidacion_nit   as eps JOIN  
       y_fondos as fon ON fon.codigo_salud=eps.codigo_salud and fon.fondo_salud=1 JOIN  
       y_seguros       as seg  ON seg.nomina=eps.nomina JOIN  
       y_ctas_nomina AS cta ON cta.concepto = seg.cpto_salud_empresa AND cta.planta = eps.planta_grl AND cta.nomina = eps.nomina_grl join
       y_conceptos_nom as cpto ON cpto.concepto=seg.cpto_salud_empresa   
WHERE  eps.tipo_cotizante  in (12,19)  
GROUP BY 
     eps.nit,eps.sucursal,eps.ano, eps.mes, fon.fondo, eps.centro_grl,fon.nro_nit_autol,   
     fon.nro_nit_autol,cpto.porc_basico,  
     seg.cpto_salud_empresa,eps.nomina,eps.planta,cta.debito,porcentaje_salud,eps.tarifa_eps  
UNION  
/****** APORTE UPC ******/
SELECT tipos='8-APORTE UPC',
       nit_empleado=eps.nit,tipo_dato='S', eps.sucursal,planta=eps.planta,nomina=eps.nomina,  
       eps.ano, eps.mes, fon.fondo,  
       eps. centro_grl as centro,nit=max(fon.nro_nit_autol),tipo=3,concepto=seg.cpto_upc_emplea,     
       valor = round((((sum(eps.vr_upc_eps * 1)) )),0),   
       cuenta=cta.debito,cuenta_credito=max(fon.cta_ctble_autol_salud),destino=0,cpto.porc_basico,eps.tarifa_eps   
FROM   v_nom_autoliquidacion_nit   as eps JOIN  
       y_fondos as fon ON fon.codigo_salud=eps.codigo_salud and fon.fondo_salud=1 JOIN  
       y_seguros       as seg  ON seg.nomina=eps.nomina JOIN  
       y_ctas_nomina AS cta ON cta.concepto = seg.cpto_salud_empresa AND cta.planta = eps.planta_grl AND cta.nomina = eps.nomina_grl join
       y_conceptos_nom as cpto ON cpto.concepto=seg.cpto_upc_emplea  
WHERE eps.tipo_cotizante not in (12,19)   
GROUP BY  eps.nit,eps.sucursal,eps.ano, eps.mes, fon.fondo, eps.centro_grl,fon.nro_nit_autol,cpto.porc_basico,  
         seg.cpto_upc_emplea,eps.nomina,eps.planta,cta.debito,eps.tarifa_eps  
HAVING round((((sum(eps.vr_upc_eps * 1)) )),0) > 0  


GO


