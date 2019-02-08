SELECT SP.*,YC.fecha
FROM saldos_prepagados SP LEFT JOIN y_calendario YC ON (SP.AÑO=YEAR(YC.fecha) AND SP.MES=MONTH(YC.fecha) AND SP.DIA=DAY(YC.fecha))
where AÑO=2016 AND MES=11 AND NIT=71779558
ORDER BY DIA


SELECT P.fecha FECHA,T.AÑO,T.MES,T.DIA,T.NIT,T.SALDO,T.DEBITO,T.CREDITO
INTO Prepagagos_Contab
FROM (


SELECT fecha
FROM y_calendario
WHERE fecha BETWEEN '01/11/2016' AND '30/11/2016') AS P 

LEFT JOIN (

SELECT SP.*,YC.fecha
FROM saldos_prepagados SP LEFT JOIN y_calendario YC ON (SP.AÑO=YEAR(YC.fecha) AND SP.MES=MONTH(YC.fecha) AND SP.DIA=DAY(YC.fecha))
where AÑO=2016 AND MES=11 AND NIT=71779558) AS T ON (P.fecha=T.fecha)

