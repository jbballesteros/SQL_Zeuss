SELECT D.tipo,D.numero,T.NIT_REAL,

CASE WHEN D.sw IN (1,21,22,6) THEN D.valor_total
WHEN D.sw IN (5,23,2,32) THEN D.valor_total*-1 ELSE 0 END,D2.tipo,D2.numero,D2.nit,T2.nit_real,D3.tipo,D3.numero,D3.nit,T3.nit_real,D4.tipo,D4.numero,D4.nit,T4.nit_real,D5.tipo,D5.numero,D5.nit,T5.nit_real
FROM documentos D 
INNER JOIN terceros T ON (D.nit=T.nit)

LEFT JOIN documentos_cruce DC ON ((D.tipo=DC.tipo AND D.numero=DC.numero) )
LEFT JOIN documentos D2 ON (DC.tipo=D2.tipo AND DC.numero=D2.numero)
LEFT JOIN terceros T2 ON (D2.nit=T2.nit)

LEFT JOIN documentos_cruce DC2 ON ((D.tipo=DC2.tipo_aplica AND D.numero=DC2.numero_aplica) )
LEFT JOIN documentos D3 ON (DC2.tipo_aplica=D3.tipo AND DC2.numero_aplica=D3.numero)
LEFT JOIN terceros T3 ON (D3.nit=T3.nit)


LEFT JOIN documentos_cruce DC3 ON ((D.tipo=DC3.tipo_aplica AND D.numero=DC3.numero_aplica) )
LEFT JOIN documentos D4 ON (DC3.tipo=D4.tipo AND DC3.numero=D4.numero)
LEFT JOIN terceros T4 ON (D4.nit=T4.nit)


LEFT JOIN documentos D5 ON (DC.tipo_aplica=D5.tipo AND DC.numero_aplica=D5.numero)
LEFT JOIN terceros T5 ON (D5.nit=T5.nit)


WHERE T.nit_real=1013636852




SELECT D.tipo,
SUM(
CASE WHEN D.sw IN (1,21,22,6) THEN D.valor_total
WHEN D.sw IN (5,23,2,32) THEN D.valor_total*-1 ELSE 0 END)
FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit)
WHERE T.nit_real=1013636852
GROUP BY D.tipo