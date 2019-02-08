SELECT tipo TIPO,numero NUMERO,D.fecha,valor_total VALOR,valor_aplicado APLICADO,valor_total-valor_aplicado VALOR
FROM documentos D
WHERE valor_total-valor_aplicado<0  AND sw=1
ORDER BY fecha DESC


SELECT tipo TIPO,numero NUMERO,valor_total VALOR,valor_aplicado APLICADO,valor_total-valor_aplicado VALOR
FROM documentos D
WHERE valor_total-valor_aplicado BETWEEN -100 AND 100 AND D.SW=1 and (valor_total-valor_aplicado)<>0
ORDER BY fecha DESC

UPDATE documentos
SET valor_aplicado=valor_total
FROM documentos D
WHERE valor_total-valor_aplicado BETWEEN -100 AND 100 AND D.SW=1 and (valor_total-valor_aplicado)<>0