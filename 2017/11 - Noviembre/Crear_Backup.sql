BACKUP DATABASE zeuss
TO DISK = 'E:\BKParaMontar.bak'
WITH NAME =  'E:\BKParaMontar.bak'


RESTORE DATABASE [zeusspruebas] 
FROM  DISK = N'E:\BKParaMontar.bak'
 WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 10
GO
