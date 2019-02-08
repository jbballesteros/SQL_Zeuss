SELECT M.tipo,M.numero,M.cuenta,M.centro,CC.CENTRO
FROM documentos D 
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN cuentas_inventarios_centro CC ON (D.bodega=CC.bodega AND M.cuenta=CC.cuenta)
INNER JOIN (SELECT TIPO,NUMERO FROM DOCUMENTOS_LIN GROUP BY TIPO,NUMERO) AS DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  M.centro<>CC.CENTRO

UPDATE movimiento
SET centro=CC.CENTRO
FROM documentos D 
INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
INNER JOIN cuentas_inventarios_centro CC ON (D.bodega=CC.bodega AND M.cuenta=CC.cuenta)
INNER JOIN (SELECT TIPO,NUMERO FROM DOCUMENTOS_LIN GROUP BY TIPO,NUMERO) AS DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE  M.centro<>CC.CENTRO