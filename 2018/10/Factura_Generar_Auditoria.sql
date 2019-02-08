SELECT* 
FROM Factura_electronica FE INNER JOIN Factura_historica FH ON (FE.id=FH.id_electronico)
WHERE FE.tipo='FV' AND FE.numero=201209


declare @texto as text

SELECT cast(archivoxml as text)
FROM auditoria_sonda
WHERE CAST(fecha_hora AS DATE)='08/10/2018' and id=4376
ORDER BY fecha_hora DESC

print @texto