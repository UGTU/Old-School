Create view [dbo].[VisaDoc]
as
select Destination.Ik_destination,Import.Post.PostName,Import.Post.idPost,Import.KafTeachers.FirstName,Import.KafTeachers.LastName,Import.KafTeachers.Otch
FROM Destination
inner join Visa_Destination 
on Visa_Destination.Ik_destination=Destination.Ik_destination
inner join Import.Post 
on Visa_Destination.numberPost=Import.Post.idPost
inner join Import.KafTeachers 
on Import.KafTeachers.PostGUID=Import.Post.PostGUID
