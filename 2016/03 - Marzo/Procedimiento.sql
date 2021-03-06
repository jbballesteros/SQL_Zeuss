USE [zeuss]
GO
/****** Object:  StoredProcedure [dbo].[spVentasDiarias]    Script Date: 03/14/2016 10:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spVentasDiarias]
	 @CORREO AS VARCHAR(MAX),
	 	 @MES AS INTEGER,
	 @AÑO AS INTEGER,
	 @DIA AS INTEGER,
	 @ASUNTO VARCHAR(50)=' ',
	 @VGIRARDOTA NVARCHAR(MAX)='',
	 @VCARTAGENA NVARCHAR(MAX)='',
	 @VBARRANQUILLA NVARCHAR(MAX)='',
	 @VCARTAGO NVARCHAR(MAX)='',
	 @VTOCANCIPA NVARCHAR(MAX)='',
	 @VTOTAL NVARCHAR(MAX)='',
	 @TablaHTML  NVARCHAR(MAX)=''

AS
BEGIN
SET @ASUNTO=(SELECT 'ZEUSS: Ventas diarias a ' + DATENAME(MM,GETDATE()) + ' ' + CAST(DAY(GETDATE()) AS VARCHAR(10)) + ' de ' + CAST(YEAR(GETDATE()) AS VARCHAR(20)));
--VENTAS GIRARDOTA	
set @VGIRARDOTA=
N'<style>
td, th {
    font-size: 75%;
    font-family: "Trebuchet MS";
}</style>'+


N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>GIRARDOTA</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
	"TD/CENTER"=Acpm,'',
	"TD/CENTER"=Corriente,'',	
	"TD/CENTER"=Extra,'',
	"TD/B/CENTER"=Total,''
FROM Zeuss_VentasDiarias
WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA and bodega=1
ORDER BY Dia asc
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
	
CAST((SELECT "TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"=TACPM,'',
"TD/CENTER"=TCORRIENTE,'',
"TD/CENTER"=TEXTRA,'',
"TD/CENTER"=TTOTAL,''
FROM Zeuss_VentasDiarias_eds
WHERE ano=@AÑO AND MES=@MES AND   bodega=1
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 



--VENTAS CARTAGENA
SET @VCARTAGENA=
N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>CARTAGENA</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
	"TD/CENTER"=Acpm,'',
	"TD/CENTER"=Corriente,'',	
	"TD/CENTER"=Extra,'',
	"TD/B/CENTER"=Total,''
FROM Zeuss_VentasDiarias
WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA and bodega=4
ORDER BY Dia asc
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
		
CAST((SELECT "TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"=TACPM,'',
"TD/CENTER"=TCORRIENTE,'',
"TD/CENTER"=TEXTRA,'',
"TD/CENTER"=TTOTAL,''
FROM Zeuss_VentasDiarias_eds
WHERE ano=@AÑO AND MES=@MES AND   bodega=4
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
			
	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 

--VENTAS BARRANQUILLA
SET @VBARRANQUILLA=
N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>GALAPA</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
	"TD/CENTER"=Acpm,'',
	"TD/CENTER"=Corriente,'',	
	"TD/CENTER"=Extra,'',
	"TD/B/CENTER"=Total,''
FROM Zeuss_VentasDiarias
WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA and bodega=5
ORDER BY Dia asc
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
		
CAST((SELECT "TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"=TACPM,'',
"TD/CENTER"=TCORRIENTE,'',
"TD/CENTER"=TEXTRA,'',
"TD/CENTER"=TTOTAL,''
FROM Zeuss_VentasDiarias_eds
WHERE ano=@AÑO AND MES=@MES AND   bodega=5
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
			
	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 


--VENTAS CARTAGO
SET @VCARTAGO=
N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>CARTAGO</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
	"TD/CENTER"=Acpm,'',
	"TD/CENTER"=Corriente,'',	
	"TD/CENTER"=Extra,'',
	"TD/B/CENTER"=Total,''
FROM Zeuss_VentasDiarias
WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA and bodega=6
ORDER BY Dia asc
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
		
CAST((SELECT "TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"=TACPM,'',
"TD/CENTER"=TCORRIENTE,'',
"TD/CENTER"=TEXTRA,'',
"TD/CENTER"=TTOTAL,''
FROM Zeuss_VentasDiarias_eds
WHERE ano=@AÑO AND MES=@MES AND   bodega=6
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
			
	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 


--VENTAS TOCANCIPA
SET @VTOCANCIPA=
N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>TOCANCIPA</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
	"TD/CENTER"=Acpm,'',
	"TD/CENTER"=Corriente,'',	
	"TD/CENTER"=Extra,'',
	"TD/B/CENTER"=Total,''
FROM Zeuss_VentasDiarias
WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA and bodega=2
ORDER BY Dia asc
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
		
CAST((SELECT "TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"=TACPM,'',
"TD/CENTER"=TCORRIENTE,'',
"TD/CENTER"=TEXTRA,'',
"TD/CENTER"=TTOTAL,''
FROM Zeuss_VentasDiarias_eds
WHERE ano=@AÑO AND MES=@MES AND   bodega=2
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+
			
	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 


--Ventas General
SET @VTOTAL=
N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>GENERAL</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>Dia</CENTER></th>'+
N'<th><CENTER>Acpm</CENTER></th>'+
N'<th><CENTER>Corriente</CENTER></th>'+
N'<th><CENTER>Extra</CENTER></th>'+
N'<th><CENTER>Total Dia</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((SELECT "TD/B"=DATENAME(DW,FECHA) + ' ' + CAST(Dia AS VARCHAR(3)),'',
			"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(CanAcpm) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(CanAcpm) AS MONEY),1))-1),'',
			"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(CanGasolina) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(CanGasolina) AS MONEY),1))-1),'',
			"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(CanExtra) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(CanExtra) AS MONEY),1))-1),'',
			"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(CanExtra)+SUM(CanGasolina)+SUM(CanAcpm) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(CanExtra)+SUM(CanGasolina)+SUM(CanAcpm) AS MONEY),1))-1),''
			FROM  Zeuss_VentasDiarias
			WHERE ano=@AÑO AND mes=@MES AND Dia<=@DIA 
			group by fecha,Dia
			order by dia asc
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+	
		
CAST((SELECT 
"TD/B"=UPPER(TIPO) ,'',
"TD/CENTER"= SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(ACPM) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(ACPM) AS MONEY),1))-1) ,'',
"TD/CENTER"= SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(Corriente) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(Corriente) AS MONEY),1))-1),'',
"TD/CENTER"= SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(Extra) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(Extra) AS MONEY),1))-1),'',
"TD/CENTER"= SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(TOTAL) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(TOTAL) AS MONEY),1))-1),''

FROM Zeuss_VentasDiarias_EDS
WHERE ANO=@AÑO AND MES=@MES 
GROUP BY TIPO
			FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+	
N'</tbody>'+ 
N'</table>'+
N'</font><BR><BR><BR><BR>' +


N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=4><CENTER><FONT SIZE=3><B>PRESUPUESTO GENERAL NACIONAL</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>SEDE</CENTER></th>'+
N'<th><CENTER>VENTAS</CENTER></th>'+
N'<th><CENTER>PRESUPUESTO</CENTER></th>'+
N'<th><CENTER>CUMPLIMIENTO</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((
SELECT 
"TD/CENTER"=SEDE,'',
"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(SUM(TOTALCAN) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(SUM(TOTALCAN) AS MONEY),1))-1) ,'',
"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(max(PRESUPUESTO_H) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(max(PRESUPUESTO_H) AS MONEY),1))-1) ,'',
"TD/CENTER"=CAST((SUM(TOTALCAN) /MAX(PRESUPUESTO_H))*100 AS DECIMAL(18,2)),''
FROM (SELECT P.*,(presupuesto/dia_mes)*dia_habil PRESUPUESTO_H
FROM (
SELECT  ZV.*,S.presupuesto,S.SEDE
FROM Zeuss_VentasDiarias ZV INNER JOIN 
(SELECT  R.bodega,B.descripcion SEDE,P.ano,P.mes,SUM(P.galones) presupuesto
FROM presupuesto P 
INNER JOIN terceros T ON (P.Nit=T.nit)
INNER JOIN referencia_x_bodega R ON (P.codigo=R.codigo)
INNER JOIN bodegas B ON (R.bodega=B.bodega)
GROUP BY R.bodega,B.descripcion,P.ano,P.mes) AS S ON (ZV.bodega=S.bodega AND ZV.ano=S.ano AND ZV.mes=S.mes)
WHERE ZV.ano=@AÑO AND ZV.mes=@MES) AS P
LEFT JOIN y_calendario YC ON (P.FECHA=YC.fecha)
) AS Q
WHERE Dia<=@DIA
GROUP BY Q.bodega,Q.SEDE,Q.ano,Q.mes
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+	
N'</tbody>'+ 
N'</table><BR><BR><BR>' +



N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+
N'<thead>'+
N'<TR><TD COLSPAN=4><CENTER><FONT SIZE=3><B>PRESUPUESTO POR ASESOR</B><CENTER></TD></TR>'+
N'<tr>'+
N'<th><CENTER>ASESOR</CENTER></th>'+
N'<th><CENTER>VENTAS</CENTER></th>'+
N'<th><CENTER>PRESUPUESTO</CENTER></th>'+
N'<th><CENTER>CUMPLIMIENTO</CENTER></th>'+
N'</tr>'+
N'</thead>'+
N'<tbody>'+
CAST((
SELECT 
"TD/CENTER"=ASESOR,'',
"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1))-1) ,'',
"TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(((PRESUPUESTO/YC.dia_mes)*YC.dia_habil) AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(((PRESUPUESTO/YC.dia_mes)*YC.dia_habil) AS MONEY),1))-1) ,'',
"TD/CENTER"=CASE WHEN PRESUPUESTO=0  THEN  0 ELSE CAST((VENTAS /((PRESUPUESTO/YC.dia_mes)*YC.dia_habil))*100 AS DECIMAL(18,2)) END,''
FROM (SELECT ISNULL(P.nit,T.nit) NIT,ISNULL(P.nombres,T.nombres) ASESOR,ISNULL(P.VENTAS,0) VENTAS,ISNULL(T.presupuesto,0) PRESUPUESTO
FROM (
SELECT TV.nit,TV.nombres,SUM(ZV.can_ventas-ZV.can_devolu) VENTAS
FROM Zeuss_Lin_Ventas ZV  
INNER JOIN terceros TV ON (ZV.vendedorter=TV.nit)
WHERE ZV.ano=@AÑO AND ZV.mes=@MES AND ZV.subgrupo2 IN (2,3,4)
GROUP BY TV.nit,TV.nombres) AS P
FULL JOIN 
(SELECT  TV.nit,TV.nombres,SUM(P.galones) presupuesto
FROM presupuesto P 
INNER JOIN terceros T ON (P.Nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
INNER JOIN referencias R ON (P.codigo=R.codigo)
INNER JOIN bodegas B ON (R.generico=B.bodega)
WHERE  P.ano=@AÑO AND P.mes=@MES 
GROUP BY TV.nit,TV.nombres) AS T ON (P.nit=T.nit)) AS R
LEFT JOIN y_calendario YC ON (YC.fecha=CAST(GETDATE() AS DATE))
FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+	
N'</tbody>'+ 
N'</table><BR><BR><BR>' 

SET @TablaHTML= ISNULL(@VGIRARDOTA,'')+ISNULL(@VCARTAGENA,'')+ISNULL(@VBARRANQUILLA,'')+ ISNULL(@VCARTAGO,'')+ ISNULL(@VTOCANCIPA,'')+ISNULL(@VTOTAL,'')

IF @TablaHTML<>''
BEGIN
	set @CORREO=@CORREO
	EXEC msdb.dbo.sp_send_dbmail 
	@profile_name='AutoEnvio de Correos',
	--@recipients='informacion@zeusspetroleum.com',
	@blind_copy_recipients=@CORREO ,
	@subject=@ASUNTO,
	@body = @TablaHTML,
	@body_format = 'HTML'
END

END
