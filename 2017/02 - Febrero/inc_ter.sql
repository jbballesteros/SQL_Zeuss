USE [ryrlub]
GO

/****** Object:  Trigger [dbo].[inc_ter]    Script Date: 12/29/2016 16:49:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[inc_ter] ON [dbo].[terceros]
FOR INSERT, UPDATE
AS
declare @direccion      	 varchar(60)
declare @nit int
declare @mensaje1	varchar(250)
declare @nit_posible decimal
SELECT  @direccion= direccion    FROM INSERTED
SELECT  @nit= nit_real FROM INSERTED
select top 1 @nit_posible=nit from terceros where direccion=@direccion
set @mensaje1='En la creacion de terceros ya existe una direccion para ese cliente Nit:'+ cast(@nit_posible as varchar)+''
IF (select count(direccion) from terceros where direccion=@direccion and nit_real<>@nit )>1   BEGIN
	RAISERROR (@mensaje1, 11,2)
	ROLLBACK TRANSACTION
	RETURN
END

GO


