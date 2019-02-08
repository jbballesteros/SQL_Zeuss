USE [zeuss]
GO

/****** Object:  View [dbo].[documentos_ped_autorizacion]    Script Date: 10/31/2017 11:16:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[documentos_ped_autorizacion]
AS

SELECT numero,MAX(fecha) FECHA,USUARIO
FROM (
SELECT     SUBSTRING(que, CHARINDEX('-', que) - 1, 1) AS SW, SUBSTRING(que, CHARINDEX('-', que) + 1, 
			CHARINDEX('BODEGA', que) - CHARINDEX('-', que) - 2) 
			AS NUMERO, CAST (fecha AS DATETIME) fecha , U.des_usuario USUARIO
			FROM dbo.auditoria A
			LEFT JOIN usuarios U ON A.usuario=U.usuario
			WHERE (que LIKE '%Autorizó pedido%')
) AS P
GROUP BY numero,USUARIO






GO


