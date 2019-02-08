USE [ADA]
GO

/****** Object:  StoredProcedure [dbo].[add_movimiento]    Script Date: 9/5/2017 10:40:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[add_movimiento]  
 (  
 @tipo    varchar (4),  
 @numero   int,  
 @seq   int,  
 @cuenta    varchar (20),  
 @centro    int,  
 @nit    Tipo_NIT,  
 @fec    datetime,  
 @valor    money,  
 @base    money=null,  
 @documento   varchar (20)=null,  
 @explicacion   varchar (250)=null,  
 @valor_niif  money=0  
 )  
  
As  
 declare @afe bit  
 declare @ter bit  
                declare @tei bit  
 declare @cco bit  
 declare @doc bit  
 declare @bas bit  
 select @afe=afe,@ter=ter,@tei=tei,@cco=cco,@doc=doc,@bas=bas  
   
  FROM cuentas WHERE cuenta=@cuenta  
   
 if @afe=0   
 BEGIN  
  ROLLBACK TRANSACTION  
  RAISERROR('Cuenta no es afectable ',11,2)   
  RETURN  
 END  
  
 IF @cco=0 SELECT @centro=0  
 IF @ter=0 and @tei=0 SELECT @nit=0  
 IF @doc=0  BEGIN  
  SELECT @documento=null  
 END  
 ELSE BEGIN  
  IF @documento='0'
	BEGIN
	 SELECT @documento='1'
	END
	ELSE BEGIN
	DECLARE @SW tinyint
	SELECT	@SW=SW FROM tipo_transacciones 
	WHERE tipo = @tipo
	IF @SW = 6
		BEGIN
			IF @numero = CAST(@documento AS NUMERIC)
				BEGIN
					SET @documento = 1
				END
		END
	END
	  
 
 END  
  
 IF @bas=0 SELECT @base=null  
 IF @explicacion='' SELECT @explicacion=null  
  
 INSERT INTO movimiento(  
 tipo,  
 numero,  
 seq,  
 cuenta,  
 centro,  
 nit,  
 fec,  
 valor,  
 base,  
 documento,  
 explicacion,  
 valor_niif  
 )  
 VALUES(  
 @tipo,  
 @numero,  
 @seq,  
 @cuenta,  
 @centro,  
 @nit,  
 @fec,  
 @valor,  
 @base,  
 @documento,  
 @explicacion,  
 @valor_niif  
 )  
   
 return  
GO


