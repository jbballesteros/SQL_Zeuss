DECLARE @FECHAUNO AS DATETIME='21/02/2015'
DECLARE @FECHADOS AS DATETIME='25/02/2015'
DECLARE @NIT AS DECIMAL (18,0)=811040857


update documentos_ped set despacho=NULL WHERE numero IN  (select numero from documentos_ped where fecha between @FECHAUNO
and @FECHADOS and anulado=0 and nit=@NIT)

insert into documentos_lin_ped (sw, bodega, numero, codigo, seq, cantidad, cantidad_despachada, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, 
                      despacho_virtual, porc_dcto_2, porc_dcto_3, enlace)

select sw, bodega, numero, codigo, seq, cantidad, cantidad_despachada, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, 
                      despacho_virtual, porc_dcto_2, porc_dcto_3, enlace from documentos_lin_ped_historia where numero in
                      (select numero from documentos_ped where fecha between @FECHAUNO
and @FECHADOS and anulado=0 and nit=@NIT)
 
delete control_facturas where numero in  (select numero from documentos_ped where fecha between @FECHAUNO
and @FECHADOS and anulado=0 and nit=@NIT)


SELECT *
FROM documentos
WHERE tipo='AJV' AND documento IN (26479,
26202,
26181,
25683,
25234,
25232,
24699,
24979)


SELECT *
FROM documentos_ped
WHERE numero IN (26479,
26202,
26181,
25683,
25234,
25232,
24699,
24979)


