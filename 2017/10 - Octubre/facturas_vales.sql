INSERT INTO movimiento (tipo,numero,seq,fec,nit,cuenta,centro,valor,valor_niif,documento)

SELECT TIPO,NUMERO,1,fec,nit,'130505',1090, ROUND(SUM(cantidad*valor_unitario),2) VALOR, ROUND(SUM(cantidad*valor_unitario),2) VALOR_niff,1
FROM documentos_lin
WHERE tipo='FV1' AND  numero IN (1879)
GROUP BY tipo,NUMERO,fec,nit

UNION ALL

SELECT TIPO,NUMERO,2,fec,nit,'130510',1090, ROUND(SUM(cantidad*valor_unitario),2)*-1 VALOR, ROUND(SUM(cantidad*valor_unitario),2)*-1 VALOR_niff,1
FROM documentos_lin
WHERE tipo='FV1' AND numero IN (1879)
GROUP BY tipo,NUMERO,fec,nit