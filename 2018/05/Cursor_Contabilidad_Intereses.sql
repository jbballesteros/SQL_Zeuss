DECLARE @TSQL AS VARCHAR(100)
DECLARE @RST AS INTEGER
DECLARE @TIPO AS VARCHAR(4)
DECLARE @NUMERO AS INTEGER
DECLARE @FECHA AS DATE
DECLARE @VALOR AS MONEY
DECLARE @SEQ AS INTEGER
DECLARE @CENTRO AS INTEGER
DECLARE @NIT AS DECIMAL(18,0)

DECLARE INT_MOV_TEMP CURSOR  
FOR
SELECT DL.tipo,DL.numero,DL.valor_unitario,B.centro,DL.nit,DL.fec
FROM documentos_lin DL LEFT JOIN movimiento M ON (DL.tipo=M.tipo AND DL.numero=M.numero AND M.cuenta='421005')
INNER JOIN bodegas B ON (DL.bodega=B.bodega)
WHERE codigo='900309' AND M.tipo IS NULL
OPEN INT_MOV_TEMP


FETCH NEXT FROM INT_MOV_TEMP INTO @TIPO,@NUMERO,@VALOR,@CENTRO,@NIT,@FECHA


WHILE @@FETCH_STATUS = 0  
		BEGIN 	 
			SELECT @SEQ=MAX(seq)
			FROM movimiento
			WHERE tipo=@TIPO AND numero=@NUMERO AND seq<1000000



			INSERT INTO movimiento 
			(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
			VALUES (@TIPO,@NUMERO,@SEQ+1,'13050501',0,@NIT,@FECHA,@VALOR,'Interes de Mora',@VALOR)

			INSERT INTO movimiento 
			(tipo,numero,seq,cuenta,centro,nit,fec,valor,explicacion,valor_niif)
			VALUES (@TIPO,@NUMERO,@SEQ+2,'421005',@CENTRO,@NIT,@FECHA,@VALOR*-1,'Interes de Mora',@VALOR*-1)
			
			
				 
			FETCH NEXT FROM INT_MOV_TEMP INTO @TIPO,@NUMERO,@VALOR,@CENTRO,@NIT,@FECHA
		END


		CLOSE INT_MOV_TEMP
		DEALLOCATE INT_MOV_TEMP
