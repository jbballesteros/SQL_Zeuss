DECLARE @SW AS INTEGER=2
DECLARE @TIPO AS VARCHAR(20)='RC'
DECLARE @NUMERO AS INTEGER=269410

IF @SW=1
BEGIN
	INSERT INTO movimientos_pendientes_historia
	SELECT tipo,numero,seq,cuenta,centro,nit,fec,valor,documento,explicacion,2017,9
	FROM movimiento
	where tipo=@TIPO AND numero=@NUMERO
END
IF @SW=2
BEGIN
	INSERT INTO movimientos_pendientes
	SELECT tipo,numero,seq,cuenta,centro,nit,fec,valor,documento,explicacion
	FROM movimiento
	where tipo=@TIPO AND numero=@NUMERO
END




