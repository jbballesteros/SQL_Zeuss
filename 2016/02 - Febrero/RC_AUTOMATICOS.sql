DECLARE @MAYOR AS INTEGER
DECLARE @MAY AS INTEGER

SELECT @MAY=MAX(ID) FROM documentos_rc_automatico WHERE numero IS NOT NULL

SELECT @MAYOR=MAX(numero) FROM documentos WHERE tipo='RC'
-------ACTUALIZA CONTROL
UPDATE documentos_rc_automatico
SET numero=(id-@MAY)+@MAYOR
WHERE NUMERO IS NULL

------ INSERTA RECIBOS

INSERT INTO documentos 
(sw,tipo,numero,nit,fecha,vencimiento,valor_total,retencion,retencion_iva,retencion_ica,descuento_pie,iva_fletes,vendedor,valor_aplicado,anulado,modelo,documento,notas,usuario,pc,fecha_hora,retencion2,retencion3,bodega,duracion,concepto,vencimiento_presup,centro_doc)
SELECT
5,tipo,numero,nit,fecha,fecha,valor,0,0,0,0,0,902,0,0,'*','ATM',' Mensaje Automatico: Se realizo un anticipo AUTOMATICO',usuario,'SQLZEUSS',GETDATE(),0,0,1,20,2,fecha,1191
FROM documentos_RC_automatico
WHERE ID>@MAY

------ INSERTA DOCUMENTOS CHE

INSERT INTO documentos_che (sw,tipo,numero,banco,documento,forma_pago,fecha,valor,consignar_en)
SELECT 5,tipo,numero,banco,referencia,forma_pago,fecha,valor,banco
FROM documentos_rc_automatico
WHERE ID>@MAY
-------------------------------

---- INSERTA  MOVIMIENTO
INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion)
SELECT tipo,numero,2,'13050501',0,T.nit,fecha,valor*-1,T.nombres
FROM documentos_rc_automatico RC INNER JOIN terceros T ON (RC.nit=T.nit)
WHERE RC.ID>@MAY


INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion)
SELECT tipo,numero,1,B.cuenta,0,T.nit,fecha,valor,T.nombres
FROM documentos_rc_automatico RC INNER JOIN terceros T ON (RC.nit=T.nit) INNER JOIN bancos B ON (RC.banco=B.banco)
WHERE RC.ID>@MAY
