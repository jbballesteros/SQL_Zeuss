DECLARE @TIPO AS VARCHAR(4)
DECLARE @NUMERO AS INTEGER
DECLARE @NUMERO_EXTRA AS INTEGER

DECLARE CURSOR_22112018 CURSOR

FOR

SELECT tipo,numero
FROM documentos
WHERE tipo='FVT1' AND numero=0

OPEN CURSOR_22112018

FETCH NEXT FROM CURSOR_22112018 INTO @TIPO,@NUMERO

WHILE @@FETCH_STATUS = 0  
		BEGIN 	

			SELECT @NUMERO_EXTRA=MAX(numero)+1
			FROM documentos
			WHERE tipo=@TIPO AND numero<1000000000
			
			INSERT INTO documentos (sw,tipo,numero,nit,fecha,vencimiento,valor_total,iva,retencion,retencion_causada,
			retencion_iva,retencion_ica,descuento_pie,fletes,iva_fletes,costo,vendedor,valor_aplicado,anulado,
			modelo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,impoconsumo,descuento_2,duracion,concepto,
			impuesto_deporte,valor_mercancia,numero_cuotas,codigo_direccion,abono,porc_RteFuente,porc_RteIva,porc_RteIca,
			porc_RteA,porc_RteB,valor_pos_cambio,placa_isla,kilometraje_isla,turno_isla,surtidor_isla
			)
			SELECT sw,tipo,@NUMERO_EXTRA,nit,fecha,vencimiento,valor_total,iva,retencion,retencion_causada,
			retencion_iva,retencion_ica,descuento_pie,fletes,iva_fletes,costo,vendedor,valor_aplicado,anulado,
			modelo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,impoconsumo,descuento_2,duracion,concepto,
			impuesto_deporte,valor_mercancia,numero_cuotas,codigo_direccion,abono,porc_RteFuente,porc_RteIva,porc_RteIca,
			porc_RteA,porc_RteB,valor_pos_cambio,placa_isla,kilometraje_isla,turno_isla,surtidor_isla
			FROM documentos
			WHERE tipo='FVT1' AND numero=@NUMERO

			INSERT INTO documentos_che (sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
			SELECT sw,tipo,@NUMERO_EXTRA,banco,documento,forma_pago,fecha,valor,consignar_en
			FROM documentos_che
			WHERE tipo='FVT1' AND numero=@NUMERO

			INSERT INTO documentos_lin (sw,tipo,numero,codigo,seq,fec,nit,cantidad,porcentaje_iva,valor_unitario,porcentaje_descuento,costo_unitario,vendedor,bodega,und,cantidad_und,
			cantidad_pedida,maneja_inventario,costo_unitario_sin,porc_dcto_2,porc_dcto_3,Id_Documentos_lin_ped,impoconsumo,costo_unitario_niif)
			SELECT sw,tipo,@NUMERO_EXTRA,codigo,seq,fec,nit,cantidad,porcentaje_iva,valor_unitario,porcentaje_descuento,costo_unitario,vendedor,bodega,und,cantidad_und,
			cantidad_pedida,maneja_inventario,costo_unitario_sin,porc_dcto_2,porc_dcto_3,Id_Documentos_lin_ped,impoconsumo,costo_unitario_niif
			FROM documentos_lin
			WHERE tipo='FVT1' AND numero=@NUMERO

			
			INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,valor_niif,base)
			SELECT tipo,@NUMERO_EXTRA,seq,cuenta,centro,nit,fec,valor,valor_niif,base
			FROM movimiento
			WHERE tipo='FVT1' AND numero=@NUMERO


			DELETE FROM movimiento
			WHERE tipo='FVT1' AND numero=@NUMERO

			DELETE FROM documentos_lin
			WHERE tipo='FVT1' AND numero=@NUMERO

			DELETE FROM documentos_che
		    WHERE tipo='FVT1' AND numero=@NUMERO

			DELETE	FROM documentos_entregados
			WHERE tipo='FVT1' AND numero=@NUMERO

			DELETE FROM documentos
			WHERE tipo='FVT1' AND numero=@NUMERO

			FETCH NEXT FROM CURSOR_22112018 INTO @TIPO,@NUMERO
		END


CLOSE CURSOR_22112018
DEALLOCATE CURSOR_22112018










