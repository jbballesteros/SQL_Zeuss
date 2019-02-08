       alter TRIGGER [dbo].[INS_movimiento] ON [dbo].[movimiento]   
FOR INSERT  
AS  
   
 declare @cta varchar(20)  
 declare @tipo varchar(4)  
 declare @centro int  
 declare @nit tipo_nit  
 declare @ano smallint  
 declare @mes smallint  
 declare @valor money  
 declare @ter bit  
 declare @cco bit  
 declare @norma char(1)  --Nuevo Campo NIIF 
	declare @valor_niif money --Nuevo Campo NIIF   
	declare @valor_o money   --Nuevo Campo NIIF 
	declare @numero int  --Nuevo Campo NIIF 
	declare @seq int   --Nuevo Campo NIIF 
     
   
   
 select @ter=ter,@cco=cco,@tipo=tipo,@cta=inserted.cuenta,@centro=centro,  
 @nit=nit,@ano=datepart(yy,fec),@mes=datepart(mm,fec),@valor=valor   ,
 	@norma=norma,@valor_niif=valor_niif, @valor_o=valor, @numero=numero, @seq=seq --Agregados por implementacion NIIF 
 FROM inserted,cuentas WHERE inserted.cuenta=cuentas.cuenta  
   
 if @tipo='Z1' select @mes=13  
  
-- dado que si es nit informativo no se debe acumular se pone en cero  
 IF @ter=0 SELECT @nit=0  
  
--si no maneja centro se deja en cero  
 IF @cco=0 SELECT @centro=0  
 
 
  --si viene valor en niif, el valor original es el valor niif, valor para cada norma (local o internacional)  
 IF @valor_niif<>0   
 SELECT @valor_o=@valor_niif    
 SELECT @valor = CASE @norma  
       WHEN 'A' THEN @valor     
       WHEN 'B' THEN 0  
       WHEN 'C' THEN @valor  
       WHEN 'D' THEN @valor  
     END  
 SELECT @valor_niif= CASE @norma  
       WHEN 'A' THEN @valor_o     
       WHEN 'B' THEN @valor_o  
       WHEN 'C' THEN 0  
       WHEN 'D' THEN @valor_niif  
     END  
 UPDATE m  
 set   valor=@valor,  
    valor_niif=@valor_niif  
 FROM   movimiento m  
 WHERE   tipo=@tipo AND  
    numero=@numero AND  
    seq=@seq  
  
--si maneja centro pero viene en cero, es un error  
 declare @mensaje varchar(80)  
 IF @cco<>0 AND @centro=0  
 BEGIN  
  ROLLBACK TRANSACTION  
     SELECT @mensaje='Cuenta ' + @cta + ' maneja centros de costos'  
     RAISERROR(@mensaje,11,2)   
     RETURN  
 END  
   
 ----  SI NO MANEJA CENTRO DE COSTO CENTRO DE COSTO CERO 18/06/2015  
 IF @cco=0 AND @centro<>0  
 BEGIN  
  ROLLBACK TRANSACTION  
     SELECT @mensaje='Cuenta ' + @cta + ' NO maneja centros de costos: Verifique con Sistemas'  
     RAISERROR(@mensaje,11,2)   
     RETURN  
 END  
  
--SI ESTA GUARDANDO EN LOS CENTROS 1,3000,4000  IMPEDIR GUARDAR CAMBIOS  
  
 IF  @centro BETWEEN 4000 AND 4999  
 BEGIN  
  ROLLBACK TRANSACTION  
     SELECT @mensaje='El centro de costo ingresado no puede ser usado'  
     RAISERROR(@mensaje,11,2)   
     RETURN  
 END  
  
  
--si maneja nit pero viene en cero, es un error  
 IF @ter<>0 AND @nit=0  
 BEGIN  
  ROLLBACK TRANSACTION  
     SELECT @mensaje='Cuenta ' + @cta + ' maneja terceros'  
     RAISERROR(@mensaje,11,2)   
     RETURN  
 END  
  
--crear el registro en los saldos del mes por si pide auxiliar de ese registro lo pueda sacar  
 IF NOT EXISTS(SELECT cuenta FROM cuentas_val WHERE   
   ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit)  
 BEGIN  
  INSERT INTO cuentas_val(ano,mes,cuenta,centro,nit) VALUES(@ano,@mes,@cta,@centro,@nit)  
 END  
  
  
--actualizar saldos  
 IF @valor>0   
  UPDATE cuentas_val SET debito=debito+@valor WHERE  
   ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit  
  
 IF @valor<0  
  UPDATE cuentas_val SET credito=credito+(@valor*-1) WHERE  
   ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit  
   
  
  IF @valor_niif>0   
  UPDATE cuentas_val SET debito_niif=debito_niif+@valor_niif WHERE  
   ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit  
  
 IF @valor_niif<0  
  UPDATE cuentas_val SET credito_niif=credito_niif+(@valor_niif*-1) WHERE  
   ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit 
  
  
  
  
  
  
  
  