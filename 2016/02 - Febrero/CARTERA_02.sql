

UPDATE documentos
SET valor_aplicado=P.VALOR
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,SUM(DC.valor) VALOR
FROM documentos D  
LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo AND D.numero=DC.numero)
LEFT JOIN documentos_cruce DC2 ON (D.tipo=DC2.tipo_aplica AND D.numero=DC2.numero_aplica)
WHERE D.tipo='RC' AND D.numero=127002
GROUP BY  D.tipo,D.numero) AS P ON (D.TIPO=P.TIPO AND D.NUMERO=P.NUMERO)

UPDATE DOCUMENTOS
SET valor_aplicado=0
WHERE TIPO='RC' AND NUMERO =127776

UPDATE documentos
SET valor_aplicado=P.VALOR
FROM documentos D INNER JOIN (
SELECT D.tipo,D.numero,SUM(DC.valor) VALOR
FROM documentos D  
LEFT JOIN documentos_cruce DC ON (D.tipo=DC.tipo AND D.numero=DC.numero)
LEFT JOIN documentos_cruce DC2 ON (D.tipo=DC2.tipo_aplica AND D.numero=DC2.numero_aplica)
WHERE ( D.tipo='RC' AND D.numero=145511) OR (DC.tipo_aplica='RC' AND DC.numero_aplica=145511)
GROUP BY  D.tipo,D.numero) AS P ON (D.TIPO=P.TIPO AND D.NUMERO=P.NUMERO)