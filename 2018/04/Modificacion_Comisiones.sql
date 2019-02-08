SELECT V.*, VV.numero,VV.fecha_rango,VV.valor_comision
FROM v_comision_final_TBL_tmp V INNER JOIN v_comision_final_TBL VV ON (v.numero_aplica=VV.numero )
WHERE MONTH(fecha_rango)<>3

UPDATE v_comision_final_TBL
SET fecha_rango='01/03/2018'
FROM v_comision_final_TBL_tmp V INNER JOIN v_comision_final_TBL VV ON (v.numero_aplica=VV.numero )
WHERE MONTH(fecha_rango)<>3
