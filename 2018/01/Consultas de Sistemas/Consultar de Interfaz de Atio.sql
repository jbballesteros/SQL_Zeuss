select CodigoEstacion,MAX(FechaHora) 
from DescargaTransacciones
group by CodigoEstacion