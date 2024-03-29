﻿-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SubjectSexTypeScores]')
GO


CREATE VIEW [zno$(ZnoYear)].[SubjectSexTypeScores] AS
SELECT Subj, SexTypeName    
			,COUNT(DISTINCT OutID) AS N
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) AS Exams
		  ,SUM(CAST([IsFailed] AS tinyint)) AS FailedExams
		  , 1 - 1.0 * SUM(CAST([IsFailed] AS tinyint))/ COUNT([Score])  AS PassRate
	  FROM [zno$(ZnoYear)].[Scores]	  
	  GROUP BY Subj, SexTypeName
