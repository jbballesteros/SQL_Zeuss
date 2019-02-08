

SELECT ZL.nit ,T.nombres,T.mail,TV.nit,TV.nombres,TV.mail
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN terceros TV ON (T.vendedor=TV.nit)
LEFT JOIN terceros_carencia TC ON (T.nit=TC.nit)
WHERE ZL.subgrupo2 IN (2,3,4) AND ZL.fec>=CAST(DATEADD(MONTH,-6,GETDATE()) AS DATE)
AND TC.nit IS  NULL
GROUP BY ZL.nit ,T.nombres,T.mail,TV.nit,TV.nombres,TV.mail