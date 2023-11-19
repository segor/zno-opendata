-- input variables: ZnoYear
PRINT N'Building composite rating $(ZnoYear)...'
GO

WITH 
Scores_WithRatingOptions
AS (
	SELECT   
	   T.*
	   ,( [MathAvg] + [PhysAvg] + [EngAvg] ) / 3.0 AS IT_AvgScore
	   ,[EOHash_Merge]
	   ,[EOName]
	   ,[dbo].[canBeInSchoolRating](Examinees, S.[EOTypeName]) AS IsInRating
	   ,CASE WHEN [dbo].[canBeInSubjectRating]([MathN])=1
				AND [dbo].[canBeInSubjectRating]([PhysN])=1
				AND [dbo].[canBeInSubjectRating]([EngN])=1
			THEN 1 ELSE 0 END AS IsInIT_Rating
	   ,[dbo].[canBeInSubjectRating]([UmlN]) AS IsInUmlRating
	   ,[dbo].[canBeInSubjectRating]([UkrN]) AS IsInUkrRating
	   ,[dbo].[canBeInSubjectRating]([HistN]) AS IsInHistRating
	   ,[dbo].[canBeInSubjectRating]([MathN]) AS IsInMathRating
	   ,[dbo].[canBeInSubjectRating]([PhysN]) AS IsInPhysRating
	   ,[dbo].[canBeInSubjectRating]([ChemN]) AS IsInChemRating
	   ,[dbo].[canBeInSubjectRating]([BioN]) IsInBioRating
	   ,[dbo].[canBeInSubjectRating]([EngN]) IsInEngRating
	 FROM [zno$(ZnoYear)].[SchoolScoresTotal] AS T
	 INNER JOIN [zno$(ZnoYear)].[Schools] S on (T.EOHash = S.EOHash)
) 
, 
Rating AS (
SELECT $(ZnoYear) AS ZnoYear
	  , CASE WHEN IsInRating=1 
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, [AvgScore] DESC, [Examinees] DESC) END AS TotalRank
	  , CASE WHEN IsInRating=1 
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, [MedScore] DESC, [Examinees] DESC) END AS MedTotalRank
	  , CASE WHEN IsInRating=1 AND IsInIT_Rating=1 
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInIT_Rating DESC, [IT_AvgScore] DESC, [Examinees] DESC) END AS IT_Rank     
      , CASE WHEN IsInRating=1 AND IsInUmlRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInUmlRating DESC, [UmlAvg] DESC, [UmlN] DESC) END AS UmlRank
      , CASE WHEN IsInRating=1 AND IsInUkrRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInUkrRating DESC, [UkrAvg] DESC, [UkrN] DESC) END AS UkrRank
      , CASE WHEN IsInRating=1 AND IsInMathRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInMathRating DESC, [MathAvg] DESC, [MathN] DESC) END AS MathRank
      , CASE WHEN IsInRating=1 AND IsInPhysRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInPhysRating DESC, [PhysAvg] DESC, [PhysN] DESC) END AS PhysRank
      , CASE WHEN IsInRating=1 AND IsInEngRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInEngRating DESC, [EngAvg] DESC, [EngN] DESC) END AS EngRank
	  , CASE WHEN IsInRating=1 AND IsInHistRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInHistRating DESC, [HistAvg] DESC, [HistN] DESC) END AS HistRank
      , CASE WHEN IsInRating=1 AND IsInChemRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInChemRating DESC, [ChemAvg] DESC, [ChemN] DESC) END AS ChemRank
      , CASE WHEN IsInRating=1 AND IsInBioRating=1
			THEN DENSE_RANK() OVER (ORDER BY IsInRating DESC, IsInBioRating DESC, [BioAvg] DESC, [BioN] DESC) END AS BioRank 
	  ,*
FROM Scores_WithRatingOptions
)
INSERT INTO [dbo].[SchoolRatingShort] 
WITH(TABLOCK)  
SELECT ZnoYear
	  , TotalRank
	  , MedTotalRank
	  , IT_Rank     
      , UmlRank
      , UkrRank
      , MathRank
      , PhysRank
      , EngRank
	  , HistRank
      , ChemRank
      , BioRank 
	  ,[AvgScore]
	  ,[MedScore]
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
	  ,[EOHash]
	  ,[EOHash_Merge]
	  , ROW_NUMBER() OVER (ORDER BY IsInRating DESC, TotalRank, [AvgScore] DESC, [Examinees] DESC, EOName) AS SortOrder
FROM Rating

GO
