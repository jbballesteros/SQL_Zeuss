SELECT P.*,DT.*,DL.codigo,DL.cantidad,DL.fec,D.concepto,D.fecha
FROM (

SELECT ID,tipo,numero,cantidad
FROM documentos_traslados
WHERE (TIPO='EPA' AND NUMERO=4623) OR 
(TIPO='EPA' AND NUMERO=4624) OR 
(TIPO='EPA' AND NUMERO=4625) OR 
(TIPO='EPA' AND NUMERO=4635) OR 
(TIPO='EPA' AND NUMERO=4636) OR 
(TIPO='EPA' AND NUMERO=4639) OR 
(TIPO='EPA' AND NUMERO=4643) OR 
(TIPO='EPA' AND NUMERO=4645) OR 
(TIPO='EPA' AND NUMERO=4647) OR 
(TIPO='EPA' AND NUMERO=4648) OR 
(TIPO='EPA' AND NUMERO=4652) OR 
(TIPO='EPA' AND NUMERO=4654) OR 
(TIPO='EPA' AND NUMERO=4658) OR 
(TIPO='EPA' AND NUMERO=4662) OR 
(TIPO='EPA' AND NUMERO=4664) OR 
(TIPO='EPA' AND NUMERO=4666) OR 
(TIPO='EPA' AND NUMERO=4668) OR 
(TIPO='EPA' AND NUMERO=4673) OR 
(TIPO='EPA' AND NUMERO=4675) OR 
(TIPO='EPA' AND NUMERO=4676) OR 
(TIPO='EPA' AND NUMERO=4678) OR 
(TIPO='EPA' AND NUMERO=4679) OR 
(TIPO='EPA' AND NUMERO=4682) OR 
(TIPO='EPA' AND NUMERO=4684) ) AS P 
LEFT JOIN documentos_traslados DT ON (P.id=DT.id AND DT.SW=11)
LEFT JOIN documentos_lin DL ON (DT.codigo=DL.codigo AND DT.tipo=DL.tipo AND DL.numero=DT.numero)
LEFT JOIN documentos D ON (DT.tipo=D.tipo AND DT.numero=D.numero)