
INSERT INTO CRM_contactos
SELECT  T.nit,UPPER(ISNULL(FE.nombre,'') + ' ' + ISNULL(FE.Apellidos,'')),FE.celular,FE.email_710,'COMPRAS',GETDATE(),'FE: ACTUALIZADO DESDE PLATAFORMA DE MERCADEO'
FROM fe_correos_10092018 FE 
LEFT JOIN terceros TR ON (FE.NIT=TR.nit) 
LEFT JOIN terceros T ON (TR.nit=T.nit_real)
WHERE ISNUMERIC(FE.NIT)=1 and T.nit IS NOT  NULL AND FE.NIT<>'0'


