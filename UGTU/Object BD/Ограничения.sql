ALTER TABLE [dbo].[AkademNeuspev]
ALTER COLUMN [NamePric] varchar(Max) NOT NULL


ALTER TABLE [dbo].[Document]
ADD CONSTRAINT FK_DocumentReason FOREIGN KEY(Ik_reason_issuing) REFERENCES [dbo].[ReasonIssuing](Ik_reason_issuing)
