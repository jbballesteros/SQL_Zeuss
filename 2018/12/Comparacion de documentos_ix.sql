SELECT *,P.valor-T.valor
FROM (
select v.cuenta,c.descripcion,v.tipo,V.numero,SUM(v.valor) valor
from v_informe_Contab_lin v inner join cuentas c on (v.cuenta=c.cuenta)
group by  v.cuenta,c.descripcion,v.tipo,V.numero) AS P FULL JOIN (

select v.cuenta,c.descripcion,v.tipo,v.numero,SUM(v.valor) valor
from v_informe_lin_Contab v inner join cuentas c on (v.cuenta=c.cuenta)
group by  v.cuenta,c.descripcion,v.tipo,V.numero) AS T ON (P.cuenta=T.cuenta AND P.numero=T.numero AND P.tipo=T.tipo)
WHERE P.cuenta='41750202'