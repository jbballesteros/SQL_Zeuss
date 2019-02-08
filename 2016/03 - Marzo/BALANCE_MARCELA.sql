SELECT YEAR(M.fec) AÑO,MONTH(fec) MES,CC2.subgrupo CODCENTRO,CC2.descripcion CENTRO,C2.cuenta CODCTAN2,C2.cuenta + ' - ' +  C2.descripcion CUENTAN2, M.cuenta CODCTA,M.cuenta + ' - ' + C.descripcion CUENTA,SUM(M.valor ) VALOR
FROM movimiento M 
INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
INNER JOIN cuentas C2 ON (SUBSTRING(C.CUENTA,0,5)=C2.cuenta)
INNER JOIN centros CC ON (M.centro=CC.centro)
INNER JOIN centros_subgrupos CC2 ON (CC.grupo=CC2.grupo AND CC.subgrupo=CC2.subgrupo)
WHERE M.cuenta LIKE '51%' OR M.cuenta LIKE '52%'
GROUP BY YEAR(M.fec),MONTH(fec),M.cuenta,C.descripcion,C2.cuenta,C2.descripcion,CC2.subgrupo,CC2.descripcion
ORDER BY AÑO,MES,CODCENTRO,CODCTAN2,CODCTA