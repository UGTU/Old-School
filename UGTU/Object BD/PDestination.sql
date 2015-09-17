--select  * from PDestination
Alter view PDestination
as
Select Ik_destination,
 cNameDestination as Название,
 cShortNameDestination as [Сокращение],
 Description as [Описание]
From Destination