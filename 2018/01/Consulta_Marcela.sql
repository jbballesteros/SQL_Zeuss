select dph.bodega BODEGA,YEAR(dph.fecha) AÑO,MONTH(dph.fecha) MES,t.nombres EMPRESA, 
case when dlh.codigo IN ('111','171') then 'CORRIENTE' when dlh.codigo in ('112','172') then 'DIESEL' when 
dlh.codigo in ('113','173') then 'EXTRA' when dlh.codigo in ('114','174') then 'GAS' end PRODUCTO,
SUM(dlh.cantidad) CANTIDAD, SUM(dlh.cantidad*dlh.valor_unitario) VALOR,
case when dlh.codigo in ('111','112','113','114') then 'CREDITO' else 'PREPAGADO' end RECARGA
from  documentos_lin_ped_historia dlh inner join documentos_ped_historia dph on dph.numero
=dlh.numero inner join terceros t on t.nit_real=dph.nit
where dlh.codigo in ('111','112','113','114','171','172','173','174')
and YEAR(dph.fecha)=2017 and MONTH(dph.fecha) =  12 and dph.bodega= 1 and dph.anulado=0
group by dph.bodega,dlh.codigo,YEAR(dph.fecha),MONTH(dph.fecha),t.nombres
order by YEAR(dph.fecha), MONTH(dph.fecha) 