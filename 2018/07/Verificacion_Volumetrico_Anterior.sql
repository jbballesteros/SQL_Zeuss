DECLARE @FECHA AS DATE='23/07/2018'
DECLARE @CODIGO AS VARCHAR(20)='51'
DECLARE @BODEGA AS INTEGER=5

declare @stock_dms  real

set @stock_dms  = (select [SALDO TEÓRICO] stock_dms 
from v_kardex_combustible_controlvolumetrico vkc
where CODICO=@codigo and AÑO=YEAR(@fecha) and MES=month(@fecha) and DIAS=DAY(@fecha) and BODEGA=@bodega)

if(@stock_dms is null)
begin
set @stock_dms=(select STOCK from v_stock_estinsa where MES=MONTH(@fecha) and ANO=YEAR(@fecha) and CODIGO=@codigo )
end 


select ROUND(ISNULL(@stock_dms,0),0) final_dms
