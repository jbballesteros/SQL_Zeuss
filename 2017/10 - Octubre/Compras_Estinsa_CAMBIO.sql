SELECT *
FROM ventas_estinsa
WHERE TIPO='FV' AND NUMERO=169302


SELECT *
FROM ESTINSA.DBO.documentos
WHERE prefijo='FV' AND documento='169302'


INSERT INTO estinsa.dbo.documentos_lin
				( sw, tipo, numero, codigo, seq, fec, nit, cantidad, porcentaje_iva, valor_unitario, porcentaje_descuento, costo_unitario, adicional, vendedor, bodega, und, cantidad_und,
								   cantidad_pedida, maneja_inventario, costo_unitario_sin, pedido,  cantidad_dos,  porc_dcto_2, porc_dcto_3, Id_Documentos_lin_ped,costo_unitario_niif)
		SELECT ZL.tipo TIPO,ZL.numero NUMERO,RT.tipo_6 TIPO,MAX(ZL.cantidad) CANTIDAD,SUM(ZL.valor_unitario)-SUM(VD.DESCUENTO_UNI) VALOR
		FROM Zeuss_Lin_Ventas ZL 
		INNER JOIN referencias R ON ZL.codigo=R.codigo
		LEFT JOIN referencias_tip6 RT ON (R.tipo_6=RT.tipo_6)
		LEFT JOIN v_facturas_descuento_pie_detalle VD ON (ZL.tipo=VD.TIPO AND ZL.numero=VD.NUMERO AND ZL.codigo=VD.CODIGO)
		WHERE ZL.tipo='FV' AND ZL.numero=169386 AND R.tipo_6 IN (1,2,3)
		GROUP BY ZL.tipo,ZL.numero,RT.tipo_6
		ORDER BY RT.tipo_6
				
				

SELECT  3,CE.tipo_doc,1289,CE.codigo_est,ROW_NUMBER() OVER(ORDER BY RT.tipo_6),ZL.fec,811043174,MAX(ZL.cantidad),0,ROUND(SUM(ZL.valor_unitario)-SUM(VD.DESCUENTO_UNI),0),ROUND(SUM(ZL.valor_unitario)-SUM(VD.DESCUENTO_UNI),0),'',0,CE.bodega,'UND',1,MAX(ZL.CANTIDAD),'S',0,0,1,0,0,0,ROUND(ROUND(SUM(ZL.valor_unitario)-SUM(VD.DESCUENTO_UNI),0),2)
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN referencias R ON ZL.codigo=R.codigo
INNER JOIN compras_estinsa CE ON (ZL.nit=CE.nit AND CE.codigo_zeuss=R.tipo_6)
LEFT JOIN referencias_tip6 RT ON (R.tipo_6=RT.tipo_6)
LEFT JOIN v_facturas_descuento_pie_detalle VD ON (ZL.tipo=VD.TIPO AND ZL.numero=VD.NUMERO AND ZL.codigo=VD.CODIGO)
WHERE ZL.tipo='FV' AND ZL.numero=169386 AND R.tipo_6 IN (1,2,3)
GROUP BY ZL.tipo,ZL.numero,ZL.fec,RT.tipo_6,CE.tipo_doc,CE.codigo_est,CE.bodega
ORDER BY RT.tipo_6




SELECT *
FROM Zeuss_Lin_Ventas ZL
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE T.nit_real=900625898 AND ZL.subgrupo2 IN (11,2,3,4)
GROUP BY ZL.tipo,ZL.numero