

select distinct 
Cname_form_ed,
CType_kat,
--cvid_doc,
COUNT(DISTINCT stud.nCode) Col
from
(
	select distinct 
		   Direction.cName_direction,
		   ABIT_postup.nCode,
		   Cname_form_ed,
		   Person.Ngodokon,
		   TypeKatZach.CType_kat
	from ABIT_postup,ABIT_Diapazon_spec_fac,Relation_spec_fac,Spec_stud,Fac,
		 Form_ed,Kat_zach,TypeKatZach,Direction, dbo.Stud Person
	where ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and Spec_stud.ik_direction = Direction.ik_direction
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --�����������
	and Relation_spec_fac.ik_fac <> 31										--�� ��������
	--and direction.ik_direction	= 3											--��������
	and NNyear=year(GETDATE())
	and ABIT_postup.nCode=Person.nCode --and Person.Ngodokon=2015
) stud
inner join (select Doc_stud.*,documents.cvid_doc 
from Doc_stud, documents 
where documents.Ik_vid_doc = Doc_stud.Ik_vid_doc 
	and IsEducational=1 and Doc_stud.Ik_vid_doc=7) docs
on stud.nCode = docs.nCode
GROUP BY Cname_form_ed,CType_kat--, cvid_doc


--1. �����������,���������� ������� ����� ����������� (�����/�������)  2. �� ��� ���������� � 2015 ���� (�����/�������) 3. ���������� ������� ���������������� ����������� �� ���������� ����������������� ������� (�����/�������) 4. �� ��� � 2015 ���� (�����/�������) 5. ������� ���������������� ����������� �� ���������� ���������� �������� ����� (�����/�������) 6. �� ��� � 2015 ����  (�����/�������)
