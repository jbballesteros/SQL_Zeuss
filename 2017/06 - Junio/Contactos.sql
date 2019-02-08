SELECT T.nit,ISNULL(MAX(CM.contacto),0)+1,B.Nombre_compras,TELEFONO,Celular_compras,correo_compras

FROM bdClientes  B 
INNER JOIN terceros T ON (B.CODIGO=T.nit)
LEFT JOIN CRM_contactos CM ON (T.nit=CM.nit)
WHERE B.Nombre_compras IS NOT NULL AND Celular_compras IS NOT NULL AND correo_compras IS NOT NULL
GROUP BY T.nit,B.Nombre_compras,TELEFONO,Celular_compras,correo_compras


SELECT *
FROM CRM_contactos


INSERT INTO CRM_contactos (nit,contacto,nombre,tel_ofi1,tel_celular,e_mail,cargo)
SELECT T.nit,ISNULL(MAX(CM.contacto),0)+1 contacto,B.nombre_cartera,
CONVERT(VARCHAR(20),CAST(TELEFONO AS DECIMAL(28,0)),128),
CONVERT(VARCHAR(20),CAST(celular_cartera AS DECIMAL(28,0)),128),correo_cartera,'CARTERA'

FROM bdClientes  B 
INNER JOIN terceros T ON (B.CODIGO=T.nit)
LEFT JOIN CRM_contactos CM ON (T.nit=CM.nit)
WHERE B.nombre_cartera IS NOT NULL AND celular_cartera IS NOT NULL AND correo_cartera IS NOT NULL
GROUP BY T.nit,B.nombre_cartera,TELEFONO,celular_cartera,correo_cartera



DELETE
FROM CRM_contactos
WHERE cargo='COMPRAS'