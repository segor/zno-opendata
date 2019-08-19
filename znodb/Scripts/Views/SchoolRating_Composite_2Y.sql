EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolRating_Composite_2Y]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolRating_Composite_2Y] AS
SELECT  TOP 1000000
	   CASE WHEN NOT (CurrSR.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) 
	   THEN  DENSE_RANK() OVER (ORDER BY 
			(CASE WHEN (CurrSR.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) THEN 1 ELSE 0 END)
			, [dbo].[wmAvg](CurrSR.AvgScore, PrevSR.AvgScore, DEFAULT) DESC
			, [dbo].[wmAvg](CurrSR.[Examinees], PrevSR.[Examinees], DEFAULT) DESC)  
	   END AS [CompositeRank]
	  ,CASE WHEN NOT (CurrSR.[IT_Rank] IS NULL OR PrevSR.[IT_Rank] IS NULL) 
	   THEN  DENSE_RANK() OVER (ORDER BY 
			(CASE WHEN (CurrSR.[IT_Rank] IS NULL OR PrevSR.[IT_Rank] IS NULL) THEN 1 ELSE 0 END)
			, [dbo].[wmAvg](CurrSR.IT_AvgScore, PrevSR.IT_AvgScore, DEFAULT) DESC
			, [dbo].[wmAvg](CurrSR.[Examinees], PrevSR.[Examinees], DEFAULT) DESC)  
	   END AS [IT_CompositeRank]
	  ,CurrSR.*
	  ,PrevSR.[TotalRank]		- CurrSR.[TotalRank]		[TotalRank_D]	
      ,PrevSR.[MedTotalRank]	- CurrSR.[MedTotalRank]	[MedTotalRank_D]
      ,PrevSR.[IT_Rank]			- CurrSR.[IT_Rank]		[IT_Rank_D]				
      ,PrevSR.[UkrRank]			- CurrSR.[UkrRank]		[UkrRank_D]			
      ,PrevSR.[MathRank]		- CurrSR.[MathRank]		[MathRank_D]	
      ,PrevSR.[PhysRank]		- CurrSR.[PhysRank]		[PhysRank_D]	
      ,PrevSR.[EngRank]			- CurrSR.[EngRank]		[EngRank_D]			
      ,PrevSR.[HistRank]		- CurrSR.[HistRank]		[HistRank_D]	
      ,PrevSR.[ChemRank]		- CurrSR.[ChemRank]		[ChemRank_D]	
      ,PrevSR.[BioRank]			- CurrSR.[BioRank]		[BioRank_D]		

FROM 
	[zno$(ZnoYear)].[SchoolRating] AS CurrSR
	LEFT OUTER JOIN [zno$(PrevZnoYear)].[SchoolRating] PrevSR
		ON PrevSR.EOHash_Merge= CurrSR.EOHash_Merge

ORDER BY 
	CASE WHEN (CurrSR.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) THEN 1 ELSE 0 END, 
	CASE WHEN (CurrSR.TotalRank IS NULL) THEN 1 ELSE 0 END, 
	[CompositeRank], CurrSR.[TotalRank], CurrSR.[AvgScore] DESC, CurrSR.[Examinees] DESC
	