DECLARE @FECHA_TXT AS VARCHAR(10)
declare @centro as int=1000
declare @TSQL VARCHAR(100)=''
DECLARE @RST BIT
DECLARE @ERROR varchar (250)=''
declare @id_anterior int
DECLARE @PASO AS INTEGER=NULL

set @id_anterior =@intNumeroPago-1


if (select count(id_pago) from psepagosfacturas where id_pago=@id_anterior)=0 

begin
insert into psepagosfacturas (id_pago, fecha_transaccion) values (@id_anterior, getdate())
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
		@profile_name='AutoEnvio de Correos',
		@recipients='felipe.pineda@ryrlubricantes.com',
	    @blind_copy_recipients='sebastian.arboleda@ryrlubricantes.com',
		@subject='Alerta PSE-Zeuss',
		@body = @mail,
		@body_format = 'HTML'
			
end 





SET @TSQL='GUARDAR_CIERRE_PLANTA'
		SET @RST =0
	
		BEGIN TRAN 	@TSQL
	
			BEGIN TRY
if (select COUNT(id_pago) from psepagosfacturas as a inner join psefacturas as b on a.id_pago=b.registro
  where se_interfazo is null and id_pago = @intNumeroPago and b.factura <>'')>0
  
	BEGIN
		SET @PASO=0
	END
  ELSE
	BEGIN
		SET @PASO=1
	END	
		
	
	SET @FECHA_TXT=
	RIGHT('0' + Ltrim(Rtrim(CAST(DAY(GETDATE()) AS VARCHAR(2)))),2) + '/' + 

	RIGHT('0' + Ltrim(Rtrim(CAST(MONTH(GETDATE()) AS VARCHAR(2)))),2)

	 + '/' + CAST(YEAR(GETDATE()) AS VARCHAR(4))

			DECLARE @SIG AS INTEGER
			
		
			-------- I INSERTAR DOCUMENTOS
			DROP TABLE pse_documentos_7
			SELECT 
			5 sw,'RC' tipo,cast(a.id_cliente as decimal(18,0)) nit,
			CAST(a.fecha_transaccion as date) fecha,
			(valor_pagado) valor_total,b.vendedor, 
			CASE WHEN @PASO=0 THEN
			(case when b.condicion='1' then 0 else  valor_pagado end)
			ELSE 0 END valor_aplicado,'*' modelo,'PSE' prefijo,
			cast(@intNumeroPago as varchar(100)) documento,
			CASE WHEN @PASO=0 THEN 'PAGO AUTOMATICO POR PSE' 
			ELSE  'PAGO AUTOMATICO POR PSE ANTICIPO' END notas,'PSE' usuario,'SQLZEUSS' pc,1191 centro
			INTO pse_documentos_7
			FROM psepagosfacturas as a left join zeuss.dbo.terceros as b on cast(a.id_cliente as decimal(18,0))= b.nit
			WHERE se_interfazo is  null and id_pago=@intNumeroPago
				
			SELECT @SIG=MAX(NUMERO)+1 FROM  zeuss.dbo.documentos WHERE  tipo='RC'
			
			INSERT INTO zeuss.dbo.documentos 
			(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,prefijo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup,centro_doc)
			SELECT sw,tipo,@SIG,nit,fecha,fecha,valor_total,0,0,0,0,0,vendedor,valor_aplicado,0,modelo,prefijo,documento,notas,usuarios,pc,GETDATE(),0,0,1,100,0,fecha,centro
			FROM pse_documentos_7
			-------- F INSERTAR DOCUMENTOS
	
	
			-------- I INSERTAR DOCUMENTOS_CHE
			
			DROP TABLE pse_documentos_che_7
			SELECT 5 sw,'RC' tipo,@SIG numero,51 banco,@FECHA_TXT documento,7 forma_pago, 
			a.fecha_transaccion fecha,(valor_pagado) valor,51 consignar_en
			INTO pse_documentos_che_7
			FROM psepagosfacturas as a inner join bancos as b on a.nombre_banco=b.descripcion
			WHERE se_interfazo is  null and id_pago=@intNumeroPago
		
			INSERT INTO zeuss.dbo.documentos_che 
			(sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
			SELECT *
			FROM pse_documentos_che_7
			-------- F INSERTAR DOCUMENTOS_CHE
			
			
			-------- I INSERTAR MOVIMIENTO
			
			DROP TABLE pse_movimiento_7
			SELECT *
			INTO pse_movimiento_7
			FROM (
			SELECT 'RC' tipo,@SIG numero,2 seq,'13050501' cuenta,0 centro,
			cast(a.id_cliente as decimal(18,0)) nit,cast(a.fecha_transaccion as date) fecha,
			(valor_pagado)*-1 valor,T.nombres explicacion
			FROM psepagosfacturas a left JOIN zeuss.dbo.terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
			WHERE se_interfazo is  null and id_pago=@intNumeroPago
			UNION ALL
			SELECT 'RC' tipo,@SIG numero,1 seq,'11100549' cuenta,0 centro,
			cast(a.id_cliente as decimal(18,0)) nit,cast(a.fecha_transaccion as date) fecha,
			(valor_pagado) valor,T.nombres explicacion
			FROM psepagosfacturas a left JOIN zeuss.dbo.terceros T ON (cast(a.id_cliente as decimal(18,0))=T.nit)
			WHERE se_interfazo is  null and id_pago=@intNumeroPago) AS P
			
			
			INSERT INTO zeuss.dbo.movimiento 
			(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion)
			SELECT *
			FROM pse_movimiento_7	

			-------- F INSERTAR MOVIMIENTO


			
			
			IF @PASO=0
			BEGIN
				-------- I INSERTAR DOCUMENTOS_CRUCE
			
			
				DROP TABLE pse_documentos_che_7
				select 'RC' tipo, @SIG numero,1 sw,tipo tipo_aplica,
				CAST(factura as int) numero_aplica,id numero_cuota,
				CASE WHEN B.valor_factura<0 then
				B.valor_factura*-1 ELSE B.valor_factura end  valor,a.fecha_transaccion fecha
				INTO pse_documentos_che_7
				from psepagosfacturas as a inner join psefacturas as b on a.id_pago=b.registro 
				where A.id_pago=@intNumeroPago
										
				insert into zeuss.dbo.documentos_cruce
				(tipo, numero, sw, tipo_aplica, numero_aplica, numero_cuota, valor, descuento, retencion, ajuste, retencion_iva, retencion_ica, fecha, retencion2, retencion3,
							  fecha_cruce)
				SELECT tipo,numero,sw,tipo_aplica,numero_aplica,numero_cuota,valor,0,0,0,0,0,fecha,0,0,cast (getdate() as date)
				FROM pse_documentos_che_7
			-------- F INSERTAR DOCUMENTOS_CRUCE
						
			-------- I ACTUALIZAR DOCUMENTOS	
			
				DROP TABLE pse_documentos_upd_7	
				SELECT valor_aplicado+(
				case when valor_factura<0 then valor_factura*-1 
				else valor_factura  end)  valor_aplicado
				from psefacturas P INNER JOIN  zeuss.dbo.documentos.tipo D ON (P.TIPO=D.TIPO AND P.REGISTRO=@intNumeroPago)

						  
				update zeuss.dbo.documentos 
				set valor_aplicado= valor_aplicado
				from pse_documentos_upd_7 
				
		    
		    -------- F ACTUALIZAR DOCUMENTOS
			END

	

			
				
		    
		    
		    UPDATE psepagosfacturas
			SET se_interfazo=1
			WHERE id_pago=@intNumeroPago	  
		

			

			

			COMMIT TRANSACTION

		END TRY
			
		BEGIN CATCH
		
			SET @ERROR=ERROR_MESSAGE()
			
			update psepagosfacturas set error_sql=@ERROR where id_pago=@intNumeroPago
			
			ROLLBACK TRANSACTION @TSQL
			
			SET @RST=0
			
		END CATCH
		
		
		SELECT @RST,@ERROR 


	
