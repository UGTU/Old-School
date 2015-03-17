--SELECT * FROM [dbo].[ABIT_GetSpecList](2012,156)
--Возвращает список специальностей, по которым в заданном году еще не созданы наборы 
--соответственно используется для создания/редактирования наборов
ALTER    FUNCTION [dbo].[ABIT_GetSpecList](@nnyear int, @ik_spec_fac int = NULL)
RETURNS  TABLE

AS

RETURN (
select spf.ik_fac, spf.ik_spec, spf.ik_spec_fac, isnull(sp.Sh_spec,'')+ ' ' +
	FormEduc.ShortNameFormEduc+RTRIM(Cname_spec) +ISNULL(' ('+Direction.cName_direction+')',' ') Cname_spec, Cname_fac, 
	Cshort_name_fac, Cshort_spec, Direction.ik_direction, Sortorder,FormEduc.Ik_form_ed from 
dbo.Relation_spec_fac spf
inner join GetSpecAbitPermissionsFromRelTable() as permissionSpecList
on spf.ik_spec_fac=permissionSpecList.ik_spec_fac
 inner join dbo.Spec_stud sp on
spf.ik_spec=sp.ik_spec
 inner join fac on
spf.ik_fac=fac.ik_fac left join dbo.Direction on sp.ik_direction=Direction.ik_direction
 inner join [dbo].[ABIT_GetFormEducInfo]() as FormEduc on
spf.Ik_form_ed=FormEduc.Ik_form_ed
WHERE (not spf.ik_spec_fac in (select spd.ik_spec_fac
		from dbo.ABIT_Diapazon_spec_fac spd where nnyear=@nnyear)
		or spf.ik_spec_fac=@ik_spec_fac)
	  and ((sp.spDateExit is null)or(year(sp.spDateExit)>@nnyear)) --грузим только современные специальности
)
GO


--расширим поле с названием документа
alter table documents alter column cvid_doc varchar(500) not null


select * from Doc_stud where Ik_vid_doc = 5