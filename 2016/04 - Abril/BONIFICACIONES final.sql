DELETE FROM bon_bonificacion_tbl
INSERT INTO bon_bonificacion_tbl

SELECT     YEAR(FV.fecha) AS A�O, MONTH(FV.fecha) AS MES, DAY(FV.fecha) AS DIA, FV.tipo, FV.numero, FV.fecha, FV.VENCIMIENTOREAL AS vencimiento, FV.VENCIMIENTO AS VENCIMIENTOF, 
                      ZP.FECHA_PAGO, ZP.DIASREAL, ZP.DIAS, FV.nit, FV.NOMBRESNIT AS NOMBRE, FV.codigo, FV.seq, FV.descripcion, FV.cantidad, FV.valor_unitario, FV.VALORCM, 
                      FV.VALOR_VENTA AS VALOR_TOTAL, FV.valor_total AS VALORFV, FV.margen, FV.PESOS, FV.[MARGEN%] AS PORCENTAJE, 
                      
       CASE 
       
       WHEN FV.NIT_REAL IN (900310074, 811038233) AND  ZP.DIAS <= 15 THEN FV.BONIFICACION 
      WHEN FV.NIT_REAL IN (8012455) AND FV.fecha BETWEEN '01/11/2014' AND '31/07/2015' AND     ZP.DIAS <= 7 THEN FV.BONIFICACION 
      WHEN FV.NIT_REAL = 890943038 AND FV.fecha BETWEEN '01/11/2014' AND '01/11/2014' THEN (CASE WHEN DIAS BETWEEN '-8' AND '0' THEN FV.BONIFICACION2 
      WHEN ZP.DIAS < - 8 THEN FV.BONIFICACION ELSE 0 END) 
    WHEN FV.NIT_REAL = 900542032 THEN (CASE WHEN ZP.FECHA_PAGO > FV.FECHA THEN FV.BONIFICACION2 ELSE FV.BONIFICACION END) 
    WHEN FV.NIT_REAL IN (800061380, 900071160, 900247772) AND ZP.DIAS <= 1 THEN FV.BONIFICACION WHEN FV.CONCEPTO_2 = '40' AND ZP.DIAS <= 2 THEN FV.BONIFICACION 
    WHEN FV.NIT_REAL = 22384461 THEN (CASE WHEN DIAS <= 0 THEN FV.BONIFICACION2 WHEN ZP.DIAS > 0 THEN FV.BONIFICACION ELSE 0 END) 
    WHEN (ZP.DIAS) <= 0 OR ZP.COMPENSA = 1 OR    FV.CONCEPTO_13 = '11' THEN FV.BONIFICACION ELSE 0 END AS TOTAL_BONIFICACION,
    
    
    
     FV.NIT_REAL, FV.bodega, FV.concepto_13, FV.tipo_bonificacion, FV.numero_bonificacion, 
                      FV.NIT_TV AS vendedor, FV.CUPO, FV.TELEFONO, FV.direccion, FV.CIUDAD, FV.DEPARTAMENTO, FV.BONIFICACION, FV.TIPO_CLIENTE, FV.NIT_TV, FV.NOMBRES_TV, 
                      FV.DESCUENTO AS DESCUENTOCL, FV.subgrupo2
FROM         bon_fvcompleta_tbl AS FV LEFT OUTER JOIN
                      bon_pagoacum AS ZP ON FV.tipo = ZP.TIPO AND FV.numero = ZP.NUMERO
WHERE     (FV.subgrupo2 IN (2, 3, 4))