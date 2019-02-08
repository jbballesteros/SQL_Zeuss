---- HABILITAR NIT PARA CONCURSO
update terceros_concurso_bicis
set fecha_registro=GETDATE(),usuario='DMS1' , fecha_hora=GETDATE()
where sorteo IS NULL
---- HABILITAR NIT PARA CONCURSO


---- HABILITAR NIT PARA CONCURSO
update terceros_concurso_bicis
set sorteo=null,usuario_sorteo=null,fecha_hora_sorteo=null,ganador=null,fecha_sorteo=null
where sorteo=5
---- HABILITAR NIT PARA CONCURSO

SELECT *
FROM terceros_concurso_bicis