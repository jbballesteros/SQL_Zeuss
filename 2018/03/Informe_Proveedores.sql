SELECT YEAR(D.fecha) ANO,MONTH(D.fecha) MES,D.tipo TIPO,D.numero NUMERO,D.fecha FECHA,T.nit NIT,T.nombres CLIENTE,D.notas NOTAS,D.valor_total VALOR
FROM DOCUMENTOS D 
INNER JOIN terceros T ON (D.nit=T.nit)
WHERE D.tipo='CXP' AND YEAR(D.fecha)=2017 AND NOT (D.nit IN (899999068,811043174))