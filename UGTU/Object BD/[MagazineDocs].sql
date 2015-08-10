USE [UGTU_ACTTEST]
GO

/****** Object:  View [dbo].[MagazineDocs]    Script Date: 01.08.2015 9:47:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- select * from [MagazineDocs]
ALTER view [dbo].[MagazineDocs]

AS
select doc.DatePod, doc.DateCreate,doc.Ik_Document,doc.NumberDoc,sifd.Ik_studGrup,sifd.nCode, sifd.FIO, sifd.Ik_grup, Cname_grup,Ik_form_ed,Cname_form_ed, Ik_fac, Cname_fac,ik_spec,Cname_spec,
d.Ik_destination,d.cShortNameDestination[cNameDestination],ik_direction, sifd.cName_direction, tm.cNameTransfer, _callspr.DateStartPeriod[DateStartCallSpr], _callspr .DateEndPeriod[DateEndCallSpr],
tm.Ik_Transfer, DateReady,Num_podrazd,PersName,discpln.cName_disc,(DATEDIFF(day,_callspr.DateStartPeriod,_callspr.DateEndPeriod)+1) as Kol_day, --vid_zaniat.cName_vid_zanyat --,t_disc.cName_type_disc,t_disc.ik_type_disc
aav.Cstrana, (aav.Cregion+ ', ã. '+ aav.Cgorod+', '+aav.cshort_type_street+' '+
			 aav.CStreet+' '+addr.BuildingNumber+'-'+addr.FlatNumber) as addr,Pricina.Cname_pric,AddressType.AddressTypeName,
			 n_sem
  from 
Document doc left join TransferMethod tm  on doc.Ik_Transfer=tm.Ik_Transfer
left join Destination d on  doc.Ik_destination=d.Ik_destination
left join StudGrup stg on  doc.Ik_studGrup=stg.Ik_studGrup 
left join StudInfoForDocs sifd on  stg.Ik_studGrup=sifd.Ik_studGrup 
left join Zach zach on stg.Ik_zach=zach.Ik_zach 
left join Person pers on zach.nCode=pers.nCode 
left join CallSpr _callspr on doc.Ik_Document=_callspr.Ik_Document
left join Content_UchPl _cup on _callspr.Ik_upContent= _cup.ik_upContent
left join sv_disc on _cup.ik_disc_uch_plan= sv_disc.ik_disc_uch_plan
left join discpln on sv_disc.ik_disc=discpln.iK_disc
left join vid_zaniat on _cup.ik_vid_zanyat=vid_zaniat.iK_vid_zanyat
left join Addressee_Doc  addr_doc on doc.Ik_Document=addr_doc.Ik_Document
left join PersonAddress paddr on addr_doc.ik_personAddress=paddr.ik_personAddress
	left join Address addr on paddr.ik_address=addr.ik_address
			left join AllAddrView aav on addr.Ik_street=aav.Ik_street
				left join ReasonIssuing
					on doc.Ik_reason_issuing=ReasonIssuing.Ik_reason_issuing
							left join Pricina
											on ReasonIssuing.ik_pric=Pricina.Ik_pric
											left join AddressType
												on paddr.ik_AddressType=AddressType.ik_AddressType
--left join Type_disc t_disc on discpln.ik_type_disc=t_disc.ik_type_disc




--left join DocumentBase DocB on
--doc.Ik_Document=DocB.Ik_Document_base
--left join DocumentBase DocB2 on
--doc.Ik_Document=DocB2.Ik_Document_base
--left join Visa_Destination VD on 
--VD.Ik_destination=d.Ik_destination
--left join [Import].Post IP on 
--IP.idPost=VD.numberPost
--Left join Base_Destination BD on
--BD.Ik_destination1=d.cShortNameDestination
--Left join Base_Destination BD2 on
--BD2.Ik_destination2=d.cShortNameDestination










GO


