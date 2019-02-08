--13381

DECLARE @TIPO AS VARCHAR(4)='EG'
DECLARE @NUMERO AS INTEGER=3332


DELETE FROM documentos
WHERE tipo=@TIPO AND numero=@NUMERO

DELETE FROM vehiculos_factura_z
WHERE tipo=@TIPO AND numero=@NUMERO



UPDATE consecutivos
SET siguiente=@NUMERO-1
WHERE tipo=@TIPO


SELECT *
FROM consecutivos
WHERE tipo=@TIPO
