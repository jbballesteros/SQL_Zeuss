SELECT MT.descripcion_tanque GRUPO,
MT.descripcion_tanque + ' - ' + CD.Tanque PRODUCTO,
CD.ExisIni INICIAL,CD.Recibido RECIBIDO,CD.Salida SALIDAS,
CD.Saldos,CD.Ajustes,CD.Posicion '#AJ',CD.InvFin FINAL,
CD.Recibos RECIBOS,CD.Operacion OPERACION,CD.Total TOTAL,CD.ExpVolDesp EXPANSION
FROM Control_diario CD 
INNER  JOIN Maestro_Tanques MT ON (CD.Tanque=MT.codigo)
INNER JOIN Producto P ON (MT.producto=P.Cod_Producto)
WHERE FechaRegistro='02/06/2017'
ORDER BY MT.id asc

