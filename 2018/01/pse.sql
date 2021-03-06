USE [RecordatoriosZER]
GO
/****** Object:  StoredProcedure [dbo].[sp_PSE_Updates]    Script Date: 12/01/2018 16:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_PSE_Updates] 
@pid_pago int = null,
@pempresa varchar(50) = null,
@psw int 
AS
DECLARE @COUNT INT
DECLARE @EMPRESA VARCHAR(50)
DECLARE @FECHA_TXT AS VARCHAR(10)
declare @centro as int=1000
declare @TSQL VARCHAR(100)=''
DECLARE @RST BIT
DECLARE @ERROR varchar (250)=''
declare @id_anterior int
--****************************************************Generar Recibo PSE********************************************
IF @psw = 1
BEGIN
set @EMPRESA = 'Zeuss Petroleum'

	


	IF @pempresa = 'zeusspetroleum123'
		BEGIN
			set @id_anterior =@pid_pago-1

			if (select count(id_pago) from #PSE_pagosfacturas where id_pago=@id_anterior and [Empresa] = @EMPRESA)=0 
			begin
			insert into [AZURECLUDP].[cloudp].[dbo].[PSE_pagosfacturas] (id_pago, fecha_transaccion,[Empresa]) values (@id_anterior, getdate(),@EMPRESA)
			declare @mail varchar(max)
			set @mail='
					 <style>
					 body {
						background-color: #fff;
					}
					  table
					   {
           				font-family: verdana;
           				width: 850px;
					   }

					   #BarraAzul
					   {
           				background-color:#0056B8;
           				width: 30px;
					   }
					   #Espacio
					   {
           				width: 60px;
					   }
					   .textAzul
					   {
           				color:#0056B8;
					   }
					   #Pie
					   {
           				text-align: center;
					   }
					   #Pie_
					   {
           				text-align: right;
						padding-right: 160px;
					   }
					   .altotr
					   {
           				height: 150px;
					   }
		  	
					</style>
					<table >
						<tr><td rowspan="7" id="BarraAzul"></td></tr>
						<tr><td rowspan="7" id="Espacio"></td></tr>
						<tr class="altotr">
							<td>
 							<h1 class="textAzul">Medellín</h1>
							</td>
							<td>
								<img src="http://www.zeuss.com.co/assets/logo-zeuss-1e380bcdfba7211d077252ef3cd1f616.png"/>
							</td>
						</tr>
						<tr class="altotr">
							<td colspan="2">
								<div class="textAzul ">
								Señor(a)<br/>
								Usuario<br/>
								</div>				   
							</td>
						</tr>
						<tr>
							<td colspan="2">
					El pago <b>'+cast(@id_anterior as varchar(50))+'</b> con la siguiente fecha <b>'+GETDATE()+'<b/> no fue insertado
							</td>
						</tr>			
						<tr class="altotr">
							<td colspan="2">
								<div class="textAzul ">
								<br/>
								Cordialmente; <br/>
								PSE ZEUSS
								</div>
							</td>
						</tr>
					</table>
				'
					EXEC msdb.dbo.sp_send_dbmail 
					@profile_name='Cuenta_Zeuss',
					@recipients='felipe.pineda@ryrlubricantes.com',
					@blind_copy_recipients='sebastian.arboleda@ryrlubricantes.com',
					@subject='Alerta PSE-Zeuss',
					@body = @mail,
					@body_format = 'HTML'
			
			end 

			SET @TSQL='GENERA_RC_PSE'
					SET @RST =0
	
					BEGIN TRAN 	@TSQL
	
						BEGIN TRY
							
							---- CREAR LAS TABLAS DE REGISTROS AZURE Y SQLZEUSS ------
							DROP TABLE PSE_FACTURAS							
							SELECT *
							INTO PSE_FACTURAS
							FROM [AZURECLUDP].[cloudp].[dbo].[PSE_facturas] 
							where registro=@pid_pago and Empresa = @EMPRESA
							
							DROP TABLE PSE_Bancos
							SELECT *
							INTO PSE_Bancos
							FROM [AZURECLUDP].[cloudp].[dbo].[PSE_bancos]

							DROP TABLE PSE_pagosfacturas
							SELECT *
							INTO PSE_pagosfacturas
							FROM [AZURECLUDP].[cloudp].[dbo].[PSE_pagosfacturas] 
							where id_pago=@pid_pago and Empresa = @EMPRESA

							DROP TABLE PSE_Terceros
							SELECT *
							INTO PSE_Terceros
							FROM [192.168.10.7].zeuss.dbo.terceros T INNER JOIN PSE_pagosfacturas P ON (id_pago=@pid_pago and Empresa = @EMPRESA)
													
						
						
							if (
							select COUNT(id_pago) 
							from PSE_pagosfacturas as a inner join PSE_FACTURAS as b on a.id_pago=b.registro and a.Empresa=b.Empresa
							  where se_interfazo is null and id_pago = @pid_pago and b.factura <>'' and b.Empresa = @EMPRESA)>0
							begin 
	
							SET @FECHA_TXT=
							RIGHT('0' + Ltrim(Rtrim(CAST(DAY(GETDATE()) AS VARCHAR(2)))),2) + '/' + 

							RIGHT('0' + Ltrim(Rtrim(CAST(MONTH(GETDATE()) AS VARCHAR(2)))),2)

							 + '/' + CAST(YEAR(GETDATE()) AS VARCHAR(4))

						DECLARE @SIG AS INTEGER
						SELECT @SIG=MAX(NUMERO)+1 
						FROM  [192.168.10.7].zeuss.dbo.documentos 
						WHERE  tipo='RC'
		
						INSERT INTO [192.168.10.7].zeuss.dbo.documentos 
						(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,prefijo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup,centro_doc)
						SELECT 
						5,'RC',@SIG,cast(a.id_cliente as decimal(18,0)),CAST(a.fecha_transaccion as date),cast(a.fecha_transaccion as date),(valor_pagado)
						,0,0,0,0,0,b.vendedor, case when b.condicion='1' then 0 else  valor_pagado end ,0,'*','PSE',cast(@pid_pago as varchar(100)),'PAGO AUTOMATICO POR PSE','PSE','SQLZEUSS',getdate(),0,0,1,20,2,cast(getdate()  as date),
						1191
						FROM PSE_pagosfacturas as a left join PSE_Terceros as b on cast(a.id_cliente as decimal(18,0))= b.nit
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
	
		
						INSERT INTO [192.168.10.7].zeuss.dbo.documentos_che (sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
						SELECT 5,'RC',@SIG,51,@FECHA_TXT,51, a.fecha_transaccion,(valor_pagado),51
						FROM PSE_pagosfacturas  as a inner join PSE_Bancos as b on a.nombre_banco=b.descripcion
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
	
		
						INSERT INTO [192.168.10.7].zeuss.dbo.movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion)
						SELECT 'RC',@SIG,2,'13050501',0,cast(a.id_cliente as decimal(18,0)),cast(a.fecha_transaccion as date),(valor_pagado)*-1,T.nombres
						FROM PSE_pagosfacturas  a left JOIN PSE_Terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA

						INSERT INTO [192.168.10.7].zeuss.dbo.movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion)
						SELECT 'RC',@SIG,1,'11100549',0,cast(a.id_cliente as decimal(18,0)),cast(a.fecha_transaccion as date),(valor_pagado),T.nombres
						FROM PSE_pagosfacturas a left JOIN PSE_Terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
		



						insert into [192.168.10.7].zeuss.dbo.documentos_cruce
						(tipo, numero, sw, tipo_aplica, numero_aplica, numero_cuota, valor, descuento, retencion, ajuste, retencion_iva, retencion_ica, fecha, retencion2, retencion3,
						fecha_cruce)
						select 'RC', @SIG,1,tipo,CAST(factura as int),id,CASE WHEN B.valor_factura<0 then
						B.valor_factura*-1 ELSE B.valor_factura end ,0,0,0,0,0,a.fecha_transaccion,0,0,
						cast (getdate() as date)
						from PSE_pagosfacturas  as a 
						inner join PSE_FACTURAS as b on a.id_pago=b.registro and a.Empresa = b.Empresa
						where A.id_pago=@pid_pago and a.Empresa = @EMPRESA
			
			
						update [192.168.10.7].zeuss.dbo.documentos 
						set valor_aplicado= valor_aplicado+case when valor_factura<0 then valor_factura*-1 else valor_factura  end 
						from 
						[192.168.10.7].zeuss.dbo.documentos as t inner join #PSE_facturas as b  on t.[tipo] = b.[tipo] and t.numero =  CAST(b.factura as int)
						 where t.tipo=b.tipo and
						 t.numero= CAST( b.factura as int) and b.registro=@pid_pago and b.Empresa = @EMPRESA

						UPDATE [AZURECLUDP].[cloudp].[dbo].[PSE_pagosfacturas] 
						SET se_interfazo=1
						WHERE id_pago=@pid_pago and Empresa = @EMPRESA
		

		

						end
			ELSE
			BEGIN
			set @centro =1000
				SET @FECHA_TXT=
				RIGHT('0' + Ltrim(Rtrim(CAST(DAY(GETDATE()) AS VARCHAR(2)))),2) + '/' + 

				RIGHT('0' + Ltrim(Rtrim(CAST(MONTH(GETDATE()) AS VARCHAR(2)))),2)

				 + '/' + CAST(YEAR(GETDATE()) AS VARCHAR(4))

						SELECT @SIG=MAX(NUMERO)+1 FROM  [192.168.10.7].zeuss.dbo.documentos WHERE  tipo='RC'
		
						INSERT INTO [192.168.10.7].zeuss.dbo.documentos 
						(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,prefijo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup,centro_doc)
						SELECT 
						5,'RC',@SIG,cast(a.id_cliente as decimal(18,0)),cast(a.fecha_transaccion as date),cast(a.fecha_transaccion as date),(valor_pagado)
						,0,0,0,0,0,b.vendedor,0,0,'*','PSE',cast(@pid_pago as varchar(100)),'PAGO AUTOMATICO POR PSE','PSE','SQLZEUSS',a.fecha_transaccion,0,0,1,20,2,cast(a.fecha_transaccion  as date),
						1191
						FROM #PSE_pagosfacturas  as a left join #Terceros as b on cast(a.id_cliente as decimal(18,0))= b.nit
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
	
		
						INSERT INTO [192.168.10.7].zeuss.dbo.documentos_che (sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
						SELECT 5,'RC',@SIG,51,@FECHA_TXT,51, cast(a.fecha_transaccion as date),(valor_pagado),51
						FROM #PSE_pagosfacturas as a inner join #PSE_Bancos as b on a.nombre_banco=b.descripcion
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
	
		
						INSERT INTO [192.168.10.7].zeuss.dbo.movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
						SELECT 'RC',@SIG,2,'13050501',@centro,cast(a.id_cliente as decimal(18,0)),cast(a.fecha_transaccion as date),(valor_pagado)*-1,T.nombres,0
						FROM #PSE_pagosfacturas a left JOIN #Terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
	

	
						INSERT INTO [192.168.10.7].zeuss.dbo.movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
						SELECT 'RC',@SIG,1,'11100549',@centro,cast(a.id_cliente as decimal(18,0)),cast(a.fecha_transaccion as date),(valor_pagado),T.nombres,0
						FROM #PSE_pagosfacturas a left JOIN #Terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
						WHERE se_interfazo is  null and id_pago=@pid_pago and a.Empresa = @EMPRESA
		
					  
					  
						UPDATE [AZURECLUDP].[cloudp].[dbo].[PSE_pagosfacturas]
						SET se_interfazo=1
						WHERE id_pago=@pid_pago and Empresa = @EMPRESA

						update [192.168.10.7].zeuss.dbo.consecutivos set siguiente=999999999 WHERE  tipo='RC'

						SET @RST=1
				
						SET @ERROR='Guardado Con Exito'	
					END
		
					COMMIT TRANSACTION

					END TRY
			
					BEGIN CATCH
		
						SET @ERROR=ERROR_MESSAGE()
			
						update [AZURECLUDP].[cloudp].[dbo].[PSE_pagosfacturas] set error_sql=@ERROR where id_pago=@pid_pago and Empresa = @EMPRESA
			
						ROLLBACK TRANSACTION @TSQL
			
						SET @RST=0
			
					END CATCH
					SELECT @RST,@ERROR 
	END
END
--**************************************************END Generar Recibo PSE********************************************
