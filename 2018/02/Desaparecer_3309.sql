DECLARE @MAX AS INTEGER

SELECT 


SELECT DI.tipo,DI.numero
FROM documentos_despacho_insertados DI LEFT JOIN Zeuss_Lin_Ventas ZL ON (DI.tipo=ZL.tipo AND DI.numero=ZL.numero)
WHERE( NOT  (ZL.ano=YEAR(GETDATE()) AND ZL.MES=MONTH(GETDATE()) AND ZL.SUBGRUPO IN (2,3,4)) OR ZL.TIPO IS NULL ) AND DI.insertado=0