SELECT *
FROM documentos D 
INNER JOIN documentos_lin M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.sw IN (13,14) AND D.fecha>='01/01/2018' AND D.nit<>M.nit


UPDATE documentos
SET nit=M.NIT
FROM documentos D 
INNER JOIN documentos_lin M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.sw IN (13,14) AND D.fecha>='01/01/2018' AND D.nit<>M.nit