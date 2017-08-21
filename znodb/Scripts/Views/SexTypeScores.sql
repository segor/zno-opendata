EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SexTypeScores]')
GO


CREATE VIEW [zno$(ZnoYear)].[SexTypeScores] AS
SELECT  SexTypeName    
			,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM([IsFailed]) FailedExams
		  , 1 - 1.0 * SUM([IsFailed])/ COUNT([Score])  AS PassRate
	  FROM [zno$(ZnoYear)].[Scores]	  
	  GROUP BY SexTypeName
