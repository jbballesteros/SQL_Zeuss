SELECT *
FROM (

SELECT DL.tipo,DL.numero,RC.cta_inventario,ROUND(SUM(DL.costo_unitario*DL.cantidad),2) valor
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
LEFT JOIN referencias_con RC ON (R.contable=RC.contable)
WHERE DL.bodega=1 and YEAR(DL.fec)=2018 and MONTH(DL.fec)=3 and R.maneja_inventario=1
group by DL.tipo,DL.numero,RC.cta_inventario) AS P  FULL JOIN (


SELECT M.tipo,M.numero,M.cuenta,SUM(M.valor)*-1 valor
FROM movimiento M INNER JOIN cuentas_inventarios_centro CC ON (M.cuenta=CC.cuenta AND M.centro=CC.centro)
WHERE CC.bodega=1 AND YEAR(M.fec)=2018 AND MONTH(M.fec)=3
GROUP BY M.tipo,M.numero,M.cuenta) AS T ON (P.tipo=T.tipo AND P.numero=T.numero AND P.cta_inventario=T.cuenta)