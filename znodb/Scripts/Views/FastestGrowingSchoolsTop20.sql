-- input variables: ZnoYear

EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[FastestGrowingSchoolsTop20]')
GO

CREATE VIEW [zno$(ZnoYear)].[FastestGrowingSchoolsTop20] AS
WITH SR_PrevYear AS (
	SELECT  *
	FROM 
		[dbo].[SchoolRating_Composite_3Y]
	WHERE [ZnoYear] = ($(ZnoYear)-1)
)
SELECT TOP 20 SR_PrevYear.TotalRank_D TotalRank_D_SR_PrevYear
	  , [SR_CurrYear].TotalRank_D TotalRank_D_CurrYear
	  ,[SR_CurrYear].[TotalRank] TotalRank_CurrYear
      ,[SR_CurrYear].[AvgScore]     
      ,[SR_CurrYear].[Examinees] 
      ,[SR_CurrYear].[PassRate]      
      ,[SR_CurrYear].[EOName]
	  ,[SR_CurrYear].[EOAreaFullName]
  FROM [zno$(ZnoYear)].[SchoolRating_Composite_3Y] [SR_CurrYear]
  inner join SR_PrevYear ON SR_PrevYear.EOHash_Merge = [SR_CurrYear].EOHash_Merge
  where SR_PrevYear.TotalRank_D > 0 and [SR_CurrYear].TotalRank_D > 0 
order by [SR_CurrYear].TotalRank_D + SR_PrevYear.TotalRank_D DESC