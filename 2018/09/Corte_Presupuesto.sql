USE [zeuss]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spInformeVentasDiarias_ContruccionTBL]
		@ANO = 2018,
		@MES = 9,
		@DIA = 18,
		@CONFIGURACION = 99

SELECT	'Return Value' = @return_value

GO
