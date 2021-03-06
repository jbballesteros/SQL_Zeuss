

ALTER TRIGGER [dbo].[tg_Referencias_INS_UPD]
   ON  [dbo].[referencias]
   FOR INSERT,UPDATE
AS 
BEGIN	
	DECLARE @USUARIO AS VARCHAR(25)	
	DECLARE @MANEJA_INVENTARIO AS BIT
	DECLARE @MENSAJE AS VARCHAR(250)
	DECLARE @CODIGO AS VARCHAR(20)

	SELECT @MANEJA_INVENTARIO=I.maneja_inventario,@CODIGO=I.codigo
	FROM inserted I

	IF NOT EXISTS (SELECT * FROM referencias WHERE codigo=@CODIGO and maneja_inventario=@MANEJA_INVENTARIO)
	BEGIN
	
		SET @MENSAJE='No puede cambiar un producto de servicio a inventario o viceversa : tg_Referencias_INS_UPD'
		ROLLBACK TRANSACTION
		RAISERROR(@mensaje,11,2)
		RETURN
	END

	IF @MANEJA_INVENTARIO=0 AND NOT (@USUARIO IN ('COORADMIN','AUXADMON2','ADMIN'))
	BEGIN
		SET @MENSAJE='No tiene permiso para crear este tipo de referencia comuniquese con Asistente Administrativo : tg_Referencias_INS_UPD'
		SET @MENSAJE=@USUARIO
		ROLLBACK TRANSACTION
		RAISERROR(@mensaje,11,2)
		RETURN
	END
END
