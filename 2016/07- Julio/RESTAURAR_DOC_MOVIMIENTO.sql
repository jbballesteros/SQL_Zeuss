INSERT INTO zeuss.dbo.movimiento
SELECT *
FROM movimiento
WHERE     (tipo = 'FV') AND (numero = 144346)