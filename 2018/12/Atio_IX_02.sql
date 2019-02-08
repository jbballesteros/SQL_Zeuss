USE [ControlGas]
GO

/****** Object:  Index [ix_PosTransaction_et]    Script Date: 12/06/2018 10:22:43 ******/
CREATE NONCLUSTERED INDEX [ix_PosTransaction_et] ON [dbo].[PosTransaction] 
(
	[ExportRetailId] ASC,
	[Total] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


