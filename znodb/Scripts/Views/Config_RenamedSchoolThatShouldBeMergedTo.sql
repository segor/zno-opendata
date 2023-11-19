-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedTo]')
GO

CREATE VIEW [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedTo] AS 
SELECT TOP 1000000
	  ISNULL(R.TotalRank/2000 +1, 6) [Priority]
	  ,S.[EOHash]
      ,S.[EOName]      
	  ,S.EOAreaFullName
	  ,S.EORegName
	  ,S.EOAreaName
	  ,S.[EOTerName]
	  ,S.[EOName_Source]
	  , S.EOName + N' / ' + S.EOAreaFullName + ( CASE WHEN  CHARINDEX(S.EOTerName, S.EOAreaFullName) > 0 THEN '' ELSE (N', ' + S.EOTerName) END) AS [EONameWithAddres] 
	FROM [zno$(ZnoYear)].[Schools] S INNER JOIN (
	  SELECT [EOHash_Merge] FROM  [dbo].[Schools] 
		WHERE  (ZnoYear = $(ZnoYear))
		EXCEPT 
		SELECT DISTINCT [EOHash_Merge] FROM  [dbo].[Schools] 
		WHERE  (ZnoYear < $(ZnoYear))
	 
	) Q ON Q.[EOHash_Merge] = S.[EOHash_Merge]
	INNER JOIN [zno$(ZnoYear)].SchoolRating R ON R.[EOHash_Merge] = S.[EOHash_Merge]
	ORDER BY S.EORegName, S.EOAreaName, S.EOTerName, S.[EOName]

GO