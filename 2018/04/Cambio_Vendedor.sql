INSERT INTO terceros_cambio_vendedor (nit,vendedor_nuevo,activo,date_ins)
SELECT nit,143,1,GETDATE()
FROM terceros
WHERE vendedor=142


INSERT INTO CRM_citas (nit,id_gru,id_sub,fecha_hora,hora,comentario,usuario)
SELECT TC.nit,0,0,GETDATE(),
CAST(DATEPART(HOUR,GETDATE()) AS varchar)+CAST(DATEPART(MINUTE,GETDATE()) AS varchar),
'Cambió campo: vendedor, Ant: ' + cast (T.vendedor AS VARCHAR)  + ', Nuevo:' + cast (TC.vendedor_nuevo AS VARCHAR),'DMS1'
FROM terceros_cambio_vendedor TC INNER JOIN terceros T ON (TC.nit=T.nit)
WHERE TC.activo=1

UPDATE terceros
SET vendedor=TC.vendedor_nuevo
FROM terceros_cambio_vendedor TC INNER JOIN terceros T ON (TC.nit=T.nit)
WHERE TC.activo=1

UPDATE terceros_cambio_vendedor
SET activo=0,date_cambio=GETDATE()
WHERE activo=1
