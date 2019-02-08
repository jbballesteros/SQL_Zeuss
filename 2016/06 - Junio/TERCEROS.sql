SELECT 'CLIENTES' TIPO,T.nit NIT,T.nombres NOMBRES,T.direccion DIRECCION,T.telefono_1 TELEFONO,T.telefono_2 TELEFONO_2,T.mail MAIL,T.mail_adicional MAIL2
FROM Zeuss_Lin_Ventas	ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE  ZL.ano=2016  AND T.nit<>T.nit_real
GROUP BY T.nit,T.nombres,T.direccion,T.telefono_1,T.telefono_2,T.mail,T.mail_adicional
UNION
SELECT 'PROVEEDOR' TIPO,T.nit NIT,T.nombres NOMBRES,T.direccion DIRECCION,T.telefono_1 TELEFONO,T.telefono_2 TELEFONO_2,T.mail MAIL,T.mail_adicional MAIL2
FROM documentos	ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
WHERE  YEAR(ZL.fecha)=2016    AND ZL.sw IN (3,6,32) AND T.nit<>0
GROUP BY T.nit,T.nombres,T.direccion,T.telefono_1,T.telefono_2,T.mail,T.mail_adicional
UNION
SELECT 'SOBRETASA' TIPO,T.nit NIT,T.nombres NOMBRES,T.direccion DIRECCION,T.telefono_1 TELEFONO,T.telefono_2 TELEFONO_2,T.mail MAIL,T.mail_adicional MAIL2
FROM SobretasaMunicipios ZL

INNER JOIN terceros T ON (ZL.nit=T.nit)

GROUP BY T.nit,T.nombres,T.direccion,T.telefono_1,T.telefono_2,T.mail,T.mail_adicional
