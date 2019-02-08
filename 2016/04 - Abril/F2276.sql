select TM.TIPO,TM.NIT,b.primer_apellido,b.segundo_apellido,b.primer_nombre,b.segundo_nombre, a.fec_ini_certificado,a.fec_fin_certificado,'04/04/2015','05','308',1,




a.val_sal_si_gravado,a.val_ces_si_gravado,0,0,a.val_ing_si_gravado,
a.val_sal_si_gravado+a.val_ing_si_gravado,a.val_salud_eps 

,a.val_pen_fsp,a.val_pen_vol,a.val_retencion 
from y_certificados as a 
LEFT join terceros_nombres as b on a.nit=b.nit
LEFT JOIN terceros_medios TM ON (a.nit=TM.NIT)
where YEAR(a.fec_ini_certificado)=2015