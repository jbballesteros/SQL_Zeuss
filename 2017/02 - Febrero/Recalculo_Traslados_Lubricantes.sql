DECLARE @AÑO AS INTEGER=2018
DECLARE @MES AS INTEGER=9

-- CONSULTA DE COSTO DE SALIDAS DE TRASLADOS DE BODEGA-----

SELECT DT.tipo,DT.numero,DT.codigo,DT.id_lin,DT.cantidad,DT.costo,DL.costo_unitario,DL.costo_unitario-DT.costo DIFERENCIA
FROM documentos_traslados DT 
INNER JOIN referencias R ON (DT.codigo=R.codigo)
INNER JOIN documentos_lin DL ON (DL.tipo=DT.tipo AND DL.numero=DT.numero AND DL.codigo=DT.codigO AND DL.seq=DT.id_lin)
WHERE year(fecha_docs)=@AÑO AND MONTH(fecha_docs)=@MES AND DT.sw=11 AND R.clase='1'

---- CONSULTA DE ENTRADAS DE DOCUMENTOS_LIN


SELECT DL.tipo,DL.numero,DL.codigo,DL.seq,DL.cantidad,DL.costo_unitario,

CASE WHEN DL.codigo=P.codigo THEN P.costo ELSE   P.COSTO_SAL END COSTO_SAL , 

DL.costo_unitario-

(CASE WHEN DL.CODIGO=P.codigo THEN P.costo ELSE P.COSTO_SAL END) DIFERENCIA
FROM documentos_lin	DL INNER JOIN (
SELECT DT.tipo,DT.numero,DT.codigo,DT.id_lin,DT.cantidad,DT.costo ,DT2.costo*R.conversion COSTO_SAL,DT2.costo-DT.costo DIFERENCIA
FROM documentos_traslados DT INNER JOIN documentos_traslados DT2 ON (DT.id=DT2.id AND DT.id_lin=DT2.id_lin AND DT2.sw_doc=11)
INNER JOIN referencias R ON (DT.codigo=R.codigo)
WHERE year(DT.fecha_docs)=@AÑO AND MONTH(DT.fecha_docs)=@MES AND DT.sw_doc=12 AND R.clase='1') AS P ON (DL.tipo=P.tipo AND DL.numero=P.numero AND DL.codigo=P.codigo AND DL.seq=P.id_lin)


---- CONSULTA DE COSTO DE ENTRADAS 


SELECT DT.tipo,DT.numero,DT.codigo,DT.id_lin,DT.cantidad,DT.costo,
CASE 
WHEN DT.codigo=DT2.codigo THEN DT2.costo ELSE DT2.costo*R.conversion END,
(CASE WHEN DT.codigo=DT2.codigo THEN DT2.costo ELSE
DT2.costo*R.conversion END)-DT.costo DIFERENCIA
FROM documentos_traslados DT INNER JOIN documentos_traslados DT2 ON (DT.id=DT2.id AND DT.id_lin=DT2.id_lin AND DT2.sw_doc=11)
INNER JOIN referencias R ON (DT.codigo=R.codigo)
WHERE year(DT.fecha_docs)=@AÑO AND MONTH(DT.fecha_docs)=@MES AND DT.sw_doc=12 AND R.clase='1'

----- ACTUALIZAR EL COSTO DE LAS SALIDAS DE TRASLADOS DE BODEGA----
UPDATE documentos_traslados
SET costo=DL.costo_unitario
FROM documentos_traslados DT INNER JOIN documentos_lin DL ON (DL.tipo=DT.tipo AND DL.numero=DT.numero AND DL.codigo=DT.codigO AND DL.seq=DT.id_lin)
INNER JOIN referencias R ON (DT.codigo=R.codigo)
WHERE year(fecha_docs)=@AÑO AND MONTH(fecha_docs)=@MES AND DT.sw=11 AND R.clase='1'


----- ACTUALIZAR LAS ENTRADAS EN TABLA documentos_traslados

UPDATE documentos_traslados
SET costo=
CASE WHEN DT.codigo=DT2.codigo THEN DT2.costo
ELSE DT2.costo*R.conversion END
FROM documentos_traslados DT 
INNER JOIN (SELECT * FROM documentos_traslados) AS DT2 ON (DT.id=DT2.id AND DT.id_lin=DT2.id_lin AND DT2.sw_doc=11)
INNER JOIN referencias R ON (R.codigo=DT.codigo)
WHERE year(DT.fecha_docs)=@AÑO AND MONTH(DT.fecha_docs)=@MES AND DT.sw_doc=12 AND R.clase='1'




----- ACTUALIZAR DOCUMENTOS_LIN

UPDATE documentos_lin
SET costo_unitario=P.COSTO_SAL
FROM documentos_lin	DL INNER JOIN (
SELECT DT.tipo,DT.numero,DT.codigo,DT.id_lin,DT.cantidad,DT.costo  COSTO_SAL,DT2.costo-DT.costo DIFERENCIA
FROM documentos_traslados DT INNER JOIN documentos_traslados DT2 ON (DT.id=DT2.id AND DT.id_lin=DT2.id_lin AND DT2.sw_doc=11)
INNER JOIN referencias R ON (DT.codigo=R.codigo)
WHERE year(DT.fecha_docs)=@AÑO AND MONTH(DT.fecha_docs)=@MES AND DT.sw_doc=12 AND R.clase='1') AS P ON (DL.tipo=P.tipo AND DL.numero=P.numero AND DL.codigo=P.codigo AND DL.seq=P.id_lin)

