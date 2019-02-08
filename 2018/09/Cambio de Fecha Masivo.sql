SELECT D.tipo,D.numero,D.fecha,DL.fec
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE 
(D.tipo='BCP' AND D.numero=520) OR
(D.tipo='BCP' AND D.numero=519) OR
(D.tipo='SCP' AND D.numero=5274) OR
(D.tipo='SCP' AND D.numero=5273) OR
(D.tipo='SP00' AND D.numero=1467) OR
(D.tipo='SP00' AND D.numero=1468) 


UPDATE documentos
SET fecha='31/07/2018'
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE 
(D.tipo='BCP' AND D.numero=520) OR
(D.tipo='BCP' AND D.numero=519) OR
(D.tipo='SCP' AND D.numero=5274) OR
(D.tipo='SCP' AND D.numero=5273) OR
(D.tipo='SP00' AND D.numero=1467) OR
(D.tipo='SP00' AND D.numero=1468) 

UPDATE documentos_lin
SET fec='31/07/2018'
FROM documentos D INNER JOIN documentos_lin DL ON (D.tipo=DL.tipo AND D.numero=DL.numero)
WHERE 
(D.tipo='BCP' AND D.numero=520) OR
(D.tipo='BCP' AND D.numero=519) OR
(D.tipo='SCP' AND D.numero=5274) OR
(D.tipo='SCP' AND D.numero=5273) OR
(D.tipo='SP00' AND D.numero=1467) OR
(D.tipo='SP00' AND D.numero=1468) 