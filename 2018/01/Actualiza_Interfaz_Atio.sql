  UPDATE  [interfaz_control_atio]
  SET planillas=0, creditosyprepagados=0, canastilla=0
    where fecha='19/01/2018' and bodega=4


SELECT [fecha]
      ,[planillas]
      ,[creditosyprepagados]
      ,[bodega]
      ,[numeracion]
      ,[pedidos]
      ,[formas_pago]
      ,[ventas]
      ,[devoluciones_ventas]
      ,[devoluciones_compra]
      ,[remisiones]
      ,[movimiento_caja]
      ,[compras]
      ,[recibos_eds]
      ,[ajustes]
      ,[canastilla]
      ,[todo]
      ,[dia]
  FROM [dbo].[interfaz_control_atio]
  where fecha='19/01/2018' and bodega=4
  
