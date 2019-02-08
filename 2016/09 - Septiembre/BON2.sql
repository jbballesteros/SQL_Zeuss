SELECT M.cuenta,
CASE 
WHEN C.descripcion='Planta Girardota Antioquia' THEN 'GIRARDOTA'
WHEN C.descripcion='Planta Cartago Eje Cafetero' THEN 'PLANTA CARTAGO'
WHEN C.descripcion='Planta Galapa C Atlántica' THEN 'PLANTA GALAPA'
WHEN C.descripcion='Planta Mamonal C Atlántica' THEN 'CARTAGENA'
WHEN C.descripcion='VALLEJO Y CALLE S.A. / EDS LAS FUENTES DE SAN JOSE' THEN 'GIRARDOTA'
WHEN C.descripcion='VALLEJO Y CALLE S.A. / EDS LAS FUENTES DE SAN JOSE' THEN 'GIRARDOTA' 
WHEN C.descripcion='Gerencia Operaciones Centro' THEN 'GIRARDOTA'
WHEN C.descripcion='Planta Valle Occidente' THEN 'PLANTA CARTAGO'
ELSE C.descripcion END,YEAR(M.fec) AÑO ,MONTH(M.fec) MES,M.nit,T.nombres,SUM(M.valor) VALOR
FROM movimiento M 
INNER JOIN terceros T ON (M.nit=T.nit)
INNER JOIN centros C ON (M.centro=C.centro)
WHERE M.cuenta IN ('53053502','53053503') AND YEAR(FEC)IN (2016) AND M.tipo<>'Z1'
GROUP BY  M.nit,MONTH(M.fec),YEAR(M.fec),C.descripcion,T.nombres,M.cuenta