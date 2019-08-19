CREATE VIEW [dbo].[SexTypeScores] AS
SELECT TOP 100000
	T.ZnoYear
	,T.SexTypeName   
    ,N
	,AvgScore
	,MedScore
	,Exams
	,FailedExams
	,PassRate
FROM
(SELECT  ZnoYear, SexTypeName    
		  ,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM(CAST([IsFailed] AS tinyint)) FailedExams
		  , 1 - 1.0 * SUM(CAST([IsFailed] AS tinyint))/ COUNT([Score])  AS PassRate
	  FROM [dbo].[Scores]
	  GROUP BY ZnoYear, SexTypeName) AS T
INNER JOIN 
(SELECT DISTINCT ZnoYear, SexTypeName
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY [Score]) OVER (PARTITION BY ZnoYear, SexTypeName) AS MedScore
	FROM [dbo].[Scores]	) AS M
ON (T.SexTypeName = M.SexTypeName AND T.ZnoYear = M.ZnoYear)
ORDER BY T.ZnoYear, T.SexTypeName
