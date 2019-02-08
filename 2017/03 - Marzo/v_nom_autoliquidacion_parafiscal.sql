



ALTER  VIEW [dbo].[v_nom_autoliquidacion_parafiscal]

AS

SELECT     'Caja' AS tipo, par.cpto_caja AS concepto, par.ano, par.mes, par.nit_cajac,
           cta.nomina, cta.planta, aut.sucursal, 
           par.centro, 
           (CASE WHEN (cta.tipo_causacion = 1) 
                 THEN (par.nit) 
                 ELSE par.nit_cajac 
            END) AS nit,
            SUM(par.devengados_caja) AS vlDevengado,
            SUM(par.valor_caja) AS vlLinea,
            MAX(par.porc_caja) AS tarifa,
            cta.debito, cta.credito, cta.nit_debito, cta.nit_credito,
            tipo_provision= (SELECT tipo_provision  FROM  y_nominas WHERE (nomina = MAX(par.nomina))),
            fondo=(SELECT  TOP 1 fondo  FROM  y_fondos  WHERE  (nro_nit_autol = par.nit_cajac) AND (fondo_caja = 1)) ,nit_empleado=par.nit
FROM  dbo.y_parafiscales AS par INNER JOIN
      dbo.y_fondos AS f ON f.nro_nit_autol = par.nit_cajac AND f.fondo_caja = 1 INNER JOIN
      dbo.y_ctas_nomina AS cta ON cta.concepto = par.cpto_caja AND cta.nomina = par.nomina AND cta.planta = par.planta INNER JOIN
      dbo.cuentas AS co ON co.cuenta = cta.debito INNER JOIN
      dbo.v_nom_autoliquidacion_nit AS aut ON aut.nit = par.nit AND aut.contrato = par.contrato AND aut.ano = par.ano AND aut.mes = par.mes AND aut.sln_grl=par.sln

WHERE par.sln <> 'X' AND  (NOT (par.nit_cajac IS NULL)) AND (f.fondo_caja = 1)

GROUP BY par.cpto_caja, par.ano, par.mes, par.nit_cajac, cta.nomina, cta.planta, par.centro, (CASE WHEN (cta.tipo_causacion = 1) THEN par.nit ELSE par.nit_cajac END), cta.debito, 

                      cta.credito, cta.nit_debito, cta.nit_credito, par.centro, aut.sucursal,par.nit

UNION

SELECT     'Sena' AS tipo, par.cpto_sena AS concepto, par.ano, par.mes, par.nit_cajac, cta.nomina, cta.planta, aut.sucursal, 
            par.centro, 
                  (CASE WHEN (cta.tipo_causacion = 1)
			THEN (par.nit)
                        ELSE par.nit_cajac 
                   END)  AS nit,
                   SUM(par.devengados_sena) AS vlDevengado, 
                   SUM(par.valor_sena) AS vlLinea, MAX(par.porc_sena) AS tarifa, cta.debito, cta.credito, cta.nit_debito, cta.nit_credito,
                   tipo_provision=( SELECT  tipo_provision   FROM  y_nominas AS y_nominas_2 WHERE  (nomina = MAX(par.nomina))),
                   fondo=  (SELECT TOP 1  fondo   FROM  y_fondos AS y_fondos_2   WHERE      (nro_nit_autol = par.nit_cajac) AND (fondo_caja = 1)) ,nit_empleado=par.nit
FROM         dbo.y_parafiscales AS par INNER JOIN
             dbo.y_fondos AS f ON f.nro_nit_autol = par.nit_cajac AND f.fondo_caja = 1 INNER JOIN
             dbo.y_ctas_nomina AS cta ON cta.concepto = par.cpto_sena AND cta.nomina = par.nomina AND cta.planta = par.planta INNER JOIN
             dbo.cuentas AS co ON co.cuenta = cta.debito INNER JOIN
             dbo.v_nom_autoliquidacion_nit AS aut ON aut.nit = par.nit AND aut.contrato = par.contrato AND aut.ano = par.ano AND aut.mes = par.mes AND aut.sln_grl=par.sln
WHERE par.sln <> 'X' AND    (NOT (par.nit_cajac IS NULL)) AND (f.fondo_caja = 1)
GROUP BY par.cpto_sena, par.ano, par.mes, par.nit_cajac, cta.nomina, cta.planta, par.centro, 
         (CASE WHEN (cta.tipo_causacion = 1) THEN (par.nit) ELSE par.nit_cajac END), cta.debito, 
          cta.credito, cta.nit_debito, cta.nit_credito,  par.centro, aut.sucursal,par.nit

UNION
SELECT     'Icbf' AS tipo, par.cpto_icbf AS concepto, par.ano, par.mes, par.nit_cajac, cta.nomina, cta.planta,  aut.sucursal, 
          par.centro, 
           (CASE WHEN (cta.tipo_causacion = 1) 
                 THEN (par.nit) 
                 ELSE par.nit_cajac 
            END) AS nit,
            SUM(par.devengados_icbf) AS vlDevengado, 
            SUM(par.valor_icbf)      AS vlLinea, 
           MAX(par.porc_icbf) AS tarifa, cta.debito, cta.credito, cta.nit_debito, cta.nit_credito,
           tipo_provision= (SELECT tipo_provision FROM y_nominas AS y_nominas_1 WHERE (nomina = MAX(par.nomina))),
           fondo=(SELECT   TOP 1 fondo  FROM  dbo.y_fondos AS y_fondos_1    WHERE (nro_nit_autol = par.nit_cajac) AND (fondo_caja = 1)),nit_empleado=par.nit 
FROM         dbo.y_parafiscales AS par INNER JOIN

                      dbo.y_fondos AS f ON f.nro_nit_autol = par.nit_cajac AND f.fondo_caja = 1 INNER JOIN

                      dbo.y_ctas_nomina AS cta ON cta.concepto = par.cpto_icbf AND cta.nomina = par.nomina AND cta.planta = par.planta INNER JOIN

                      dbo.cuentas AS co ON co.cuenta = cta.debito INNER JOIN

                      dbo.v_nom_autoliquidacion_nit AS aut ON aut.nit = par.nit AND aut.contrato = par.contrato AND aut.ano = par.ano AND aut.mes = par.mes AND aut.sln_grl=par.sln

WHERE par.sln <> 'X' AND    (NOT (par.nit_cajac IS NULL)) AND (f.fondo_caja = 1)

GROUP BY par.cpto_icbf, par.ano, par.mes, par.nit_cajac, cta.nomina, cta.planta, par.centro, (CASE WHEN (cta.tipo_causacion = 1) THEN (par.nit) ELSE par.nit_cajac END), cta.debito, 

                      cta.credito, cta.nit_debito, cta.nit_credito, par.centro, aut.sucursal,par.nit






GO


