select * from Zaved_stud where Ik_gorod in (510,7440,7455) order by Ik_gorod
select * from Street where ik_gorod in (510,7440,7455) order by ik_gorod

update Address set Ik_street = 3810 where Ik_street = 3811

update Zaved_stud set Ik_gorod = 510 where Ik_gorod in (7440)
update Street set Ik_gorod = 510 where Ik_gorod in (7440)

update Student set Ik_zaved = 259 where Ik_zaved = 2596
update Zaved_stud set Ik_gorod = 510 where Ik_gorod in (7455)
update Street set Ik_gorod = 510 where Ik_gorod in (7455)

update Gorod set Ik_raion = 85 where Ik_raion = 7816


declare @ik_street int
declare @old_ik_street int
declare @CStreet varchar(100)
DECLARE cur CURSOR
FOR
select ik_street,CStreet from Street 
where ik_gorod = 7455 
OPEN cur
FETCH NEXT FROM cur INTO @ik_street, @CStreet
WHILE @@FETCH_STATUS = 0
BEGIN
  set @old_ik_street = null
  select @old_ik_street = ik_street from Street where ik_gorod = 510
  and CStreet like '%'+@CStreet+'%'
  if @old_ik_street is not null
    update Address set Ik_street = @old_ik_street where Ik_street = @ik_street
FETCH NEXT FROM cur INTO @ik_street, @CStreet
END
CLOSE cur
DEALLOCATE cur 



select ik_street,CStreet from Street 
where ik_gorod = 7455 and CStreet like '%'+(select CStreet from Street 
where ik_gorod = 510)+'%'