select '(415)7709998009356(8020)' + TT.tipo_fe + REPLICATE('0',10-LEN(D.NUMERO))+CAST(D.numero AS VARCHAR)+'(8020)'+REPLICATE('0',12-LEN(T.nit_real))+CAST(T.nit_real AS VARCHAR)
from documentos D 
INNER  JOIN terceros T on (d.nit=t.nit)
INNER JOIN tipo_transacciones TT ON (D.tipo=TT.tipo AND D.sw=TT.sw)
where d.tipo='FM' AND numero=88326


