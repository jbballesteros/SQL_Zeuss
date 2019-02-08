

SELECT d.tipo,d.numero,d.fecha,t.nombres,tel1=t.telefono_1,tel2=t.telefono_2,t.direccion From documentos d Join terceros t on d.nit = t.nit 
Left Join documentos_despachos p on d.tipo = p.tipo_desp And d.numero = p.numero_desp 
Where d.anulado <> 1 And d.sw  in (1,4,11,16,101) And p.tipo_desp is null And p.numero_desp is null ORDER BY d.fecha desc,d.tipo,d.numero


SELECT *
FROM documentos D 
LEFT JOIN documentos_despacho_insertados DI ON (D.tipo=DI.TIPO AND D.numero=DI.NUMERO)
WHERE D.anulado=0 AND D.sw IN (1,4,11,16,101) AND DI.tipo_desp IS NULL AND DIFFERENCE