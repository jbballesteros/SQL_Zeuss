SELECT D.tipo,D.numero
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.anulado=1
GROUP BY D.tipo,D.numero
