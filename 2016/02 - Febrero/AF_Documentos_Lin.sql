USE [estinsa]
GO

/****** Object:  Trigger [dbo].[AF_Documentos_Lin]    Script Date: 06/05/2015 16:33:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[AF_Documentos_Lin]
   ON  [dbo].[documentos_lin]
   AFTER INSERT
AS 
DECLARE @IMPCONSUMO AS REAL
DECLARE @SW AS INTEGER
DECLARE @TIPO AS VARCHAR(4)
DECLARE @NUMERO AS INTEGER
DECLARE @CODIGO AS VARCHAR(20)
DECLARE @SEQ AS INT
SELECT @SW=SW, @CODIGO=CODIGO,@TIPO=TIPO,@NUMERO=NUMERO,@SEQ=SEQ FROM INSERTED
SELECT @IMPCONSUMO=IMPOCONSUMO FROM REFERENCIAS WHERE CODIGO=@CODIGO

IF @SW IN (1,2)
BEGIN
	UPDATE DOCUMENTOS_LIN
	SET IMPOCONSUMO=@IMPCONSUMO
	WHERE TIPO= @TIPO AND NUMERO=@NUMERO AND CODIGO=@CODIGO AND SEQ=@SEQ
END
GO


