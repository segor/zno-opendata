-- input variables: YearColumns, YearNullColumns
EXEC ('DROP VIEW IF EXISTS [dbo].[SchoolsWithRatingHistory]')
GO

CREATE VIEW [dbo].[SchoolsWithRatingHistory] AS

WITH IDs AS (
SELECT 
	[SortOrder] AS ID
	 ,[EOHash_Merge]
  FROM [zno_LastYear].[SchoolRating_Composite_3Y]
  )
, History AS (
SELECT
	 ID
	  , [ZnoYear]

	  , cast([CompositeRank]	  AS float)  [CompositeRank]	
      , cast([IT_CompositeRank]	  AS float)  [IT_CompositeRank]	
      , cast([TotalRank]		  AS float)  [TotalRank]		
      , cast([MedTotalRank]		  AS float)  [MedTotalRank]		
      , cast([IT_Rank]			  AS float)  [IT_Rank]			
      , cast([UmlRank]			  AS float)  [UmlRank]			
      , cast([UkrRank]			  AS float)  [UkrRank]			
      , cast([MathRank]			  AS float)  [MathRank]			
      , cast([PhysRank]			  AS float)  [PhysRank]			
      , cast([EngRank]			  AS float)  [EngRank]			
      , cast([HistRank]			  AS float)  [HistRank]			
      , cast([ChemRank]			  AS float)  [ChemRank]			
      , cast([BioRank]			  AS float)  [BioRank]			

	  , cast([Examinees]		  AS float)  [Examinees]
	  , cast(ROUND(PassRate, 4) AS float)	 PassRate

	  , cast(ROUND([CompositeAvgScore]	 , 2) AS float) [CompositeAvgScore]	
      , cast(ROUND([IT_CompositeAvgScore], 2) AS float) [IT_CompositeAvgScore]    
      , cast(ROUND([AvgScore]			 , 2) AS float) [AvgScore]			
      , cast(ROUND([MedScore]   		 , 2) AS float) [MedScore]   		
      , cast(ROUND([StdDevScore]		 , 2) AS float) [StdDevScore]		
      , cast(ROUND([IT_AvgScore]		 , 2) AS float) [IT_AvgScore]		
      , cast(ROUND([UmlAvg]				 , 2) AS float) [UmlAvg]				
      , cast(ROUND([UmlMed]				 , 2) AS float) [UmlMed]				
      , cast(ROUND([UmlN]				 , 2) AS float) [UmlN]				
      , cast(ROUND([UkrAvg]				 , 2) AS float) [UkrAvg]				
      , cast(ROUND([UkrMed]				 , 2) AS float) [UkrMed]				
      , cast(ROUND([UkrN]				 , 2) AS float) [UkrN]				
      , cast(ROUND([HistAvg]			 , 2) AS float) [HistAvg]			
      , cast(ROUND([HistMed]			 , 2) AS float) [HistMed]			
      , cast(ROUND([HistN]				 , 2) AS float) [HistN]				
      , cast(ROUND([MathAvg]			 , 2) AS float) [MathAvg]			
      , cast(ROUND([MathMed]			 , 2) AS float) [MathMed]			
      , cast(ROUND([MathN]				 , 2) AS float) [MathN]				
      , cast(ROUND([PhysAvg]			 , 2) AS float) [PhysAvg]			
      , cast(ROUND([PhysMed]			 , 2) AS float) [PhysMed]			
      , cast(ROUND([PhysN]				 , 2) AS float) [PhysN]				
      , cast(ROUND([ChemAvg]			 , 2) AS float) [ChemAvg]			
      , cast(ROUND([ChemMed]			 , 2) AS float) [ChemMed]			
      , cast(ROUND([ChemN]				 , 2) AS float) [ChemN]				
      , cast(ROUND([BioAvg]				 , 2) AS float) [BioAvg]				
      , cast(ROUND([BioMed]				 , 2) AS float) [BioMed]				
      , cast(ROUND([BioN]				 , 2) AS float) [BioN]				
      , cast(ROUND([GeoAvg]				 , 2) AS float) [GeoAvg]				
      , cast(ROUND([GeoMed]				 , 2) AS float) [GeoMed]				
      , cast(ROUND([GeoN]				 , 2) AS float) [GeoN]				
      , cast(ROUND([EngAvg]				 , 2) AS float) [EngAvg]				
      , cast(ROUND([EngMed]				 , 2) AS float) [EngMed]				
      , cast(ROUND([EngN]				 , 2) AS float) [EngN]				
      , cast(ROUND([FrAvg]				 , 2) AS float) [FrAvg]				
      , cast(ROUND([FrMed]				 , 2) AS float) [FrMed]				
      , cast(ROUND([FrN]				 , 2) AS float) [FrN]				
      , cast(ROUND([DeuAvg]				 , 2) AS float) [DeuAvg]				
      , cast(ROUND([DeuMed]				 , 2) AS float) [DeuMed]				
      , cast(ROUND([DeuN]				 , 2) AS float) [DeuN]				
      , cast(ROUND([SpAvg]				 , 2) AS float) [SpAvg]				
      , cast(ROUND([SpMed]				 , 2) AS float) [SpMed]				
      , cast(ROUND([SpN]				 , 2) AS float) [SpN]				
      , cast(ROUND([RusAvg]				 , 2) AS float) [RusAvg]				
      , cast(ROUND([RusMed]				 , 2) AS float) [RusMed]				
      , cast(ROUND([RusN]				 , 2) AS float) [RusN]				

  FROM [dbo].[SchoolRating_Composite_3Y] R
  INNER JOIN IDs ON IDs.EOHash_Merge=R.EOHash_Merge
  --ORDER BY ID, ZnoYear DESC
)
, unpvt AS (
SELECT ID, ZnoYear, MetricName, MetricValue
FROM History
UNPIVOT (MetricValue FOR MetricName IN   
      (
	   [CompositeRank]	
	  , [IT_CompositeRank]	
	  , [TotalRank]		
	  , [MedTotalRank]		
	  , [IT_Rank]			
	  , [UmlRank]			
	  , [UkrRank]			
	  , [MathRank]			
	  , [PhysRank]			
	  , [EngRank]			
	  , [HistRank]			
	  , [ChemRank]			
	  , [BioRank]		
	  , [Examinees]
	  , [PassRate]
	  , [CompositeAvgScore]	
	  , [IT_CompositeAvgScore]    
	  , [AvgScore]			
	  , [MedScore]   		
	  , [StdDevScore]		
	  , [IT_AvgScore]		
	  , [UmlAvg]				
	  , [UmlMed]				
	  , [UmlN]				
	  , [UkrAvg]				
	  , [UkrMed]				
	  , [UkrN]				
	  , [HistAvg]			
	  , [HistMed]			
	  , [HistN]				
	  , [MathAvg]			
	  , [MathMed]			
	  , [MathN]				
	  , [PhysAvg]			
	  , [PhysMed]			
	  , [PhysN]				
	  , [ChemAvg]			
	  , [ChemMed]			
	  , [ChemN]				
	  , [BioAvg]				
	  , [BioMed]				
	  , [BioN]				
	  , [GeoAvg]				
	  , [GeoMed]				
	  , [GeoN]				
	  , [EngAvg]				
	  , [EngMed]				
	  , [EngN]				
	  , [FrAvg]				
	  , [FrMed]				
	  , [FrN]				
	  , [DeuAvg]				
	  , [DeuMed]				
	  , [DeuN]				
	  , [SpAvg]				
	  , [SpMed]				
	  , [SpN]				
	  , [RusAvg]				
	  , [RusMed]				
	  , [RusN]				

	  )  
)AS unpvt
)
, Q AS (
SELECT ID, NULL AS [EOName], MetricName, $(YearColumns)
FROM unpvt
PIVOT ( MAX(MetricValue) FOR ZnoYear IN ( $(YearColumns) ))
AS pvt  
UNION 
SELECT 
	[SortOrder] AS ID
	 ,CONCAT( [EOName], N', ', EOAreaFullName) [EOName]
	 ,NULL AS MetricName
	 ,$(YearNullColumns)
FROM [zno_LastYear].[SchoolRating_Composite_3Y]
)

SELECT TOP 10000000000 * FROM Q
ORDER BY ID, [EOName] DESC
,(
    CASE MetricName

    WHEN 'CompositeRank'		THEN 10
	WHEN 'CompositeAvgScore'	THEN 20
	WHEN 'IT_CompositeRank'		THEN 30
	WHEN 'IT_CompositeAvgScore' THEN 40   
	WHEN 'TotalRank'			THEN 50
	WHEN 'AvgScore'				THEN 60
	WHEN 'MedTotalRank'			THEN 70
	WHEN 'MedScore'   			THEN 80
	WHEN 'Examinees'			THEN 90
	WHEN 'PassRate'				THEN 100
	WHEN 'StdDevScore'			THEN 110
	WHEN 'IT_Rank'				THEN 120
	WHEN 'IT_AvgScore'			THEN 130
	WHEN 'UmlRank'				THEN 140
	WHEN 'UmlAvg'				THEN 150
	WHEN 'UmlMed'				THEN 160
	WHEN 'UmlN'					THEN 170
	WHEN 'UkrRank'				THEN 171
	WHEN 'UkrAvg'				THEN 172
	WHEN 'UkrMed'				THEN 173
	WHEN 'UkrN'					THEN 174
	WHEN 'HistRank'				THEN 180
	WHEN 'HistAvg'				THEN 190
	WHEN 'HistMed'				THEN 200
	WHEN 'HistN'				THEN 210
	WHEN 'MathRank'				THEN 220
	WHEN 'MathAvg'				THEN 230
	WHEN 'MathMed'				THEN 240
	WHEN 'MathN'				THEN 250
	WHEN 'PhysRank'				THEN 260
	WHEN 'PhysAvg'				THEN 270
	WHEN 'PhysMed'				THEN 280
	WHEN 'PhysN'				THEN 290
	WHEN 'ChemRank'				THEN 300
	WHEN 'ChemAvg'				THEN 310
	WHEN 'ChemMed'				THEN 320
	WHEN 'ChemN'				THEN 330
	WHEN 'BioRank'				THEN 340
	WHEN 'BioAvg'				THEN 350
	WHEN 'BioMed'				THEN 360
	WHEN 'BioN'					THEN 370
	WHEN 'GeoAvg'				THEN 380
	WHEN 'GeoMed'				THEN 390
	WHEN 'GeoN'					THEN 400
	WHEN 'EngRank'				THEN 410
	WHEN 'EngAvg'				THEN 420
	WHEN 'EngMed'				THEN 430
	WHEN 'EngN'					THEN 440
	WHEN 'FrAvg'				THEN 450
	WHEN 'FrMed'				THEN 460
	WHEN 'FrN'					THEN 470
	WHEN 'DeuAvg'				THEN 480
	WHEN 'DeuMed'				THEN 490
	WHEN 'DeuN'					THEN 500
	WHEN 'SpAvg'				THEN 510
	WHEN 'SpMed'				THEN 520
	WHEN 'SpN'					THEN 530
	WHEN 'RusAvg'				THEN 540
	WHEN 'RusMed'				THEN 550
	WHEN 'RusN'					THEN 560
    
    END
) ASC



