-- input variables: ZnoYear

EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedFrom]')
GO

CREATE VIEW [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedFrom] AS 
SELECT TOP 100000
	  S.[EOHash]
      ,S.[EOName]      
	  ,S.EOAreaFullName
	  ,S.EORegName
	  ,S.EOAreaName
	  ,S.[EOTerName]
	  ,S.[EOName_Source]
	  , S.EOName + N' / ' + S.EOAreaFullName + ( CASE WHEN  CHARINDEX(S.EOTerName, S.EOAreaFullName) > 0 THEN '' ELSE (N', ' + S.EOTerName) END) AS [EONameWithAddres] 
	  FROM [dbo].[Schools_Merged] S INNER JOIN (
		 SELECT [EOHash_Merge] FROM  [dbo].[Schools_Merged] 
		 WHERE  ZnoYear < $(ZnoYear)
		 EXCEPT
	     SELECT [EOHash_Merge] FROM  [dbo].[Schools] 
		 WHERE  ZnoYear = $(ZnoYear)
		  ) Q ON Q.[EOHash_Merge] = S.[EOHash_Merge]	
	 WHERE  ZnoYear < $(ZnoYear)
	ORDER BY S.EORegName, S.EOAreaName, S.EOTerName

GO