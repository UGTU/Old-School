ALTER TABLE [dbo].[AkademNeuspev]
ALTER COLUMN [NamePric] varchar(Max) NOT NULL


ALTER TABLE [dbo].[Document]
ADD CONSTRAINT FK_DocumentReason FOREIGN KEY(Ik_reason_issuing) REFERENCES [dbo].[ReasonIssuing](Ik_reason_issuing)

UPDATE  [dbo].[sv_disc]  SET ik_disc=1737 and   WHERE NameSubject='сд'; 


Select *
from grup inner join Uch_pl
on grup.Ik_uch_plan=Uch_pl.ik_uch_plan
inner join sv_disc
on Uch_pl.ik_uch_plan=sv_disc.ik_uch_plan 
inner join discpln
on sv_disc.ik_disc=discpln.iK_disc
inner join Content_UchPl
on sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
 where sv_disc.ik_disc=1737 and Cname_grup='хбр-12Г (А)'
 order by  discpln.cName_disc