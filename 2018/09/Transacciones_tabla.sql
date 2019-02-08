SELECT [Transaction Name],
DATEADD(MINUTE,CAST(SUBSTRING([Begin Time],15,2) AS INTEGER) ,
DATEADD(HOUR,CAST(SUBSTRING([Begin Time],12,2) AS INTEGER),
DATEADD(DAY, CAST(SUBSTRING([Begin Time],9,2) AS INTEGER)-1,
DATEADD(MONTH,CAST(SUBSTRING([Begin Time],6,2) AS INTEGER)-1,
DATEADD (YEAR,cast(SUBSTRING([Begin Time],1,4) as integer)-2001,'1/1/1')))))

FROM transacciones_zeuss
where [Begin Time] is not null