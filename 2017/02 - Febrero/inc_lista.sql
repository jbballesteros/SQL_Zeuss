USE [ryrlub]
GO

/****** Object:  Trigger [dbo].[inc_lista]    Script Date: 12/29/2016 16:47:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[inc_lista] ON [dbo].[terceros]
instead of INSERT,update
AS
declare @vendedor      	 int
declare @nit int
SELECT  @vendedor= vendedor    FROM INSERTED
SELECT  @nit= nit FROM INSERTED
if @vendedor between 300 and 399
BEGIN
update terceros set lista=5 where nit=@nit


END

GO


