SELECT BT.nit,T.nombres,BT.tipo,BT.numero,fecha,ROUND(VALORCM,0) VALORCM,vencimiento,VENCIMIENTOF,BT.DIAS,
round(((2.4/30)*BT.DIAS)*VALORCM/100,0)
FROM bon_bonificacion_tbl BT 
INNER JOIN terceros T ON (BT.nit=T.nit)
LEFT JOIN documentos_intereses	DI ON (BT.tipo=DI.TIPO AND BT.NUMERO=DI.NUMERO)
WHERE fecha>='01/04/2017'  AND VENCIMIENTOF <CAST(GETDATE() AS DATE)
AND ( BT.DIAS>0) AND

ISNULL(T.concepto_8,'0')='0'  AND ISNULL(T.CONCEPTO_9,'0')='0'
AND BT.tipo<>'LB'
GROUP BY BT.nit,T.nombres,BT.tipo,BT.numero,fecha,VALORCM,VENCIMIENTOF,vencimiento,BT.DIAS