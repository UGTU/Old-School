select distinct Person.Clastname, Person.Cfirstname, Person.Cotch, cast(Person.Dd_birth as date)
from Person, ABIT_postup, ABIT_Diapazon_spec_fac
where Person.nCode = ABIT_postup.nCode
and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
and NNyear = 2014
and Person.nCode not in (select nCode from ABIT_postup where ik_zach in (6))
