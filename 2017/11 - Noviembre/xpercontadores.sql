SELECT 
TT.sUA, TD.devdes, 
TT.PerNum, TT.ProTypDes, 
TT.ProNum, TP.prodes,

SUM(CASE WHEN sstaend='s' THEN iTotaliz ELSE 0 END) Ini,
SUM(CASE WHEN sstaend='e' THEN iTotaliz ELSE 0 END) Fin,
SUM(CASE WHEN sstaend='e' THEN iTotaliz ELSE iTotaliz*-1 END) Diff,
Max(CASE WHEN sstaend='s' THEN perdat ELSE 0 END) DatIni,
Max(CASE WHEN sstaend='s' THEN perHou ELSE 0 END) HouIni,
Max(CASE WHEN sstaend='s' THEN perdat ELSE 0 END) DatFin,
Max(CASE WHEN sstaend='s' THEN perHou ELSE 0 END) HouFin

 
    
     FROM tPeriodTotalizers TT
     INNER JOIN TDevices TD ON TT.[sUA]=TD.[devcod]
      INNER JOIN TProducts TP ON TT.[ProCod]=TP.[procod]
      GROUP BY TT.[sUA], TD.[devdes], TT.[PerNum],
       TT.[ProTypDes], TT.[ProNum], TP.[prodes]
        HAVING (TT.PerNum) Between 1990 AND 1990