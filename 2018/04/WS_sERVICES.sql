SET XACT_ABORT ON
DECLARE @ID INT = 0
DECLARE @NUMERO DECIMAL(18,0)
DECLARE @NIT DECIMAL(18,0)
DECLARE @VENDEDOR DECIMAL(18,0)
DECLARE @CODIGOFACTURA VARCHAR (150)
DECLARE @CODIGOBANCO VARCHAR(10)
DECLARE @VALORFACTURA MONEY
DECLARE @FECHAPAGO DATETIME
DECLARE @TIPO VARCHAR(5)
DECLARE @COUNT INT
DECLARE @EMPRESA VARCHAR(50)
DECLARE @FECHA_TXT AS VARCHAR(10)
DECLARE @CENTRO AS INT=1000
DECLARE @TSQL VARCHAR(100)=''
DECLARE @RST BIT
DECLARE @ERROR VARCHAR (250)=''
DECLARE @NOMBRES VARCHAR (250)=''
DECLARE @ID_ANTERIOR INT
DECLARE @PASO INT = NULL
DECLARE @MAIL VARCHAR(MAX)
DECLARE @BANCORECAUDADOR VARCHAR(50)
DECLARE @NIT_REAL DECIMAL(18,0)
DECLARE @ANTICIPO BIT
DECLARE @CONTROL_CARTERA AS BIT
DECLARE @

SELECT @CONTROL_CARTERA=control_cartera
FROM tablag

IF @CONTROL_CARTERA=1
BEGIN
	RETURN
END

------ TABLA DE PAGOS EN ESTADO PENDIENTE -----------

DROP TABLE v_ws_urlconfirmacion_tbl
SELECT VW.*
INTO v_ws_urlconfirmacion_tbl
FROM v_ws_urlconfirmacion VW 
LEFT JOIN  control_ws_alerta CW ON (VW.id=CW.id)
LEFT JOIN y_personal_contratos YC ON (CAST(VW.CodigoFactura AS DECIMAL(18,0))=YC.nit)
WHERE VW.se_interfazo IS NULL AND CW.id IS NULL AND VW.empresa='ZEUSS' AND YC.nit IS NULL AND LEN(codigoFactura)>5

-------------------------------------------------------
DECLARE WS_CURSOR CURSOR 
FOR

SELECT TB.id,TB.codigoFactura,CAST(SUBSTRING(TB.codigoFactura,4,15) AS DECIMAL) numero,
CAST(TB.fechaPago AS DATE) fechapago,CAST(TB.valorFactura as money) valorfactura,TB.codBancoRecaudador,TB.bancoRecaudador,
CAST(CodigoFactura AS decimal) nitreal
FROM v_ws_urlconfirmacion_tbl TB

OPEN WS_CURSOR
FETCH NEXT FROM WS_CURSOR INTO @ID,@CODIGOFACTURA,@NUMERO,@FECHAPAGO,@VALORFACTURA,@CODIGOBANCO,@BANCORECAUDADOR,@NITREAL