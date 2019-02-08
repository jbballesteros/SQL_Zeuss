
UPDATE documentos
SET valor_total=P.VALOR
FROM documentos D INNER JOIN

(
SELECT D.TIPO,D.NUMERO, SUM(DL.cantidad*DL.costo_unitario) VALOR
FROM documentos D INNER JOIN documentos_lin		 DL  ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo IN ('SCP') AND D.fecha>='01/04/2017'
GROUP BY D.TIPO,D.NUMERO) AS P ON (D.tipo=P.tipo AND D.numero=P.numero)