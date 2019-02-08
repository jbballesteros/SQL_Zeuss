SELECT cn.*,r.descripcion
FROM control_numeracion_parametrizacion cn inner join referencias r on (cn.codigo=r.codigo)
WHERE bodega=4 AND manguera IN (14,18,24,26,29,30)
order by manguera