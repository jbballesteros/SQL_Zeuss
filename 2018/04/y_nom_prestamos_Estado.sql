SELECT YN.IdPrestamo,YN.nit,T.nombres,YN.capital,YN.valor_pagado,YN.saldo,SUM(YL.valor)+ISNULL(P.valor,0),
YN.capital-SUM(YL.valor)-ISNULL(P.valor,0) SALDO_REAL
FROM y_prestamos_nom YN 
INNER JOIN terceros T ON (YN.nit=T.nit)
LEFT JOIN y_liquidacion YL ON (YN.IdPrestamo=YL.numero AND YN.contrato=YL.contrato)
LEFT JOIN (SELECT IdPrestamo,SUM(valor) valor
FROM y_abonos_extra
GROUP BY IdPrestamo) AS P ON (YN.IdPrestamo=P.IdPrestamo)
WHERE YL.concepto=706 AND YL.tabla!= 'y_prestamos' AND YN.estado='i'
GROUP BY YN.IdPrestamo,YN.capital,t.nombres,YN.valor_pagado,YN.saldo,YN.nit, P.valor