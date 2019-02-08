begin try
SELECT nit,digito,
CASE 
WHEN tipo_identificacion='C' THEN 13
WHEN tipo_identificacion='N' THEN 31
WHEN tipo_identificacion='T' THEN 12
WHEN tipo_identificacion='E' THEN 44 ELSE 0 END ,

tipo_identificacion,nombres,dbo.cuenta_espacios(RTRIM(nombres))
FROM terceros T 
WHERE T.nit=T.nit_real AND nit>100000


end try

begin catch

SELECT 'ERROR'

end catch