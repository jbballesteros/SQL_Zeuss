SELECT *
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.tipo='AJ' AND D.prefijo='IN' AND YEAR(FEC)=2015

UPDATE documentos
SET notas='*** Motivo: ERROR EN LOS REGISTROS NO SE UTILIZA  USUARIO: SISTEMAS *** '
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.tipo='AJ' AND D.prefijo='IN' AND YEAR(FEC)=2015

DELETE FROM movimiento
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE D.tipo='AJ' AND D.prefijo='IN' AND YEAR(FEC)=2015
