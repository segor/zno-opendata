EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[EOTypeScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[EOTypeScores] AS
SELECT  EOTypeName    
			,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM([IsFailed]) FailedExams
		  , 1 - 1.0 * SUM([IsFailed])/ COUNT([Score])  AS PassRate
	  FROM [zno$(ZnoYear)].[Scores]
	  INNER JOIN [zno$(ZnoYear)].[Schools] on ([Scores].EOHash = [Schools].EOHash)	  
	  GROUP BY EOTypeName

