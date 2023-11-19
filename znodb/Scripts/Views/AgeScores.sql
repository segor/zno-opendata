-- input variables: ZnoYear

EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[AgeScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[AgeScores] AS
SELECT  Age   
			,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM(CAST([IsFailed] AS tinyint)) FailedExams
		  , 1 - 1.0 * SUM(CAST([IsFailed] AS tinyint))/ COUNT([Score])  AS PassRate
	  FROM [zno$(ZnoYear)].[Scores]
	  GROUP BY Age;

