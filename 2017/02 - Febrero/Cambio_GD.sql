SELECT YEAR(fecha_recepcion) A�O,MONTH(fecha_recepcion) MES,MIN(id_doc) MINIMO,MAX(id_doc) MAXIMO
FROM gd_documentos
GROUP BY YEAR(fecha_recepcion),MONTH(fecha_recepcion)
order by A�O,MES