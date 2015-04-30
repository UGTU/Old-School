USE UGTU
SELECT DISTINCT    dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') Cname_spec, 
	--ik_Gener_spec_fac нужен для определения уникальности специальности - ik_spec_fac не подходит, чтобы не дублировать одну и ту же специальность несколько раз
	Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac, 
	dbo.Relation_spec_fac.ik_fac, dbo.Spec_stud.Cshort_spec, Spec_stud.ik_spec, Spec_stud.ik_spec ik_spec_fac
FROM        Spec_stud INNER JOIN Relation_spec_fac
	ON     Relation_spec_fac.ik_spec = Spec_stud.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline]())
	INNER JOIN dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction
	WHERE dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') IN
(SELECT    Cname_spec
FROM        (SELECT DISTINCT    dbo.Spec_stud.Cname_spec+' ('+ISNULL(Direction.cShort_name_direction,'')+')'+ ' - '+ISNULL(Spec_stud.Sh_spec,'') Cname_spec, 
	--ik_Gener_spec_fac нужен для определения уникальности специальности - ik_spec_fac не подходит, чтобы не дублировать одну и ту же специальность несколько раз
	Spec_stud.ik_spec+dbo.Relation_spec_fac.ik_fac*100000 ik_Gener_spec_fac, 
	dbo.Relation_spec_fac.ik_fac, dbo.Spec_stud.Cshort_spec, Spec_stud.ik_spec, Spec_stud.ik_spec ik_spec_fac
FROM        Spec_stud INNER JOIN Relation_spec_fac
	ON     Relation_spec_fac.ik_spec = Spec_stud.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline]())
	INNER JOIN dbo.Direction ON Spec_stud.ik_direction=Direction.ik_direction)spec
                       

GROUP BY  Cname_spec
HAVING COUNT(*)>1)