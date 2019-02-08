DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7

INSERT INTO movimiento (tipo,numero,seq,fec,cuenta,centro,nit,valor,explicacion)

SELECT ZL.tipo,ZL.numero,ROW_NUMBER() OVER (PARTITION BY ZL.TIPO,ZL.NUMERO ORDER BY ZL.CODIGO) +   100100,ZL.fec,
ISNULL(TM.cta1,TM2.cta1) CUENTA,9998,ZL.nit,(ZL.cantidad*ZL.costo_unitario)*-1 VALOR,'ZINV IMPUESTO NACIONAL TRASLADO'
FROM documentos_lin ZL 
INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
LEFT JOIN tipo_transacciones_mod_nuevo TM ON (ZL.tipo=TM.tipo AND (TM.bodega=ZL.bodega) AND TM.modelo=D.modelo AND TM.perfil_contable=R.contable)
LEFT JOIN tipo_transacciones_mod_nuevo TM2 ON (ZL.tipo=TM2.tipo AND (TM2.bodega=0) AND TM2.modelo=D.modelo AND TM2.perfil_contable=R.contable)
WHERE YEAR(ZL.fec)=@AÑO and MONTH(ZL.fec)=@MES AND R.subgrupo2 IN (13,20,21)  AND D.sw=12
ORDER BY ZL.TIPO,ZL.NUMERO



INSERT INTO movimiento (tipo,numero,seq,fec,cuenta,centro,nit,valor,explicacion)

SELECT ZL.tipo,ZL.numero,ROW_NUMBER() OVER (PARTITION BY ZL.TIPO,ZL.NUMERO ORDER BY ZL.CODIGO) +   100200,ZL.fec,
ISNULL(TM.cta2,TM2.cta2) CUENTA,ISNULL(TM.cen1,TM2.cen2) centro,ZL.nit,(ZL.cantidad*ZL.costo_unitario) VALOR,'ZINV IMPUESTO NACIONAL TRASLADO'
FROM documentos_lin ZL 
INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
LEFT JOIN tipo_transacciones_mod_nuevo TM ON (ZL.tipo=TM.tipo AND (TM.bodega=ZL.bodega) AND TM.modelo=D.modelo AND TM.perfil_contable=R.contable)
LEFT JOIN tipo_transacciones_mod_nuevo TM2 ON (ZL.tipo=TM2.tipo AND (TM2.bodega=0) AND TM2.modelo=D.modelo AND TM2.perfil_contable=R.contable)
WHERE YEAR(ZL.fec)=@AÑO and MONTH(ZL.fec)=@MES AND R.subgrupo2 IN (13,20,21)  AND D.sw=12
ORDER BY ZL.TIPO,ZL.NUMERO



