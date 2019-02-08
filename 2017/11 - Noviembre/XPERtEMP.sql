	
	
	SELECT *,
	TemMul/TotGro AS TemAvg,
	ApiMul/TotGro AS ApiAvg,
	
	CASE WHEN TotBase>0 THEN BaseTemMul/TotBase ELSE 0 END BaseTemAvg,
	
	CASE WHEN TotBase>0 THEN BaseApiMul/TotBase ELSE 0 END BaseApiAvg,
	
	CASE WHEN totblen>0 THEN BlenTemMul/TotBlen ELSE 0 END BlenTemAvg,
	
	CASE WHEN totblen>0 THEN BlenApiMul/TotBlen ELSE 0 END BlenApiAvg
	
	
	
	
	
	
	
	
	
	
	
	FROM (
	
	
	SELECT T.iProCod, P.prodes, T.sUA, 
		SUM(T.iGroVol) AS TotGro, 
		SUM(cast(sTemAvg AS real)*iGroVol) AS TemMul, 
		SUM(T.fApi*iGroVol) AS ApiMul,
		SUM(T.iBaseVol) AS TotBase,
		SUM(fBaseTem*iBaseVol) AS BaseTemMul,
		SUM(fBaseApi*iBaseVol) AS BaseApiMul,
		SUM(T.iBlenVol) AS TotBlen,
		SUM(fBlenTem*iBlenVol) AS BlenTemMul,
		SUM(fBlenApi*iBlenVol) AS BlenApiMul
   
   FROM tBatch T INNER JOIN TProducts P ON T.iProCod = P.procod 
   WHERE T.pernum=1990
   GROUP BY T.iProCod, P.prodes, T.sUA
   HAVING (((SUM(T.iGroVol))>0)) ) AS S
   ORDER BY S.prodes, S.sUA