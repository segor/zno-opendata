EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[FastestGrowingSchoolsTop20]')
GO

CREATE VIEW [zno$(ZnoYear)].[FastestGrowingSchoolsTop20] AS
SELECT TOP 20 [SR$(PrevZnoYear)].TotalRank_D TotalRank_D_$(PrevZnoYear)
	  , [SR$(ZnoYear)].TotalRank_D TotalRank_D_$(ZnoYear)
	  ,[SR$(ZnoYear)].[TotalRank] TotalRank_$(ZnoYear)       
      ,[SR$(ZnoYear)].[AvgScore]     
      ,[SR$(ZnoYear)].[Examinees] 
      ,[SR$(ZnoYear)].[PassRate]      
      ,[SR$(ZnoYear)].[EOName]
	  ,[SR$(ZnoYear)].[EOAreaFullName]
  FROM [zno$(ZnoYear)].[SchoolRating_Composite_2Y_Table] [SR$(ZnoYear)]
  inner join [zno$(PrevZnoYear)].[SchoolRating_Composite_2Y_Table] [SR$(PrevZnoYear)] ON [SR$(PrevZnoYear)].EOHash_Merge = [SR$(ZnoYear)].EOHash_Merge
  where [SR$(PrevZnoYear)].TotalRank_D > 0 and [SR$(ZnoYear)].TotalRank_D > 0 
order by [SR$(ZnoYear)].TotalRank_D + [SR$(PrevZnoYear)].TotalRank_D DESC