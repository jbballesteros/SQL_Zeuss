DECLARE @FECHA AS DATE='17/11/2016'
DECLARE @BODEGA AS INTEGER=4


DELETE FROM movimiento
FROM documentos D 
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN documentos_ped DP ON (D.tipo='AJV' AND D.documento=DP.numero AND DP.sw=1)
WHERE DP.fecha=@FECHA AND DP.bodega=@BODEGA and DP.notas = 'Vale importador automaticamente Interfaz Atio'


DELETE FROM documentos
FROM documentos D 
INNER JOIN documentos_ped DP ON (D.tipo='AJV' AND D.documento=DP.numero AND DP.sw=1)
WHERE DP.fecha=@FECHA AND DP.bodega=@BODEGA and  DP.notas = 'Vale importador automaticamente Interfaz Atio'

DELETE documentos_lin_ped_historia
FROM documentos_ped DP INNER JOIN documentos_lin_ped_historia DLH ON (DP.numero=DLH.numero AND DP.sw=1)
WHERE fecha=@FECHA AND DP.bodega=@BODEGA and  DP.notas = 'Vale importador automaticamente Interfaz Atio'


DELETE documentos_lin_ped
FROM documentos_ped DP INNER JOIN documentos_lin_ped DLH ON (DP.numero=DLH.numero AND DP.sw=1)
WHERE fecha=@FECHA AND DP.bodega=@BODEGA and  DP.notas = 'Vale importador automaticamente Interfaz Atio'




DELETE documentos_ped_historia
FROM documentos_ped DP INNER JOIN documentos_ped_historia DLH ON (DP.numero=DLH.numero AND DP.sw=1)
WHERE DP.fecha=@FECHA AND DP.bodega=@BODEGA and  DP.notas = 'Vale importador automaticamente Interfaz Atio'

DELETE documentos_ped
FROM documentos_ped DP 
WHERE DP.fecha=@FECHA AND DP.bodega=@BODEGA and  DP.notas = 'Vale importador automaticamente Interfaz Atio'

