USE [ControlGas]
GO

/****** Object:  Index [ix_PosTransactionMethodOfPayment_t]    Script Date: 12/06/2018 10:20:28 ******/
CREATE NONCLUSTERED INDEX [ix_PosTransactionMethodOfPayment_t] ON [dbo].[PosTransactionMethodOfPayment] 
(
	[TransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


