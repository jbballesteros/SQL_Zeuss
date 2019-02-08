SELECT P.*,S.ULTIMA_FECHA
FROM (

SELECT B.bodega COD_BOD,B.descripcion BODEGA,R.codigo CODIGO,
R.descripcion PRODUCTO,RC.descripcion CLASE,
(RS.can_ini+RS.can_ent-RS.can_sal) STOCK
FROM referencias_sto RS 
INNER JOIN referencias R ON (RS.codigo=R.codigo)
LEFT JOIN referencias_cla RC ON (R.clase=RC.clase)
INNER JOIN bodegas B ON (RS.bodega=B.bodega)
WHERE ((RS.can_ini+RS.can_ent-RS.can_sal)<>0) AND RS.ano=YEAR(GETDATE()) AND RS.mes=MONTH(GETDATE())

) AS P LEFT JOIN (


SELECT codigo CODIGO,MAX(fec) ULTIMA_FECHA
FROM documentos_lin
WHERE sw=1 AND maneja_inventario='S'
GROUP BY codigo ) AS S ON (P.CODIGO=S.CODIGO)
WHERE ULTIMA_FECHA<DATEADD(DAY,-90,CAST(GETDATE() AS DATE)) AND COD_BOD=1