SELECT RS.bodega,B.descripcion,R.codigo,R.descripcion,
SUM(CASE WHEN RS.mes=12 THEN RS.can_ini+RS.can_ent-RS.can_sal ELSE 0 END) DICIEMBRE,
SUM(CASE WHEN RS.mes=1 THEN RS.can_ini+RS.can_ent-RS.can_sal ELSE 0 END) ENERO,
SUM(CASE WHEN RS.mes=2 THEN RS.can_ini+RS.can_ent-RS.can_sal ELSE 0 END) FEBRERO
FROM referencias_sto RS 
INNER JOIN referencias R ON (RS.codigo=R.codigo)
INNER JOIN bodegas B ON (RS.bodega=B.bodega)
WHERE (ano=2015 and mes=12) OR (ano=2016 AND mes IN (1,2))
GROUP BY RS.bodega,B.descripcion,R.codigo,R.descripcion
HAVING  SUM(RS.can_ini+RS.can_ent-RS.can_sal)<>0