alter PROCEDURE spVentas_Diarias_Asesor  
as  
  
declare @CORREO AS VARCHAR(500)=' '  
declare @vendedor decimal(18,0)  
declare @TablaHTML  NVARCHAR(MAX)=' '  
declare @ASUNTO VARCHAR(max)=''  
DECLARE @ASESOR AS VARCHAR(MAX)=NULL  
  
  
declare cursorasesores  CURSOR    
FOR   
  
SELECT T.nit, T.nombres,T.mail  
FROM documentos D INNER JOIN terceros T ON (D.vendedor=T.nit)  
WHERE D.fecha>=DATEADD(DAY,-1,CAST(GETDATE() AS DATE))  AND D.SW=1 AND T.mail IS NOT NULL  
GROUP BY T.nit, T.nombres,T.mail  
  
  
open cursorasesores  
  
FETCH NEXT FROM cursorasesores INTO @vendedor,@ASESOR,@correo  
WHILE @@FETCH_STATUS = 0  
BEGIN  
  SET @ASUNTO=(SELECT 'Cumplimiento de presupuesto ' + DATENAME(MM,GETDATE()) + ' ' +  
  CAST(DAY(GETDATE()) AS VARCHAR(10)) + ' de ' + CAST(YEAR(GETDATE()) AS VARCHAR(20))) + ': ' + @ASESOR  
  --VENTAS RYR LUBRICANTES  
  set @TablaHTML=  
  N'<FONT FACE="Trebuchet MS" SIZE=2 COLOR=black>'+  
  
  N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+  
  N'<thead>'+  
  N'<TR><TD COLSPAN=4><CENTER><FONT SIZE=3><B>RESULTADO</B><CENTER></TD></TR>'+  
  N'<tr>'+  
  N'<th><CENTER>PRESUPUESTO</CENTER></th>'+  
  N'<th><CENTER>VENTAS GALONES</CENTER></th>'+  
  N'<th><CENTER>DIFERENCIA</CENTER></th>'+  
  N'<th><CENTER>CUMPLIMIENTO</CENTER></th>'+  
  N'</tr>'+  
  N'</thead>'+  
  N'<tbody>'+  
  CAST((SELECT   
  "TD/CENTER"=ISNULL(SUBSTRING(CONVERT(VARCHAR(50),CAST(PRESUPUESTO AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(PRESUPUESTO AS MONEY),1))-1),0) ,'',  
  "TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1))-1) ,'',  
  "TD/CENTER"=ISNULL(SUBSTRING(CONVERT(VARCHAR(50),CAST(PRESUPUESTO- VENTAS AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(PRESUPUESTO- VENTAS AS MONEY),1))-1),0) + ' %','',  
  "TD/CENTER"=CAST(CUMPLIMIENTO AS VARCHAR),''  
  FROM (SELECT V.CANTIDAD VENTAS,  
  (V.PRESUPUESTO/V.DIA_MES)*V.DIA_HABIL PRESUPUESTO,  
  ROUND(((V.CANTIDAD/((V.PRESUPUESTO/V.dia_mes)*V.dia_habil))*100),2) CUMPLIMIENTO  
	FROM Zeuss_Lin_Ventas_tbl_presupuesto_asesor V
	WHERE BODEGA IS NULL AND NIT IS NULL AND ANO IS NULL AND MES IS NULL AND COD_VEN=@vendedor) AS R  

  
  FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+   
  
 /*Presupuesto detallado */  
  
  N'</tbody>'+   
  N'</table>'+  
  N'</font><BR><BR><BR><BR>' +  
  N'<table border="1" cellpadding="5" cellspacing="1" bordercolor="black">'+  
  N'<thead>'+  
  N'<TR><TD COLSPAN=5><CENTER><FONT SIZE=3><B>PRESUPUESTO DETALLADO</B><CENTER></TD></TR>'+  
  N'<tr>'+  
  N'<th><CENTER>CLIENTE</CENTER></th>'+  
  N'<th><CENTER>PRESUPUESTO</CENTER></th>'+  
  N'<th><CENTER>VENTAS GALONES</CENTER></th>'+  
  N'<th><CENTER>DIFERENCIA</CENTER></th>'+  
  N'<th><CENTER>CUMPLIMIENTO</CENTER></th>'+  
  N'</tr>'+  
  N'</thead>'+  
  N'<tbody>'+  
  CAST((SELECT   
  "TD/CENTER"= nombres,'',  
  "TD/CENTER"=ISNULL(SUBSTRING(CONVERT(VARCHAR(50),CAST(PRESUPUESTO AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(PRESUPUESTO AS MONEY),1))-1),0) ,'',  
  "TD/CENTER"=SUBSTRING(CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(VENTAS AS MONEY),1))-1) ,'',  
  "TD/CENTER"=ISNULL(SUBSTRING(CONVERT(VARCHAR(50),CAST(PRESUPUESTO- VENTAS AS MONEY),1),1,CHARINDEX('.',CONVERT(VARCHAR(50),CAST(PRESUPUESTO- VENTAS AS MONEY),1))-1),0) ,'',  
  "TD/CENTER"=CAST(isnull(CUMPLIMIENTO,0) AS VARCHAR),''  
  FROM (SELECT ISNULL(T. nombres,'TOTAL') nombres,V.CANTIDAD VENTAS,  
  (V.PRESUPUESTO/V.dia_mes)*V.dia_habil PRESUPUESTO,  
  ROUND(((V.CANTIDAD/((V.PRESUPUESTO/V.dia_mes)*V.dia_habil))*100),2) CUMPLIMIENTO  
	FROM Zeuss_Lin_Ventas_tbl_presupuesto_asesor V INNER JOIN terceros T ON (V.NIT=T.nit)
	WHERE BODEGA IS NULL  AND ANO IS NULL AND MES IS NULL AND COD_VEN=@vendedor) AS R  
  ORDER BY CASE WHEN R.nombres='TOTAL' THEN -1 ELSE R.CUMPLIMIENTO END DESC  
  FOR XML PATH('TR'),TYPE) AS NVARCHAR(MAX))+   
    
        
  N'</tbody>'+   
  N'</table>'+N'</font>'  
  IF LEN(ISNULL(@TablaHTML,''))>0  
  BEGIN  
   EXEC msdb.dbo.sp_send_dbmail   
   @profile_name='AutoEnvio de Correos',  
   @recipients='jbballesteros@hotmail.com',  
   @blind_copy_recipients='jballesteros@zeuss.com.co',  
   @subject=@ASUNTO,  
   @body = @TablaHTML,  
   @body_format = 'HTML'  
  END  
      
  FETCH NEXT FROM cursorasesores INTO @vendedor,@ASESOR,@correo  
END  
  
  CLOSE cursorasesores;  
     DEALLOCATE cursorasesores;  
   