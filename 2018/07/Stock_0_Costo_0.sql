SELECT R.codigo,R.descripcion,RS.cos_ini+RS.cos_ent-RS.cos_sal,RS.can_ini+RS.can_ent-RS.can_sal
FROM referencias_sto RS INNER JOIN referencias R ON (RS.codigo=R.codigo)
WHERE (RS.cos_ini+RS.cos_ent-RS.cos_sal)  NOT BETWEEN -1 AND 1 AND (RS.can_ini+RS.can_ent-RS.can_sal)=0 AND RS.ano=2018 AND RS.mes=7