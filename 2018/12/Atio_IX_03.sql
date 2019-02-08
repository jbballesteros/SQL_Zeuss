USE [ControlGas]
GO

/****** Object:  Index [ix_Jobs_slcs]    Script Date: 12/06/2018 10:23:51 ******/
CREATE NONCLUSTERED INDEX [ix_Jobs_slcs] ON [dbo].[Jobs] 
(
	[State] ASC,
	[BilledDateTime] ASC,
	[LockDateTime] ASC,
	[CloseDateTime] ASC,
	[SaleFinishDateTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


