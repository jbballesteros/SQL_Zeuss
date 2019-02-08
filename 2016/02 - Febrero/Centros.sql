SELECT *
FROM INFORMATION_SCHEMA.COLUMNS IC INNER JOIN INFORMATION_SCHEMA.TABLES IT ON (IC.TABLE_NAME=IT.TABLE_NAME)
WHERE COLUMN_NAME LIKE '%CENTRO%' AND IT.TABLE_TYPE='BASE TABLE'

SELECT *
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY IT.TABLE_NAME) SEQ,IT.TABLE_NAME,IC.COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS IC INNER JOIN INFORMATION_SCHEMA.TABLES IT ON (IC.TABLE_NAME=IT.TABLE_NAME)
WHERE COLUMN_NAME LIKE 'CEN%' AND IT.TABLE_TYPE='BASE TABLE') AS P
WHERE P.SEQ=@I


SELECT *
FROM bodegas

DECLARE @I AS INTEGER=1 
DECLARE @TABLA AS VARCHAR (150)
DECLARE @CAMPO AS VARCHAR(150)
WHILE  @I<=139
BEGIN
	SELECT @TABLA=TABLE_NAME ,@CAMPO=COLUMN_NAME
	FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY IT.TABLE_NAME) SEQ,IT.TABLE_NAME,IC.COLUMN_NAME
	FROM INFORMATION_SCHEMA.COLUMNS IC INNER JOIN INFORMATION_SCHEMA.TABLES IT ON (IC.TABLE_NAME=IT.TABLE_NAME)
	WHERE COLUMN_NAME LIKE 'CEN%' AND IT.TABLE_TYPE='BASE TABLE') AS P
	WHERE P.SEQ=@I
	DECLARE @CONSULTA AS VARCHAR(MAX)
	SET @CONSULTA= 'INSERT INTO CENTRO_TEMP_CANTIDAD SELECT ''' + @TABLA + ''',''' + @CAMPO + ''',' + 'COUNT(' + @CAMPO + ') FROM ' +  @TABLA + ' WHERE ' + @CAMPO + ' IS NOT NULL'
	EXEC (@CONSULTA)
	
	SET @I=@I+1
END

SELECT *
FROM centro_temp_CANTIDAD
WHERE CANTIDAD<>0


