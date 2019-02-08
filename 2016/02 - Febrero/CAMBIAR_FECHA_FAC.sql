UPDATE documentos
SET fecha=DD.fecha,vencimiento=DD.vencimiento
FROM documentos D INNER JOIN estinsapruebas.dbo.documentos DD ON (D.tipo=DD.tipo AND D.numero=DD.numero)
WHERE D.tipo='FVT4' AND D.numero IN (1726,1755)