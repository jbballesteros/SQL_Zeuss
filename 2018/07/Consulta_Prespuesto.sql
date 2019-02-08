select AÑO ano,CMES mes,TV.nit cod_ven,TV.nombres vendedor,T.nit,T.nombres,SUM(PRESUPUESTO) presupuesto
from (
SELECT     ISNULL(T_1.AÑO, S.ano) AS AÑO, ISNULL(T_1.CMES, S.mes) AS CMES, ISNULL(T_1.NIT, S.Nit) AS NIT, ISNULL(T_1.CANTIDAD, 0) AS CANTIDAD, ISNULL(S.PRESUPUESTO, 0)   
                                              AS PRESUPUESTO  
                       FROM          (SELECT     ano AS AÑO, mes AS CMES, nit AS NIT, SUM(can_ventas - can_devolu) AS CANTIDAD  
                                               FROM          dbo.Zeuss_Lin_Ventas AS ZL  
                                               WHERE      (subgrupo2 IN (2, 3, 4)) AND (ano = YEAR(CAST(GETDATE() AS DATE))) AND (mes <= MONTH(CAST(GETDATE() AS DATE)))  
                                               GROUP BY ano, mes, nit) AS T_1 FULL JOIN  
                                                  (SELECT     Nit, ano, mes, SUM(galones) AS PRESUPUESTO  
                                                    FROM          dbo.presupuesto AS P  
                                                    WHERE      (ano = YEAR(CAST(GETDATE() AS DATE)))  AND codigo<>1  
                                                    GROUP BY Nit, ano, mes) AS S ON T_1.NIT = S.Nit AND T_1.AÑO = S.ano AND T_1.CMES = S.mes) as p inner JOIN terceros_historico TH ON (p.NIT=TH.nit)
													INNER JOIN terceros T ON (TH.nit=T.nit)
													INNER JOIN terceros TV ON (T.vendedor=TV.nit)
WHERE AÑO=2018
											group by AÑO,CMES,TV.nit,TV.nombres,T.nit,T.nombres