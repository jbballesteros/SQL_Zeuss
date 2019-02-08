DECLARE @AÑO AS INTEGER=2016
DECLARE @MES AS INTEGER=7

INSERT INTO movimiento (tipo,numero,seq,fec,cuenta,centro,nit,valor,explicacion)

SELECT ZL.tipo,ZL.numero,ROW_NUMBER() OVER (PARTITION BY ZL.TIPO,ZL.NUMERO ORDER BY ZL.CODIGO) +   100100,ZL.fec,
ISNULL(TM.cta11,TM2.cta11) CUENTA,B.centro,ZL.nit,(ZL.vlr_ventas-ZL.vlr_devolu)*-1 VALOR,'ZINV IMPUESTO NACIONAL'
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
LEFT JOIN tipo_transacciones_mod_nuevo TM ON (ZL.tipo=TM.tipo AND (TM.bodega=ZL.bodega) AND TM.modelo=D.modelo AND TM.perfil_contable=R.contable)
LEFT JOIN tipo_transacciones_mod_nuevo TM2 ON (ZL.tipo=TM2.tipo AND (TM2.bodega=0) AND TM2.modelo=D.modelo AND TM2.perfil_contable=R.contable)
WHERE ZL.ano=@AÑO and ZL.mes=@MES AND ZL.subgrupo2 IN (13,20,21)
ORDER BY ZL.TIPO,ZL.NUMERO



INSERT INTO movimiento (tipo,numero,seq,fec,cuenta,centro,nit,valor,explicacion)

SELECT ZL.tipo,ZL.numero,ROW_NUMBER() OVER (PARTITION BY ZL.TIPO,ZL.NUMERO ORDER BY ZL.CODIGO) +   100200,ZL.fec,
ISNULL(TM.cta10,TM2.cta10) CUENTA,B.centro,ZL.nit,(ZL.vlr_ventas-ZL.vlr_devolu) VALOR,'ZINV IMPUESTO NACIONAL'
FROM Zeuss_Lin_Ventas ZL 
INNER JOIN bodegas B ON (ZL.bodega=B.bodega)
INNER JOIN documentos D ON (ZL.tipo=D.tipo AND ZL.numero=D.numero)
INNER JOIN referencias R ON (ZL.codigo=R.codigo)
LEFT JOIN tipo_transacciones_mod_nuevo TM ON (ZL.tipo=TM.tipo AND (TM.bodega=ZL.bodega) AND TM.modelo=D.modelo AND TM.perfil_contable=R.contable)
LEFT JOIN tipo_transacciones_mod_nuevo TM2 ON (ZL.tipo=TM2.tipo AND (TM2.bodega=0) AND TM2.modelo=D.modelo AND TM2.perfil_contable=R.contable)
WHERE ZL.ano=@AÑO and ZL.mes=@MES AND ZL.subgrupo2 IN (13,20,21)
ORDER BY ZL.TIPO,ZL.NUMERO
