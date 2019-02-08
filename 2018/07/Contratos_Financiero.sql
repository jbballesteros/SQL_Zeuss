SELECT CT.CLIENTE CLIENTE,T.nit_real  NIT,ISNULL(P.valor,0) VALOR_FACTURAS,ISNULL(P.facturas,0) CANTIDAD_FACTURAS,ISNULL(T.cupo_credito,0) + ISNULL(TR.cupo_credito,0) CUPO,
YC.descripcion + ' - ' + YD.descripcion UBICACION,ISNULL(S.nombre,'') PROPIETARIO
FROM contratos_eds_tbl CT 
INNER JOIN terceros T ON (CT.NIT=T.nit)
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN y_ciudades YC ON (T.y_ciudad=YC.ciudad AND T.y_dpto=YC.departamento)
INNER JOIN y_departamentos YD ON (YC.departamento=YD.departamento AND YC.pais='169')
LEFT JOIN (
 
SELECT nit,ROUND(SUM(valor_total)/6,0) valor,ROUND(COUNT(tipo)/6.00,2) facturas
FROM documentos
WHERE sw=1 AND fecha BETWEEN '01/01/2018' AND '30/06/2018' AND anulado=0
GROUP BY nit) AS P ON (CT.NIT=P.nit)
LEFT JOIN (
SELECT nit,nombre,tel_ofi1
FROM CRM_contactos
WHERE cargo='PROPIETARIO') AS S ON (CT.NIT=S.nit)

