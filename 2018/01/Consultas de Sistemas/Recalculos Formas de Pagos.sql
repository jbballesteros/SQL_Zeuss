use estinsa

DECLARE @MES AS INTEGER=11
DECLARE @AÑO AS INTEGER=2017


exec sp_movimiento_eds_recalculo @MES,@AÑO,1
exec sp_movimiento_eds_recalculo @MES,@AÑO,2
exec sp_movimiento_eds_recalculo @MES,@AÑO,3
exec sp_movimiento_eds_recalculo @MES,@AÑO,4
exec sp_movimiento_eds_recalculo @MES,@AÑO,5
exec sp_movimiento_eds_recalculo @MES,@AÑO,6
exec sp_movimiento_eds_recalculo @MES,@AÑO,7
exec sp_movimiento_eds_recalculo @MES,@AÑO,8
exec sp_movimiento_eds_recalculo @MES,@AÑO,9
exec sp_movimiento_eds_recalculo @MES,@AÑO,11