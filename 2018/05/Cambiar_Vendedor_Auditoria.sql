INSERT INTO auditoria (fecha,pc,usuario,programa,que,forma,nivel)
SELECT GETDATE(),HOST_NAME(),'DMS1','','Cambió vendedor del Nit ' + cast (T.nit AS VARCHAR)  + '  Antes  '  + cast (T.vendedor AS VARCHAR)  + '  Nuevo  ' + + cast (TC.vendedor_nuevo AS VARCHAR) ,'0105',0
FROM terceros_cambio_vendedor TC INNER JOIN terceros T ON (TC.nit=T.nit)
WHERE TC.activo=0 AND T.vendedor<>TC.vendedor_nuevo



UPDATE terceros
SET vendedor=TC.vendedor_nuevo
FROM terceros_cambio_vendedor TC INNER JOIN terceros T ON (TC.nit=T.nit)
WHERE TC.activo=0 AND T.vendedor<>TC.vendedor_nuevo

UPDATE terceros_cambio_vendedor
SET activo=1
WHERE activo=0