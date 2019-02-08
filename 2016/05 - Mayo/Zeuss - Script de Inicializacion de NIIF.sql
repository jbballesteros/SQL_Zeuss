--SP_HELPTEXT add_documentos_lin

alter Procedure add_documentos_lin

	(
		@sw 		tinyint,
		@tipo 		varchar(4),
		@numero		int,
		@codigo		varchar(20),
		@seq		int,
		@fec		datetime,
		@nit		Tipo_NIT,
		@cantidad	DECIMAL(13,2),
		@porcentaje_iva	real,
		@valor_unitario	money,
		@porcentaje_descuento real,
		@costo_unitario	Tipo_COSTO,
		@costo_unitario_niif Tipo_COSTO=NULL, --Nuevo Campo NIIF
		@adicional	varchar(80),
		@vendedor	Tipo_NIT,
		@bodega		smallint,
		@und		varchar(4),
		@cantidad_und	DECIMAL(13,2),
		@cantidad_pedida	real=0,
		@maneja_inventario varchar(1)='S',
		@costo_unitario_sin Tipo_COSTO,
		@pedido		int=null,
		@lote			varchar(10)=null,
		@cantidad_otra_und	DECIMAL(13,2)=null,
		@telefono		int=null,
		@tipo_op 		varchar(4)=NULL,
		@numero_op		int=null,
		@lote_vcmto		smalldatetime=null,
		@tipo_link 		varchar(4)=null,
		@numero_link		int=null,
		@seq_link		int=null,
		@cantidad_dos		int=null,
		@porc_dcto_2		real=null,
		@porc_dcto_3		real=null
	)

As
	/* set nocount on */
	INSERT INTO documentos_lin
	(
		sw,
		tipo,
		numero,
		codigo,
		seq,
		fec,
		nit,
		cantidad,
		porcentaje_iva,
		valor_unitario,
		porcentaje_descuento,
		costo_unitario,
		costo_unitario_niif,  --Nuevo Campo NIIF
		adicional,
		vendedor,
		bodega,
		und,
		cantidad_und,
		cantidad_pedida,
		maneja_inventario,
		costo_unitario_sin,
		pedido,
		lote,
		cantidad_otra_und,
		telefono,
		tipo_op,
		numero_op,
		lote_vcmto,
		tipo_link,
		numero_link,
		seq_link,
		cantidad_dos,
		porc_dcto_2,
		porc_dcto_3
	)
	VALUES
	(
		@sw,
		@tipo,
		@numero,
		@codigo,
		@seq,
		@fec,
		@nit,
		@cantidad,
		@porcentaje_iva,
		@valor_unitario,
		@porcentaje_descuento,
		@costo_unitario,
		@costo_unitario_niif,  --Nuevo Campo NIIF
		@adicional,
		@vendedor,
		@bodega,
		@und,
		@cantidad_und,
		@cantidad_pedida,
		@maneja_inventario,
		@costo_unitario_sin,
		@pedido,
		@lote,
		@cantidad_otra_und,
		@telefono,
		@tipo_op,
		@numero_op,
		@lote_vcmto,
		@tipo_link,
		@numero_link,
		@seq_link,
		@cantidad_dos,
		@porc_dcto_2,
		@porc_dcto_3
	)

	return

--sp_helptext add_movimiento

alter Procedure add_movimiento
	(
	@tipo 			varchar (4),
	@numero 		int,
	@seq			int,
	@cuenta 			varchar (20),
	@centro 			int,
	@nit 			Tipo_NIT,
	@fec 			datetime,
	@valor 			money,
	@valor_niif     money=0, --Nuevo Campo NIIF
	@base 			money=null,
	@documento 		int=null,
	@explicacion 		varchar (250)=null

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

--sp_helptext INS_movimiento
--alter TRIGGER INS_movimiento ON dbo.movimiento 
FOR INSERT NOT FOR REPLICATION
AS
	
	declare @cta varchar(20)
	declare @tipo varchar(4)
	declare @maneja_moneda char(1)
	declare @cod_moneda varchar(2)
	declare @numero int
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
	--declare @numero int  --Nuevo Campo NIIF 
	declare @seq int   --Nuevo Campo NIIF 
     
	
	
	select @ter=cuentas.ter,@cco=cuentas.cco,
	@tipo=inserted.tipo,@numero=inserted.numero,
	@cta=inserted.cuenta,@centro=inserted.centro,
	@nit=inserted.nit,@ano=datepart(yy,inserted.fec),
	@mes=datepart(mm,inserted.fec),@valor=inserted.valor,
	@norma=norma,@valor_niif=valor_niif, @valor_o=valor, @numero=numero, @seq=seq, --Agregados por implementacion NIIF  
	@maneja_moneda=isnull(cuentas.maneja_medios,''),
	@cod_moneda=isnull(cuentas.codigo_mm,'')
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
		INSERT INTO cuentas_val(ano,mes,cuenta,centro,nit,saldo_inicial,debito,credito) 
		VALUES(@ano,@mes,@cta,@centro,@nit,0,0,0)
	END


--actualizar saldos
	IF @valor>0 
		UPDATE cuentas_val SET debito=debito+@valor WHERE
			ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit
	IF @valor<0
		UPDATE cuentas_val SET credito=credito+(@valor*-1) WHERE
			ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit

	IF @maneja_moneda <> 'Y' or @tipo='ZDC'
		RETURN

	DECLARE @tasa money
	DECLARE @moneda varchar(2)
	select @tasa=tasa,@moneda=moneda FROM documentos WHERE tipo=@tipo AND numero=@numero

	IF @moneda IS NULL or isnull(@moneda,'')<>@cod_moneda
	BEGIN
		ROLLBACK TRANSACTION
	   	SELECT @mensaje='Cuenta ' + @cta + ' maneja moneda extranjera ' + @cod_moneda
	   	RAISERROR(@mensaje,11,2) 
	   	RETURN
	END


	select @valor=@valor/@tasa
--crear el registro en los saldos del mes por si pide auxiliar de ese registro lo pueda sacar
	IF NOT EXISTS(SELECT cuenta FROM cuentas_val_me WHERE 
			ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit)
	BEGIN
		INSERT INTO cuentas_val_me(ano,mes,cuenta,centro,nit,saldo_inicial,debito,credito) 
		VALUES(@ano,@mes,@cta,@centro,@nit,0,0,0)
	END


--actualizar saldos
	IF @valor>0 
		UPDATE cuentas_val_me SET debito=debito+@valor WHERE
			ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit
	IF @valor<0
		UPDATE cuentas_val_me SET credito=credito+(@valor*-1) WHERE
			ano=@ano and mes=@mes and cuenta=@cta AND centro=@centro AND nit=@nit


 /********************************************************************************************************************/ 

 /*igualacion de Costos de Inventario (documentos_lin)*/
--update documentos_lin set costo_unitario_niif=costo_unitario where year(fec)>=2011
--update documentos_lin set costo_unitario_niif=costo_unitario where year(fec)<=2010
select top 100 costo_unitario_niif, costo_unitario  from documentos_lin where year(fec)<=2015

/*igualacion de Costos de Inventario (referencias_sto)*/
--update referencias_sto set cos_ini_niif=cos_ini, cos_ent_niif=cos_ent, cos_sal_niif=cos_sal where ano>=2011
--update referencias_sto set cos_ini_niif=cos_ini, cos_ent_niif=cos_ent, cos_sal_niif=cos_sal where ano<=2010
select top 100 ano,mes,codigo,can_ini,can_ent,can_sal,cos_ini,cos_ini_niif,cos_ent,cos_ent_niif, cos_sal,cos_sal_niif from referencias_sto where ano<=2015

/*igualacion de Contabilidad*/
--update movimiento set valor_niif=valor where year(fec)>=2011
--update movimiento set valor_niif=valor where year(fec)<=2010
select top 100 * from movimiento where year(fec)<=2015 and tipo<>'NIIF'

/*Posterior al update en movimiento realizar recalculo contable de los meses 12 y 13 del 2014*/
--update cuentas_val set saldo_inicial_niif=saldo_inicial, debito_niif=debito, credito_niif=credito where ano>=2011
--update cuentas_val set saldo_inicial_niif=saldo_inicial, debito_niif=debito, credito_niif=credito where ano<=2010

/**/
/*Actualizar de vistas*/
sp_refreshview v_documentos_lin_histot
GO
sp_refreshview v_documentos_lin
GO
sp_refreshview v_referencias_sto_real
GO
sp_refreshview v_referencias_cos_hoy
GO
sp_refreshview v_referencias_cos
GO
sp_refreshview v_inv_doc_lin_tot
GO
sp_refreshview v_promedio
GO
sp_refreshview v_imputacion
GO
sp_refreshview v_imputacion_real
GO
sp_refreshview v_imputacion_tot
GO
sp_refreshview v_imputacion_saldo 
GO
sp_refreshview v_cuentas_val_his
GO
sp_refreshview v_cuentas_val_his_cen
GO
sp_refreshview v_cuentas_mayor
GO
sp_refreshview v_cuentas_mayor_centros
GO
sp_refreshview v_referencias_sto_histot
GO
sp_refreshview v_referencias_cos
GO

--VALIDAR CONSISTENCIA EN CONTABILIDAD
--update cuentas set descripcion_niif=descripcion where descripcion_niif is null
select norma,cuenta,descripcion,afe,cco,ter,doc,aju,inactiva,cuenta_niif,descripcion_niif
from cuentas
