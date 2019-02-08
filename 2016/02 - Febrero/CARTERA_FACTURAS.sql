SELECT *
FROM (
SELECT D.tipo,D.numero,D.fecha,D.valor_total,D.valor_aplicado,SUM(ISNULL(DC.valor,0)+ISNULL(DC.ajuste,0)+ISNULL(DC.descuento,0)+ISNULL(DC.retencion_ica,0)+ISNULL(DC.retencion,0)) valor,D.valor_aplicado-SUM(ISNULL(DC.valor,0)+ISNULL(DC.ajuste,0)+ISNULL(DC.descuento,0)+ISNULL(DC.retencion_ica,0)+ISNULL(DC.retencion,0)) saldo_dif
FROM documentos D LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo_aplica AND D.numero=DC.numero_aplica)
WHERE D.sw=1
GROUP BY  D.tipo,D.numero,D.fecha,D.valor_total,D.valor_aplicado
) AS P 
WHERE saldo_dif>1000 OR saldo_dif<-1000 
ORDER  BY  P.fecha DESC