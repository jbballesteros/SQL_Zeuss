--CONTABLEMENTE: DB. 41350801 (GAS CTE),  41350803 (GAS EXTRA) Y CR. 13050501

SELECT  *
FROM         documentos D
INNER JOIN terceros T ON (D.nit=T.nit)
LEFT JOIN condiciones_pago CP ON (T.condicion=CP.condicion)
WHERE     (D.tipo = 'NC') AND (D.numero between 14723 and 14744)


SELECT     tipo, numero, 1, '13050501', 0, nit,fec , valor
FROM         movimiento
WHERE     (tipo = 'NC') AND (numero = 14722)


SELECT tipo, numero, 1, '13050501', 0, nit,fecha, valor_total 
 FROM documentos D
WHERE     (D.tipo = 'NC') AND (D.numero between 14723 and 14744)

INSERT INTO  movimiento(tipo, numero, seq, cuenta, centro, nit, fec, valor)
SELECT tipo, numero, 1, '13050501', 0, nit,fecha, valor_total 
 FROM documentos D
WHERE     (D.tipo = 'NC') AND (D.numero between 14723 and 14744)

UPDATE movimiento
SET valor=valor*-1
WHERE     (tipo = 'NC') AND (numero between 14723 and 14744)



INSERT INTO  movimiento(tipo, numero, seq, cuenta, centro, nit, fec, valor)
SELECT tipo, numero, case when subgrupo2=2 then 2 else 3 end ,CASE WHEN subgrupo2=2 THEN '41350801' ELSE '41350803' END,1191, NIT,fecha,
case when subgrupo2=2 then CANTIDAD*73.62 else CANTIDAD*73.62 end 
FROM (
select DD.tipo,DD.numero, ZL.nit,T.nombres,zl.subgrupo2,D.fecha ,ZL.can_ventas-ZL.can_devolu CANTIDAD
from Zeuss_Lin_Ventas ZL
INNER JOIN terceros T ON (T.nit=ZL.nit)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN (SELECT tipO, NUMERO,prefijo,documento FROM documentos
WHERE numero between 14723 and 14744 )DD ON (ZL.tipo=DD.prefijo AND ZL.numero=DD.documento)
where ZL.tipo= 'fv' and ZL.numero in (134860,134862,
134863,134866,134867,134868,134869,134873,134874,134875,134876,134877,134878,134879,
134880,134881,134882,134884,134885,134886,134887,134890)  AND ZL.subgrupo2 IN (2,4)
GROUP BY DD.tipo,DD.numero,ZL.tipo,ZL.numero,ZL.nit,T.vendedor,T.nombres,ZL.subgrupo2,ZL.can_ventas,ZL.can_devolu,D.fecha )AS P
