-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolScores] AS
SELECT 
	[A].[EOHash], [A].[AvgScore], [A].[Exams], [A].[FailedExams], [A].[PassRate], M.MedScore, A.StdDevScore
FROM
	(SELECT  EOHash    
			  ,AVG([Score]) AvgScore
			  ,STDEV([Score]) AS StdDevScore
			  ,COUNT([Score]) AS Exams
			  ,SUM(CAST([IsFailed] AS tinyint)) FailedExams			  
			  , 1 - 1.0 * SUM(CAST([IsFailed] AS tinyint))/ COUNT([Score])  AS PassRate
		  FROM [zno$(ZnoYear)].[Scores]	  
		  GROUP BY EOHash) AS A
INNER JOIN 
	(SELECT DISTINCT EOHash
				, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY [Score]) OVER (PARTITION BY EOHash) AS MedScore
	FROM [zno$(ZnoYear)].[Scores]	) AS M 
ON A.EOHash = M.EOHash

