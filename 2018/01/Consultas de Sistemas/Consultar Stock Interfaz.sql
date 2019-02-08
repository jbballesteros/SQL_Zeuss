
			SELECT  c.codigo,r.codigo ,cos_ini+cos_ent-cos_sal,(can_ini+can_ent-can_sal)
				   
				
			from  [192.168.10.11].AtionetInterfacesZeuss.dbo. v_cierrelotes as b inner join 
			[192.168.10.11].AtionetInterfacesZeuss.dbo.CierreLoteVentasPorCajero as c on b.ID=c.IdCierreLote
			inner join [192.168.10.11].AtionetInterfacesZeuss.dbo.CierreLoteVentasPorCodigoMercancia cp on cp.IdCierreLote=b.ID
			inner join estinsa.dbo.referencias r on r.codigo=cp.CodigoMercancia and r.tipo_2=b.CodigoEstacion	
			left join referencias_sto as j on r.codigo=j.codigo AND j.bodega=7 and ano= year(getdate()) and mes=month(getdate())    
			where codigoestacion=7  and FechaNegocioFinal='09/10/2017' 