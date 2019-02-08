DECLARE @TIPO AS VARCHAR(20)='FV'
DECLARE @NUMERO AS INTEGER=200404		
DECLARE @EMPRESA AS INTEGER=1
DECLARE @ID_ELECTRONICO AS INTEGER
DECLARE @ID_FACTIBLE AS INTEGER=22099

INSERT INTO Factura_electronica (tipo,numero,estado,empresa,sw)
VALUES (@TIPO,@NUMERO,1,@EMPRESA,1)

SELECT @ID_ELECTRONICO=id
FROM Factura_electronica
WHERE tipo=@TIPO AND numero=@NUMERO

INSERT INTO Factura_historica (id_electronico,idDocumentoElectronico,fecha_hora,empresa,estado,qr_data)
VALUES (@ID_ELECTRONICO,@ID_FACTIBLE,GETDATE(),@EMPRESA,1,'')

