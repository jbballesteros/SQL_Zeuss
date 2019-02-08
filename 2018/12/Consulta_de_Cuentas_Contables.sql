SELECT M.cuenta,C.descripcion,m.tipo,m.numero,sum(m.valor)*-1
FROM movimiento M INNER JOIN cuentas C ON (M.cuenta=C.cuenta)
WHERE fec BETWEEN '01/11/2018' AND '30/11/2018' AND M.cuenta LIKE '41%' AND 
M.cuenta NOT IN ('41760501','41760502','41760503','41760504','4135100101','4135100101','4135100201','413509')
GROUP BY M.cuenta,C.descripcion,m.tipo,m.numero


select 
case when ZL.subgrupo2=3 and sw=1 then 
from Zeuss_Lin_Ventas ZL 
WHERE ZL.subgrupo2 IN (2,3,4,39)
