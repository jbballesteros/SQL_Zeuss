DECLARE @AÑO AS INTEGER=2015
DECLARE @MES AS INTEGER=3

SELECT *,P.valor_total/S.CANTIDAD2
FROM (
SELECT D.tipo,D.numero,D.fecha,DL.codigo,DL.cantidad,D.valor_total,D.prefijo,D.documento
FROM documentos D INNER JOIN documentos_lin	DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN v_referencias_sube_costo V ON (V.TIPO=D.tipo AND V.CODIGO=DL.codigo)
WHERE D.sw IN (13,14) AND YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES  ) AS P
FULL JOIN (


SELECT D.tipo,D.numero,D.fecha,DL.codigo,DL.cantidad CANTIDAD2,D.valor_total
FROM documentos D 
INNER JOIN documentos_lin	DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
INNER JOIN v_referencias_sube_costo V ON (V.CODIGO=DL.codigo)
WHERE D.sw IN (3,4) AND YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES ) AS S ON (P.prefijo=S.tipo AND P.documento=S.numero AND P.codigo=S.codigo)