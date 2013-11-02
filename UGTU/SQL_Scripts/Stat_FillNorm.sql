--select * from [dbo].[Stat_FillNorm](2008)
alter FUNCTION [dbo].[Stat_FillNorm] 
(
  @year int
)
RETURNS @Result TABLE
   (
    nfac		varchar(100),
	norm		int			NULL,
	spec_count	int			NULL
   ) 
AS
BEGIN

declare @ik_fac int
declare @Cname_fac varchar(100)
declare @spec_count int
declare @norm_fill int

DECLARE Cursor1 CURSOR LOCAL FAST_FORWARD READ_ONLY FOR		
		SELECT Ik_fac,Cname_fac
        FROM dbo.Fac
        Order by Cname_fac
	    OPEN Cursor1
FETCH NEXT FROM Cursor1 INTO @ik_fac,@Cname_fac
WHILE @@FETCH_STATUS = 0
BEGIN 

select @spec_count=count(ik_spec) from dbo.Relation_spec_fac where ik_fac=@ik_fac

select @norm_fill=count(ik_norm_of_time) 
from dbo.Norm_of_time n_t,Relation_spec_fac r
where n_t.ik_spec_fac = r.ik_spec_fac
and ik_fac=@ik_fac
and ik_year=@year
and (select count(distinct ik_vid_zanyat) from dbo.Content_norma_of_time c where c.ik_norm_of_time=n_t.ik_norm_of_time)>=8
Insert into @Result values(@Cname_fac,@norm_fill,@spec_count)
FETCH NEXT FROM Cursor1 INTO @ik_fac,@Cname_fac
END    
CLOSE Cursor1
DEALLOCATE Cursor1

RETURN
END

