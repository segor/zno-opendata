-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolRating]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolRating]
AS
SELECT TOP 1000000
	   TotalRank
	  ,MedTotalRank
	  ,IT_Rank     
      ,UmlRank
      ,UkrRank
      ,MathRank
      ,PhysRank
      ,EngRank
	  ,HistRank
      ,ChemRank
      ,BioRank 
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
	  ,[EOHash]
	  ,[EOHash_Merge]
FROM [dbo].[SchoolRating]
WHERE [ZnoYear] = $(ZnoYear)
ORDER BY CASE WHEN (TotalRank IS NULL) THEN 1 ELSE 0 END, TotalRank, [AvgScore] DESC, [Examinees] DESC, EOName

