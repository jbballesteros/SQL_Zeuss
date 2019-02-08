SELECT ZA.NIT,T.nombres,ZA.tipo,ZA.numero,ZA.fecha,ZA.vencimiento,ZA.FECHA_PAGO,ZA.DIAS,ZA.VALOR_TOTAL,P.VALORAB
FROM Zeuss_BonificacionAgrup ZA 
INNER JOIN terceros T ON (ZA.nit=T.nit)
LEFT JOIN v_bon_pagoacum_tbl P ON (ZA.tipo=P.TIPO AND ZA.numero=P.NUMERO)
WHERE T.concepto_12='01' AND ZA.FECHA_PAGO BETWEEN '01/03/2018' AND '31/03/2018'
AND DIAS>0

