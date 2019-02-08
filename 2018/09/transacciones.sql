SELECT [Current LSN],
  [Operation],
  [Transaction Name],
  [Transaction ID],
  [Transaction SID],
  [SPID],
  [Begin Time]
FROM fn_dblog(null,null)
where [Begin Time]>='09/12/2018'