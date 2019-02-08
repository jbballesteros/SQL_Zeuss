SELECT *,P.valor-T.valor
FROM (
select v.cuenta,c.descripcion,SUM(v.valor) valor
from v_informe_Contab_lin v inner join cuentas c on (v.cuenta=c.cuenta)
group by  v.cuenta,c.descripcion) AS P FULL JOIN (

select v.cuenta,c.descripcion,SUM(v.valor) valor
from v_informe_lin_Contab v inner join cuentas c on (v.cuenta=c.cuenta)
group by  v.cuenta,c.descripcion) AS T ON (P.cuenta=T.cuenta)