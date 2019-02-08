SELECT *
FROM generar_interes_auditoria GI INNER JOIN (
SELECT ZL.ano,ZL.mes-1 mes,ZL.codigo,ZL.nit,ZL.tipo,ZL.numero
FROM Zeuss_Lin_Ventas ZL 
WHERE ZL.CODIGO=900309 AND sw=1) AS P ON (GI.ano=P.ano AND GI.mes=P.mes AND GI.nit=P.nit)

UPDATE generar_interes_auditoria
SET tipo_dms=P.tipo , numero_dms=P.numero
FROM generar_interes_auditoria GI INNER JOIN (
SELECT ZL.ano,ZL.mes-1 mes,ZL.codigo,ZL.nit,ZL.tipo,ZL.numero
FROM Zeuss_Lin_Ventas ZL 
WHERE ZL.CODIGO=900309 AND sw=1) AS P ON (GI.ano=P.ano AND GI.mes=P.mes AND GI.nit=P.nit)