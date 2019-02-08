DECLARE @TIPO AS VARCHAR(5)='FVC1'
DECLARE @NUMERO AS INTEGER=6248
DECLARE @SW AS INTEGER=2

IF @SW=1
BEGIN

UPDATE documentos
SET vencimiento_presup=fecha,vencimiento=DATEADD(DAY, DATEDIFF(DAY,fecha,vencimiento),CAST(GETDATE() AS DATE)),fecha=CAST(GETDATE() AS DATE)
WHERE tipo=@TIPO AND numero=@NUMERO


END


IF @SW=2
BEGIN
UPDATE documentos
SET fecha=vencimiento_presup
WHERE tipo=@TIPO AND numero=@NUMERO

END

