SELECT T.nit_real NIT,T.nit NIT,T.nombres TERCERO,D.tipo TIPO,D.numero NUMERO,D.fecha FECHA,D.valor_total TOTAL,D.valor_aplicado APLICADO,D.valor_total-D.valor_aplicado SALDO,
B.banco COD_BAN,B.descripcion BANCO,T2.nit_real NIT,T2.nit NIT,T2.nombres NOMBRES,D2.tipo TIPO,D2.numero NUMERO,D2.fecha FECHA,D2.valor_total VALOR_TOTAL

FROM documentos D 
INNER JOIN terceros T ON (D.nit=T.nit)
LEFT JOIN (SELECT tipo,numero,consignar_en banco FROM documentos_che GROUP BY tipo,numero,consignar_en) DC ON (D.TIPO=DC.TIPO AND D.NUMERO=DC.NUMERO)
LEFT JOIN bancos B ON (DC.banco=B.banco)
LEFT JOIN documentos_cruce DC2 ON (DC2.tipo=D.tipo AND DC2.numero=D.numero)
LEFT JOIN documentos D2 ON (DC2.tipo_aplica=D2.tipo AND DC2.numero_aplica=D2.numero AND D2.sw=1)
LEFT JOIN terceros T2 ON (D2.nit=T2.nit)
WHERE D.tipo='RC' AND T.nit_real IN (900167770,900777023,39184296)  AND D.anulado=0
