DECLARE @AÑO AS INTEGER=2019
DECLARE @MES AS INTEGER=1
DECLARE @DIA AS INTEGER=30
DECLARE @FECHA AS DATE

SELECT @FECHA=CAST(CAST(@DIA AS VARCHAR)+'/'+CAST(@MES AS VARCHAR)+'/'+CAST(@AÑO AS VARCHAR) AS DATE)  


SELECT A.nit,A.nombres,A.actual,A.presupuesto_dia,
ROUND(CASE WHEN A.presupuesto_dia=0 THEN 1 ELSE  A.actual/A.presupuesto_dia END,2) cumplimiento,
A.presupuesto,A.anterior, A.actual-A.anterior diferencia,
ROUND(CASE WHEN A.anterior=0 AND A.actual<>0 THEN 1 WHEN A.actual=0 AND A.anterior=0 THEN 0 ELSE A.actual/A.anterior END,2) difernecia_porcentual
FROM (
SELECT TV.nit,TV.nombres,T.actual,
round(CASE 
WHEN ISNULL(F.dia_mes,0)=0 THEN 0 ELSE
(T.presupuesto / ISNULL(F.dia_mes,0)) *  ISNULL(F.dia_habil,0) END,0) presupuesto_dia,
T.presupuesto,T.anterior,F.dia_mes,F.dia_habil
FROM (
SELECT ISNULL(P.vendedor,T.vendedor) vendedor,
isnull(ano_actual,0) actual, isnull(ano_anterior,0) anterior,
isnull(galones,0) presupuesto
FROM (
SELECT ZL.vendedorter vendedor,
SUM(CASE WHEN ZL.ano=@AÑO THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END ) ano_actual,
SUM(CASE WHEN ZL.ano=(@AÑO-1) THEN ZL.can_ventas-ZL.can_devolu ELSE 0 END )  ano_anterior
FROM Zeuss_Lin_Ventas ZL 
WHERE ZL.subgrupo2 IN (2,3,4,39) AND ZL.ano IN (@AÑO,@AÑO-1) AND ZL.mes=@MES AND ZL.Dia<=@DIA
GROUP BY ZL.vendedorter
 ) AS P FULL JOIN (
SELECT T.vendedor,SUM(P.galones) galones
FROM presupuesto P 
INNER JOIN terceros T ON (P.Nit=t.nit)
WHERE P.ano=@AÑO AND P.mes=@MES AND P.codigo<>1 AND P.galones<>0 
GROUP BY T.vendedor) AS T ON (P.vendedor=T.vendedor)
) AS T INNER JOIN terceros TV ON (T.vendedor=TV.nit)
INNER JOIN bon_calendario_tbl F ON (F.fecha=@FECHA)
WHERE T.actual+T.anterior+T.presupuesto<>0 AND TV.concepto_4 IN (101,103)) AS A



