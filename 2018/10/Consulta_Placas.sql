select * 
		from (
		select *, r = row_number() over (partition by bodega order by calidadfecha desc) 
		from (SELECT di.BODEGA,convert(varchar(50),FECHA,103) AS calidadfecha,PLACA AS calidadplaca,R.descripcion calidadproducto,CASE WHEN DI.valor=100 THEN 'PASO' ELSE 'NO PASO' END calidadresultado
		FROM  zeuss.dbo.documentos_info_medida_placas DI INNER JOIN zeuss.dbo.referencias R ON (DI.codigo=R.codigo)
		WHERE activo=1 
		) P 
		) a 
		where r <= 15 ORDER BY calidadfecha DESC