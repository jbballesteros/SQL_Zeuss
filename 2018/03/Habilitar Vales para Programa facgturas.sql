select sw,numero,despacho,anulado,nit
from documentos_ped
where numero=194049 

SELECT *
FROM documentos_lin_ped
where numero=193539

UPDATE documentos_ped
SET despacho=NULL
where numero=193633

INSERT INTO documentos_lin_ped ( sw, bodega, numero, codigo, seq, cantidad, cantidad_despachada, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, despacho_virtual, porc_dcto_2, porc_dcto_3, enlace
                         )
SELECT sw, bodega, numero, codigo, seq, cantidad, cantidad_despachada, valor_unitario, porcentaje_iva, porcentaje_descuento, und, cantidad_und, adicional, despacho_virtual, porc_dcto_2, porc_dcto_3, enlace 
                         
FROM documentos_lin_ped_historia
where numero=193633


SELECT *
FROM documentos_lin
WHERE numero_link=193539


UPDATE documentos_ped
SET vendedor=vendedor*-1
where numero=193821


select *
from control_facturas
where numero=193633
193633

DELETE FROM control_facturas
where numero=193633