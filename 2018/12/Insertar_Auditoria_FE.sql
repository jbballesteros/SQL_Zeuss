DECLARE @TIPO AS VARCHAR(4)='NC'
DECLARE @NUMERO AS INTEGER=47778
DECLARE @ID_ELECTRONIC AS INTEGER
DECLARE @ID_FACTIBLE AS INTEGER=87951
DECLARE @SW AS INTEGER


SELECT @SW=sw
FROM ryrlub.dbo.documentos
WHERE tipo=@TIPO AND numero=@NUMERO


SELECT @ID_ELECTRONIC=id
FROM Factura_electronica
WHERE tipo=@TIPO AND numero=@NUMERO


INSERT INTO Factura_electronica(tipo,numero,estado,empresa,sw)
VALUES (@TIPO,@NUMERO,1,2,@SW)

SELECT @ID_ELECTRONIC=id
FROM Factura_electronica
WHERE tipo=@TIPO AND numero=@NUMERO

INSERT INTO Factura_historica (id_electronico,fecha_hora,estado,idDocumentoElectronico,empresa,qr_data)
VALUES (@ID_ELECTRONIC,GETDATE(),1,@ID_FACTIBLE,2,'')






