

SELECT D.tipo,DL.numero,DL.bodega,DL.codigo,DL2.cantidad*380 N_VALOR,REPLACE(DL.adicional,'7.46','7.45') adicional,D.concepto,DL.costo_unitario/DL2.cantidad unitario
--INTO  TEMP2
FROM documentos D 
INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN referencias R ON (DL.codigo=R.codigo)
LEFT JOIN documentos_lin DL2 ON (D.prefijo=DL2.tipo AND D.documento=DL2.numero AND DL.codigo=DL2.codigo)
WHERE D.fecha BETWEEN '01/04/2017' AND '30/04/2017' AND D.tipo='SCP'  AND DL.codigo=900157



UPDATE documentos_lin
SET costo_unitario=T.N_VALOR , valor_unitario=T.N_VALOR,adicional=T.adicional
FROM documentos_lin DL INNER JOIN TEMP2 T ON (DL.tipo=T.TIPO AND DL.numero=T.NUMERO AND DL.codigo=T.CODIGO)


drop table TEMP2