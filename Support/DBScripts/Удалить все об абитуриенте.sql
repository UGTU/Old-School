select * from [dbo].[ABIT_postup] where [NNrecord] in (select NNrecord from ABIT_Diapazon_spec_fac where NNyear = 2015)

delete from Doc_stud where nCode in (113307,113307,113295,113302,113302,113295,113303,113304,113304,113306)
delete from PersonAddress where nCode in (113307,113307,113295,113302,113302,113295,113303,113304,113304,113306)
delete from Export_FB_journal where nCode in (113307,113307,113295,113302,113302,113295,113303,113304,113304,113306)
delete from Lang_stud where nCode in (113307,113307,113295,113302,113302,113295,113303,113304,113304,113306)

delete from Person where nCode in (113307,113307,113295,113302,113302,113295,113303,113304,113304,113306)