SELECT M.cuenta CD_CUENTA,C2.descripcion CUENTA,CC.centro COD_CENTRO,CC.descripcion CENTRO,T2.descripcion TIPO,T.nit NIT,T.nombres CLIENTE,SUM(M.valor) VALOR
FROM movimiento M INNER JOIN terceros T ON (M.nit=T.nit)
INNER JOIN cuentas C2 ON (M.cuenta=C2.cuenta)
INNER JOIN centros C ON (M.centro=C.centro)
INNER JOIN centros CC ON (C.ncentro=CC.centro)
LEFT JOIN terceros_2 T2 ON (T.concepto_2=T2.concepto_2)
WHERE YEAR(fec)=2015  AND m.cuenta LIKE '530535%' AND M.tipo<>'Z1'
GROUP BY T2.descripcion,T.nit,T.nombres,M.cuenta,CC.centro,CC.descripcion,C2.descripcion
order by M.cuenta