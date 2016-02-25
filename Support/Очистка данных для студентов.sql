delete from [Import].[KafTeachers]
where [isPPS] = 0

go
update [dbo].[Person]
set [Clastname]='111',[Cfirstname] ='222', [Cotch]='333'

go
update [Import].[KafTeachers]
set [LastName]='333', [FirstName]='222', [Otch]='111'

go
update [dbo].[Diplom]
set [cTema]='dfgdfsgdfsxgdxfcgvdxfcg'

go
update [dbo].[Person]
set [Photo]=null

