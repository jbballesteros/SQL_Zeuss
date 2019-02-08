DECLARE @AÑO AS INTEGER=2017
DECLARE @MES AS INTEGER=9
DECLARE @CUENTA AS VARCHAR(20)='11100575'
DECLARE @VALOR AS MONEY= 920310


SELECT @VALOR=@VALOR-saldo_final
FROM extracto_enc
WHERE ano=@AÑO AND mes=@MES AND cuenta=@CUENTA


UPDATE extracto_enc
SET saldo_inicial=@VALOR
WHERE ano=@AÑO AND mes=@MES AND cuenta=@CUENTA


UPDATE CONCILIACION
SET saldo_inicial_ext=@VALOR
WHERE ano_concilia=@AÑO AND mes_concilia=@MES AND cuenta=@CUENTA


SELECT *
FROM extracto_enc
WHERE ano=@AÑO AND mes=@MES AND cuenta=@CUENTA


SELECT *
FROM CONCILIACION
WHERE ano_concilia=@AÑO AND mes_concilia=@MES AND cuenta=@CUENTA

