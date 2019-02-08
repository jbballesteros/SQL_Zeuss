
INSERT INTO  movimiento(tipo, numero, seq, cuenta, centro, nit, fec, valor,valor_niif)
SELECT M.tipo,M.numero,MAX(seq)+1,'53959501',1000,D.nit,D.fecha,SUM(valor)*-1,SUM(valor)*-1
FROM movimiento M INNER JOIN documentos D ON (M.tipo=D.tipo AND M.numero=D.numero)
GROUP BY M.tipo,M.numero,D.fecha,D.nit
having SUM(valor)<>0 