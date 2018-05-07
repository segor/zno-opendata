EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolScoresTotal]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolScoresTotal] AS
SELECT		  School.AvgScore
			, School.FailedExams
			, School.PassRate
			, School.MedScore
			, School.StdDevScore
			, [Subj].[EOHash]
			, [Subj].[Examinees]
			, [Subj].[UkrAvg]
			, [Subj].[UkrStDev]
			, [Subj].[UkrMed]
			, [Subj].[UkrN]
			, [Subj].[HistAvg]
			, [Subj].[HistStDev]
			, [Subj].[HistMed]
			, [Subj].[HistN]
			, [Subj].[MathAvg]
			, [Subj].[MathStDev]
			, [Subj].[MathMed]
			, [Subj].[MathN]
			, [Subj].[PhysAvg]
			, [Subj].[PhysStDev]
			, [Subj].[PhysMed]
			, [Subj].[PhysN]
			, [Subj].[ChemAvg]
			, [Subj].[ChemStDev]
			, [Subj].[ChemMed]
			, [Subj].[ChemN]
			, [Subj].[BioAvg]
			, [Subj].[BioStDev]
			, [Subj].[BioMed]
			, [Subj].[BioN]
			, [Subj].[GeoAvg]
			, [Subj].[GeoStDev]
			, [Subj].[GeoMed]
			, [Subj].[GeoN]
			, [Subj].[EngAvg]
			, [Subj].[EngStDev]
			, [Subj].[EngMed]
			, [Subj].[EngN]
			, [Subj].[FrAvg]
			, [Subj].[FrStDev]
			, [Subj].[FrMed]
			, [Subj].[FrN]
			, [Subj].[DeuAvg]
			, [Subj].[DeuStDev]
			, [Subj].[DeuMed]
			, [Subj].[DeuN]
			, [Subj].[SpAvg]
			, [Subj].[SpStDev]
			, [Subj].[SpMed]
			, [Subj].[SpN]
			, [Subj].[RusAvg]
			, [Subj].[RusStDev]
			, [Subj].[RusMed]
			, [Subj].[RusN]
  FROM [zno$(ZnoYear)].[SchoolSubjScores] AS Subj
  INNER JOIN 
	  [zno$(ZnoYear)].SchoolScores AS School
  ON (School.EOHash = Subj.EOHash)

