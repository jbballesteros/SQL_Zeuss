

UPDATE documentos
SET fecha='26/02/2015' ,vencimiento='10/04/2015'
WHERE tipo='FV' AND numero =118125


UPDATE movimiento
SET fec='31/12/2014'
WHERE tipo='RC' AND numero BETWEEN @NUMEROUNO AND @NUMERODOS


UPDATE documentos_lin
SET fec=''
WHERE tipo='FV'

UPDATE documentos_che
SET fecha='31/12/2014'
WHERE tipo='RC' AND numero BETWEEN @NUMEROUNO AND @NUMERODOS

