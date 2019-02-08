USE [msdb]
GO

/****** Object:  Job [Proceso_Bonificaciones]    Script Date: 08/27/2015 11:37:45 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 08/27/2015 11:37:45 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Proceso_Bonificaciones', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No hay ninguna descripción.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'Zeusspetroleum\Sistemas', 
		@notify_email_operator_name=N'EnvioCorreo', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [FVIMPUESTOS]    Script Date: 08/27/2015 11:37:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'FVIMPUESTOS', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_fvimpuesto_tbl

INSERT INTO bon_fvimpuesto_tbl
SELECT     D.tipo AS TIPO, D.numero AS NUMERO, SUM(CASE WHEN R.subgrupo2 IN (13, 20, 21) THEN CONVERT(real, (((DL.cantidad) * DL.valor_unitario) * (1 - isnull(DL.porcentaje_descuento, 0) 
                                                   / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - ISNULL(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) AS IMPUESTOS, SUM(CASE WHEN R.subgrupo2 IN (12, 17, 18) THEN CONVERT(real, 
                                                   (((DL.cantidad) * DL.valor_unitario) * (1 - isnull(DL.porcentaje_descuento, 0) / 100) * (1 - isnull(DL.porc_dcto_2, 0) / 100) * (1 - ISNULL(DL.porc_dcto_3, 0) / 100))) ELSE 0 END) 
                                                   AS SOBRETASA
	
                            FROM          dbo.documentos AS D INNER JOIN
                                                   dbo.documentos_lin AS DL ON D.tipo = DL.tipo AND D.numero = DL.numero INNER JOIN
                                                   dbo.referencias AS R ON DL.codigo = R.codigo
                            WHERE      (D.sw IN (1)) AND (D.anulado = 0) AND (R.subgrupo2 IN (''12'', ''13'', ''17'', ''18'', ''20'', ''21''))
                            GROUP BY D.tipo, D.numero', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DEVOLUCIONES]    Script Date: 08/27/2015 11:37:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DEVOLUCIONES', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_devolucion_tbl
INSERT INTO bon_devolucion_tbl


SELECT     tipo,numero,tipo_link, numero_link, codigo, can_real

                            FROM          dbo.Zeuss_Lin_Ventas
                            WHERE      (sw = 2) AND (subgrupo2 IN (2, 3, 4))', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TERCEROS]    Script Date: 08/27/2015 11:37:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TERCEROS', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_terceros_tbl
INSERT INTO bon_terceros_tbl


SELECT  T.nit, T.nombres AS NOMBRESNIT, TR.nit AS NIT_REAL, TR.nombres AS NOMBRESNIT_REAL, TV.nit AS NIT_TV, TV.nombres AS NOMBRES_TV, YC.descripcion AS CIUDAD, 
                      YD.descripcion AS DEPARTAMENTO, TR.cupo_credito AS CUPO, CP.descripcion AS DIASTEXTO, T.telefono_1 AS TELEFONO, T.direccion, 
CASE WHEN ISNUMERIC(T8.descripcion)=1 THEN CAST(T8.descripcion AS REAL) ELSE 0 END AS PESOS, 
CASE WHEN ISNUMERIC(T9.descripcion)=1 THEN CAST(T9.descripcion AS REAL) ELSE 0 END AS [MARGEN%],  
CASE WHEN ISNUMERIC(T7.descripcion)=1 THEN CAST(T7.descripcion AS REAL) ELSE 0 END AS COSTO_LOGISTICO, 
CASE WHEN ISNUMERIC(T17.descripcion)=1 THEN CAST(T17.descripcion AS REAL) ELSE 0 END AS BON_PESOS_2, 
CASE WHEN ISNUMERIC(T18.descripcion)=1 THEN CAST(T18.descripcion AS REAL) ELSE 0 END AS BON_MARGEN_2, 
  
 T.dias_gracia, 
T.concepto_13, T2.descripcion AS TIPO_CLIENTE,
T.concepto_16,T.dias_recibo_caja,T.bancos_pueblos,T.concepto_2

FROM terceros T 
INNER JOIN terceros TR ON (T.nit_real=TR.nit)
INNER JOIN condiciones_pago AS CP ON T.condicion = CP.condicion 
INNER JOIN y_ciudades AS YC ON T.y_ciudad = YC.ciudad AND T.y_dpto = YC.departamento 
INNER JOIN y_departamentos AS YD ON YC.departamento = YD.departamento 
LEFT  JOIN terceros_7 AS T7 ON T.concepto_7 = T7.concepto_7
LEFT  JOIN terceros_8 AS T8 ON T.concepto_8 = T8.concepto_8 
LEFT  JOIN terceros_9 AS T9 ON T.concepto_9 = T9.concepto_9
LEFT  JOIN terceros_17 AS T17 ON T.concepto_17 = T17.concepto_17
LEFT  JOIN terceros_18 AS T18 ON T.concepto_18 = T18.concepto_18 
LEFT  JOIN terceros_13 AS T13 ON T.concepto_13 = T13.concepto_13 
LEFT  JOIN terceros_2 AS T2 ON T.concepto_2 = T2.concepto_2
LEFT  JOIN terceros AS TV ON T.vendedor = TV.nit', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [FACTURA COMPLETA]    Script Date: 08/27/2015 11:37:46 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'FACTURA COMPLETA', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE    FROM     bon_fvcompleta_tbl
INSERT INTO         bon_fvcompleta_tbl
SELECT     D.tipo, D.numero, D.fecha, D.valor_total, CASE WHEN YEAR(D .fecha) < 2013 THEN (D .valor_total - FVIMPUESTOS.SOBRETASA) 
                      - FVIMPUESTOS.IMPUESTOS ELSE (D .valor_total - FVIMPUESTOS.SOBRETASA) - FVIMPUESTOS.IMPUESTOS * 0.6 END AS VALORCM, D.valor_aplicado, D.vencimiento AS VENCIMIENTOREAL, T.nit, 
                      T.NOMBRESNIT , T.NIT_REAL , T.NOMBRESNIT_REAL , T.NIT_TV, T.NOMBRES_TV , T.CIUDAD AS CIUDAD, 
                      T.DEPARTAMENTO , T.CUPO AS CUPO, T.DIASTEXTO AS DIASTEXTO, T.TELEFONO , T.direccion, DL.codigo, R.subgrupo2, DL.seq, R.descripcion, 
                      DL.cantidad + ISNULL(DV.can_real, 0) AS cantidad, DL.valor_unitario, 
                      
                      CONVERT(real, (((DL.cantidad * DL.valor_unitario) * (1 - ISNULL(DL.porcentaje_descuento, 0) / 100))* (1 - ISNULL(DL.porc_dcto_2, 0) / 100)) * (1 - ISNULL(DL.porc_dcto_3, 0) / 100)) AS VALOR_VENTA,                   
                     T.COSTO_LOGISTICO AS SOBREPRECIO, CB.margen, T.PESOS , T.[MARGEN%] ,
                     
                    (T.PESOS+ T.[MARGEN%])  * (CB.margen / 100)  AS DESCUENTO,
                      T.dias_gracia, 
                      
                      CASE WHEN (Y.SABADO = 1 AND Y.DOMINGO = 1 AND Y.FESTIVO = 1) THEN DATEADD(DAY, 4, DATEADD(D, ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento)) 
                      WHEN Y.sabado = 1 AND Y.festivo = 1 THEN DATEADD(DAY, 3, DATEADD(D, ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento)) WHEN (Y.domingo = 1 AND 
                      Y.festivo = 1) OR
                      (sabado = 1) THEN DATEADD(DAY, 2, DATEADD(D, ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento)) WHEN (domingo = 1) OR
                      (festivo = 1) OR
                      (DATEPART(weekday, DATEADD(D, ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento))) = T .bancos_pueblos THEN DATEADD(DAY, 1, DATEADD(D, 
                      ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento)) ELSE DATEADD(D, ISNULL(T .dias_recibo_caja, 0) + ISNULL(T .dias_gracia, 0), D .vencimiento) END AS VENCIMIENTO,
                      
                       
                     (CASE WHEN DL.fec <= ''31/05/2015'' THEN 
                     (CASE WHEN R.subgrupo2 IN (2, 3) THEN (T.PESOS+ T.[MARGEN%]) * 3.264 ELSE (T.PESOS+ T.[MARGEN%]) * 4.43 END) 
                     ELSE  (T.PESOS+ T.[MARGEN%])  * (CB.margen / 100)  END) * (DL.cantidad + ISNULL(DV.can_real, 0)) 
                    AS BONIFICACION, 
                      
                          (CASE WHEN DL.fec <= ''31/05/2015'' THEN 
                     (CASE WHEN R.subgrupo2 IN (2, 3) THEN (T.BON_PESOS_2+ T.BON_MARGEN_2) * 3.264 ELSE (T.BON_PESOS_2+ T.BON_MARGEN_2) * 4.43 END) 
                     ELSE  (T.BON_PESOS_2+ T.BON_MARGEN_2)  * (CB.margen / 100)  END) * (DL.cantidad + ISNULL(DV.can_real, 0)) 
                    AS BONIFICACION2, 
                      
                                           
                                          
                      
                      
                      DL.tipo_bonificacion, DL.numero_bonificacion, D.bodega, T.concepto_13, T.TIPO_CLIENTE AS TIPO_CLIENTE, 
                      T.concepto_2
             
FROM         dbo.documentos AS D INNER JOIN
                      dbo.documentos_lin AS DL ON D.tipo = DL.tipo AND D.numero = DL.numero INNER JOIN
                      dbo.referencias AS R ON DL.codigo = R.codigo INNER JOIN 
                      bon_terceros_tbl T ON (D.nit=T.nit) INNER JOIN
                      bon_fvimpuesto_tbl FVIMPUESTOS ON (D.tipo=FVIMPUESTOS.TIPO AND D.numero=FVIMPUESTOS.NUMERO) LEFT JOIN                                        
					
                      dbo.bon_calendario_tbl AS Y ON DATEADD(D, ISNULL(T.dias_recibo_caja, 0) + ISNULL(T.dias_gracia, 0), D.vencimiento) = Y.fecha 
                LEFT OUTER JOIN
                      dbo.categorias_bonificacion AS CB ON T.concepto_16 = CB.concepto_13 AND R.subgrupo2 = CB.codigo LEFT JOIN
                      bon_devolucion_tbl DV ON ( DL.tipo = DV.tipo_link AND DL.numero = DV.numero_link AND DL.codigo = DV.codigo)                   
                      

WHERE     (D.sw IN (1)) AND (D.anulado = 0) AND (R.subgrupo2 IN (''2'', ''3'', ''4'', ''12'', ''13''))', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [PAGOS_ACUMULADO]    Script Date: 08/27/2015 11:37:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'PAGOS_ACUMULADO', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_pagoacum_tbl
INSERT INTO bon_pagoacum_tbl

SELECT     DC.tipo_aplica AS TIPO, DC.numero_aplica AS NUMERO, CASE WHEN DC.tipo = ''NC'' THEN AB.fecha ELSE (CASE WHEN ISDATE(DCC.documento)=1  THEN (CASE WHEN (YEAR(DCC.documento)>2050 OR YEAR(DCC.documento)<2000) THEN AB.fecha ELSE  DCC.documento END ) ELSE AB.fecha END) END AS FECHAAB, DC.valor AS VALORAB,
                                                                          (SELECT     SUM(valor) AS Expr1
                                                                            FROM          dbo.documentos_cruce
                                                                            WHERE      (tipo_aplica = DC.tipo_aplica) AND (numero_aplica = DC.numero_aplica) AND (seq <= DC.seq)) AS VALORACUM
                                           
                                               FROM          dbo.documentos_cruce AS DC INNER JOIN
                                                                      dbo.documentos AS AB ON DC.tipo = AB.tipo AND DC.numero = AB.numero
                                                                      INNER JOIN documentos_che DCC ON (AB.tipo=DCC.tipo AND AB.numero=DCC.numero)
                                               WHERE      (DC.sw = 1)
                                               
', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [PAGOS]    Script Date: 08/27/2015 11:37:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'PAGOS', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_pagoacum
INSERT INTO bon_pagoacum

SELECT     TIPO, NUMERO, MIN(FECHA_PAGO) AS FECHA_PAGO, DATEDIFF(D, VENCIMIENTOREAL, MIN(FECHA_PAGO)) AS DIASREAL, DATEDIFF(D, VENCIMIENTO, MIN(FECHA_PAGO)) AS DIAS, 
                      CASE WHEN VALOR_TOTAL = VALOR_APLICADO THEN (CASE WHEN SUM(VALORCOMPENSADO) >= VALOR_TOTAL AND SUM(ABONOAV) > 0 AND SUM(ABONODV) > 0 THEN 1 ELSE 0 END) 
                      ELSE CASE WHEN SUM(VALORCOMPENSADO) >= VALORCM AND SUM(ABONOAV) > 0 AND SUM(ABONODV) > 0 THEN 1 ELSE 0 END END AS COMPENSA

FROM         (SELECT     PRIMERA.TIPO, PRIMERA.NUMERO, FV.VALORCM, FV.valor_total, FV.valor_aplicado, FV.VENCIMIENTOREAL, FV.VENCIMIENTO, CASE WHEN (VALORACUM >= (VALORCM - 2000)) 
                                              THEN PRIMERA.FECHAAB ELSE NULL END AS FECHA_PAGO, CASE WHEN FECHAAB <= VENCIMIENTOREAL THEN 1 ELSE 0 END AS ABONOAV, 
                                              CASE WHEN FECHAAB > VENCIMIENTOREAL THEN 1 ELSE 0 END AS ABONODV, CASE WHEN FECHAAB <= VENCIMIENTOREAL THEN POWER(1.0002, DATEDIFF(DAY, FECHAAB, 
                                              VENCIMIENTOREAL)) * VALORAB ELSE (VALORAB) / POWER(1.0002, DATEDIFF(DAY, VENCIMIENTOREAL, FECHAAB)) END AS VALORCOMPENSADO
                       FROM     bon_pagoacum_tbl  AS PRIMERA INNER JOIN bon_fvcompleta_tbl AS FV ON PRIMERA.TIPO = FV.tipo AND PRIMERA.NUMERO = FV.numero) 
                      AS SEGUNDA
GROUP BY TIPO, NUMERO, valor_total, VALORCM, valor_aplicado, VENCIMIENTO, VENCIMIENTOREAL', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [BONIFICACION]    Script Date: 08/27/2015 11:37:47 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'BONIFICACION', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DELETE FROM bon_bonificacion_tbl
INSERT INTO bon_bonificacion_tbl

SELECT     YEAR(FV.fecha) AS AÑO, MONTH(FV.fecha) AS MES, DAY(FV.fecha) AS DIA, FV.tipo, FV.numero, FV.fecha, FV.VENCIMIENTOREAL AS vencimiento, FV.VENCIMIENTO AS VENCIMIENTOF, 
                      ZP.FECHA_PAGO, ZP.DIASREAL, ZP.DIAS, FV.nit, FV.NOMBRESNIT AS NOMBRE, FV.codigo, FV.seq, FV.descripcion, FV.cantidad, FV.valor_unitario, FV.VALORCM, 
                      FV.VALOR_VENTA AS VALOR_TOTAL, FV.valor_total AS VALORFV, FV.margen, FV.PESOS, FV.[MARGEN%] AS PORCENTAJE, CASE WHEN FV.NIT_REAL IN (900310074, 811038233) AND 
                      ZP.DIAS <= 15 THEN FV.BONIFICACION WHEN FV.NIT_REAL IN (8012455) AND FV.fecha BETWEEN ''01/11/2014'' AND ''31/07/2015'' AND 
                      ZP.DIAS <= 7 THEN FV.BONIFICACION WHEN FV.NIT_REAL = 890943038 AND FV.fecha BETWEEN ''01/11/2014'' AND ''01/11/2014'' THEN (CASE WHEN DIAS BETWEEN ''-8'' AND 
                      ''0'' THEN FV.BONIFICACION2 WHEN ZP.DIAS < - 8 THEN FV.BONIFICACION ELSE 0 END) 
                      WHEN FV.NIT_REAL = 900542032 THEN (CASE WHEN ZP.FECHA_PAGO > FV.FECHA THEN FV.BONIFICACION2 ELSE FV.BONIFICACION END) WHEN FV.NIT_REAL IN (800061380, 900071160, 
                      900247772) AND ZP.DIAS <= 1 THEN FV.BONIFICACION WHEN FV.CONCEPTO_2 = ''40'' AND 
                      ZP.DIAS <= 2 THEN FV.BONIFICACION WHEN FV.NIT_REAL = 22384461 THEN (CASE WHEN DIAS <= 0 THEN FV.BONIFICACION2 WHEN ZP.DIAS > 0 THEN FV.BONIFICACION ELSE 0 END) 
                      WHEN (ZP.DIAS) <= 0 OR
                      ZP.COMPENSA = 1 OR
                      FV.CONCEPTO_13 = ''11'' THEN FV.BONIFICACION ELSE 0 END AS TOTAL_BONIFICACION, FV.NIT_REAL, FV.bodega, FV.concepto_13, FV.tipo_bonificacion, FV.numero_bonificacion, 
                      FV.NIT_TV AS vendedor, FV.CUPO, FV.TELEFONO, FV.direccion, FV.CIUDAD, FV.DEPARTAMENTO, FV.BONIFICACION, FV.TIPO_CLIENTE, FV.NIT_TV, FV.NOMBRES_TV, 
                      FV.DESCUENTO AS DESCUENTOCL, FV.subgrupo2
FROM         bon_fvcompleta_tbl AS FV LEFT OUTER JOIN
                      bon_pagoacum AS ZP ON FV.tipo = ZP.TIPO AND FV.numero = ZP.NUMERO
WHERE     (FV.subgrupo2 IN (2, 3, 4))', 
		@database_name=N'zeuss', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Ejecutar', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=7, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20130802, 
		@active_end_date=99991231, 
		@active_start_time=194500, 
		@active_end_time=235959, 
		@schedule_uid=N'5ad98e93-e40d-4a4a-9837-26162880bf03'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


