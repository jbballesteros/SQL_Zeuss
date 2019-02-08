USE [zeuss]
GO

/****** Object:  View [dbo].[Zeuss_VentasDiarias_eds]    Script Date: 03/14/2016 10:14:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Zeuss_VentasDiarias_eds]
AS
SELECT     bodega, descripcion, ano, mes, TIPO, CORRIENTE, ACPM, EXTRA, TOTAL, SUBSTRING(CONVERT(VARCHAR(50), CAST(ACPM AS MONEY), 1), 1, CHARINDEX('.', CONVERT(VARCHAR(50), 
                      CAST(ACPM AS MONEY), 1)) - 1) AS TACPM, SUBSTRING(CONVERT(VARCHAR(50), CAST(CORRIENTE AS MONEY), 1), 1, CHARINDEX('.', CONVERT(VARCHAR(50), CAST(CORRIENTE AS MONEY), 1)) - 1)
                       AS TCORRIENTE, SUBSTRING(CONVERT(VARCHAR(50), CAST(EXTRA AS MONEY), 1), 1, CHARINDEX('.', CONVERT(VARCHAR(50), CAST(EXTRA AS MONEY), 1)) - 1) AS TEXTRA, 
                      SUBSTRING(CONVERT(VARCHAR(50), CAST(TOTAL AS MONEY), 1), 1, CHARINDEX('.', CONVERT(VARCHAR(50), CAST(TOTAL AS MONEY), 1)) - 1) AS TTOTAL
FROM         (SELECT     bodega, descripcion, ano, mes, 'TOTAL' AS TIPO, SUM(CanGasolina) AS CORRIENTE, SUM(CanAcpm) AS ACPM, SUM(CanExtra) AS EXTRA, SUM(TOTALCAN) AS TOTAL
                       FROM          dbo.Zeuss_VentasDiarias
                       WHERE      (CAST(FECHA AS DATE) <= CAST(GETDATE() AS DATE))
                       GROUP BY bodega, descripcion, ano, mes
                       UNION
                       SELECT     bodega, descripcion, ano, mes, 'PROMEDIO' AS TIPO, SUM(CanGasolina) / DAY(GETDATE()) AS CORRIENTE, SUM(CanAcpm) / DAY(GETDATE()) AS ACPM, SUM(CanExtra) / DAY(GETDATE()) 
                                             AS EXTRA, SUM(TOTALCAN) / DAY(GETDATE()) AS TOTAL
                       FROM         dbo.Zeuss_VentasDiarias AS Zeuss_VentasDiarias_2
                       WHERE     (CAST(FECHA AS DATE) <= CAST(GETDATE() AS DATE))
                       GROUP BY bodega, descripcion, ano, mes
                       UNION
                       SELECT     bodega, descripcion, ano, mes, 'PROYECCION' AS TIPO, SUM(CanGasolina) / DAY(GETDATE()) * DAY(DATEADD(D, DAY(GETDATE()) * - 1, DATEADD(M, 1, GETDATE()))) AS CORRIENTE, 
                                             SUM(CanAcpm) / DAY(GETDATE()) * DAY(DATEADD(D, DAY(GETDATE()) * - 1, DATEADD(M, 1, GETDATE()))) AS ACPM, SUM(CanExtra) / DAY(GETDATE()) * DAY(DATEADD(D, DAY(GETDATE()) 
                                             * - 1, DATEADD(M, 1, GETDATE()))) AS EXTRA, SUM(TOTALCAN) / DAY(GETDATE()) * DAY(DATEADD(D, DAY(GETDATE()) * - 1, DATEADD(M, 1, GETDATE()))) AS TOTAL
                       FROM         dbo.Zeuss_VentasDiarias AS Zeuss_VentasDiarias_1
                       WHERE     (CAST(FECHA AS DATE) <= CAST(GETDATE() AS DATE))
                       GROUP BY bodega, descripcion, ano, mes) AS P

GO


