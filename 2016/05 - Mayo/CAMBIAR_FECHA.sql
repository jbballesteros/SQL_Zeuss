DECLARE @TIPO AS VARCHAR(10)='DC'
DECLARE @NUMERO AS INTEGER=79
DECLARE @FECHA AS DATE='01/07/2017'



UPDATE movimiento
SET fec=@FECHA
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.tipo=@TIPO AND D.numero=@NUMERO


UPDATE documentos_lin
SET fec=@FECHA
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo=@TIPO AND D.numero=@NUMERO


UPDATE documentos
SET fecha=@FECHA
WHERE tipo=@TIPO AND numero=@NUMERO

SELECT 'FECHA_MOVIMIENTO' RESULTADO ,D.tipo,D.numero,D.fecha,M.fec
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.tipo=@TIPO AND D.numero=@NUMERO
UNION
SELECT 'FECHA DOCUMENTOS LIN',D.tipo,D.numero,D.fecha,DL.fec
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE D.tipo=@TIPO AND D.numero=@NUMERO