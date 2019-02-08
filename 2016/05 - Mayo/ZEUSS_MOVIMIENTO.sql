   CREATE  Procedure [dbo].[add_movimiento]  
 (  
 @tipo    varchar (4),  
 @numero   int,  
 @seq   int,  
 @cuenta    varchar (20),  
 @centro    int,  
 @nit    Tipo_NIT,  
 @fec    datetime,  
 @valor    money,  
 @valor_niif     money=0, --Nuevo Campo NIIF
 @base    money=null,  
 @documento   int=null,  
 @explicacion   varchar (250)=null  
 )  
  
As  
 declare @afe bit  
 declare @ter bit  
                declare @tei bit  
 declare @cco bit  
 declare @doc bit  
 declare @bas bit  
 select @afe=afe,@ter=ter,@tei=tei,@cco=cco,@doc=doc,@bas=bas FROM cuentas WHERE cuenta=@cuenta  
   
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
  IF @documento=0 SELECT @documento=1  
 END  
 IF @explicacion='' SELECT @explicacion=null  
   
 IF @tipo='RC' or @tipo='CHD'  
 BEGIN  
 IF @explicacion IS NULL  
  BEGIN  
   SELECT @explicacion=T.nombres FROM documentos D INNER JOIN terceros T ON (D.nit=T.nit) WHERE  D.tipo=@tipo AND D.numero=@numero  
  END  
 END  
   
 IF @tipo='CXP'  
 BEGIN   
  IF @explicacion IS NULL  
  BEGIN  
   SELECT @explicacion=NOTAS FROM documentos WHERE tipo=@tipo AND numero=@numero  
  END  
 END  
   
 IF @bas=0 SELECT @base=null  
   
  
 INSERT INTO movimiento(  
 tipo,  
 numero,  
 seq,  
 cuenta,  
 centro,  
 nit,  
 fec,  
 valor,  
 	valor_niif, --Nuevo Campo NIIF
 base,  
 documento,  
 explicacion  
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
 	@valor_niif, --Nuevo Campo NIIF   
 @base,  
 @documento,  
 @explicacion  
 )  
   
 return  
  
  
  
  
  
  
  
  
  
  
  