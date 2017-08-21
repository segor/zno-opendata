EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolRating_Composite]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolRating_Composite] AS
SELECT  TOP 1000000
	   CASE WHEN NOT (CurrSR_PY.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) 
	   THEN  DENSE_RANK() OVER (ORDER BY 
			(CASE WHEN (CurrSR_PY.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) THEN 1 ELSE 0 END)
			, [dbo].[wmAvg](CurrSR_PY.AvgScore, PrevSR.AvgScore) DESC
			, [dbo].[wmAvg](CurrSR_PY.[Examinees], PrevSR.[Examinees]) DESC)  
	   END AS [CompositeRank]
	  ,CASE WHEN NOT (CurrSR_PY.[IT_Rank] IS NULL OR PrevSR.[IT_Rank] IS NULL) 
	   THEN  DENSE_RANK() OVER (ORDER BY 
			(CASE WHEN (CurrSR_PY.[IT_Rank] IS NULL OR PrevSR.[IT_Rank] IS NULL) THEN 1 ELSE 0 END)
			, [dbo].[wmAvg](CurrSR_PY.IT_AvgScore, PrevSR.IT_AvgScore) DESC
			, [dbo].[wmAvg](CurrSR_PY.[Examinees], PrevSR.[Examinees]) DESC)  
	   END AS [IT_CompositeRank]
	  ,CurrSR_PY.*
	  ,PrevSR.[TotalRank]		- CurrSR_PY.[TotalRank]		[TotalRank_D]	
      ,PrevSR.[MedTotalRank]	- CurrSR_PY.[MedTotalRank]	[MedTotalRank_D]
      ,PrevSR.[IT_Rank]			- CurrSR_PY.[IT_Rank]		[IT_Rank_D]				
      ,PrevSR.[UkrRank]			- CurrSR_PY.[UkrRank]		[UkrRank_D]			
      ,PrevSR.[MathRank]		- CurrSR_PY.[MathRank]		[MathRank_D]	
      ,PrevSR.[PhysRank]		- CurrSR_PY.[PhysRank]		[PhysRank_D]	
      ,PrevSR.[EngRank]			- CurrSR_PY.[EngRank]		[EngRank_D]			
      ,PrevSR.[HistRank]		- CurrSR_PY.[HistRank]		[HistRank_D]	
      ,PrevSR.[ChemRank]		- CurrSR_PY.[ChemRank]		[ChemRank_D]	
      ,PrevSR.[BioRank]			- CurrSR_PY.[BioRank]		[BioRank_D]		

FROM 
	(SELECT  CurrSR.*, (CASE WHEN EOHashPrevYear IS NULL THEN CurrSR.EOHash ELSE EOHashPrevYear END) AS EOHashPrevYear
	  FROM [zno$(ZnoYear)].[SchoolRating] CurrSR
		LEFT OUTER JOIN Config_EONamesMergingTable MT ON CurrSR.[EOHash] = MT.[EOHash]
	) CurrSR_PY
	LEFT OUTER JOIN [zno$(PrevZnoYear)].[SchoolRating] PrevSR  ON (PrevSR.[EOHash] = CurrSR_PY.[EOHashPrevYear])

ORDER BY 
	CASE WHEN (CurrSR_PY.TotalRank IS NULL OR PrevSR.[TotalRank] IS NULL) THEN 1 ELSE 0 END, 
	CASE WHEN (CurrSR_PY.TotalRank IS NULL) THEN 1 ELSE 0 END, 
	[CompositeRank], CurrSR_PY.[TotalRank], CurrSR_PY.[AvgScore] DESC, CurrSR_PY.[Examinees] DESC
	