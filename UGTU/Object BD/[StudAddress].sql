Alter VIEW [dbo].[StudAddress]
AS
Select at.[ik_AddressType],[AddressTypeName],[ik_personAddress],[BuildingNumber],[StructNumber],
[CStreet],[cshort_type_street],[CType_Street],[Cgorod],[CIndex],[cshort_type_gorod],[ctype_gorod],[Craion],
[Cregion],[Cstrana],[bit_SNG],sg.Ik_studGrup,ad.FlatNumber

From StudGrup sg inner join Zach z
on sg.Ik_zach=z.Ik_zach
inner join Student s
on z.nCode=s.nCode
inner join Person p
on s.nCode=p.nCode
inner join PersonAddress pa
on p.nCode= pa.nCode
inner join AddressType at
on pa.ik_AddressType=at.ik_AddressType
inner join Address ad
on pa.ik_address=ad.ik_address
inner join Street st
on ad.Ik_street=st.Ik_street
inner join Gorod g
on st.ik_gorod = g.Ik_gorod
inner join Raion ra
on g.Ik_raion=ra.Ik_raion
inner join Region re
on ra.Ik_region=re.Ik_region
inner join Strana 
on re.Ik_strana=Strana.Ik_strana
inner join Type_street ts
on st.Ik_type_street=ts.Ik_type_street
inner join type_gorod tg
on g.ik_type_gorod=tg.ik_type_gorod
