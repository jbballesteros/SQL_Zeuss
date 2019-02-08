SELECT  YEAR(D.fecha) AÑO,MONTH(D.fecha) MES,D.TIPO,D.numero,D.fecha,D.valor_total,D.notas,D.concepto
FROM documentos D
WHERE nit=899999068 AND fecha>='01/01/2017' AND sw=13 AND NOT (D.concepto  IN (3,2,6,0)) AND D.anulado=0

SELECT YEAR(D.fecha) AÑO,MONTH(D.fecha) MES,D.tipo,D.numero,D.valor_total,T.TIPO,T.NUMERO
FROM TEMP_FACTURAS T LEFT JOIN documentos D   ON (D.prefijo=T.TIPO AND CAST(T.NUMERO AS VARCHAR(50))=D.documento)
WHERE (D.fecha>='01/01/2017' AND D.sw=14) OR (D.fecha IS NULL)

