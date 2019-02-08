UPDATE documentos_lin
SET codigo=CASE 
WHEN R.subgrupo2=8 THEN  100001
WHEN R.subgrupo2=5 THEN 100002
WHEN R.subgrupo2=7 THEN 100003 ELSE 0 END,
fec=DATEADD(DAY,(DAY(DL.FEC)*-1)+1,   DL.fec),
bodega=1000
FROM documentos_lin DL 
INNER JOIN referencias R ON (DL.codigo=R.codigo)
WHERE tipo='SCP' AND numero IN (4085,4086,4087,4162,4163,4164,4237,4238,4239,4240,4241)
