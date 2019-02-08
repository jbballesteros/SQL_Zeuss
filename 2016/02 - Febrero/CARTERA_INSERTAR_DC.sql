insert into documentos_cruce (tipo,numero,sw,tipo_aplica,numero_aplica,numero_cuota,valor,fecha,fecha_cruce)
SELECT tipo,numero,sw,tipo_aplica,numero_aplica,0,sum(valor),max(fecha),max(fecha_cruce)
FROM documentos_cruce_tem
GROUP BY tipo,numero,sw,tipo_aplica,numero_aplica

SELECT *
FROM documentos_cruce
WHERE tipo='RC' AND numero=128993