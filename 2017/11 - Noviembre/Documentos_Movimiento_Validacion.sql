SELECT *
FROM documentos D LEFT JOIN movimiento M ON (D.tipo=M.TIPO AND D.numero=M.numero)
WHERE anulado=0 AND M.tipo IS NULL AND D.fecha<='31/10/2017' AND NOT (D.tipo IN ('CRUC'))
ORDER BY D.fecHA