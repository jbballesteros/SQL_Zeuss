INSERT INTO movimiento (tipo,numero,seq,cuenta,centro,nit,fec,valor,base,documento,explicacion,concilio,concepto_mov,concilio_ano,Cuenta_Documento,valor_niif,secuencia_extracto,ano_concilia,mes_concilia,ID_CRUCE,TIPO_CRUCE)
SELECT        M.tipo, M.numero, V.SEQ+ROW_NUMBER() OVER (PARTITION BY M.TIPO,M.NUMERO ORDER BY M.SEQ ), '41750210', M.centro, M.nit, M.fec, 0, M.base, M.documento, M.explicacion, M.concilio, M.concepto_mov, M.concilio_ano, M.Cuenta_Documento, M.valor, M.secuencia_extracto, 
                         M.ano_concilia, M.mes_concilia, M.id_cruce, M.tipo_cruce
FROM            movimiento AS M INNER JOIN
                         v_max_seq_movimiento AS V ON M.tipo = V.tipo AND M.numero = V.numero
WHERE        (YEAR(M.fec) = 2017) AND (M.cuenta = '530535')