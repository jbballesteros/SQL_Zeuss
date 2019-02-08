SELECT B.bodega COD_SEDE,	B.descripcion SEDE,R.codigo CODIGO,R.descripcion PRODUCTO,
RS.can_ini INICIAL,RS.can_ent ENTRANTE,RS.can_sal SALIENTE,
RS.can_ini+RS.can_ent-RS.can_sal  FINAL,
RS.cos_ini COSTO_INICIAL,RS.cos_ent COSTO_ENTRANTE,RS.cos_sal COSTO_SALIENTE,
RS.cos_ini+RS.cos_ent-RS.cos_sal  COSTO_FINAL,
(RS.cos_ini+RS.cos_ent-RS.cos_sal)/(RS.can_ini+RS.can_ent-RS.can_sal ) COSTO_PROMEDIO
FROM referenciars_sto RS 
INNER JOIN referencias R ON (RS.codigo=R.codigo)
INNER JOIN bodegas B ON (RS.bodega=B.bodega )
WHERE RS.ano=2017 AND RS.mes=10 AND R.clase='01' AND 
(RS.can_ent<>0 or RS.can_ini<>0 AND RS.can_ent<>0 )
ORDER BY B.bodega,R.codigo