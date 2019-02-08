SELECT ROW_NUMBER() OVER(PARTITION BY CI.NIT ORDER BY CI.nit,CI.numero) ,CI.numero,T.nit,T.nombres,CI.id_cal,CI.valor
FROM compras_orden_calificacion CI INNER JOIN terceros T ON (CI.nit=T.nit)
WHERE id_cal=1
ORDER BY CI.nit,CI.id_cal,CI.numero ASC


