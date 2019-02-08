INSERT INTO tipo_transacciones_mod
SELECT  'FVT6', modelo, descripcion, centro_fijo, cta1, cta2, cta3, cta4, cta5, cta6, cta7, cta8, cta9, cta10, cta11, cta12, cta13, cta14, cta15, cen1, cen2, cen3, cen4, cen5, cen6, cen7, cen8, cen9, cen10, cen11, 
                      cen12, cen13, cen14, cen15, cta16, cen16, cta17, cen17, cta18, cen18, cta19, cen19, cta20, cen20, exportado, no_usar_perfil, cta21, cen21
FROM tipo_transacciones_mod
WHERE tipo='FVT5'

INSERT INTO tipo_transacciones_mod_nuevo
SELECT 'FVT6', modelo, perfil_contable, bodega, cta1, cen1, cta2, cen2, cta3, cen3, cta4, cen4, cta5, cen5, cta6, cen6, cta7, cen7, cta8, cen8, cta9, cen9, cta10, cen10, cta11, cen11, cta12, cen12, cta13, cen13, 
                      cta14, cen14, cta15, cen15, cta16, cen16, cta17, cen17, cta18, cen18, cta19, cen19, cta20, cen20, cta21, cen21, cta22, cen22, cta23, cen23, cta24, cen24, cta25, cen25
FROM tipo_transacciones_mod_nuevo
WHERE tipo='FVT5'