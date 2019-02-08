UPDATE documentos
SET valor_total=T.valor
FROM documentos D INNER JOIN (SELECT *,P.valor-P.valor_total diferencia
FROM (
SELECT D.tipo,D.numero,D.fecha,D.valor_total,ROUND(B.valor,0) valor,notas,D.nit
FROM documentos D LEFT JOIN 
(SELECT tipo_bonificacion tipo,numero_bonificacion numero, sum(ISNULL(bonificacion,0)) valor 
FROM Zeuss_BonificacionAgrup
GROUP BY tipo_bonificacion,numero_bonificacion
) B ON (D.tipo=B.tipo AND D.numero=B.numero )
WHERE D.tipo='NC' AND date_ins>='30/08/2018' AND notas='Descuento por Compras'
) AS P
WHERE (P.valor_total-P.valor)<>0) AS T ON (D.tipo=T.tipo AND D.numero=T.numero)