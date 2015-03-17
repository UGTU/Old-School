--расширим поле с названием документа
alter table documents alter column cvid_doc varchar(500) not null


select * from Doc_stud where Ik_vid_doc = 5