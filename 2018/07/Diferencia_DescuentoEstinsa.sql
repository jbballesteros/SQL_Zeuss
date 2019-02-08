SELECT T.nit,T.nombres,D.tipo,D.numero,D.fecha,D.descuento_pie,P.descuento
FROM documentos D 
INNER JOIN terceros T ON (D.nit=T.nit)
LEFT JOIN (SELECT V.*
FROM v_facturas_descuento_pie V 
INNER JOIN documentos D ON (V.tipo=D.tipo AND V.numero=D.numero)
INNER JOIN terceros T ON (D.nit=T.nit)
WHERE T.nit_real=900625898 AND D.fecha>='01/06/2018') AS P ON (D.tipo=P.tipo AND D.numero=P.numero)
WHERE T.nit_real=900625898 AND D.fecha>='01/06/2018' AND D.anulado=0 AND D.sw=1 