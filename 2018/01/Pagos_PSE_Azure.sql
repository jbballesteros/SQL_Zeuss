

SELECT PP.id_pago,PP.valor_pagado,PP.se_interfazo,PP.error_sql,PP.Empresa,PF.tipo,PF.factura,PF.valor_factura,PP.str_error,PP.estado_pago,CAST(PP.fecha_transaccion AS DATE)
FROM PSE_pagosfacturas PP LEFT JOIN PSE_facturas PF ON (PP.id_pago=PF.registro AND PP.Empresa=PF.Empresa)
WHERE PP.fecha_transaccion>='01/19/2018'  AND NOT (PP.estado_pago=0)
ORDER BY id_pago DESC