----1. Esperar Instruccion de Cartera Para ejecutar
----2. Eliminar de la unidad E del servidor el backup anterior (BKParaMontar)
----3. Desconectar los usuarios de BDPruebas con la siguiente instruccion:

USE master
DECLARE curkillproc
CURSOR FOR
SELECT spid,dbs.name AS dbname
FROM master..sysprocesses pro, master..sysdatabases dbs
WHERE pro.dbid = dbs.dbid
AND dbs.name = 'estinsa'
FOR READ ONLY 
DECLARE @varspid AS integer
DECLARE @vardbname AS varchar(256)
DECLARE @numUsers AS integer
SET @numUsers = 0
OPEN curkillproc
FETCH NEXT FROM curkillproc
INTO @varspid, @vardbname
WHILE @@fetch_status = 0
BEGIN
EXEC('kill ' + @varspid)
SET @numUsers = @numUsers + 1
FETCH NEXT FROM curkillproc INTO @varspid, @vardbname
END
CLOSE curkillproc
DEALLOCATE curkillproc
SELECT @numUsers as NumUsersDisconnected 

----4 . Ejecutar la nueva instruccion para generar BK

BACKUP DATABASE zeuss
TO DISK = 'E:\BKParaMontar.bak'
WITH NAME =  'E:\BKParaMontar.bak'


RESTORE DATABASE [zeusspruebas] 
FROM  DISK = N'E:\BKParaMontar.bak'
 WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 10
GO



--- Nota: Cuando finalice correctamente, informar a cartera que puede continuar.



----5. Actualizamos la tablag para habilitar el mes anterior en Pruebas


UPDATE tablag
SET ano=2018 ,periodo=2


----6 . Hacemos el delete a la tabla documentos_acu del peridodo anterior  en pruebas

DELETE FROM documentos_acu
WHERE ANO=2018 AND MES=2


----7. Realizar en Pruebas el cierre del mes del periodo anterior, en el DMS.

----8. Hacemos delete a la tabla documentos_acu eliminando los registros del mes actual, en BD Pruebas


DELETE FROM documentos_acu
WHERE ANO=2018 AND MES=2 and fecha>='01/03/2018'

----9 . Hacemos el delete a la tabla documentos_acu del peridodo anterior  en REAL ZEUSS

DELETE FROM documentos_acu
WHERE ANO=2018 AND MES=2

----10. Insertamos la informacion de la de pruebas en la REAL ZEUSS

INSERT INTO DOCUMENTOS_ACU
SELECT *
FROM  zeusspruebas.dbo.documentos_acu
WHERE ANO=2018 AND MES=2


-----11. Le informamos a cartera que el proceso fue concluido para que validen.
