CREATE VIEW [dbo].[SchoolRating_YearlyHistory]	AS 

WITH 
Schools_AllYears( [ZnoYear], [EOHash_Merge]) 
AS (
SELECT * from 
	(SELECT [ZnoYear] from [dbo].[Years]) Y
	, (SELECT distinct [EOHash_Merge] FROM [dbo].[Schools]) H
) 

SELECT TOP 100000000 
	   SM.[EOName]
      ,SM.[EOAreaFullName]
      ,SM.[EOTypeName]
      ,SM.[TerType]
      ,SM.[IsPrivate]
      ,SAY.[EOHash_Merge] 
	  ,SAY.[ZnoYear]
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
	 -- ,SortOrder
	 --, ISNULL(LAST_VALUE ( SortOrder ) OVER (PARTITION BY SAY.EOHash_Merge  ORDER BY SAY.ZnoYear RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 100000 )
	 --, AVG ( SortOrder  ) OVER (PARTITION BY SAY.EOHash_Merge  ORDER BY SAY.ZnoYear RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM Schools_AllYears AS SAY
  LEFT OUTER JOIN [dbo].[SchoolRatingShort] R on (R.EOHash_Merge = SAY.EOHash_Merge) AND (R.[ZnoYear] = SAY.[ZnoYear])
  INNER JOIN [dbo].[Schools_Merged] SM on SAY.EOHash_Merge = SM.EOHash_Merge
  ORDER BY ISNULL(LAST_VALUE ( SortOrder ) OVER (PARTITION BY SAY.EOHash_Merge  ORDER BY SAY.ZnoYear RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 100000 )
			, AVG ( SortOrder ) OVER (PARTITION BY SAY.EOHash_Merge  ORDER BY SAY.ZnoYear RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
			, SAY.EOHash_Merge
			, SAY.[ZnoYear] DESC