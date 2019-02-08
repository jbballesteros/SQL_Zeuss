SELECT ZL.ano,ZL.nit,T.nombres,RS.subgrupo2,RS.descripcion,

SUM(CASE WHEN ZL.mes=1 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) ENERO,
SUM(CASE WHEN ZL.mes=1 THEN   ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) ENERO,

SUM(CASE WHEN ZL.mes=2 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) FEBRERO,
SUM(CASE WHEN ZL.mes=2 THEN   ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) FEBRERO,

SUM(CASE WHEN ZL.mes=3 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) MARZO,
SUM(CASE WHEN ZL.mes=3 THEN   ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) MARZO,

SUM(CASE WHEN ZL.mes=4 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) ABRIL,
SUM(CASE WHEN ZL.mes=4 THEN    ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) ABRIL,

SUM(CASE WHEN ZL.mes=5 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) MAYO,
SUM(CASE WHEN ZL.mes=5 THEN     ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) MAYO,

SUM(CASE WHEN ZL.mes=6 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END)  JUNIO,
SUM(CASE WHEN ZL.mes=6 THEN    ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END)  JUNIO,

SUM(CASE WHEN ZL.mes=7 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) JULIO,
SUM(CASE WHEN ZL.mes=7 THEN     ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) JULIO,

SUM(CASE WHEN ZL.mes=8 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) AGOSTO,
SUM(CASE WHEN ZL.mes=8 THEN     ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) AGOSTO,

SUM(CASE WHEN ZL.mes=9 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) SEPTIEMBRE,
SUM(CASE WHEN ZL.mes=9 THEN     ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) SEPTIEMBRE,

SUM(CASE WHEN ZL.mes=10 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) OCTUBRE,
SUM(CASE WHEN ZL.mes=10 THEN     ZL.vlr_ventas-ZL.vlr_devolu ELSE 0 END) OCTUBRE,


SUM(CASE WHEN ZL.mes=11 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) NOVIEMBRE,
SUM(CASE WHEN ZL.mes=11 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) NOVIEMBRE,

SUM(CASE WHEN ZL.mes=12 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) DICIEMBRE,
SUM(CASE WHEN ZL.mes=12 THEN   ZL.can_ventas-ZL.can_devolu ELSE 0 END) DICIEMBRE
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias_sub2 RS ON (ZL.subgrupo2=RS.subgrupo2)
WHERE ZL.ano IN (2014,2015) 
AND T.nit IN (909529,909866)
AND ZL.subgrupo2 IN (2,3,4)
GROUP BY ZL.ano,ZL.nit,T.nombres,RS.subgrupo2,RS.descripcion