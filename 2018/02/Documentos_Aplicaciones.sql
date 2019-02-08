SELECT D.tipo TIPO,D.numero NUMERO,D.valor_total VALOR,D.valor_aplicado APLICADO,
D.valor_total-D.valor_aplicado VALOR,DD.tipo,DD.numero,DD.fecha,DD.valor_total,DD.usuario
FROM documentos D 
LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo_aplica AND D.numero=DC.numero_aplica)
LEFT JOIN documentos DD ON (DC.tipo=DD.tipo AND DC.numero=DD.numero)
WHERE D.valor_total-D.valor_aplicado<0 AND D.SW=1 
ORDER BY D.tipo,D.numero DESC
