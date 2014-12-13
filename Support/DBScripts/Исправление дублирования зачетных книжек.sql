declare @old_zach char(6)
declare @new_zach char(6)
declare @NNrecord int
declare @nCode int
declare @ik_zach int

DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR
	select person.nCode,zach.Nn_zach,  NNrecord, zach.ik_zach
	from person, zach, ABIT_postup
	where person.nCode = zach.nCode and person.nCode = ABIT_postup.nCode
	and ABIT_postup.ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2)
	and zach.Nn_zach in 
				(Select Nn_zach --,count(distinct Zach.nCode)-- Clastname, Cfirstname, Cotch, Spec_stud.Cname_spec, Fac.Cname_fac, группа и форма
				from ABIT_postup 
				inner join ABIT_Diapazon_spec_fac on ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
				inner join Relation_spec_fac on  ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
				inner join Person  on Person.nCode = ABIT_postup.nCode
				inner join ABIT_sost_zach on ABIT_sost_zach.ik_zach = ABIT_postup.ik_zach
				inner join Kat_zach on Kat_zach.Ik_kat_zach = ABIT_postup.ik_kat_zach
				inner join Zach on Zach.nCode = Person.nCode
				where Ik_fac not in (15,17,21,23)	--не колледжи и не филиалы
					and NNyear = year(GETDATE())						--За текущий год
					and ABIT_sost_zach.ik_type_zach = 2	--зачисленные
				group by Nn_zach
				having count(distinct Zach.nCode)>1)
	order by zach.Nn_zach
open Cursor1
FETCH NEXT FROM Cursor1 INTO @nCode,@old_zach,@NNrecord, @ik_zach
WHILE @@FETCH_STATUS = 0
BEGIN 
  if (select count(nCode) from Zach where Nn_zach = @old_zach and nCode<>@nCode)>0
  begin
	set @new_zach = (select [dbo].[GetNextZachNumForNabor](@NNrecord))
	if (@new_zach is not null)and((select count(nCode) from Zach where Nn_zach = @new_zach)=0)
	  update Zach set Nn_zach = @new_zach where Ik_zach = @ik_zach
  end
FETCH NEXT FROM Cursor1 INTO @nCode,@old_zach,@NNrecord, @ik_zach
END    
CLOSE Cursor1
DEALLOCATE Cursor1