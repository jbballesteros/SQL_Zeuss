

select RS.ano,RS.mes,RS.codigo,RS.can_ini,
SUM(isnull(DL.cantidad,0)*isnull(SW.FACTOR,0)) movimiento,
RS.can_ini+SUM(isnull(DL.cantidad,0)*isnull(SW.FACTOR,0)) saldo
from referencias_sto RS 
LEFT JOIN documentos_lin DL ON (
RS.codigo=DL.codigo AND RS.bodega=DL.bodega AND YEAR(DL.fec)=RS.ano AND MONTH(DL.fec)=RS.mes AND DL.maneja_inventario='S')
LEFT JOIN tipo_transacciones_sw SW ON (DL.SW=SW.SW)
WHERE RS.ano=YEAR(GETDATE()) AND RS.mes=MONTH(GETDATE())
GROUP BY RS.ano,RS.mes,RS.codigo,RS.can_ini