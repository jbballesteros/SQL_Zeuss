DECLARE @AÑO AS INTEGER=2017
DECLARE @MES AS INTEGER=10
DECLARE @SW AS INTEGER=2

IF @SW=1
BEGIN
	UPDATE zeusspruebas.dbo.tablag
	SET periodo=@MES


	DELETE 
	FROM zeusspruebas.dbo.documentos_acu
	WHERE ano=@AÑO AND mes=@MES


	DELETE 
	FROM ZEUSS.dbo.documentos_acu
	WHERE ano=@AÑO AND mes=@MES

END


IF @SW=2

BEGIN
	
	INSERT INTO ZEUSS.dbo.documentos_acu
	SELECT *
	FROM zeusspruebas.dbo.documentos_acu
		WHERE ano=@AÑO AND mes=@MES
	
	

END

