SELECT *
FROM v_cubo_terceros T 
LEFT JOIN dwzeuss.dbo.DimDsr_Cli_Hoy V ON (T.vendedor=V.nit)
WHERE V.nit IS NULL