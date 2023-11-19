-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[PersonScoresWithAvg]')
GO

CREATE VIEW [zno$(ZnoYear)].[PersonScoresWithAvg] AS
SELECT   S.AvgScore, S.Exams, 
	[P].[OutID], [P].[SexTypeName], [P].[Age], [P].[EOHash],
	[P].[Uml], [P].[Ukr], [P].[Hist], [P].[Math], [P].[Phys], [P].[Chem], [P].[Bio], [P].[Geo], [P].[Eng], [P].[Fr], [P].[Deu], [P].[Sp], [P].[Rus]
  FROM [zno$(ZnoYear)].[PersonScores] AS P
  RIGHT OUTER JOIN 
	  (SELECT [OutID]      
		  ,AVG([Score]) AvgScore
		  ,COUNT([Score]) Exams
	  FROM [zno$(ZnoYear)].[Scores]
	  GROUP BY [OutID]) AS S
  ON S.[OutID] = P.[OutID]

