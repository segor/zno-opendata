EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolScoresTotal]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolScoresTotal] AS
SELECT  School.AvgScore
		  ,School.FailedExams
		  , School.PassRate
		  , School.MedScore
		  , [Subj].[EOHash]
		  , [Subj].[Examinees]
		  , [Subj].[UkrAvg], [Subj].[UkrMed], [Subj].[UkrN]
		  , [Subj].[HistAvg], [Subj].[HistMed], [Subj].[HistN]
		  , [Subj].[MathAvg], [Subj].[MathMed], [Subj].[MathN]
		  , [Subj].[PhysAvg], [Subj].[PhysMed], [Subj].[PhysN]
		  , [Subj].[ChemAvg], [Subj].[ChemMed], [Subj].[ChemN]
		  , [Subj].[BioAvg], [Subj].[BioMed], [Subj].[BioN]
		  , [Subj].[GeoAvg], [Subj].[GeoMed], [Subj].[GeoN]
		  , [Subj].[EngAvg], [Subj].[EngMed], [Subj].[EngN]
		  , [Subj].[FrAvg], [Subj].[FrMed], [Subj].[FrN]
		  , [Subj].[DeuAvg], [Subj].[DeuMed], [Subj].[DeuN]
		  , [Subj].[SpAvg], [Subj].[SpMed], [Subj].[SpN]
		  , [Subj].[RusAvg], [Subj].[RusMed], [Subj].[RusN]
  FROM [zno$(ZnoYear)].[SchoolSubjScores] AS Subj
  INNER JOIN 
	  [zno$(ZnoYear)].SchoolScores AS School
  ON (School.EOHash = Subj.EOHash)

