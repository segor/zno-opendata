EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[StudentRaitingTop1000]')
GO

CREATE view [zno$(ZnoYear)].[StudentRaitingTop1000] as 
SELECT TOP 1000
	 DENSE_RANK() OVER (ORDER BY [AvgScore] DESC, [Exams] DESC) AS TotalRank
	 ,V.*
	 ,[Schools].EOName
	 ,[Schools].EOAreaFullName
	 ,[Schools].EOTypeName
	 ,[Schools].TerType
  FROM [zno$(ZnoYear)].[PersonScoresWithAvg] V
  INNER JOIN [zno$(ZnoYear)].[Schools] on (V.EOHash = [Schools].EOHash)
  WHERE  [Exams]>=3
  ORDER BY [TotalRank] ASC