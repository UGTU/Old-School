Create VIEW [dbo].[ReasonForDestination]
as
select Pricina.[Ik_pric],Pricina.[Cname_pric],Pricina.[ShortCname_pric],
[Ik_reason_issuing],Destination.Ik_destination,Destination.cNameDestination
 from  Destination  inner join ReasonIssuing
on Destination.Ik_destination = ReasonIssuing.ik_destinatoin
inner join Pricina on
ReasonIssuing.ik_pric=Pricina.Ik_pric 

Create VIEW [dbo].[VisaForDestination]
as
select * from  Destination  inner join Visa_Destination
on Destination.Ik_destination = Visa_Destination.Ik_destination
inner join Import.Post on
Visa_Destination.numberPost=Pricina.Ik_pric where ik_destinatoin=4