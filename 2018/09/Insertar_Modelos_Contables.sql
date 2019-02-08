
INSERT INTO tipo_transacciones_mod
SELECT TT.tipo, TM.modelo, TM.descripcion, TM.centro_fijo, TM.cta1, TM.cta2, TM.cta3, TM.cta4, TM.cta5, TM.cta6, TM.cta7, TM.cta8, TM.cta9, TM.cta10, TM.cta11, TM.cta12, TM.cta13, TM.cta14, TM.cta15, TM.cen1, TM.cen2, TM.cen3, 
                         TM.cen4, TM.cen5, TM.cen6, TM.cen7, TM.cen8, TM.cen9, TM.cen10, TM.cen11, TM.cen12, TM.cen13, TM.cen14, TM.cen15, TM.cta16, TM.cen16, TM.cta17, TM.cen17, TM.cta18, TM.cen18, TM.cta19, TM.cen19, TM.cta20, 
                         TM.cen20, TM.exportado, TM.no_usar_perfil, TM.cta21, TM.cen21, TM.maneja_anticipo, TM.inactivo
FROM tipo_transacciones_mod TM INNER JOIN tipo_transacciones TT ON (TM.tipo=TT.tipo_eq)

