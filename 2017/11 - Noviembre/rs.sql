SELECT R.codigo CODIGO,R.descripcion PRODUCTO,RS.can_ini INICIAL,RS.can_ent ENTRANTE,RS.can_sal SALIENTE,RS.can_ini+RS.can_ent-RS.can_sal CANTIDAD,(RS.cos_ini+RS.cos_ent-RS.cos_sal) COSTO
FROM referencias_sto RS INNER JOIN referencias R ON (RS.codigo=R.codigo)
WHERE RS.ano=2017 AND RS.mes=10 AND RS.bodega=201
