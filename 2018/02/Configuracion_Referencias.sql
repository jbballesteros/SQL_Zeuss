   SELECT RT2.descripcion SEDE,R.codigo CODIGO,R.descripcion DESCRIPCION,CASE WHEN R.ref_anulada='S' THEN 'SI' WHEN R.ref_anulada='N' THEN 'NO' ELSE 'ERROR' END ANULADA,
   CASE WHEN R.maneja_inventario=0 THEN 'SERVICIO' WHEN R.maneja_inventario=1 THEN 'INVENTARIO' ELSE 'ERROR' END TIPO_PRODUCTO,
   RGC.GRUPO_CONTABLE ,RGC.SUBGRUPO_CONTABLE,RC.descripcion CLASE,RG.descripcion GRUPO,RSS.descripcion SUBGRUPO,R.valor_unitario VALOR_UNITARIO,



   CASE WHEN VE.codigo IS NULL THEN 'NO' ELSE 'SI' END TIENE_ESTRUCTURA,
      CASE WHEN EC.componente IS NULL THEN 'NO' ELSE 'SI' END ES_COMPONENTE ,VU.ultima_venta ULTIMA_VENTA
	
   FROM         
                                                                      dbo.referencias R LEFT JOIN
                                                                      referencias_cla RC ON (R.clase=RC.clase) LEFT JOIN
                                                                      referencias_gru RG ON (R.grupo=RG.grupo) LEFT JOIN 
                                                                      referencias_sub RSG ON (R.subgrupo=RSG.subgrupo AND R.grupo=RSG.grupo)                                                                    
																	  LEFT JOIN referencias_grupocontable RGC ON RGC.codigo=R.codigo 
																	  LEFT JOIN referencias_tip2 RT2 ON (R.tipo_2=RT2.tipo_2)
																	  LEFT JOIN v_referencias_ultima_venta VU ON (R.codigo=VU.codigo)
																	  LEFT JOIN v_referencias_estructura VE ON (R.codigo=VE.codigo)
																	  LEFT JOIN referencias_sub RSS ON (RSS.grupo=R.grupo AND RSS.subgrupo=R.subgrupo)
																	  LEFT JOIN v_referencias_estructura_compuesto EC ON (R.codigo=EC.componente)