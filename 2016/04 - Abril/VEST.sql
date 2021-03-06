SELECT EL.bodega,B.descripcion,
EL.codigo,EL.descripcion,

ROUND(SUM(CASE WHEN EL.mes=1 THEN EL.can_real ELSE 0 END),0) ENERO,
ROUND(SUM(CASE WHEN EL.mes=2 THEN EL.can_real ELSE 0 END),0) FEBRERO,
ROUND(SUM(CASE WHEN EL.mes=3 THEN EL.can_real ELSE 0 END),0) MARZO,
ROUND(SUM(CASE WHEN EL.mes=4 THEN EL.can_real ELSE 0 END),0) ABRIL,
ROUND(SUM(CASE WHEN EL.mes=5 THEN EL.can_real ELSE 0 END),0) MAYO,
ROUND(SUM(CASE WHEN EL.mes=6 THEN EL.can_real ELSE 0 END),0) JUNIO,
ROUND(SUM(CASE WHEN EL.mes=7 THEN EL.can_real ELSE 0 END),0) JULIO,
ROUND(SUM(CASE WHEN EL.mes=8 THEN EL.can_real ELSE 0 END),0) AGOSTO,
ROUND(SUM(CASE WHEN EL.mes=9 THEN EL.can_real ELSE 0 END),0) SEPTIEMBRE,
ROUND(SUM(CASE WHEN EL.mes=10 THEN EL.can_real ELSE 0 END),0) OCTUBRE,
ROUND(SUM(CASE WHEN EL.mes=11 THEN EL.can_real ELSE 0 END),0) NOVIEMBRE,
ROUND(SUM(CASE WHEN EL.mes=12 THEN EL.can_real ELSE 0 END),0) DICIEMBRE,
sum(EL.can_real) TOTAL
FROM Estinsa_Lin_Ventas EL INNER JOIN bodegas B ON (EL.bodega=B.bodega)
WHERE EL.ano=2015 AND EL.clase='01'
GROUP BY EL.bodega,B.descripcion,
EL.codigo,EL.descripcion