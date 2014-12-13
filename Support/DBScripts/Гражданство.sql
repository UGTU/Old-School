Select distinct Cshort_name_fac, Cname_spec, Cname_grup,CType_kat,Cname_form_ed,c_grazd,Clastname +' '+Cfirstname +' '+ Cotch,cast(Dd_birth as DATE)
from dbo.Person,dbo.Zach, dbo.StudGrup,dbo.Grup,dbo.Relation_spec_fac,dbo.Spec_stud,dbo.Fac,grazd,
Kat_zach,TypeKatZach,Form_ed
where dbo.Zach.nCode = dbo.Person.nCode
and dbo.StudGrup.Ik_zach = dbo.Zach.Ik_zach
and dbo.Grup.Ik_grup = dbo.StudGrup.Ik_grup
and StudGrup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
and dbo.Relation_spec_fac.Ik_form_ed= Form_ed.Ik_form_ed
and Person.Ik_grazd = grazd.ik_grazd
and dbo.Relation_spec_fac.ik_fac = dbo.Fac.Ik_fac
and dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec
and grazd.ik_grazd<>2
and ((dbo.StudGrup.Ik_prikazOtch is null)or(dbo.StudGrup.ik_pricOtch=3))
and dbo.Grup.DateExit > '2011-01-09' 
order by Cshort_name_fac