update documentos
set valor_total=0,iva=0,retencion=0,retencion_causada=0,retencion_iva=0,retencion_ica=0,descuento_pie=0,fletes=0,iva_fletes=0,
costo=0,vendedor=0,valor_aplicado=0,anulado=1,notas='*** Motivo: ERROR EN CODIGO DE BARRAS  USUARIO: DMS1 *** ',retencion2=0,retencion3=0,
impoconsumo=0,descuento_2=0
WHERE tipo='RC' AND numero IN (316452,
316464,
316761
) AND valor_aplicado=0

DELETE FROM documentos_che
WHERE tipo='RC' AND numero IN (316452,
316464,
316761)


DELETE FROM movimiento
WHERE tipo='RC' AND numero IN (316452,
316464,
316761)
