

SELECT ZL.ano AÑO,ZL.mes MES,YC.departamento+YC.ciudad CODDANE,SM.Descripcion DESCRIPCION,R2.descripcion PRODUCTO,RT.descripcion MEZCLA,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD,
PS.valor VALOR,
ROUND((PS.valor*SUM(ZL.can_ventas-ZL.can_devolu)*((100-porcentaje)/100)),-3) BASE,
ROUND((PS.valor*SUM(ZL.can_ventas-ZL.can_devolu)*((100-porcentaje)/100))* (SM.PMunicipioSobre / 100),-3)  VALOR_PAGAR
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
INNER JOIN referencias_sub2 R2 ON (R.subgrupo2=R2.subgrupo2)
INNER JOIN y_ciudades YC ON (T.y_ciudad=YC.ciudad AND T.y_dpto=YC.departamento)
INNER JOIN Precios_Sobretasa PS ON (ZL.ano=PS.año AND ZL.mes=PS.mes AND ZL.subgrupo2=PS.codigo)
LEFT JOIN referencias_tip1 RT ON (R.tipo_1=RT.tipo_1)
LEFT JOIN SobretasaMunicipios SM ON (YC.departamento+YC.ciudad =SM.CodDane)
WHERE ZL.subgrupo2 IN (2,4) AND ZL.ano>=2016
GROUP BY ZL.ano,ZL.mes,YC.departamento,YC.ciudad,ZL.codigo,ZL.descripcion,RT.descripcion,SM.Descripcion,PS.valor,RT.porcentaje,SM.PMunicipioSobre,R2.descripcion
UNION
SELECT ZL.ano AÑO,ZL.mes MES,SM.CodDane CODDANE,SM.Descripcion DESCRIPCION,R2.descripcion PRODUCTO,RT.descripcion MEZCLA,SUM(ZL.can_ventas-ZL.can_devolu) CANTIDAD,
PS.valor VALOR,
ROUND((PS.valor*SUM(ZL.can_ventas-ZL.can_devolu)*((100-porcentaje)/100)),-3) BASE,
ROUND((PS.valor*SUM(ZL.can_ventas-ZL.can_devolu)*((100-porcentaje)/100))* (SM.PMunicipioSobre / 100),-3)  SOBRETASA
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN terceros T ON (ZL.nit=T.nit)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
INNER JOIN referencias_sub2 R2 ON (R.subgrupo2=R2.subgrupo2)
INNER JOIN Precios_Sobretasa PS ON (ZL.ano=PS.año AND ZL.mes=PS.mes AND ZL.subgrupo2=PS.codigo)
LEFT JOIN referencias_tip1 RT ON (R.tipo_1=RT.tipo_1)
LEFT JOIN SobretasaMunicipios SM ON (T.y_dpto+'000' =SM.CodDane)
WHERE ZL.subgrupo2 IN (2,4) AND ZL.ano>=2016 and T.y_dpto<>'11' and ZL.mes=5
GROUP BY ZL.ano,ZL.mes,SM.CodDane ,RT.descripcion,SM.Descripcion,PS.valor,RT.porcentaje,SM.PMunicipioSobre,T.y_dpto,R2.descripcion


