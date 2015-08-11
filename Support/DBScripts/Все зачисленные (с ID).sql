select distinct 
	   Cshort_name_fac,
	   Cname_spec,
	   cName_direction,
       '',
	   43,
	   Clastname,
	   Cfirstname,
	   Cotch,
	   iif(lSex = 0,'Ж','М') lSex,
	   docs.cvid_doc,
	   cast(Cd_seria as varchar(10)) Cd_seria,
	   cast(Np_number as varchar(20)) Np_number,
	   FORMAT(cast(Dd_vidan as DATE), 'd', 'de-de' ) Dd_vidan, 
	   Cd_kem_vidan,
	   Dd_birth,
	   Cplacebirth,
	   c_grazd,
	   cast(ctelefon as varchar(20)) dom_ctelefon,
	   iif(tel_i=1,substring(cSotTel,1,11),iif(substring(cSotTel,tel_i-1,1)='+', substring(cSotTel,tel_i-1,12),substring(cSotTel,tel_i,11))) SotTel,
	   cEmail,
	   Cname_form_ed
from
(
	select distinct cast(dd_pod_zayav as Date) dd_pod_zayav,
		   ltrim(rtrim(Clastname)) Clastname, 
		   ltrim(rtrim(Cfirstname)) Cfirstname, 
		   ltrim(rtrim(Cotch)) Cotch,
		   lSex, 
		   FORMAT(cast(Dd_birth as DATE), 'd', 'de-de' ) Dd_birth, 
		   Cplacebirth, 
		   ctelefon, 
		   REPLACE(REPLACE(REPLACE(REPLACE(cSotTel,' ',''),'-',''),'(',''),')','') cSotTel,
		   cSotTel SotTel,
		   PATINDEX('%[0-9]%',cSotTel) tel_i,
		   cEmail,
		   Fac.Cshort_name_fac,
		   Spec_stud.Cname_spec,
		   Direction.cName_direction,
		   Person.nCode,
		   Person.Ik_grazd,
		   Strana.Cstrana c_grazd,
		   Strana.ik_type_grazd resident,
		   NNyear,
		   Cname_form_ed,
		   CType_kat
	from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
		 Strana,Form_ed,Kat_zach,TypeKatZach,Direction
	where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and Person.Ik_grazd = Strana.Ik_strana
	and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and Spec_stud.ik_direction = Direction.ik_direction
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
	and Relation_spec_fac.Ik_form_ed = 1									--очники
	and TypeKatZach.ik_type_kat in (1,2,12)									--не контракт
	and Relation_spec_fac.ik_fac <> 31										--не колледжи
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())
) stud
left join (select Doc_stud.*,documents.cvid_doc from Doc_stud, documents where documents.Ik_vid_doc = Doc_stud.Ik_vid_doc and IsIdentity = 1) docs
on stud.nCode = docs.nCode
order by  Clastname,Cfirstname,Cotch

------------------------------------------------------------------------------------------------------------------------------------------------------
select ABIT_postup.NN_abit
	from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,dbo.Student,Relation_spec_fac,Spec_stud,Fac,
		 Strana,Form_ed,Kat_zach,TypeKatZach,Direction
	where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
	and Person.Ik_grazd = Strana.Ik_strana
	and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed
	and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	and Spec_stud.ik_direction = Direction.ik_direction
	and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --зачисленные
	and Relation_spec_fac.Ik_form_ed = 1									--очники
	and TypeKatZach.ik_type_kat in (1,2,12)									--не контракт
	and Relation_spec_fac.ik_fac <> 31										--не колледжи
	and dbo.Student.nCode = ABIT_postup.nCode
	and NNyear=year(GETDATE())

Номера (ABIT_postup.NN_abit) всех зачисленных до 07.08.2015

select NN_abit, nCode
from ABIT_postup where NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac where NNyear = 2015)

update ABIT_postup set ABIT_postup.[dd_zachisl] = '2015-06-08'

declare @NN_abit int
declare cur1 cursor for
Select NN_abit from ABIT_postup where NN_abit in
(43990
,44265
,44394
,44568
,44667
,44948
,45152
,45211
,45559
,45631
,45640
,45975
,46026
,46187
,46246
,46692
,46697
,46723
,46727
,46735
,46746
,46750
,46800
,47264
,47396
,47993
,48301
,50670
,43917
,43919
,43936
,43944
,44575
,44580
,44616
,44679
,44694
,44696
,44712
,44897
,44958
,44997
,45200
,45306
,45325
,45348
,45408
,45433
,45449
,45464
,45478
,45485
,45618
,45704
,45837
,45921
,45922
,46014
,46044
,46125
,46133
,46193
,46202
,46214
,46255
,46265
,46382
,46405
,46474
,46533
,46535
,46539
,46668
,46669
,46679
,46707
,46801
,46805
,46830
,46853
,46875
,46955
,46981
,46985
,46989
,46997
,46999
,47010
,47013
,47022
,47034
,47037
,47058
,47112
,47236
,47315
,47422
,47562
,47581
,47597
,47697
,47714
,47723
,47730
,47752
,47800
,47868
,47912
,47916
,47959
,48115
,48239
,48284
,48349
,48457
,48523
,48580
,48648
,48717
,49748
,49815
,49828
,49838
,50260
,50283
,50507
,50676
,44725
,45111
,46234
,46347
,46413
,46479
,47031
,47041
,47087
,47092
,48423
,48518
,48527
,50082
,50374
,50433
,50460
,50698
,50824
,50885
,43953
,43955
,44349
,45114
,45468
,46291
,46304
,46312
,46950
,47351
,47470
,48471
,48613
,48689
,50520
,50899
,43945
,44977
,45169
,45723
,46324
,46938
,46974
,46977
,47419
,47642
,47666
,47887
,47904
,47905
,47917
,47941
,47949
,47953
,48363
,48559
,48565
,48568
,50014
,50069
,50201
,50281
,50290
,50523
,50528
,50626
,50627
,50637
,43878
,43886
,43901
,45112
,46768
,47287
,47585
,47590
,48133
,48365
,48535
,49837
,49845
,50401
,50605
,50664
,50707
,50832
,50860
,50912
,50914
,50925
,45068
,45407
,45722
,46006
,46032
,46049
,46091
,46544
,46990
,46998
,47029
,47059
,47134
,47612
,47634
,47799
,47845
,47945
,48151
,48155
,48483
,48575
,48652
,48669
,49757
,50127
,50144
,50377
,50461
,50462
,50600
,50890
,46037
,46581
,46851
,46862
,46874
,47626
,47818
,47939
,48016
,48036
,48196
,48571
,49817
,49933
,50054
,50214
,50223
,50571
,50814
,50845
,50921
,50931
,44537
,44734
,44738
,44843
,44916
,45044
,45113
,45236
,45318
,45558
,45729
,46105
,46286
,46321
,46338
,46359
,46593
,46604
,46616
,46618
,46620
,46621
,46675
,46730
,46736
,46797
,46812
,46818
,46928
,46984
,47283
,47320
,47347
,47357
,47803
,47862
,47907
,47973
,48045
,48123
,48222
,48249
,48517
,48691
,49751
,49846
,50018
,50070
,50215
,50230
,50455
,50573
,50722
,50851
,44371
,44437
,44590
,44670
,44949
,45239
,45261
,45320
,45337
,45399
,45515
,45849
,45977
,45986
,46355
,46608
,46689
,46988
,46994
,47187
,47299
,47327
,47501
,47893
,48163
,48310
,48375
,48376
,49823
,49841
,50308
,50317
,44124
,44923
,46781
,46832
,47983
,48683
,50353
,50366
,50406
,50684
,50757
,43910
,45809
,47021
,47607
,47751
,47932
,47958
,47988
,47999
,48008
,48391
,50438
,50586
,50597
,50894
,44436
,45584
,45657
,46040
,46173
,46870
,47003
,47241
,47592
,47596
,47914
,48253
,48619
,48692
,50234
,50500
,50530
,50719
,50862
,50865
,44025
,45004
,45474
,46153
,46318
,46690
,46915
,47030
,47150
,47172
,47474
,48429
,48469
,48477
,48627
,49743)
open cur1
fetch next from cur1 into @NN_abit
while @@Fetch_Status = 0
begin
  update ABIT_postup set ABIT_postup.[dd_zachisl] = '2015-04-08' where NN_abit = @NN_abit
  FETCH NEXT FROM cur1 INTO @NN_abit
END     
CLOSE cur1
DEALLOCATE cur1

select * from ABIT_postup where dd_zachisl is not null

update ABIT_postup set ABIT_postup.[dd_zachisl] = '2015-07-08'
where [ik_zach] = 6
and ABIT_postup.[dd_zachisl] is null
and NNrecord in (select NNrecord from ABIT_Diapazon_spec_fac where NNyear = 2015)