	SELECT documento
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].[pse_documentos_7]
		WHERE EMPRESA=3

		SELECT sw,tipo,nit,fecha,fecha,valor_total,0,0,0,0,0,vendedor,valor_aplicado,0,modelo,prefijo,documento,notas,usuario,pc,GETDATE(),0,0,1,100,0,fecha
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].[pse_documentos_7]
		WHERE EMPRESA=3

			SELECT sw,tipo,banco,documento,forma_pago,CAST(fecha as date),valor,consignar_en
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_che_7
		WHERE EMPRESA=3

		SELECT tipo,seq,
		CASE WHEN SEQ=2 THEN '130505' WHEN SEQ=1 THEN '11100503' ELSE 'N/A' END ,centro,nit,fecha,valor,explicacion,valor
		FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_movimiento_7	
		WHERE EMPRESA=3

		SELECT tipo,sw,tipo_aplica,numero_aplica,numero_cuota,valor,0,0,0,0,0,fecha,0,0,cast (getdate() as date)
			FROM [192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_cruce_7
			WHERE EMPRESA=3
			
			select  ISNULL(P.valor_aplicado,0)
			from documentos D INNER JOIN  
			[192.168.10.11].[RecordatoriosZER].[dbo].pse_documentos_upd_7  P ON (D.tipo=P.TIPO AND D.numero=P.NUMERO)
			WHERE P.EMPRESA=3