SELECT DI.fecha Fecha,MP.descripcion Propiedad,
 MM.descripcion + ' - ' + CAST(DI.porcentaje*100 as varchar) + '% - ' + R.descripcion + ' - ' ,DI.valor
FROM documentos_info_medida DI 
INNER JOIN referencias R ON (DI.id_producto=R.codigo)
INNER JOIN medidas_propiedades MP ON (DI.id_propiedad=MP.id_propiedad)
INNER JOIN medidas_metodos MM ON (MM.id_metodo=MP.id_metodo)
WHERE activo=1


