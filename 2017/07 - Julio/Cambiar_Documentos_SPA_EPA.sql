UPDATE documentos_lin
SET valor_unitario=costo_unitario
WHERE tipo='SPAL' AND numero IN (126,127)




UPDATE documentos
SET valor_total=P.VALOR
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,SUM(DL.cantidad*DL.costo_unitario) VALOR
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo='SPAL' AND D.numero IN (126,127)
GROUP BY D.tipo,D.numero) AS P ON (D.tipo=P.tipo AND D.numero=P.numero)