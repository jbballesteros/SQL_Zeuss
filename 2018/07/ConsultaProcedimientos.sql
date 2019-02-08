SELECT O.name procedimiento,A.name parametro,T.name tipo_dato
FROM sys.objects O 
INNER JOIN sys.all_parameters A ON (O.object_id=A.object_id)
INNER JOIN sys.types T ON (A.system_type_id=T.system_type_id)
WHERE O.name='spGDDocumentos'