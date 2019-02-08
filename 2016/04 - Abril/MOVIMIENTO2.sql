
INSERT INTO  movimiento(tipo, numero, seq, cuenta, centro, nit, fec, valor)



SELECT tipo,numero,1,13050501,0,nit,fecha,valor_total
FROM documentos
WHERE tipo='NC' AND numero BETWEEN 15310 AND 15317