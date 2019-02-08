USE [estinsa]
GO

ALTER TABLE [dbo].[referencias_sto]  WITH NOCHECK ADD  CONSTRAINT [referencias_sto: STOCK NO PUEDE QUEDAR NEGATIVO] CHECK  (((([CAN_INI]+[CAN_ENT])-[CAN_SAL])>=(0)))
GO

ALTER TABLE [dbo].[referencias_sto] CHECK CONSTRAINT [referencias_sto: STOCK NO PUEDE QUEDAR NEGATIVO]
GO


