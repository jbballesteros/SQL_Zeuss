


ALTER   VIEW [dbo].[v_nom_autoliq_contable_arp]
AS
SELECT tipo_dato='A', arp.sucursal,arp.planta,nomina=arp.nomina,
       arp.ano, arp.mes, fon.fondo,
       arp. centro_grl as centro,nit=fon.nro_nit_autol,tipo=6, concepto=seg.cpto_atep_empresa,  
       valor = (isnull(sum(arp. vr_arp),0)), 
       cuenta=cta.debito,cuenta_credito=max(cta_ctble_autol_arp), destino=0,nit_empleado=arp.nit
FROM   v_nom_autoliquidacion_nit   as arp JOIN
       y_fondos        as fon ON fon.codigo_arp=arp.codigo_arp and fon.fondo_arp=1 JOIN
       y_seguros       as seg ON seg.nomina=arp.nomina join
       y_ctas_nomina   as cta ON cta.concepto=seg.cpto_atep_empresa and cta.planta=arp.planta_grl and cta.nomina=arp.nomina_grl JOIN
       centros         as cen ON cen.centro=arp.centro_grl
WHERE arp.sln_grl<>'X'
GROUP BY arp.sucursal,arp.ano, arp.mes, 
         fon.fondo, arp.centro_grl,fon.nro_nit_autol,
         seg.cpto_atep_empresa,arp.planta,arp.nomina,cta.debito,arp.nit
UNION
SELECT tipo_dato='A', arp.sucursal,arp.planta,nomina=arp.nomina,
       arp.ano, arp.mes, fon.fondo,
       arp. centro_grl as centro,nit=fon.nro_nit_autol,tipo=6, concepto=seg.cpto_atep_empresa,  
       valor = (isnull(sum(arp. vr_arp),0)), 
       cuenta=cta.debito,cuenta_credito=max(cta_ctble_autol_arp), destino=0,nit_empleado=arp.nit
FROM   v_nom_autoliquidacion_nit   as arp JOIN
       y_fondos        as fon ON fon.codigo_arp=arp.codigo_arp and fon.fondo_arp=1 JOIN
       y_seguros       as seg ON seg.nomina=arp.nomina join
       y_ctas_nomina   as cta ON cta.concepto=seg.cpto_atep_empresa and cta.planta=arp.planta_grl and cta.nomina=arp.nomina_grl JOIN
       centros         as cen ON cen.centro=arp.centro_grl
WHERE arp.sln_grl='X'
GROUP BY arp.sucursal,arp.ano, arp.mes, 
         fon.fondo, arp.centro_grl,fon.nro_nit_autol,
         seg.cpto_atep_empresa,arp.planta,arp.nomina,cta.debito,arp.nit


GO


