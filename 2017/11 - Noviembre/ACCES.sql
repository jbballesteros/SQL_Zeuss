SHAPE {SELECT tTran.pernum, tTran.sUA, TDevices.devdes, 
TDevicesProducts.devproComNum, TProducts.prodes, 
Min(Val(Choose([devprocomNum],[iContP1Ini],
[iContP2Ini],[iContP3Ini],[iContP4Ini],
[iContP5Ini],[iContP6Ini]))) AS GIni, 
Max(Val(Choose([devprocomNum],
[iContP1Fin],[iContP2Fin],
[iContP3Fin],[iContP4Fin],
[iContP5fin],[iContP6Fin]))) AS GFin, 
Sum(Choose([devprocomNum],[iContP1Fin]-
[iContP1Ini],[iContP2Fin]-[iContP2Ini],
[iContP3Fin]-[iContP3Ini],[iContP4Fin]-[iContP4Ini],
[iContP5Fin]-[iContP5Ini],[iContP6Fin]-[iContP6Ini])) AS GVol, 
[GFin]-[GIni] AS GDif, IIf(([GDif]-[GVol])=0,'','<== WARNING ==>') AS Wrn
 FROM TDevices 
 INNER JOIN ((tTran RIGHT JOIN TDevicesProducts 
 ON tTran.sUA = TDevicesProducts.devprodevcod) 
 INNER JOIN TProducts ON TDevicesProducts.devproprocod = TProducts.procod) 
 ON TDevices.devcod = TDevicesProducts.devprodevcod
  Where (((Choose([devprocomNum], [iContP1Fin] - [iContP1Ini], 
  [iContP2Fin] - [iContP2Ini], [iContP3Fin] - [iContP3Ini], 
  [iContP4Fin] - [iContP4Ini], [iContP5Fin] - [iContP5Ini],
   [iContP6Fin] - [iContP6Ini])) > 0))
    GROUP BY tTran.pernum, tTran.sUA, TDevices.devdes, 
    TDevicesProducts.devproComNum, TProducts.prodes
     HAVING (((tTran.pernum) Between 1 AND 2 }  AS MetDet 
     APPEND ({SELECT tTran.pernum, tTran.sUA, tTran.iTran,
      TDevicesProducts.devproComNum, TDevicesProducts.devproprocod,
       tTran.iNumDoc, TSuppliers.supnam, tTran.dDateIni, tTran.dTimeIni, 
       tTran.dTimeFin, tTran.iCamion, tTran.sPlacas, 
       Val(Choose([devprocomNum],[iContP1Ini],[iContP2Ini],
       [iContP3Ini],[iContP4Ini],[iContP5Ini],[iContP6Ini])) 
       AS Ini, 
       Val(Choose([devprocomNum],[iContP1Fin],[iContP2Fin],
       [iContP3Fin],[iContP4Fin],[iContP5Fin],[iContP6Fin])) AS Fin,
        Val(Choose([devprocomNum],[iContP1Fin]-[iContP1Ini],[iContP2Fin]-
        [iContP2Ini],[iContP3Fin]-[iContP3Ini],[iContP4Fin]-[iContP4Ini],
        [iContP5Fin]-[iContP5Ini],[iContP6Fin]-[iContP6Ini])) AS Vol
         FROM (tTran LEFT JOIN TDevicesProducts ON tTran.sUA = 
         TDevicesProducts.devprodevcod) LEFT JOIN TSuppliers ON
          tTran.iProveed = TSuppliers.supcod
           WHERE (((tTran.pernum) Between 1 AND 2) AND
            ((Val(Choose([devprocomNum],[iContP1Fin]-[iContP1Ini],
            [iContP2Fin]-[iContP2Ini],[iContP3Fin]-[iContP3Ini],
            [iContP4Fin]-[iContP4Ini],[iContP5Fin]-[iContP5Ini],
            [iContP6Fin]-[iContP6Ini])))>0))
             ORDER BY tTran.pernum, tTran.sUA, 
             tTran.iTran, 
             Val(Choose([devprocomNum],[iContP1Ini],[iContP2Ini],
             [iContP3Ini],[iContP4Ini],[iContP5Ini],[iContP6Ini]));
             }  AS MDdet RELATE 'pernum' TO 'pernum','sUA' 
             TO 'sUA','devproComNum' TO 'devproComNum') AS MDdet