SELECT 
	TT.pernum, TT.sUA, T.devdes, 
	TD.devproComNum, TP.prodes, 
	MIN(CASE 
	WHEN devprocomNum=1 THEN iContP1Ini
	WHEN devprocomNum=2 THEN iContP2Ini
	WHEN devprocomNum=3 THEN iContP3Ini
	WHEN devprocomNum=4 THEN iContP4Ini
	WHEN devprocomNum=5 THEN iContP5Ini
	WHEN devprocomNum=6 THEN iContP6Ini
	END),
	MAX(CASE 
	WHEN devprocomNum=1 THEN iContP1Fin
	WHEN devprocomNum=2 THEN iContP2Fin
	WHEN devprocomNum=3 THEN iContP3Fin
	WHEN devprocomNum=4 THEN iContP4Fin
	WHEN devprocomNum=5 THEN iContP5Fin
	WHEN devprocomNum=6 THEN iContP6Fin
	END),
	SUM(
	CASE 
	WHEN devprocomNum=1 THEN iContP1Fin-iContP1Ini
	WHEN devprocomNum=2 THEN iContP2Fin-iContP2Ini
	WHEN devprocomNum=3 THEN iContP3Fin-iContP3Ini
	WHEN devprocomNum=4 THEN iContP4Fin-iContP4Ini
	WHEN devprocomNum=5 THEN iContP5Fin-iContP5Ini
	WHEN devprocomNum=6 THEN iContP6Fin-iContP6Ini
	END)
	FROM TDevices T
	INNER JOIN ((tTran TT
	RIGHT JOIN TDevicesProducts TD ON TT.sUA = TD.devprodevcod) 
	INNER JOIN TProducts TP ON TD.devproprocod = TP.procod) 
	ON T.devcod = TD.devprodevcod
	Where TT.PERNUM=1990
	GROUP BY TT.sUA, T.devdes,
	TD.devproComNum, TT.pernum, TP.prodes