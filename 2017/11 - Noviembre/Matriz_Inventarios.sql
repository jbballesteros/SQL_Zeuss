SELECT RS.ANO AÑO,RS.MES MES,B.bodega COD_SEDE,	B.descripcion SEDE,R.codigo CODIGO,R.subgrupo2 SUBGRUPO,RS2.descripcion DES_SUBGRUPO,R.descripcion PRODUCTO,
RS.can_ini INICIAL,RS.can_ent ENTRANTE,RS.can_sal SALIENTE,
RS.can_ini+RS.can_ent-RS.can_sal  FINAL,
RS.cos_ini COSTO_INICIAL,RS.cos_ent COSTO_ENTRANTE,RS.cos_sal COSTO_SALIENTE,
RS.cos_ini+RS.cos_ent-RS.cos_sal  COSTO_FINAL,
CASE WHEN (RS.can_ini+RS.can_ent-RS.can_sal) BETWEEN -0.3 AND 0.3 THEN 0 ELSE
(RS.cos_ini+RS.cos_ent-RS.cos_sal)/(RS.can_ini+RS.can_ent-RS.can_sal ) END COSTO_PROMEDIO
FROM referencias_sto RS 
INNER JOIN referencias R ON (RS.codigo=R.codigo)
INNER JOIN bodegas B ON (RS.bodega=B.bodega )
LEFT JOIN referencias_sub2 RS2 ON (R.subgrupo2=RS2.subgrupo2)
WHERE RS.ano=2017  AND R.subgrupo2 in (7,8,5,6,9) AND 
(RS.can_ent<>0 or RS.can_ini<>0 AND RS.can_ent<>0 )
ORDER BY B.bodega,R.codigo