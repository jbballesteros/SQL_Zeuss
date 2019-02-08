
DECLARE @FECHA AS DATE='23/07/2018'
DECLARE @CODIGO AS VARCHAR(20)='51'
DECLARE @BODEGA AS INTEGER=5

declare @stock_dms  real=NULL
DECLARE @CALCULO AS REAL=NULL
DECLARE @YEAR AS INTEGER=NULL
DECLARE @MES AS INTEGER=NULL
DECLARE @DIA AS INTEGER=NULL

SELECT @YEAR=YEAR(@fecha),@MES=MONTH(@fecha),@DIA=DAY(@fecha)

SELECT @stock_dms=RS.can_ini+ROUND(SUM(DL.cantidad*SW.factor),2) ,@CALCULO=SUM(DL.cantidad*SW.factor)
		FROM documentos_lin DL 
		INNER JOIN tipo_transacciones_sw SW ON (DL.SW=SW.sw)
		INNER JOIN referencias_sto RS ON (DL.codigo=RS.codigo AND YEAR(DL.fec)=RS.ano AND MONTH(DL.fec)=RS.mes AND DL.bodega=RS.bodega)
		WHERE DL.maneja_inventario='S' AND YEAR(DL.fec)=@YEAR AND MONTH(DL.fec)=@MES AND DAY(DL.fec)<=@DIA   AND DL.codigo=@codigo AND DL.bodega=@BODEGA
		GROUP BY DL.codigo,RS.can_ini

		--IF @stock_dms IS NULL
		--BEGIN
		--	select @stock_dms=STOCK 
		--	from v_stock_estinsa 
		--	where MES=MONTH(@fecha) 
		--	and ANO=YEAR(@fecha) and CODIGO=cast(@codigo as varchar) and bodega = @bodega
		--END		

		select ROUND(ISNULL(@stock_dms,0),0) final_dms,@CALCULO


		
SELECT RS.can_ini,RS.can_ini+ROUND((DL.cantidad*SW.factor),2),DL.tipo,DL.numero,DL.cantidad,SW.factor,DL.cantidad*SW.factor
		FROM documentos_lin DL 
		INNER JOIN tipo_transacciones_sw SW ON (DL.SW=SW.sw)
		INNER JOIN referencias_sto RS ON (DL.codigo=RS.codigo AND YEAR(DL.fec)=RS.ano AND MONTH(DL.fec)=RS.mes AND DL.bodega=RS.bodega)
		WHERE DL.maneja_inventario='S' AND YEAR(DL.fec)=@YEAR AND MONTH(DL.fec)=@MES AND DAY(DL.fec)<=@DIA   AND DL.codigo=@codigo AND DL.bodega=@BODEGA

