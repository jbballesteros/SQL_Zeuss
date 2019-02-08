SELECT DL.tipo,DL.numero,DL.codigo,R.descripcion,DL.valor_unitario,DL2.valor_unitario
FROM documentos_lin DL 
INNER JOIN zeusspruebas.dbo.documentos_lin DL2 ON (DL.tipo=DL2.tipo AND DL.numero=DL2.numero AND DL.codigo=DL2.codigo)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
WHERE R.subgrupo2  IN (13,20,21) AND YEAR(DL.fec)=2016 AND MONTH(DL.fec)=4 

