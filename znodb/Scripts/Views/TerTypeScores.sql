﻿-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[TerTypeScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[TerTypeScores] AS
SELECT  TerType    
		  ,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM(CAST([IsFailed] AS tinyint)) FailedExams
		  , 1 - 1.0 * SUM(CAST([IsFailed] AS tinyint))/ COUNT([Score])  AS PassRate
	  FROM [zno$(ZnoYear)].[Scores]
	  INNER JOIN [zno$(ZnoYear)].[Schools] on ([Scores].EOHash = [Schools].EOHash)	  
	  GROUP BY TerType

