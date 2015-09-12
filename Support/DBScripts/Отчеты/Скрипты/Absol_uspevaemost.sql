/*SELECT
dbo.Person.Clastname+' '+
dbo.Person.Cfirstname+' '+ dbo.Person.Cotch, AVG(CONVERT(DECIMAL(8,2),Cosenca)) avgBall
FROM
(SELECT        dbo.Uspev.Cosenca, Vedomost.Itab_n
FROM            dbo.Vedomost INNER JOIN
                         dbo.Uspev ON dbo.Vedomost.Ik_ved = dbo.Uspev.Ik_ved INNER JOIN
                         dbo.Content_UchPl ON dbo.Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                         dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat INNER JOIN
                         dbo.TypeZanyat ON dbo.vid_zaniat.ikTypeZanyat = dbo.TypeZanyat.ikTypeZanyat
WHERE dbo.Vedomost.Dd_exam >'01.08.2012'
	AND TypeZanyat.bitZach<>1
		AND Cosenca>1

UNION
SELECT        2, Vedomost.Itab_n 
FROM            dbo.Vedomost INNER JOIN
                         dbo.Uspev ON dbo.Vedomost.Ik_ved = dbo.Uspev.Ik_ved INNER JOIN
                         dbo.Content_UchPl ON dbo.Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                         dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat INNER JOIN
                         dbo.TypeZanyat ON dbo.vid_zaniat.ikTypeZanyat = dbo.TypeZanyat.ikTypeZanyat
WHERE dbo.Vedomost.Dd_exam >'01.08.2012'
	AND TypeZanyat.bitZach<>1
		AND Cosenca<2
)Uspev
 INNER JOIN
dbo.Prepod ON Uspev.Itab_n = dbo.Prepod.itab_n INNER JOIN
dbo.Person ON dbo.Prepod.nCode = dbo.Person.nCode 

GROUP BY dbo.Person.Clastname+' '+
dbo.Person.Cfirstname+' '+ dbo.Person.Cotch
ORDER BY dbo.Person.Clastname+' '+
dbo.Person.Cfirstname+' '+ dbo.Person.Cotch*/


SELECT
ISNULL(ManDep.DepartmentName,''), ISNULL(Department.DepartmentSmallName,''), 
Employee.EmployeeName, ISNULL(Employee.EmployeeLogin,''),/*Employee.[EmployeeName], */ISNULL(Post.PostName,''), 
(SUM(OtnCount)*100/SUM(AllCount)) OtnUsp,
(SUM(AbsCount)*100/SUM(AllCount)) AbsUsp, SUM(AllCount) AllCount
FROM
(SELECT        Vedomost.[id_teacher] Itab_n, COUNT(Cosenca)as AllCount, COUNT(DISTINCT Vedomost.Ik_zach) studCount
FROM            MaxUspev Vedomost INNER JOIN
                         dbo.Content_UchPl ON Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                         dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat INNER JOIN
                         dbo.TypeZanyat ON dbo.vid_zaniat.ikTypeZanyat = dbo.TypeZanyat.ikTypeZanyat
WHERE Vedomost.Dd_exam >'01.08.2014' AND Vedomost.Dd_exam <'08.08.2015'
	AND TypeZanyat.bitZach<>1 AND Content_UchPl.n_module IS NULL
	GROUP BY Vedomost.[id_teacher]
) Allp
	LEFT JOIN
(SELECT        Vedomost.[id_teacher] Itab_n, COUNT(Cosenca)as AbsCount
FROM            MaxUspev Vedomost INNER JOIN
                         dbo.Content_UchPl ON Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                         dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat INNER JOIN
                         dbo.TypeZanyat ON dbo.vid_zaniat.ikTypeZanyat = dbo.TypeZanyat.ikTypeZanyat
WHERE Vedomost.Dd_exam >'01.08.2014' AND Vedomost.Dd_exam <'08.08.2015'
	AND TypeZanyat.bitZach<>1 AND Content_UchPl.n_module IS NULL
		AND Cosenca>2
GROUP BY Vedomost.[id_teacher])Absp
ON Allp.Itab_n=Absp.Itab_n
LEFT JOIN
(SELECT        Vedomost.[id_teacher] Itab_n, COUNT(Cosenca)as OtnCount 
FROM             MaxUspev Vedomost INNER JOIN
                         dbo.Content_UchPl ON Vedomost.ik_upContent = dbo.Content_UchPl.ik_upContent INNER JOIN
                         dbo.vid_zaniat ON dbo.Content_UchPl.ik_vid_zanyat = dbo.vid_zaniat.iK_vid_zanyat INNER JOIN
                         dbo.TypeZanyat ON dbo.vid_zaniat.ikTypeZanyat = dbo.TypeZanyat.ikTypeZanyat
WHERE Vedomost.Dd_exam >'01.08.2014' AND Vedomost.Dd_exam <'08.08.2015'
	AND TypeZanyat.bitZach<>1
		AND Cosenca>3 AND Content_UchPl.n_module IS NULL
GROUP BY Vedomost.[id_teacher])Otnp ON Allp.Itab_n=Otnp.Itab_n
 LEFT JOIN
--dbo.Prepod ON Allp.Itab_n = dbo.Prepod.itab_n LEFT JOIN
--dbo.Person ON dbo.Prepod.nCode = dbo.Person.nCode 
--[Import].[KafTeachers] ON
--Allp.Itab_n=[KafTeachers].idEmployee
--LEFT JOIN
kadr.dbo.Employee ON 
Allp.Itab_n=Employee.id

LEFT JOIN
(SELECT idEmployee, MAX(idPost) idPost, MAX(idDepartment) idDepartment FROM
kadr.[dbo].[GetStaffByPeriod]('1.08.2014','30.09.2015') 
GROUP BY idEmployee) 
Staffs
ON Employee.id=Staffs.idEmployee
LEFT JOIN
KADR.dbo.Post ON Staffs.idPost=Post.id
LEFT JOIN KADR.dbo.Department ON Staffs.idDepartment=Department.id
LEFT JOIN KADR.dbo.Department ManDep ON ManDep.id=Department.idManagerDepartment

--CONVERT(VARCHAR(150),Person.PersonFullName)=CONVERT(VARCHAR(150),Employee.EmployeeName)
--LEFT JOIN

WHERE AbsCount>0
GROUP BY ManDep.DepartmentName,Department.DepartmentSmallName, 
Employee.EmployeeName, /*Employee.[EmployeeName], */Post.PostName, Employee.EmployeeLogin
ORDER BY ManDep.DepartmentName, Department.DepartmentSmallName, Employee.EmployeeName


