
SELECT *
FROM (

SELECT T.NIT,T.nombres,MAX(UV.FECHA_ULT) FECHA_ULT
FROM terceros  t INNER JOIN terceros TR ON (T.nit=TR.nit_real)
left JOIN ultima_venta UV ON (tR.nit=uv.nit)
WHERE T.nit in (830075888,900310074,900135545,900093384,800003644,900364435,900174435,900899585,900656720,900496043) AND TR.concepto_2<>'14'
GROUP BY T.NIT,T.nombres )  AS P LEFT JOIN (


SELECT  t.nit_real,ROUND(sum(ZL.can_ventas-ZL.can_devolu)/6,0) PROMEDIO
FROM Zeuss_Lin_Ventas ZL INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE ZL.fec>='01/07/2018' AND ZL.subgrupo2 IN (2,3,4,39) AND T.nit_real IN (830075888,900310074,900135545,900093384,800003644,900364435,900174435,900899585,900656720,900496043)
group by t.nit_real) AS T ON (P.nit=T.nit_real)