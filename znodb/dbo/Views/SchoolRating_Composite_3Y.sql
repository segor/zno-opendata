CREATE VIEW [dbo].[SchoolRating_Composite_3Y] AS 
WITH
AllPossibleSchools( [ZnoYear], [EOHash_Merge]) 
AS (
SELECT * from 
	(SELECT [ZnoYear] from [dbo].[Years]) Y
	, (SELECT distinct [EOHash_Merge]FROM [dbo].[Schools]) H
) 
,PrevValues
AS (
SELECT  
	 APS.[ZnoYear]
	,APS.[EOHash_Merge]
	--,LAG([TotalRank]    , 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [TotalRank_Prev_1]	
	,CAST((CASE WHEN [TotalRank] IS NULL OR LAG([TotalRank], 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) IS NULL THEN 0 ELSE 1 END) AS BIT) AS IsInCompositeRating
	,CAST((CASE WHEN [IT_Rank] IS NULL OR LAG([IT_Rank], 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) IS NULL THEN 0 ELSE 1 END) AS BIT) AS IsInIT_CompositeRating
	--,LAG([Examinees]    , 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [Examinees_Prev_1]
	--,LAG([Examinees]    , 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [Examinees_Prev_2] 	
	,[dbo].[wmAvg]([Examinees], LAG([Examinees], 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]), LAG([Examinees], 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear])) [CompositeAvgExaminees]
	--,LAG([AvgScore]     , 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [AvgScore_Prev_1]
	--,LAG([AvgScore]     , 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [AvgScore_Prev_2] 
	,[dbo].[wmAvg]([AvgScore], LAG([AvgScore], 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]), LAG([AvgScore], 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear])) [CompositeAvgScore]
	--,LAG([IT_AvgScore]  , 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [IT_AvgScore_Prev_1]
	--,LAG([IT_AvgScore]  , 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) [IT_AvgScore_Prev_2] 	
	,[dbo].[wmAvg](IT_AvgScore, LAG([IT_AvgScore], 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]), LAG([IT_AvgScore], 2) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear])) [IT_CompositeAvgScore]	

	,LAG([TotalRank]    , 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear])	- [TotalRank]		[TotalRank_D]	
	,LAG([MedTotalRank]	, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [MedTotalRank]	[MedTotalRank_D]
	,LAG([IT_Rank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [IT_Rank]			[IT_Rank_D]		
	,LAG([UmlRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [UmlRank]			[UmlRank_D]		
	,LAG([UkrRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [UkrRank]			[UkrRank_D]		
	,LAG([MathRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [MathRank]		[MathRank_D]	
	,LAG([PhysRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [PhysRank]		[PhysRank_D]	
	,LAG([EngRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [EngRank]			[EngRank_D]		
	,LAG([HistRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [HistRank]		[HistRank_D]	
	,LAG([ChemRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [ChemRank]		[ChemRank_D]	
	,LAG([BioRank]		, 1) OVER (PARTITION BY APS.[EOHash_Merge]  ORDER BY APS.[ZnoYear]) - [BioRank]			[BioRank_D]		
FROM 
	AllPossibleSchools AS APS 
	LEFT OUTER JOIN [dbo].[SchoolRatingShort] AS SR	 ON SR.[ZnoYear] = APS.ZnoYear AND SR.[EOHash_Merge] = APS.[EOHash_Merge]
)
, CompositeRating 
AS (
SELECT 
	   CASE WHEN IsInCompositeRating = 1 
	   THEN  DENSE_RANK() OVER (PARTITION BY [ZnoYear] ORDER BY 
			IsInCompositeRating DESC
			, [CompositeAvgScore] DESC
			, [CompositeAvgExaminees] DESC)  
	   END AS [CompositeRank]
	  ,CASE WHEN IsInIT_CompositeRating = 1 
	   THEN  DENSE_RANK() OVER (PARTITION BY [ZnoYear] ORDER BY 
			IsInIT_CompositeRating DESC
			,[IT_CompositeAvgScore] DESC
			, [CompositeAvgExaminees] DESC)  
	   END AS [IT_CompositeRank]      
	  ,PrevValues.*
FROM PrevValues
)
, CompositeRatingPrevValues
AS (
SELECT 
	  LAG([CompositeRank], 1) OVER (PARTITION BY [EOHash_Merge]  ORDER BY [ZnoYear]) - [CompositeRank]	[CompositeRank_D]
	  ,LAG([IT_CompositeRank], 1) OVER (PARTITION BY [EOHash_Merge]  ORDER BY [ZnoYear]) - [IT_CompositeRank]	[IT_CompositeRank_D] 
	  ,CompositeRating.*
FROM CompositeRating
)
SELECT
	  SR.[ZnoYear]
      ,[CompositeRank]
	  ,[IT_CompositeRank]
      ,[CompositeAvgScore]
	  ,[IT_CompositeAvgScore]
	  ,[TotalRank]
      ,[MedTotalRank]
      ,[IT_Rank]
      ,[UmlRank]
      ,[UkrRank]
      ,[MathRank]
      ,[PhysRank]
      ,[EngRank]
      ,[HistRank]
      ,[ChemRank]
      ,[BioRank]
      ,[AvgScore]
      ,[MedScore]
      ,[EOName]
      ,[EOAreaFullName]
      ,[Examinees]
      ,[FailedExams]
      ,[PassRate]
      ,[StdDevScore]
      ,[IT_AvgScore]
      ,[UmlAvg]
      ,[UmlStDev]
      ,[UmlMed]
      ,[UmlN]
      ,[UkrAvg]
      ,[UkrStDev]
      ,[UkrMed]
      ,[UkrN]
      ,[HistAvg]
      ,[HistStDev]
      ,[HistMed]
      ,[HistN]
      ,[MathAvg]
      ,[MathStDev]
      ,[MathMed]
      ,[MathN]
      ,[PhysAvg]
      ,[PhysStDev]
      ,[PhysMed]
      ,[PhysN]
      ,[ChemAvg]
      ,[ChemStDev]
      ,[ChemMed]
      ,[ChemN]
      ,[BioAvg]
      ,[BioStDev]
      ,[BioMed]
      ,[BioN]
      ,[GeoAvg]
      ,[GeoStDev]
      ,[GeoMed]
      ,[GeoN]
      ,[EngAvg]
      ,[EngStDev]
      ,[EngMed]
      ,[EngN]
      ,[FrAvg]
      ,[FrStDev]
      ,[FrMed]
      ,[FrN]
      ,[DeuAvg]
      ,[DeuStDev]
      ,[DeuMed]
      ,[DeuN]
      ,[SpAvg]
      ,[SpStDev]
      ,[SpMed]
      ,[SpN]
      ,[RusAvg]
      ,[RusStDev]
      ,[RusMed]
      ,[RusN]
      ,[EOTypeName]
      ,[TerType]
      ,[IsPrivate]
      ,SR.[EOHash]
      ,SR.[EOHash_Merge]
	  ,[CompositeRank_D]
	  ,[IT_CompositeRank_D] 
	  ,[TotalRank_D]	
      ,[MedTotalRank_D]
      ,[IT_Rank_D]				
      ,[UmlRank_D]			
      ,[UkrRank_D]			
      ,[MathRank_D]	
      ,[PhysRank_D]	
      ,[EngRank_D]			
      ,[HistRank_D]	
      ,[ChemRank_D]	
      ,[BioRank_D]		
	  ,ROW_NUMBER() OVER (PARTITION BY SR.ZnoYear ORDER BY 
			IsInCompositeRating DESC, 	
			[CompositeRank], 
			CASE WHEN (TotalRank IS NULL) THEN 1 ELSE 0 END, 
			[TotalRank], 
			[AvgScore] DESC, 
			[Examinees] DESC, 
			EOName) SortOrder
FROM [dbo].[SchoolRating] AS SR
	INNER JOIN CompositeRatingPrevValues AS CRPV ON SR.ZnoYear = CRPV.ZnoYear AND SR.[EOHash_Merge] = CRPV.[EOHash_Merge]
