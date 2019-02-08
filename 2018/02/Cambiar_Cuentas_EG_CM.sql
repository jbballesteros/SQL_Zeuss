SELECT M.*
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE prefijo='MC' AND cuenta='11050503'


select *
from movimiento
where tipo='EGC5' AND numero=1353

update movimiento
set cuenta='11050502'
FROM documentos D INNER JOIN movimiento M ON (D.tipo=M.tipo AND D.numero=M.numero)
WHERE prefijo='MC' AND cuenta='11050503'