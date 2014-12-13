select Cstrana,Cregion,Craion,Cgorod,ABIT_entry.count_entry, ABIT_pass.count_pass
from dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana,
(

SELECT count(distinct ABIT_postup.nCode) as count_entry,Gorod.Ik_gorod  --с заявлениями
       FROM ABIT_postup,PersonAddress,Street,ABIT_Diapazon_spec_fac,Gorod,Address
       WHERE ik_zach <> 2
        AND ABIT_postup.nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=2013)
        AND ABIT_postup.nCode=PersonAddress.nCode
        AND ABIT_postup.NNrecord=ABIT_Diapazon_spec_fac.NNrecord
        AND PersonAddress.ik_address = Address.ik_address
        and dbo.Address.Ik_street=Street.Ik_street
        AND Street.Ik_gorod=Gorod.Ik_gorod
        and ik_AddressType = (select top 1 AddressType.ik_AddressType  from dbo.PersonAddress, AddressType
							  where  PersonAddress.ik_AddressType = AddressType.ik_AddressType
							  and nCode = ABIT_postup.nCode
							  order by IsFirst DESC, AddressType.ik_AddressType)
        AND ik_spec_fac in (select ik_spec_fac
                     from Relation_spec_fac
                     where ik_fac not in (23)) --не колледжи
       Group by Gorod.Ik_gorod
       ) ABIT_entry
 Left join (
SELECT count(distinct ABIT_postup.nCode) as count_pass,Gorod.Ik_gorod    --зачислено
       FROM ABIT_postup,PersonAddress,Street,ABIT_Diapazon_spec_fac,Gorod,Address
       WHERE ik_zach IN (SELECT ik_zach FROM dbo.ABIT_sost_zach WHERE ik_type_zach=2) 
        AND ABIT_postup.nnrecord IN (SELECT nnrecord FROM ABIT_Diapazon_spec_fac WHERE NNyear=2013)
        AND ABIT_postup.nCode=PersonAddress.nCode
        AND ABIT_postup.NNrecord=ABIT_Diapazon_spec_fac.NNrecord
        AND PersonAddress.ik_address = Address.ik_address
        and dbo.Address.Ik_street=Street.Ik_street
        and ik_AddressType = (select top 1 AddressType.ik_AddressType  from dbo.PersonAddress, AddressType
							  where  PersonAddress.ik_AddressType = AddressType.ik_AddressType
							  and nCode = ABIT_postup.nCode
							  order by IsFirst DESC, AddressType.ik_AddressType)
	/*	AND ((@isreal=2)or((Realy_postup=@isreal)and(ik_kat_zach not in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))or
			((Realy_postup!=@isreal)and(ik_kat_zach in (select Ik_kat_zach from Kat_zach where ik_type_kat=3)))) */
        AND Street.Ik_gorod=Gorod.Ik_gorod
        AND ik_spec_fac in (select ik_spec_fac
                     from Relation_spec_fac
                     where ik_fac not in (23)) --не колледжи
       Group by Gorod.Ik_gorod
      )ABIT_pass
on ABIT_entry.Ik_gorod=ABIT_pass.Ik_gorod 

where ABIT_entry.Ik_gorod=Gorod.Ik_gorod
and Gorod.Ik_raion=Raion.Ik_raion
and Raion.Ik_region=Region.Ik_region
and Region.Ik_strana=Strana.Ik_strana
Order by  Cstrana,Cregion,Craion,Cgorod