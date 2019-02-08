SELECT *
FROM (

SELECT  T.iBasePr AS CodePr, P.prodes, 
S.supnam, 'Base' AS Tipo,  Sum(T.iBaseVol) AS SumaDeVol, 
Sum(T.iBaseVolN) As SumaDeVolN
 FROM tBatch T
 INNER JOIN TSuppliers S ON T.iProveed = S.supcod
  INNER JOIN TProducts P ON T.iBasePr = P.procod
   WHERE T.pernum =1990 
   GROUP BY T.iBasePr, P.prodes, S.supnam
    HAVING T.iBasePr>0
    
    UNION ALL
    
    SELECT  T.iBlenPr AS CodePr, P.prodes, 
S.supnam, 'Blender' AS Tipo, 
 Sum(T.iBlenVol) AS SumaDeVol,
  Sum(T.iBlenVolN) AS SumaDeVolN
   FROM tBatch T 
   INNER JOIN TSuppliers S ON T.iProveed = S.supcod
    INNER JOIN TProducts P ON T.iBlenPr = P.procod
     WHERE T.pernum=1990
      GROUP BY T.iBlenPr, P.prodes, S.supnam
       HAVING T.iBlenPr>0 
       
       UNION ALL
       
        SELECT  T.iAddiPr AS CodePr, P.prodes, 
 S.supnam, 'Additive' AS Tipo,
  Sum(T.fAddiVol) AS SumaDeVol, 
  Sum(T.fAddiVol) AS SumaDeVolN
  FROM tBatch T
  INNER JOIN TSuppliers S ON T.iProveed = S.supcod
  INNER JOIN TProducts P  ON T.iAddiPr = P.procod
   WHERE T.pernum=1990
    GROUP BY T.iAddiPr, P.prodes, S.supnam
     HAVING T.iAddiPr>0)AS CompTot
   
        