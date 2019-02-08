


SELECT P.BODEGA,P.CODIGO, P.PRODUCTO,SUM(COSTO_STOCK) COSTO_STOCK,SUM(P.STOCK) STOCK,SUM(ISNULL(S.PROMEDIO,0)) PROMEDIO,
SUM(CASE WHEN ISNULL(PROMEDIO,0) = 0 THEN 0 ELSE STOCK/PROMEDIO END) DSI
FROM (
SELECT RS.bodega BODEGA,rs.codigo CODIGO, R.descripcion PRODUCTO, ((can_ini+can_ent)-can_sal) STOCK, ((RS.cos_ini + cos_ent)-cos_sal) COSTO_STOCK
FROM referencias_sto RS
INNER JOIN referencias R ON (RS.codigo=R.codigo)
INNER JOIN bodegas B ON (RS.bodega=B.bodega)
WHERE R.subgrupo2 IN (34,36) AND RS.ano= year(getdate()) and rs.mes= MONTH(getdate()) AND RS.bodega IN (101,200)  ) AS P
LEFT JOIN (
select ZL.bodega BODEGA,zl.codigo CODIGO, ROUND(((SUM(ZL.CAN_VENTAS - ZL.CAN_DEVOLU))/180),2) PROMEDIO
from Zeuss_Lin_Ventas ZL CROSS JOIN v_fecha_6_meses V
WHERE subgrupo2 IN (34,36) AND ZL.FEC BETWEEN V.INICIAL AND V.FINAL
GROUP BY ZL.bodega,ZL.codigo, ZL.descripcion
) AS S ON (P.CODIGO=S.CODIGO AND P.BODEGA=S.BODEGA)
WHERE P.STOCK<>0
GROUP BY P.BODEGA,P.CODIGO, P.PRODUCTO 

