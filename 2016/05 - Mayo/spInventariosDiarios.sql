ALTER PROCEDURE spInventariosDiarios
	@A�O AS INTEGER=NULL,
	@MES AS INTEGER=NULL
AS
BEGIN
	DELETE    FROM inventarios_Diarios  WHERE A�O=@A�O and MES=@MES
	
	INSERT INTO inventarios_diarios
	
	SELECT YEAR(YM.fecha) A�O,MONTH(YM.fecha) MES,DAY(YM.fecha) DIA,YM.BODEGA,
	ISNULL(P.IACPM,0) IACPM,
	ISNULL(P.CACPM,0) CACPM,
	ISNULL(P.VACPM,0) VACPM,
	ISNULL(P.ICORRIENTE,0) ICORRIENTE,
	ISNULL(P.CCORRIENTE,0) CCORRIENTE,
	ISNULL(P.VCORRIENTE,0) VCORRIENTE,
	ISNULL(P.IEXTRA,0) IEXTRA,
	ISNULL(P.CEXTRA,0) CEXTRA,
	ISNULL(P.VEXTRA,0) VEXTRA,
	ISNULL(P.IB100,0) IB100,
	ISNULL(P.CB100,0) CB100,
	ISNULL(P.VB100,0) VB100,
	ISNULL(P.IALCOHOL,0) IALCOHOL,
	ISNULL(P.CALCOHOL,0) CALCOHOL,
	ISNULL(P.VALCOHOL,0) VALCOHOL

	FROM y_calendario_bodegas YM LEFT JOIN (



	SELECT DL.fec,DL.bodega ,
	MAX(CASE WHEN R.subgrupo2 IN (8) THEN RS.can_ini ELSE 0 END) IACPM,
	SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD*-1 ELSE 0 END) CACPM,
	SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (8) THEN DL.CANTIDAD*-1 ELSE 0 END) VACPM,
	MAX(CASE WHEN R.subgrupo2 IN (5) THEN RS.can_ini ELSE 0 END) ICORRIENTE,
	SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD*-1 ELSE 0 END) CCORRIENTE,
	SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (5) THEN DL.CANTIDAD*-1 ELSE 0 END) VCORRIENTE,
	MAX(CASE WHEN R.subgrupo2 IN (7) THEN RS.can_ini ELSE 0 END) IEXTRA,
	SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD*-1 ELSE 0 END) CEXTRA,
	SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (7) THEN DL.CANTIDAD*-1 ELSE 0 END) VEXTRA,
	MAX(CASE WHEN R.subgrupo2 IN (9) THEN RS.can_ini ELSE 0 END) IB100,
	SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD*-1 ELSE 0 END) CB100,
	SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (9) THEN DL.CANTIDAD*-1 ELSE 0 END) VB100,
	MAX(CASE WHEN R.subgrupo2 IN (6) THEN RS.can_ini ELSE 0 END) IALCOHOL,
	SUM(CASE WHEN DL.sw IN (3) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD WHEN DL.sw IN (4) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD*-1 ELSE 0 END) CALCOHOL,
	SUM(CASE WHEN DL.sw IN (1) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD WHEN DL.sw IN (2) AND R.subgrupo2 IN (6) THEN DL.CANTIDAD*-1 ELSE 0 END) VALCOHOL
	FROM documentos_lin DL 
	INNER JOIN referencias R ON (DL.codigo=R.codigo AND R.subgrupo2 IN (5,6,7,8,9))
	INNER JOIN bodegas B ON B.bodega=DL.bodega
	INNER JOIN referencias_sto	RS ON (R.codigo=RS.codigo AND RS.ano=YEAR(DL.fec) AND RS.mes=MONTH(DL.fec) AND RS.bodega=DL.bodega)
	WHERE DL.sw IN (1,2,3,4) AND YEAR(DL.fec)=@A�O AND MONTH(DL.fec)=@MES
	GROUP BY DL.fec,DL.bodega) AS P ON (YM.fecha=P.fec AND YM.BODEGA=P.BODEGA)
	WHERE YEAR(YM.fecha)=@A�O AND  MONTH(YM.fecha)=@MES 
	ORDER BY YM.fecha,YM.BODEGA ASC
	
    DELETE    FROM inventarios_diarios_acum  WHERE A�O=@A�O and MES=@MES
	DECLARE @DIAS AS INTEGER=(SELECT MAX(DIA) FROM inventarios_diarios WHERE A�O=@A�O AND MES=@MES)
	DECLARE @CONT AS INTEGER=1

	WHILE @DIAS>=@CONT
	BEGIN
	    INSERT INTO inventarios_diarios_acum
		SELECT A�O, MES, @CONT, BODEGA,SUM( IACPM) IACPM, SUM( CACPM) CACPM, SUM( VACPM) VACPM,SUM( ICORRIENTE) ICORRIENTE, SUM( CCORRIENTE) CCORRIENTE, 
		SUM( VCORRIENTE) VCORRIENTE, SUM( IEXTRA) IEXTRA, SUM( CEXTRA) CEXTRA, SUM( VEXTRA) VEXTRA,SUM(  IB100) IB100, SUM(  CB100) CB100,SUM( VB100) VB100, SUM( IALCOHOL) IALCOHOL, 
		SUM( CALCOHOL) CALCOHOL, SUM( VALCOHOL) VALCOHOL
		FROM inventarios_diarios
		WHERE A�O=@A�O AND MES=@MES AND DIA<=@CONT
		GROUP BY A�O, MES, BODEGA


		SET @CONT=@CONT+1
	
    END
	
END
GO
