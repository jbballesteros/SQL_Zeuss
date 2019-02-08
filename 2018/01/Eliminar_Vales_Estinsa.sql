DELETE FROM documentos_lin_ped
FROM documentos_PED DP INNER JOIN documentos_lin_ped DLP ON (DP.SW=DLP.sw AND DP.numero=DLP.numero)
WHERE DP.bodega=4 AND FECHA='19/01/2018' 


DELETE FROM documentos_lin_ped_historia
FROM documentos_PED DP INNER JOIN documentos_lin_ped_historia DLP ON (DP.SW=DLP.sw AND DP.numero=DLP.numero)
WHERE DP.bodega=4 AND FECHA='19/01/2018' 

DELETE
FROM documentos_PED
WHERE bodega=4 AND FECHA='19/01/2018'