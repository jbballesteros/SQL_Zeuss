SELECT codigo,  numero_link,COUNT(numero_link)
FROM (

SELECT DL.tipo,DL.numero,DL.numero_link,DL.codigo
FROM documentos D INNER JOIN documentos_LIN DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.TIPO IN ('FVC1','FV1')
GROUP BY DL.tipo,DL.numero,DL.numero_link,DL.codigo

) AS P
GROUP BY CODIGO,numero_link
HAVING  COUNT(numero_link)>1
