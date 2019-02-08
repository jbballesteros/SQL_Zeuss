SELECT WS.*
FROM v_ws_urlconfirmacion WS INNER JOIN (
SELECT fechaPago,codigoFactura,valorFactura,codBancoRecaudador,COUNT(ID) cuenta
FROM v_ws_urlconfirmacion
WHERE fecha>='15/05/2018'
GROUP BY fechaPago,codigoFactura,valorFactura,codBancoRecaudador
HAVING COUNT(ID)>1) AS R ON (WS.fechaPago=R.fechaPago AND WS.codigoFactura=R.codigoFactura AND WS.codBancoRecaudador=R.codBancoRecaudador AND WS.valorFactura=R.valorFactura )
ORDER BY WS.codigoFactura

