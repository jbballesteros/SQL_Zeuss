
DECLARE @AÑO AS INTEGER=2017
DECLARE @MES AS INTEGER=8

UPDATE documentos_lin
SET valor_unitario=costo_unitario
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES AND D.sw IN (11,12)



UPDATE documentos
SET valor_total=P.COSTO, valor_aplicado=P.COSTO
FROM documentos D INNER JOIN (SELECT D.tipo,D.numero,D.fecha,D.valor_total,SUM(DL.costo_unitario*DL.cantidad) COSTO,DL.bodega
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.sw IN (11,12) AND YEAR(D.fecha)=@AÑO AND MONTH(D.fecha)=@MES
GROUP BY D.tipo,D.numero,D.fecha,D.valor_total,DL.bodega) AS P ON (D.tipo=P.tipo AND D.numero=P.numero)


