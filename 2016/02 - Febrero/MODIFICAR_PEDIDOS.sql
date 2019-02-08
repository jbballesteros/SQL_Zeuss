SELECT *
FROM documentos_ped	DP LEFT JOIN documentos_lin_ped DLP ON (DP.numero=DLP.numero AND DP.sw=1)
where DP.nit=900624540  AND DP.fecha BETWEEN '01/10/2015' AND '15/10/2015'




SELECT *
FROM documentos_ped	DP LEFT JOIN documentos_lin_ped_historia DLP ON (DP.numero=DLP.numero AND DP.sw=1)
where DP.nit=900624540  AND DP.fecha BETWEEN '01/10/2015' AND '15/10/2015'

UPDATE documentos_ped
SET bodega=DP.nit_destino
FROM documentos_ped	DP LEFT JOIN documentos_lin_ped_historia DLP ON (DP.numero=DLP.numero AND DP.sw=1)
where DP.nit=900624540  AND DP.fecha BETWEEN '01/10/2015' AND '15/10/2015'