select D.*
from documentos D LEFT JOIN FacturacionElectronica.dbo.Factura_electronica FE ON (D.tipo=FE.tipo AND D.numero=FE.numero)
where  date_ins>='17/09/2018' and D.sw=1 AND D.tipo NOT LIKE 'CO%' AND FE.tipo IS NULL AND D.anulado=0


select *
from documentos
where  date_ins>='17/09/2018' and sw=1 AND tipo NOT LIKE 'CO%'


SELECT *
FROM v_facturaelectronica
WHERE tipo=