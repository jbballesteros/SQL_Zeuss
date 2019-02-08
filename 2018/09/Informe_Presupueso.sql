	SELECT B.BODEGA COD_BOD, B.descripcion SEDE,P.ANO,P.MES CMES,P.NIT,P.CANTIDAD,P.PRESUPUESTO,YM.Descripcion MES,YM.etiqueta EMES,  
T.nombres CLIENTE,ISNULL(T.razon_comercial,'') RAZON_COMERCIAL,TV.nit NIT_VEN,TV.nombres VENDEDOR,  
T4.descripcion ZONA  
	FROM (
	select 
	ISNULL(FV.ano,VP.ano) ano,
	ISNULL(FV.mes,VP.mes) mes,
	ISNULL(FV.bodega,VP.bodega) bodega,
	ISNULL(FV.nit,VP.Nit) nit,
	ISNULL(FV.vendedor,VP.vendedor) vendedor,
	ISNULL(FV.cantidad,0) cantidad,
	ISNULL(VP.presupuesto,0) presupuesto
	from fn_ventas_bod_coi020(2017,13) FV
	FULL JOIN fn_presupuesto_bod_coi020(2017,13) VP 
	ON (FV.bodega=VP.bodega AND FV.ano=VP.ano AND FV.mes=VP.mes AND VP.vendedor=FV.vendedor AND VP.Nit=FV.nit)
	) AS P
	INNER JOIN y_meses_texto YM ON (P.MES=YM.NroMes)  
	INNER JOIN bodegas B ON (P.BODEGA=B.bodega)  
	INNER JOIN terceros T ON (P.NIT=T.nit)  
	INNER JOIN terceros TV ON (T.vendedor=TV.nit)  
	LEFT JOIN terceros_4 T4 ON (TV.concepto_4=T4.concepto_4)   
	WHERE P.vendedor IN (146,147,143)

