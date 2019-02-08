


	DECLARE @TIPO AS VARCHAR(4)
	DECLARE	@NUMERO  AS INTEGER=229
	DECLARE @TABLAHTML AS VARCHAR(MAX)
	DECLARE @FECHA AS DATETIME
	DECLARE @NIT AS DECIMAL(18,0)
	DECLARE @TERCERO AS VARCHAR(60)
	DECLARE @DIRECCION AS VARCHAR(60)
	DECLARE @MUNICIPIO AS VARCHAR(40)
	DECLARE @DEPARTAMENTO AS VARCHAR(32)
	DECLARE @CORREO AS VARCHAR(100)
	DECLARE @ASUNTO AS VARCHAR(100)
	DECLARE @CANTIDAD AS INTEGER
	DECLARE @NIT_REAL AS DECIMAL(18,0)
	DECLARE @PREFIJO AS VARCHAR(5)
	DECLARE @DOCUMENTO AS VARCHAR(10)
	DECLARE @NOTAS AS VARCHAR(250)


	SELECT @NIT=D.nit,@FECHA=fecha_hora,@PREFIJO=prefijo,@DOCUMENTO=documento,@NOTAS=notas FROM documentos D WHERE D.tipo='DV' AND D.numero=@NUMERO
	SELECT @CANTIDAD=SUM(CANTIDAD) FROM Zeuss_Lin_Ventas DL WHERE DL.tipo='DV' AND DL.numero=@NUMERO AND DL.subgrupo2 IN (2,3,4)
	SELECT @TERCERO=nombres ,@DIRECCION=direccion,@MUNICIPIO=YC.descripcion,@DEPARTAMENTO=YD.descripcion,@NIT_REAL=nit_real FROM terceros T INNER JOIN y_ciudades YC ON (T.y_ciudad=YC.ciudad AND T.y_dpto=YC.departamento) INNER JOIN y_departamentos YD ON (T.y_dpto=YD.departamento) WHERE nit=@NIT
	
	
	
		SET @ASUNTO='Confirmación de Devolución ' + CAST(@NUMERO AS VARCHAR(10)) + ', ' + @TERCERO
		SET @TABLAHTML=
		N'<FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>'+
		N'<B><U><CENTER>CONFIRMACION DE DEVOLUCIÓN</CENTER></B></U><BR><BR>'+
		N'<table border="0" cellpadding="3" cellspacing="0" bordercolor="black">'+
		N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Numero de Devolución:</TD><TD align="right"><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black> '+ CAST(@NUMERO AS VARCHAR(10)) +
		N'</TD></TR>'+	
		N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Fecha de Devolución:</TD><TD align="right"><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black> ' + CAST(DAY(@FECHA) AS VARCHAR(2)) + '/'  + CAST(MONTH(@FECHA) AS VARCHAR(2))+ '/'  + CAST(YEAR(@FECHA) AS VARCHAR(4))+ ' ' + CONVERT(VARCHAR(10),@FECHA,108) +
			N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Factura :</TD><TD align="right"><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black> '+ @PREFIJO + ' - ' + @DOCUMENTO +
		N'</TD></TR>'+	
		
	
		
			N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Motivo: </TD><TD align="right"><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black> '+ @NOTAS +
		N'</TD></TR>'+	
		
		N'</TD></TR></TABLE><BR><BR>'+
		N'<table border="0" cellpadding="3" cellspacing="0" bordercolor="black">'+
		N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Cantidad de Devolución:</TD><TD align="right"><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black> '+ CAST(@CANTIDAD AS VARCHAR(1000)) +
		N'<TR><TD><B><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Datos del Cliente:</TD></TR>' +
		N'<TR><TD><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>' + @TERCERO +
		N'</TD></TR>'+
		N'<TR><TD><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>' + @DIRECCION +
		N'</TD></TR>'+
		N'<TR><TD><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>' + @MUNICIPIO + ' - ' + @DEPARTAMENTO +
		N'</TD></TR></TABLE><BR><BR>'+
		N'<table border="1" cellpadding="5" cellspacing="0" bordercolor="black">'+
		N'<thead>'+
		N'<tr>'+
		N'<th><CENTER><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Codigo Producto</CENTER></th>'+
		N'<th><CENTER><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Descripcion</CENTER></th>'+
		N'<th><CENTER><FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>Cantidad</CENTER></th>'+
		N'</tr>'+
		N'</thead>'+
		N'<tbody style="font-family:Trebuchet MS; color:black; background-color:white; font-size:14px">'+
		CAST((SELECT 
		"TD/CENTER"=  DL.codigo,'',
		"TD"= R.descripcion,'',
		"TD/CENTER"= SUBSTRING(CONVERT(VARCHAR(50),CAST((DL.cantidad) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST((DL.cantidad) AS MONEY),1))-1),''
		FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero) INNER JOIN referencias R ON (DL.codigo=R.codigo)
		WHERE D.tipo='DV' AND D.numero=@NUMERO AND R.subgrupo2 IN (2,3,4) FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))
		
		IF @NIT_REAL=900625898
		BEGIN
			SET @CORREO='ana.villa@estinsa.com;juan.idarraga@estinsa.com;operaciones_girardota@zeusspetroleum.com'
		END
		ELSE
		BEGIN
		SET @CORREO='operaciones_girardota@zeusspetroleum.com'
		
		END

	
		
		
		EXEC msdb.dbo.sp_send_dbmail 
		@profile_name='AutoEnvio Pedidos',
		@recipients='jballesteros@zeuss.com.co',
		@subject=@ASUNTO,
		@body = @TablaHTML,
		@body_format = 'HTML'
		
	
	
	

		