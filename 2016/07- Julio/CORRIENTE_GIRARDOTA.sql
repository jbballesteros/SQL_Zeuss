UPDATE documentos_lin
SET cantidad=P.ETANOL
FROM documentos_lin DL INNER JOIN

 (




SELECT DL.tipo TIPO,DL.numero NUMERO,DL.fec FECHA,DL.nit NIT,DL.codigo CODIGO,DL.cantidad CANTIDAD,DL2.codigo CODIGO1,DL2.cantidad CANTIDAD1,DL3.codigo CODIGO2,DL3.cantidad CANTIDAD2,
DL2.cantidad+DL3.cantidad ERROR,DL.cantidad*.92 CORRIENTE,DL.cantidad*.08 ETANOL
FROM documentos_lin DL 
LEFT JOIN documentos_lin DL2 ON (DL.tipo=DL2.tipo AND DL.numero=DL2.numero AND DL2.codigo=700102)
LEFT JOIN documentos_lin DL3 ON (DL.tipo=DL3.tipo AND DL.numero=DL3.numero AND DL3.codigo=700)
WHERE YEAR(DL.fec)=2016 AND MONTH(DL.fec)=6 AND DL.codigo=500) AS P ON (P.TIPO=DL.tipo AND P.NUMERO=DL.numero AND DL.codigo=700)





